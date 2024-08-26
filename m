Return-Path: <linux-i2c+bounces-5799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CF95F037
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 13:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BDAF1C2185C
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 11:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73392156C62;
	Mon, 26 Aug 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Zp8NSDFw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2043.outbound.protection.outlook.com [40.107.117.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB4945A;
	Mon, 26 Aug 2024 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724673391; cv=fail; b=S1F0FvWAVOihS+tSYpWaHdioiWSiWY7OnnSWDnAB46eWw+Ad7sZKtlHePWLZ3iwY16QE62EoMukCIS3iICgH4fKuINfUOLSBOO8cMlTqg1mPq97HfByHsGg3gH4mYxqwdL4B3yO/JGhjMT6nOzG4b/Ah2bIfykWs3gkSeEqXH8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724673391; c=relaxed/simple;
	bh=QZCHnVFlhUln6/TMYyNf6aouYOh/19WMKTs6rB0r0LI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qg++9oZy1ApvJYiDaz8Ioobu4DobP/YMhXC3JLd+zGlLXBRtjhgo1TOw3c+zGi5M0jTzTVhKFgSClEWrrsmeL/D7rTdD395UYnTd32GjpA8OTdrYsndMwezFoC4K9e8sKfWWXRPhSruTBTBo3uiMkCENCRGSJp+m+53FzuImxAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Zp8NSDFw; arc=fail smtp.client-ip=40.107.117.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+fkohEA7NGBd5mADAUIDEQPY0uGp+CgtMz9bmjKrx6vZqhEOyq6ayuC7a2ogvlu5qZUISp+PdY6aOdMMn1sHX0I67GY+kReIkvns6sPrgwRR5waVBG9JZSksQQhgKW89jAgBcfDbt5sc5tTjYjx1wa9kEwXC9nYTV1dndWKRIQiUPqXkswvLFSd+o52hwivQzAK1eh6utQjShcmG+TBF24dzqV3GX155DPqcAD8kzJbIpjDRrQ/b5MM8ciWhQ1r8KEfg+PpYfBRYWF1t7y4rWwvvzDefW6ewvjyB0ppEwNhKaZduwK8mjMGpYn8WUvmop8P60idBy+dr3HU9XJuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BegHzGI7V06oz+98cr5mAscjkO+qvK51czW6W0AJodQ=;
 b=XHwVe7LOJgJION95jaIIXMkZQaMiUWK3yFf5lTEWNZAvtTAi3rJ5iiaGz6UZjYxNWgdKMzd7ldqACWg8Kj/+VzLlMx02W1knX+cosA5C+3o6IRMkE/dPEMizShEkX1p80JxppNxtZSVZoYTuiNqOgC9OIZLtGD845IAKbgce2frtxZExQw8NuhJHS/WO8sl6kymGxJA315qxKM6FM4vU0yyUP4oFKR20Mu1ItpunJ1VySNxyQr1DscvebktGskzJncXzHqgGybKFkNQdPxD4HPDcEvF3npS4ZatK9MJGJPM46yMUDgq8Y4BZRtA/wiBWhKS4ZsgsSJzpf+I/WvK+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BegHzGI7V06oz+98cr5mAscjkO+qvK51czW6W0AJodQ=;
 b=Zp8NSDFw0R6FqkpwZfUE6jY5ogozL8zECsyMa0jq/r/jvbn30+gqjKn2jfxevUyH1Ga7HwgtS6WEnHyn8ynCaIyUv0zJ1zaycluhd4ylBzRYY30kxJUvkRqdHYFSnCdcdp2dSDpYFjyoAMOmHEJa0n/2RgDHtRc7g+MKXzD7JmDL0EKP5dAzAt5XczKBk2/9jCG2TOGLSX/tA02G6ljp3Q28DaCKhUs/l5BvWHVy6jknCdrd+9ieCeaKF0UVDsfS55+4pXFsql52znfJCiRxNFQZ24MGS4FQXNQhA522FjGMVDuZ/X+plemCooegslhvELleS1uSTzsBHHr72D2GPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB6563.apcprd06.prod.outlook.com (2603:1096:101:166::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Mon, 26 Aug 2024 11:56:25 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 11:56:25 +0000
Message-ID: <c253ff51-52bd-446a-aab4-274f55a4b80c@vivo.com>
Date: Mon, 26 Aug 2024 19:56:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] i2c: jz4780: Use devm_clk_get_enabled() helpers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rong Qianfeng <rongqianfeng@vivo.com>, biju.das.jz@bp.renesas.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-4-rongqianfeng@vivo.com>
 <Zsir2Lo5TM8YKKrY@black.fi.intel.com>
 <b625df1f-9ddf-4eb1-8b51-6c63fac36530@vivo.com>
 <ZsxaEtWEMWeoVusv@smile.fi.intel.com>
Content-Language: en-US
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <ZsxaEtWEMWeoVusv@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: ab88dd7d-24f9-43c2-a13e-08dcc5c61c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eS9DTG9Ucm9aRDByb0hFQ0Z1V2tJUmtrU2FNSWdNRmZ4WC9OVDYxem1LZUcw?=
 =?utf-8?B?Vjh4RkJrcjFuTG1iZUh2Mms3VDhnVlZJNStHZExlTVFBeStOVHNSVTZWKzI5?=
 =?utf-8?B?eUQyTkoxU2pQTGNzajFIZzh6empHRGVJdG4rSGNQaHRiYjBjSmhJQW9ONE1m?=
 =?utf-8?B?ckpWSXI0MmUrcHJwMEtSNVdrenBuL3hlYWhWTDM5Z3FIV2JNbkdZQUpCYmk5?=
 =?utf-8?B?Y0hWcmpjb2N0RXBiRFRDUUR5cnFyd3lhQmhYUXNyNFlhK1BOemxYQTlCcVRZ?=
 =?utf-8?B?bzAxUG9lQ3QxZXNsVXRoeVYvY2RIVjloc0ZDK3NUTC95aHNSeENaL3plY3FS?=
 =?utf-8?B?WjRmcVJKMmtycU1Jb0xTYW1zN2VxM2k5citUNGpQZjM2bjNIemhHVGw0T0o2?=
 =?utf-8?B?czRYVllWYUJGT2NjTUFFU3pGYWg0U2xFSFVRLzFmME5iNENOc2FldkQyLzBY?=
 =?utf-8?B?SzEvUjlkWEgwemhTM3dqdkpacGM0SXdXRVNJTlF0eCtKbHd4Wmo4T0ZWb3cr?=
 =?utf-8?B?UGg2ZitGZGQ5UEg2cmxKSUQ2d3VGQUFzUnBkRnFaZHlsTStBK1RTWU0vcmpT?=
 =?utf-8?B?R2lWenJWYzNmY29ZWUdBdVB1TU96RmZFTC9tMkdaTjhkcFRqN1A5bnFpZFBv?=
 =?utf-8?B?VTJjN0xFMUd2N25UVytaSXFpdE1JRVpRbjh6c25KbENDS0FqaE5kT0p5dklI?=
 =?utf-8?B?Z2hNOGxPSkxjd0xTOTVaRElRMXFaVHdKSUtDdjU4eUxPVmJ1TEtEZnpqUHZF?=
 =?utf-8?B?TG1vbjF6dTlTLysyUUVkTGo5cjd2NUo5c3RkNkhUNE5zZTNJd216MmhKSjk1?=
 =?utf-8?B?cEdNcUwveTJJYVdCOG13REZHOHNpVEJzQTZpbmFxR3lPemh4RnpTNU5oRHph?=
 =?utf-8?B?K0dpa05jMWpENTJYTU02RC9kK3NuNktob0ZMZGZWSWtlcjh2bEc1QmdWZm11?=
 =?utf-8?B?YlpjcWhPZXJnczhidFMxMXhEUGRWcTIwTFVSWk1MNFlEQWx6U1pTb1E3SDhz?=
 =?utf-8?B?d3UzTDVqNGN1MzcyeEJMZEtxelUzSDg4Q1NLOUtEeUVPZDhYZk5PalRuMVdT?=
 =?utf-8?B?Q2NNZ2RPaTZRK1VyOWp6Y2VyK0p6ZmJmWTJtYy8yYmNrdy82UExtQzRKbGFR?=
 =?utf-8?B?YWJWVnJWbE9TdnIvaHcyK1BaS2Z0RS9qYndqT0VTSHFjcHpGMHlZMEVwTElK?=
 =?utf-8?B?YWFsOWdzcEMvazVsQTZZcVkxMHptcWwwQzRiZE01UkZ0VzhablZ3ZUxJWUxa?=
 =?utf-8?B?UnBqN2ZNOFNUenVRK1Q5M3R0N3h4TmphMVQ0Rkh0eTNKV0FmNVVkWm1wWHRH?=
 =?utf-8?B?Ry9Wd2Z1aUZLeVZhWHZOVG9ha1FNeDZXSUlXbGF2Tm9ZZ2hNWVdMcFgwcWJR?=
 =?utf-8?B?NWpYeGFycUZvbGlKb2hZRTlBckxucTk4MFNzcVJXQ25RdFJPbjQzeGx4enFi?=
 =?utf-8?B?TkI3eTd1NW5Ycm1CbGlReFJQejRuN2k0Tm53eUEzU2d4OFdRN0MvNUswMVBY?=
 =?utf-8?B?OHJUZGxkQlhJcjdPcTdBa1JGVlZUVk95Y1NMRk5JK3JZRmZwQlBNQnZtcGZU?=
 =?utf-8?B?VDZYYTFjMVk2MzkyeXp5NUxrc25Pckk1TVFNZXlKTEFUdDFndGtJblUrY1pO?=
 =?utf-8?B?aWt0UHF3QTZ6RkN0dDdrVHVxTjB0SFNqWVVRUDVXNUloRmJza3E0aC9JZXVS?=
 =?utf-8?B?eC9SRmdkVlQwcmdkMVk4eTV0eTRqTzNlTExLRjZsSzhlWE9Cb3JGOFNZME9G?=
 =?utf-8?B?OFQyd05Sak44ejRITGZ0SGxvdHkrblhxemJHVkxTUUJVejExVHVRZWNNMmJo?=
 =?utf-8?B?OGgrN3liNXNUanQ3bWgrSEtzb2dQM0U1cXdpeWdHWklRQjl3MFdRVnYyeEJH?=
 =?utf-8?B?NEMycklnMFFWKzNjRlk4cVVuUFBwWDBtS0JyeUxBcnFTSXlIQTN4SlB5K2tx?=
 =?utf-8?Q?BCir8NDc65w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG56dUg0Z09UbjJrQ1BNVEpTSGxXR2FESTVwNU9tL0ZDei9hbzV4UlVrM3Y0?=
 =?utf-8?B?SVh2elVLdHNad1o3SWFFTHk5NXp4WHl3ZEtndG1LZE9pdnVJSVpKV0laVVlx?=
 =?utf-8?B?V1Q3ZVNZbGRzT0tnRFFTdjFyOGl5ZTJWWEdrZms2akx0WHBORnB2bS93SnVy?=
 =?utf-8?B?RnlJS0N6eFBPc05iUG54TDRiL3kvVnFnZURGUk1FWjA4U0VxbVBVSzAxaVpx?=
 =?utf-8?B?ZVREb3dyT1N5T3MxeFY1WklPUCt2d2dTdXhnWEpad0k0ZGFMa05sZlZndUht?=
 =?utf-8?B?b2VXUnEzYlhJdjBXL3VEaEdMdVlKNjJNUTF4dXdTbWtST2pPWU96azcrRXBi?=
 =?utf-8?B?R2tUMUYxV1JKNTh2RDF3TmVDdHlUUFJqUXNxc1FUczcrUXZIZHBaNUwremxR?=
 =?utf-8?B?aS9lYnR1Y3M3Yit4MktLOEtuejh5aTZpRzZLVUdNblE5RWRlUzF5VTBJWWdU?=
 =?utf-8?B?dkdic1JXQXIzYWtvZmVRTmxkZmtQcFJDeG1JZTZENWcwa3BhOWl0MHRrYXl4?=
 =?utf-8?B?eHFRUWpBcGMwa0IwbWQ1Qmp5OHBFci9LUFZQT3lwSmN2OGFwekthOWNReXc4?=
 =?utf-8?B?RzVMREVhbWxnOWVnc3V6ZGlIZ0xYMWZ1R0pReXRtbkxkQ3dWTVVhUS9laElh?=
 =?utf-8?B?QnQxOUdnQjBOQ3kvaTVEWjc0OGRoTW5YeEQxYlJ3dTRKbEFPNElFbG1KZkN4?=
 =?utf-8?B?UFBMWktNMnVSYXhZQ2RBYkhKM3haSVJaWkhuWm54cDVUV0VPakQ3TXYwTEhn?=
 =?utf-8?B?blY1T2tyajdCRENJYzBuUE1LTXA1OThPZFJtcmZLTDNGRytDdEMxdCtMcU4y?=
 =?utf-8?B?dEpUaTFYdnlFdG1mcUt6RU1SaldRcFFUejVqbWJKdzZ2ZjA2U2Z3cjl0eWxm?=
 =?utf-8?B?U1RsWFE4eEc2dmg0Z1dWMFpjK2VZVjBsbk92RmhXdmVVcHV5YUtEazFnSCt5?=
 =?utf-8?B?akhRdmhVV0U0Zjd1UE12bGpmTjZreHkwWmd3TURpeDNScC81K2FuQ2w5bzJj?=
 =?utf-8?B?aFRpNEJKRnQ0UjRYOXp0RWVmMUFkbm9EMURhK20veHM0S0V6REZWOFU4OFRs?=
 =?utf-8?B?V2VqVklwU1pIY1Bsc2EwSkNDdkthUUhIQUN2cHpKNVVFTnBXOEFwbkpNZXRo?=
 =?utf-8?B?S3RIUnI3MHB4YkhoTVUrNld2VUZqMzkzZllnTDVRT3hpWDZwOUhDSHdIWW1v?=
 =?utf-8?B?eVE1NXM5cGNrRXE5K2ZSUFVMTlF2SlpseFVXc0ZuMlhBZEp1TjMvSUN2enBC?=
 =?utf-8?B?MVc4cFY3Ni9XRThabFNDMlMrSkVuaVBjbHBjd1o4ZEpoamZTVkxFcFdNT1FJ?=
 =?utf-8?B?UEtTaFM2NGJNTUZ2QnV0SmwwS0JMdlJQQnJ4b29jYm9MU0JOb2wyV0JRK2ow?=
 =?utf-8?B?UkhFOU9YdFlxam1VMHI4d3lLYXZ0QysxMjFKV3BxeXFrcGRCZmRvdnZXdUtF?=
 =?utf-8?B?Z3Qzc0swNWllcTZQTnlmNzliQUlNdWpVU3E1blgvMFBIQkdvQjk0dmw4WC8y?=
 =?utf-8?B?M2ZMMkhveUd6SkJWdXVkTUxyNnEzaHhvM2ZVVXh0ODR2UFp4QUo2UlB3MkJt?=
 =?utf-8?B?VSs2bEh4b2oyZkNaU0o3d2g1YlRLWDlGdDBJOWRyT2FvTFNoODAwM2I3czVV?=
 =?utf-8?B?K1BwdStjaTg2SHZ5UW9PWjI0WU5oR2l0aTd5czNXL1pLcUhqK1YxZ2RTWmM3?=
 =?utf-8?B?OTRMaGszQ0lVMVh4WEtxN0Y2dU1kOU95ZGZpNlhxc0xVcUFOcFlUOW9NR2pU?=
 =?utf-8?B?cWVNVjFMMVIwREZXdmZlYkwydHdYMTZYaDg4R3ZYcSsyc1VqblJPZkxiTFVh?=
 =?utf-8?B?L3R4WnN3TURIVFhaZFExbHo2VFBiY000WHVuRlM5cEJEUUV4MGRKYmhkU2lJ?=
 =?utf-8?B?S2sydyswMWVjWXdtdFpwaysvRGFQMWtTanVlem1kT2Y4Z0VVMVlRRThQcDNi?=
 =?utf-8?B?SVBDK1p2N25SOC94a0dLUjRDNTE5RDNZNS9lRm4vMkxUQXd4T1dmRldOR055?=
 =?utf-8?B?Z2dPRndnYXhYUW5pOTF0TU44YVJScUcwcU5nVFJqOWlSYkVZNWcvMmNDZnBK?=
 =?utf-8?B?NlRzbEtVTE95SEhuT3R1OE1VelVNNC94ek1ETllZVFhhWk9ndGtPK0dBVTI0?=
 =?utf-8?Q?LXPisI6zM6fXhZ/iNgM3Ee2iB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab88dd7d-24f9-43c2-a13e-08dcc5c61c9a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 11:56:25.5724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QwmFS/vH7cgBJL1TwVYuhQ1rbehBndmH3R5K4gyqdoYwxuakPyqSxJwHIIMlkCsR/RRYT+L2aotNyqEj/zzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6563


在 2024/8/26 18:33, Andy Shevchenko 写道:
> On Mon, Aug 26, 2024 at 11:03:20AM +0800, Rong Qianfeng wrote:
>> 在 2024/8/23 23:33, Andy Shevchenko 写道:
>>> On Fri, Aug 23, 2024 at 11:51:15AM +0800, Rong Qianfeng wrote:
> ...
>
>>>>         ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>>>>                                    &clk_freq);
>>> (side note: this driver should use i2c_timings and respective I2C core
>>> APIs instead of this)
>> Sorry, I didn't fully understand what you meant, it's my problem. I guess
>> you are suggesting to use an API like i2c_parse_fw_timings() to get the
>> clock-frequency?
> Yes.

Very good point, Thanks for letting me know about these advanced APIs.

I think we may need some other patch series to discuss how to implement it,
because there are many places in the i2c that need such modifications, and
these modifications are not suitable in the current patch series.
>

