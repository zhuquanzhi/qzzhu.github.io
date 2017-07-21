<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/commons/manager/common-taglibs.jsp"%>
<div id="header" class="navbar">
    <div class="navbar-inner">
        <!-- company or app name -->
        <a class="brand hidden-phone" href="index.html">
            <img src="${ctx}/resources/manager/library/images/logo.png" />
        </a>
        <ul class="nav pull-right">
            <!-- dropdown user account -->
            <li class="dropdown">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-large icon-user"></i>
                </a>
                <ul class="dropdown-menu dropdown-user-account">
                    <li class="account-img-container">
                        <img class="thumb account-img" src="${ctx}/resources/manager/library/images/100/07.png" />
                    </li>
                    <li class="account-info">
                        <h3>
                            ${SESSION_USERINFO.username }
                        </h3>
                        <p>
                            ${SESSION_USERINFO.fullname }
                        </p>
                        <p>
                            <a href="javascript:;">
                                Edit
                            </a>
                            |
                            <a href="javascript:;">
                                Account Settings
                            </a>
                        </p>
                    </li>
                    <li class="account-footer">
                        <div class="row-fluid">
                            <div class="span8">
                                <a class="btn btn-small btn-primary btn-flat" href="javascript:;">
                                    Change avatar
                                </a>
                            </div>
                            <div class="span4 align-right">
                                <a class="btn btn-small btn-danger btn-flat" href="${ctx}/security/logout">
                                    Logout
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
            <!-- ./ dropdown user account -->
        </ul>
        <ul class="nav  pull-right">
            <li>
                <a href="javascript:;">
                    <i class="icon-large icon-envelope"></i>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-large icon-cog"></i>
                </a>
            </li>
        </ul>
    </div>
</div>