<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>首页</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		html::after {
			position: fixed;
			top: 0;
			right: 0;
			left: 0;
			bottom: 0;
			content: '';
			display: block;
			background-attachment: fixed;
			background-size: cover;
			background-position: center;
			z-index: -1;
		}
		#swiper {
			overflow: hidden;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 0;
			background-color: rgba(110,22,64,1);
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
	
		input#buynumber::-webkit-outer-spin-button, input::-webkit-inner-spin-button { -webkit-appearance: none; }
		input#buynumber[type="number"]{ -moz-appearance: textfield; }
	
		.message-container {width: 100%}
	
		.detail-tab .layui-tab-card>.layui-tab-title .layui-this {
			background-color: rgba(157, 126, 98, 1);
			color: #fff;
			font-size: 14px;
		}
	
	.data-detail {
	  padding-bottom: 20px;
	}
	
	.data-detail .layui-breadcrumb a.first {
	  color: rgba(5, 5, 5, 1) !important;
	}
	</style>
	<body>

		<div id="app">
			<div class="data-detail" style="padding:0;">
				<div class="data-detail-breadcrumb" :style='{"padding":"0 10px","boxShadow":"0 0 6px #9d7e62","margin":"20px auto","borderColor":"rgba(157, 126, 98, 1)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0 8px","borderStyle":"solid","height":"54px"}'>
					<span class="layui-breadcrumb">
						<a class="first" :style='{"padding":"8px 10px","boxShadow":"0 0 0px rgba(255,0,0,0)","margin":"0 5px","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","color":"rgba(5, 5, 5, 1)","borderRadius":"0","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}' href="../home/home.jsp">首页</a>
						<a><cite :style='{"padding":"8px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","margin":"0 15px","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>{{title}}</cite></a>
					</span>

					<a v-if='storeupFlag' :style='{"padding":"0 12px","boxShadow":"0 0 6px #9d7e62","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","color":"rgba(157, 126, 98, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"16px","lineHeight":"34px","borderStyle":"solid"}' @click="storeUp()" href="javascript:void(0)">
						<i class="layui-icon" style="font-size: 20px;color: red;" v-if='true' :style='{"color":"rgba(157, 126, 98, 1)","padding":"0 2px 0 0","fontSize":"18px"}'>&#xe67a;</i>取消收藏
					</a>
					<a v-if='!storeupFlag' :style='{"padding":"0 12px","boxShadow":"0 0 6px #9d7e62","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","color":"rgba(157, 126, 98, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"16px","lineHeight":"34px","borderStyle":"solid"}' @click="storeUp()" href="javascript:void(0)">
						<i class="layui-icon" style="font-size: 20px;color: red;" v-if='true' :style='{"color":"rgba(157, 126, 98, 1)","padding":"0 2px 0 0","fontSize":"18px"}'>&#xe67b;</i>点我收藏
					</a>

				</div>
			</div>
			<div class="data-detail" style="padding:0;width:100%;" :style='{"padding":"0","boxShadow":"0 0 0px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","background":"#fff","borderStyle":"solid"}'>
				<div class="layui-row" style="display: flex;width:980px;margin: 0 auto;">
					<div class="layui-col-md5" style="width:400px">
						<!-- <div class="layui-carousel" id="swiper">
							<div carousel-item id="swiper-item">
								<div v-for="(item,index) in swiperList" v-bind:key="index">
									<img class="swiper-item" :src="item.img">
								</div>
							</div>
						</div> -->
						<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"4px","borderWidth":"0","width":"400px","borderStyle":"solid","height":"400px"}'>
						  <div carousel-item>
							<div v-if="swiperList.length" v-for="(item,index) in swiperList" :key="index">
								<img style="width: 100%;height: 100%;object-fit:cover;" :src="item" />
							</div>
						  </div>
						</div>



					</div>
					<div class="layui-col-md7" style="padding-left: 20px;flex: 1;" :style='{"padding":"0","boxShadow":"0 0 6px #9d7e62","margin":"0 0 0 20px","borderColor":"rgba(157, 126, 98, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","borderStyle":"solid"}'>
						<h1 style="position: relative;" :style='{"padding":"10px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"0","textAlign":"left","borderWidth":"0","fontSize":"18px","borderStyle":"solid"}' class="title">{{title}}</h1>

						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' v-if="detail.price" class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>价格：</span>
							<span :style='{"padding":"5px 0","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(110,22,64,1)","borderRadius":"0","textAlign":"left","borderWidth":"0","width":"100%","lineHeight":"34px","fontSize":"18px","borderStyle":"solid"}' class="price">
								<span :style='{"fontSize":"12px"}'>￥</span>{{detail.price.toFixed(2)}}
							</span>
						</div>
						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' v-if="detail.jf" class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>积分：</span>
							<span :style='{"padding":"5px 0","boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(110,22,64,1)","borderRadius":"0","textAlign":"left","borderWidth":"0","width":"100%","lineHeight":"34px","fontSize":"18px","borderStyle":"solid"}' class="price">
								{{detail.jf}}
							</span>
						</div>
						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' v-if="detail.onelimittimes" class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>单次购买：</span>
							<span :style='{"padding":"5px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="desc">
								{{detail.onelimittimes}}
							</span>
						</div>
						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' v-if="detail.alllimittimes" class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>库存：</span>
							<span :style='{"padding":"5px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="desc">
								{{detail.alllimittimes}}
							</span>
						</div>


						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>图书分类：</span>
							<span  :style='{"padding":"5px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="desc">
								{{detail.tushufenlei}}
							</span>
						</div>
						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>作者：</span>
							<span  :style='{"padding":"5px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="desc">
								{{detail.zuozhe}}
							</span>
						</div>
						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>出版社：</span>
							<span  :style='{"padding":"5px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="desc">
								{{detail.chubanshe}}
							</span>
						</div>
						<div :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' class="detail-item">
							<span :style='{"padding":"0 12px 0 0","minWidth":"94px","fontSize":"14px","color":"#333","textAlign":"right"}'>点击次数：</span>
							<span  :style='{"padding":"5px 15px","boxShadow":"0 0 0px rgba(110,22,64,.3)","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="desc">
								{{detail.clicknum}}
							</span>
						</div>



						<div class="detail-item" :style='{"padding":"6px 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<div class="num-picker" v-if="detail.alllimittimes">
								<button style="height:auto;" :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#666","borderRadius":"4px 0 0 4px","borderWidth":"1px","width":"34px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' type="button" @click="buynumber>0?buynumber--:buynumber" class="layui-btn layui-btn-primary">-</button>
								<input style="height:auto;" :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#666","borderRadius":"0","borderWidth":"1px 0","width":"44px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' type="number" v-model="buynumber" id="buynumber" name="buynumber" class="layui-input" disabled="disabled"></input>
								<button style="height:auto;" :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#666","borderRadius":"0 4px 4px 0","borderWidth":"1px","width":"34px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' type="button" @click="buynumber++" class="layui-btn layui-btn-primary">+</button>
							</div>
							<button v-if="detail.alllimittimes" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(110,22,64,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(157, 126, 98, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' @click="addCartTap" type="button" class="layui-btn layui-btn-warm">
								添加到购物车
							</button>
							<button v-if="detail.alllimittimes" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 6px #9d7e62","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(157, 126, 98, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' @click="buyTap" type="button" class="layui-btn btn-submit">
								立即购买
							</button>

                        <button v-if="!detail.alllimittimes" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(110,22,64,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(250, 212, 0, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' type="button" class="layui-btn layui-btn-warm">
                            商品无货
                        </button>


						</div>
					</div>
				</div>
				</div>
				
				<div class="data-detail">



				<div class="layui-row detail-tab">
					<div class="layui-tab layui-tab-card" :style='{"boxShadow":"0 0 6px #9d7e62","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"10px","borderStyle":"solid","borderWidth":"1px"}' style="overflow: hidden;">

						<ul class="layui-tab-title" :style='{"color":"rgba(42, 42, 42, 1)","backgroundColor":"#f2f2f2","fontSize":"14px"}'>

							<li class="layui-this">图书简介</li>



							<li>评论</li>







						</ul>
						<div style="word-break:break-all" class="layui-tab-content">

							<div class="layui-tab-item layui-show">
								<div v-html="detail.tushujianjie"></div>
							</div>



							<div class="layui-tab-item">
								<div class="message-container">
									<form class="layui-form message-form" :style='{"padding":"20px","boxShadow":"0 0 6px #9d7e62","margin":"0 0 20px 0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"solid"}'>
										<div class="layui-form-item layui-form-text" style="display: flex;align-items: center;margin:0">
											<label style="width: auto;" :style='{"padding":"0","minWidth":"54px","fontSize":"14px","color":"#333","textAlign":"center"}' class="layui-form-label">评论</label>
											<div class="layui-input-block" style="margin:0;flex:1;">
												<textarea :style='{"padding":"10px","boxShadow":"0 0 6px #9d7e62","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"solid","height":"120px"}' name="content" required lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
											</div>
										</div>
										<div class="layui-form-item">
											<div class="layui-input-block">
												<button :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(110,22,64,.3)","margin":"10px 5px 0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(157, 126, 98, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' class="layui-btn btn-submit" lay-submit lay-filter="*">立即提交</button>
												<button :style='{"padding":"0 10px","boxShadow":"0 0 6px #9d7e62","margin":"10px 5px 0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(157, 126, 98, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' type="reset" class="layui-btn layui-btn-primary">重置</button>
											</div>
										</div>
									</form>
									<div class="message-list" :style='{"padding":"0 20px 20px","boxShadow":"0 0 6px #9d7e62","margin":"0","borderColor":"rgba(110,22,64,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"solid"}'>
										<div :style='{"padding":"20px 0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}' class="message-item" v-for="(item,index) in dataList" v-bind:key="index">
											<div class="username-container">
												<img :style='{"boxShadow":"0 0 6px rgba(110,22,64,.3)","margin":"0 10px 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"100%","borderWidth":"0","width":"40px","borderStyle":"solid","height":"40px"}' class="avator" src="http://codegen.caihongy.cn/20201211/da4d2513e31447efa461a278574f51fc.jpg">
												<span style="display: inline-block;" :style='{"padding":"0 10px","boxShadow":"0 0 6px #9d7e62","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}' class="username">用户：{{item.userid}}</span>
											</div>
											<div class="content" style="margin: 0;flex: 1;">
												<span style="display: inline-block;" :style='{"padding":"8px","boxShadow":"0 0 6px rgba(110,22,64,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(157, 126, 98, 0.52)","color":"#fff","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"solid"}' class="message">
													{{item.content}}
												</span>
											</div>
											<div v-if="item.reply" class="content" style="margin: 0;flex: 1;">
												<span style="display: inline-block;" :style='{"padding":"8px","boxShadow":"0 0 6px rgba(110,22,64,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(157, 126, 98, 0.52)","color":"#fff","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"solid"}' class="message">
													回复:{{item.reply}}
												</span>
											</div>
										</div>
									</div>
									<div class="pager" id="pager" :style="{textAlign:2==1?'left':2==2?'center':'right'}"></div>
								</div>
							</div>







						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="../../layui/layui.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [],
					// 数据详情
					detail: {
						id: 0
					},
					// 商品标题
					title: '',
					// 倒计时
					count: 0,
					// 加入购物车数量
					buynumber: 1,
					// 当前详情页表
					detailTable: 'tushuxinxi',
					baseurl: '',
					// 评论列表
					dataList: [],
					storeupFlag: 0,
					// 选座座位列表
					numberList: []
				},
				// 倒计时效果
				computed: {
					SecondToDate: function() {
						var time = this.count;
						if (null != time && "" != time) {
							if (time > 60 && time < 60 * 60) {
								time =
									parseInt(time / 60.0) +
									"分钟" +
									parseInt((parseFloat(time / 60.0) - parseInt(time / 60.0)) * 60) +
									"秒";
							} else if (time >= 60 * 60 && time < 60 * 60 * 24) {
								time =
									parseInt(time / 3600.0) +
									"小时" +
									parseInt(
										(parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
									) +
									"分钟" +
									parseInt(
										(parseFloat(
												(parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
											) -
											parseInt(
												(parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
											)) *
										60
									) +
									"秒";
							} else if (time >= 60 * 60 * 24) {
								time =
									parseInt(time / 3600.0 / 24) +
									"天" +
									parseInt(
										(parseFloat(time / 3600.0 / 24) - parseInt(time / 3600.0 / 24)) *
										24
									) +
									"小时" +
									parseInt(
										(parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
									) +
									"分钟" +
									parseInt(
										(parseFloat(
												(parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
											) -
											parseInt(
												(parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60
											)) *
										60
									) +
									"秒";
							} else {
								time = parseInt(time) + "秒";
							}
						}
						return time;
					}
				},
				//  清除定时器
				destroyed: function() {
					window.clearInterval(this.inter);
				},
				methods: {
					jump(url) {
						jump(url)
					},
					isAuth(tablename, button) {
						return isFrontAuth(tablename, button)
					},
					// 倒计时初始化
					countDown() {
						let reversetime = new Date(this.detail.reversetime).getTime()
						let now = new Date().getTime();
						let count = reversetime - now;
						if (count > 0) {
							this.count = count / 1000
							var _this = this;
							this.inter = window.setInterval(function() {
								_this.count = _this.count - 1;
								if (_this.count < 0) {
									window.clearInterval(_this.inter);
									layer.msg("活动已结束", {
										time: 2000,
										icon: 5
									})
								}
							}, 1000);
						}
					},

					// 下载文件
					downFile(url) {
						var download = $("#download");
						download.append(
							"<a id=\"down\" href=\"aaaa.txt\" target=\"_blank\" download=\"aaaa.txt\" style=\"display:none\">下载该文件</a>");
						console.log(download);
						$("#down")[0].click();
					},
					// 跨表
					onAcrossTap(acrossTable,statusColumnName,tips,statusColumnValue){
						localStorage.setItem('crossTable',`tushuxinxi`);
						localStorage.setItem('crossObj', JSON.stringify(this.detail));
						localStorage.setItem('statusColumnName',statusColumnName);
						localStorage.setItem('statusColumnValue',statusColumnValue);
						localStorage.setItem('tips',tips);

						if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
							var obj = JSON.parse(localStorage.getItem('crossObj'));
							for (var o in obj){
								if(o==statusColumnName && obj[o]==statusColumnValue){
									layer.msg(tips, {
										time: 2000,
										icon: 5
									});
									return
								}
							}
						}

						jump(`../${acrossTable}/add.jsp?corss=true`);
					},
					// 添加到购物车
					addCartTap() {
						// 活动倒计时限制
						// 单次购买限制
						if (this.detail.onelimittimes && this.detail.onelimittimes > 0 && this.detail.onelimittimes < this.buynumber) {
							layer.msg(`每人单次只能购买${this.detail.onelimittimes}件`, {
								time: 2000,
								icon: 5
							});
							return
						}
                        // 库存不够
                        if (this.detail.alllimittimes <= 0 ) {
                            layer.msg(`商品已售罄`, {
                                time: 2000,
                                icon: 5
                            });
                            return
                        }
						// 库存限制
						if (this.detail.alllimittimes && this.detail.alllimittimes > 0 && this.detail.alllimittimes < this.buynumber) {
							layer.msg(`库存不足`, {
								time: 2000,
								icon: 5
							});
							return
						}
						// 查询是否已经添加到购物车
						layui.http.request('cart/list', 'get', {
							userid: localStorage.getItem('userid'),
							tablename: `${this.detailTable}`,
							goodid: this.detail.id
						}, (res) => {
							if (res.data.list.length > 0) {
								layer.msg("该商品已经添加到购物车", {
									time: 2000,
									icon: 5
								});
								return
							}
							layui.http.requestJson('cart/save', 'post', {
								tablename: `${this.detailTable}`,
								goodid: this.detail.id,
								goodname: this.title,
	                                                        goodtype: this.detail.tushufenlei,
								picture:vue.detail.tupian,
								buynumber: this.buynumber,
								userid: localStorage.getItem('userid'),
								price: this.detail.price,
								discountprice: this.detail.vipprice ? this.detail.vipprice : 0
							}, (res) => {
								layer.msg("添加到购物车成功", {
									time: 2000,
									icon: 6
								});
							});
						})
					},

					// 立即购买
					buyTap() {
						// 活动倒计时限制
						// 单次购买限制
						if (this.detail.onelimittimes && this.detail.onelimittimes > 0 && this.detail.onelimittimes < this.buynumber) {
							layer.msg(`每人单次只能购买${this.detail.onelimittimes}件`, {
								time: 2000,
								icon: 5
							});
							return
						}
                        // 库存不够 
                        if (this.detail.alllimittimes <= 0 ) { 
                            layer.msg(`商品已售罄`, { 
                                time: 2000, 
                                icon: 5 
                            }); 
                            return 
                        }
						// 库存限制
						if (this.detail.alllimittimes && this.detail.alllimittimes > 0 && this.detail.alllimittimes < this.buynumber) {
							layer.msg(`库存不足`, {
								time: 2000,
								icon: 5
							});
							return
						}
						// 保存到storage中，在确认下单页面中获取要购买的商品
						localStorage.setItem('orderGoods', JSON.stringify([{
							tablename: `${this.detailTable}`,
							goodid: this.detail.id,
							goodname: this.title,
	                                                        goodtype: this.detail.tushufenlei,
								picture:vue.detail.tupian,
							buynumber: this.buynumber,
							userid: localStorage.getItem('userid'),
							price: this.detail.price,
							discountprice: this.detail.vipprice ? this.detail.vipprice : 0
						}]));
						// 跳转到确认下单页面
						jump('../shop-order/confirm.jsp');
					},


					// 收藏商品
					storeUp() {
						layui.http.request('storeup/list', 'get', {
							page: 1,
							limit: 1,
							type:1,
							refid : this.detail.id,
							tablename : this.detailTable,
							userid: localStorage.getItem('userid'),
						}, (res) => {
							vue.dataList = res.data.list
							if(res.data.list.length==1) {
								layui.http.requestJson(`storeup/delete`, 'post', [res.data.list[0].id], function(res) {
									layer.msg('取消成功', {
										time: 1000,
										icon: 5
									}, function() {
										window.location.reload();
									});
								});
								return;
							}
							layui.http.requestJson('storeup/save', 'post', {
								userid: localStorage.getItem('userid'),
								name: this.title,
							    type:1,
                                inteltype: vue.detail.tushufenlei,
								picture:vue.detail.tupian,
								refid: this.detail.id,
								tablename: this.detailTable
							}, function(res) {
								layer.msg('收藏成功', {
									time: 1000,
									icon: 6
								}, function() {
									window.location.reload();
								});
							});
						});
					},
					
				}
			})
			layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var form = layui.form;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var laypage = layui.laypage;
				var limit = 10;
				// 数据ID
				var id = http.getParam('id');
				vue.detail.id = id;
				vue.baseurl = http.baseurl;
				// 商品信息
				http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function(res) {
					// 详情信息
					vue.detail = res.data
					vue.title = vue.detail.tushumingcheng;
					// 轮播图片
					vue.swiperList = vue.detail.tupian ? [http.baseurl+vue.detail.tupian.split(",")[0]] : [];
					// var swiperItemHtml = '';
					// for (let item of vue.swiperList) {
					// 	swiperItemHtml +=
					// 		'<div>' +
					// 		'<img class="swiper-item" style="width: 100%;height: 100%;object-fit:cover;" src="' + item + '">' +
					// 		'</div>';
					// }
					// jquery('#swiper-item').html(swiperItemHtml);
					// 轮播图
					vue.$nextTick(() => {
					  carousel.render({
					  	elem: '#swiper',
						width: '400px',
					  	height: '400px',
					  	arrow: 'hover',
					  	anim: 'default',
					  	autoplay: 'true',
					  	interval: '3000',
					  	indicator: 'inside'
					  });
					
					})


				});
				if(localStorage.getItem('userid')){
					http.request(`storeup/list`, 'get', {
						page: 1,
						limit: 1,
						type:1,
						refid : vue.detail.id,
						tablename : vue.detailTable,
						userid: localStorage.getItem('userid'),
					}, function(res) {
						vue.storeupFlag = res.data.list.length;
					})
				}


				// 获取评论
				http.request(`discuss${vue.detailTable}/list`, 'get', {
					page: 1,
					limit: limit,
					refid: vue.detail.id,
					//userid: localStorage.getItem('userid')
				}, function(res) {
					vue.dataList = res.data.list
					// 分页
					laypage.render({
						elem: 'pager',
						count: res.data.total,
						limit: limit,
						groups: 5,
						layout: ["prev","page","next"],
						theme: '#9D7E62',
						jump: function(obj, first) {
							//首次不执行
							if (!first) {
								http.request(`discuss${vue.detailTable}/list`, 'get', {
									page: obj.curr,
									limit: obj.limit,
									userid: localStorage.getItem('userid')
								}, function(res) {
									vue.dataList = res.data.list
								})
							}
						}
					});
				})
				// 提交评论
				form.on('submit(*)', function(data) {
					data = data.field;
					data.userid = localStorage.getItem('userid')
					data.nickname = localStorage.getItem('adminName')
					data.refid = vue.detail.id
                                layui.http.request('orders/list', 'get', {
                                        page: 1,
                                        limit: 1,
                                        userid: localStorage.getItem('userid'),
                                        goodid: vue.detail.id,
                                        status: '已完成'
                                }, function(res) {
                                        debugger
                                        vue.dataList = res.data.list
                                        if(res.data.list.length==0) {
                                                layer.msg('请完成订单后再评论', {
                                                                time: 2000,
                                                                icon: 6
                                                        }, function() {
                                                        });
                                                return false
                                        } else {
                                                http.requestJson(`discuss${vue.detailTable}/save`, 'post', data, function(res) {
                                                        layer.msg('评论成功', {
                                                                time: 2000,
                                                                icon: 6
                                                        }, function() {
                                                                window.location.reload();
                                                        });
                                                        return false
                                                });

                                        }
                                })
					return false
				});
			});
		</script>
	</body>
</html>
