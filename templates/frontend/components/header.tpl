{**
 * plugins/themes/sao-iain-pare/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2024 LP2M IAIN Parepare
 *
 * @brief Header kustom untuk Sao Jurnal dengan desain modern Tailwind.
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"} bg-slate-50 font-inter antialiased" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="min-h-screen flex flex-col">
		{* Navigasi Top Bar *}
		<header class="absolute top-0 left-0 right-0 z-50 bg-sky-950/50 backdrop-blur-lg border-b border-white/10">
			<div class="max-w-7xl mx-auto px-6 h-28 flex items-center justify-between">
				
				{* Logo & Site Name *}
				<div class="flex items-center gap-4">
					{capture assign="homeUrl"}{url page="index" router=$smarty.const.ROUTE_PAGE}{/capture}
					<a href="{$homeUrl}" class="flex items-center gap-4 group">
						<div class="w-14 h-14 bg-white/10 backdrop-blur-md rounded-2xl flex items-center justify-center border border-white/20 shadow-xl group-hover:bg-white/20 transition-all overflow-hidden">
							{if $displayPageHeaderLogo}
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" 
									 class="w-full h-full object-cover" 
									 alt="{$displayPageHeaderTitle|escape}">
							{else}
								<i data-lucide="book-marked" class="text-white w-8 h-8"></i>
							{/if}
						</div>
						
						<div class="flex flex-col hidden md:flex">
							<span class="text-white font-black text-2xl leading-none tracking-tighter">
								Sao Jurnal
							</span>
							<span class="text-sky-300 font-bold text-[10px] uppercase tracking-[0.4em] mt-1.5">
								IAIN Parepare
							</span>
						</div>
					</a>
				</div>

				{* Desktop Navigation Menu *}
				<nav class="hidden lg:flex items-center gap-8">
					<div class="custom-nav-wrapper">
						{load_menu name="primary" id="navigationPrimary" ulClass="flex gap-8 text-[11px] font-black uppercase tracking-[0.1em]" liClass="nav-item"}
					</div>
				</nav>

				{* User Actions (Login/Register) *}
				<div class="flex items-center gap-4">
					{if $isUserLoggedIn}
						<div class="bg-white/10 backdrop-blur-md px-5 py-2.5 rounded-full border border-white/20 flex items-center gap-3">
							<span class="text-xs font-black text-white uppercase tracking-wider">{$currentUser->getUsername()|escape}</span>
							<a href="{url page="login" op="signOut"}" class="text-white/70 hover:text-white transition-colors">
								<i data-lucide="log-out" class="w-4 h-4"></i>
							</a>
						</div>
					{else}
						<a href="{url page="login"}" class="text-xs font-black text-white uppercase tracking-widest hover:text-sky-200 transition-colors px-4 py-2">Masuk</a>
						<a href="{url page="user" op="register"}" class="bg-sky-500 text-white text-[11px] font-black uppercase tracking-widest px-8 py-3.5 rounded-full hover:bg-sky-400 transition-all shadow-2xl shadow-sky-900/40 active:scale-95 border border-sky-400">Daftar</a>
					{/if}
					
					{* Mobile Menu Toggle *}
					<button class="lg:hidden text-white ml-2 p-3 rounded-xl bg-white/10 border border-white/10" onclick="toggleMobileMenu()">
						<i data-lucide="menu" class="w-6 h-6"></i>
					</button>
				</div>
			</div>
		</header>

		<script>
			function toggleMobileMenu() {
				const menu = document.getElementById('mobile-menu');
				if (menu.classList.contains('hidden')) {
					menu.classList.remove('hidden');
					setTimeout(() => menu.classList.remove('translate-x-full'), 10);
				} else {
					menu.classList.add('translate-x-full');
					setTimeout(() => menu.classList.add('hidden'), 300);
				}
			}
		</script>

		{* Main Content Area *}
		<div class="flex-grow flex flex-col">
			<main class="flex-grow {if !$isFullWidth}max-w-7xl mx-auto px-6 py-12{/if}" role="main">
