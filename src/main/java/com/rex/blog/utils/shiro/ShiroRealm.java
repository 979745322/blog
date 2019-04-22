package com.rex.blog.utils.shiro;

import com.rex.blog.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.List;

/**
 * 自定义认证授权类
 */
@Slf4j
public class ShiroRealm extends AuthorizingRealm {

//    private final UserService userService;

//    private final ShiroRedisSessionDao shiroRedisSessionDao;

    private final SessionDAO sessionDAO;

    @Autowired
    public ShiroRealm(SessionDAO sessionDAO) {
        this.sessionDAO = sessionDAO;
    }

    /*@Autowired
    public ShiroRealm(UserService userService, SessionDAO sessionDAO, ShiroRedisSessionDao shiroRedisSessionDao) {
        this.userService = userService;
        this.shiroRedisSessionDao = shiroRedisSessionDao;
    }*/

    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 获取登录用户
        final User user = (User) principals.getPrimaryPrincipal();
        final SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        // 查询该用户权限
        final List<String> roleList =null /*userService.getRole(user)*/;
        if (roleList != null) {
            authorizationInfo.addStringPermissions(roleList);
            return authorizationInfo;
        }
        return null;
    }

    /**
     * 登录验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        final UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        final User loginUser = new User();
        loginUser.setUserName(token.getUsername());
        loginUser.setPassword(new String(token.getPassword()));

        // 查询符合条件的用户
//        final User result = userService.login(loginUser);
        User result = null ;
        if(loginUser.getUserName().equals("aaa")&&loginUser.getPassword().equals("123"))
        {
            result = loginUser;
        }

        // 如果用户返回不为null，则登录验证通过
        if (result.getUserName() != null) {
            // 查询已登录用户，发现多处登录，踢出之前登录用户
            kickLoginUser(loginUser.getUserName());
//            rediskickLoginUser(loginUser.getUserName());
            return new SimpleAuthenticationInfo(result, result.getPassword(), getName());
        } else {
            throw new AuthenticationException();
        }

    }

    /**
     * 踢出已登录对象
     * 多处登录踢除之前已登录的用户
     * @param uerName 登录对象的用户名
     */
    private void kickLoginUser(String uerName){
        // 获取session对象
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {

            // 如果session不为空，判断session中有没有与当前登录用户同名的用户
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) != null) {

                // 分割登录对象信息，获取登录用户名
                final String sessionUserName = String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)).split("userName='")[1].split("'")[0];

                // 比对登录用户名
                if (uerName.equals(sessionUserName)) {

                    // 如果找到，设置session立即失效，即将其踢出系统
                    session.setTimeout(0);
                    break;
                }
            }
        }
    }

    /**
     * 踢出redis已登录对象
     * 多处登录踢除之前已登录的用户
     * @param uerName 登录对象的用户名
     */
    /*private void rediskickLoginUser(String uerName){

        // 获取session对象
        Collection<Session> sessions = shiroRedisSessionDao.getActiveSessions();
        for (Session session : sessions) {

            // 如果session不为空，判断session中有没有与当前登录用户同名的用户
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) != null) {

                // 分割登录对象信息，获取登录用户名
                final String sessionUserName = String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)).split("userName='")[1].split("'")[0];

                // 比对登录用户名
                if (uerName.equals(sessionUserName)) {

                    // 如果找到，设置session立即失效，即将其踢出系统
                    shiroRedisSessionDao.delete(session);
                    break;
                }
            }
        }
    }*/
}