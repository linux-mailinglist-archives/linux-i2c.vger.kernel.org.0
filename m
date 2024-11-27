Return-Path: <linux-i2c+bounces-8234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CAB9DA33D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8520BB216DE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 07:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C13615381A;
	Wed, 27 Nov 2024 07:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QPaKcVgj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F0146A87;
	Wed, 27 Nov 2024 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732693305; cv=fail; b=DokcTro60FcP/MGtIndNZ8fLSYhCV4GHz/jHC+/mVkCFFu1bN8vGs8DGZP2aXXjYJfhdUEd9UaoIGnavI/QbkwTjwafKp2sKlysppmf3F2ha5Wwi/yOE3Ac6oenZ92ErPoMkqaBE8OB7ATwH/Ssak5CVM9wjvmY8C+pbzAx4QhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732693305; c=relaxed/simple;
	bh=lGhisNzK6WrOH7ueJpeE/ELdMlXihQUI2mkcRKfKW/s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NQcnfkJOifpHOKZTlrjkmE7B+gYUxOMafSrEtglpW6Rl17+pNeECGIJ6Qsx5LpG/9N/TWOmhwkxOSuBuJIPFbrfrMVEz+hQ4hQaqezQ8u+xaegSBDmi+abOw2mDET5y5dLkibArZcrG0XMn6bJBtPv6jHtqdGiSu993VnQTSH00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QPaKcVgj; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPGx0kFiSWGV38TPIce0QGFcWKRRZcS1IE52tRT6mDo1vEVyfIdGTMXGwqtozjMLgYwpwo14fnx8SSFMHQj/zkxRujqcRaNQDMkT6bKGXONO6Wnc5Bflw/ItTnpE9+UobNl2NhCCgDoVVqYhtYlQMItL7Pmfw1f6tW6W/HJ2qtRbCKmnQch7duPPSFc5/JFb+YY394RDlNgNXpeZjtZudoZgAQEopFUmz+LEC1lu0uz0SLsJEOL6t34S0GuKhp5slVHGoWjVGX8mJ3DCngcZNDJ2h0ruZYoiiPaomM1qEraC0XyFfT9nkQPecrW4gfhvazDYod2+KugODcgOZlSnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGhisNzK6WrOH7ueJpeE/ELdMlXihQUI2mkcRKfKW/s=;
 b=i1MQYyNoSii3bn/QKLObtM2vbYwNqAX3EQxv4UyYaOjy1yY8g+mQNRK1fGKAEIMD2vISAtJPHUqAiMAzOBrAbN6rY8QGIohbvGr7+qM4akXPehLoPqoE6XmwkjF7spjN3hOrToIyRA/bHRT9epG1v6gLkngkovySlTq3nwJEt63FgGX3MI8Mlun6mFasMuv5tj+wGcoLIUdl7aM+MYVLwZSMKHJGj9E7cGw6iNURPx3Hlg7EqZ8ycF7a2jvGfamXMNwV5XG31YiFGQKCnJ1fAVdRCpPpG/+ZNdR1Fra7xtlQWhoGie/z0KsrjbewSvgFB826D0OeQJlRxrUMobxHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGhisNzK6WrOH7ueJpeE/ELdMlXihQUI2mkcRKfKW/s=;
 b=QPaKcVgjTRrxq7ZyLeIoAnYXDNgoAiYhW7Znx+RU1ZXLUkVP+nxKqNzzGEvEF4BiNbT4VSZd2f6sKYBZQN6SCtqjl93RYhYO4XTEFGBdndPKX4mmmT4b5bnwCfzgbG127/NYSHpRT664GCf1DZi40WTrjfQpACO8Ug9Xc/bblqiaxScS6p8PcJBP+DtXgQ6HvmSWB9FR76pvD1cBOnq0XQjJolvRG+d7TztFYl779TZnKH05oCLymzkTCnBZH0hAuQhRuUDiX+zoTHfMG3yCNUwarZg/LbMADd37RDRfIV/SEwmrGL9yGOr1Sjwff63m5KUbYaNuV/L7hhLnKgpN1Q==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI0PR04MB10461.eurprd04.prod.outlook.com (2603:10a6:800:216::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 07:41:39 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 07:41:38 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v2] i2c: imx: support DMA defer probing
Thread-Index: AQHbQJ/KpxcVwD7VSUaHU7HQcvRSIQ==
Date: Wed, 27 Nov 2024 07:41:38 +0000
Message-ID:
 <AM0PR0402MB3937944D3D0D985367EDEF9BE8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
 <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-fat-orthodox-eel-5389b4-mkl@pengutronix.de>
In-Reply-To: <20241126-fat-orthodox-eel-5389b4-mkl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|VI0PR04MB10461:EE_
x-ms-office365-filtering-correlation-id: d073222e-f488-418e-296a-08dd0eb6ed8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eW5tTTYydzNHeUZub2dxbk4yWEI3SnExS3V6VVc5ZDduelNuY1F1am9YSGto?=
 =?utf-8?B?YWdlWVNqOFpYNWcyOFBVcTVTTFlWN3JCK2dlc0ZQb0g4d0x2bml0dTRvRExa?=
 =?utf-8?B?WFR0dFFLQlB4SnZnVmxjQSswTTh0d29FV2RRM0xndnR4T0xQNG0zTnkvdnYv?=
 =?utf-8?B?WFJxeWFrZGdXSkVSZGthU0VlRTZXbzBLd0U0aEdKY0ZTb3dHa2lLSjNHNEhn?=
 =?utf-8?B?MHBySFlhRncyRHNZaTVsYXpRVXRjWE04cTRtMmdLdjlxTUpZdGFlUnpRc2hO?=
 =?utf-8?B?U1hwZUx2RVlsNjgwRk5BNDB4Nkt0S3lEYmp0K1JsaTlCQjYxKzcvalZ2NlA0?=
 =?utf-8?B?VlFjK3BLUzFsQWErNk1WNVBLUzZnNUJNWDdjaGwraTQ4b1FZd0l2c3NVV0U4?=
 =?utf-8?B?VVk4OXIyOExuOWZWQ2NBOUtXdDlweHdkQm9IR1VTeExGK3M1cnk4RHBoVmVP?=
 =?utf-8?B?V3R5Z3Bqdzk0Wm5leDVNZUJwTGdieVRzT3VkbEFjTFhoeDJSVzJBTnZlQk01?=
 =?utf-8?B?MzJNN2FsT2psb1VKYThrdUM4elFTVmhHekdHQUhZbENXVkpJcjU4QXpzY1JK?=
 =?utf-8?B?SnI1T1EwUnRsSUNVaTRpSGhnSFMwTVpJVHZpYytUTFE2TDEwckZ2dGM0eGRh?=
 =?utf-8?B?UFQ4b2pBVWordmJ2SmNaQzBDK2paazdkdHBSdjV3eVJUQU95ZzlmNlV4QUVL?=
 =?utf-8?B?MW1FOUJ3SmRyNHJJeVpEa3dDbmZKc3pMc3hRdSsyNURlTElNTkR0Y3lMQ0I2?=
 =?utf-8?B?dFVkNzFyUis0OE0wbThGRWxTMU50eGRmVUdWUjBBZUNycDBBWmo0dTB0YmZs?=
 =?utf-8?B?ZGdDTm9admFMZlphM2lRZXI5L1loS3lKUURIeFNaeCtCblIyVExMRVlHaXlL?=
 =?utf-8?B?ZXR2NEN4STQxUEhVNWVhY2hNRm5SWDBiU09vbFAvWVUzS0dHbHNuU0tzdElt?=
 =?utf-8?B?Q0dFWVdZQW5oblN6R05MRDlvUmpUS0VYYU1hVnk1YURQbmFES080V1NGUFZv?=
 =?utf-8?B?VDYwNkN0SWcvS2hlMEtzTDkxSlRqSWQ4TG5PWXdkVEQvd090bDlUVFdlczlR?=
 =?utf-8?B?MFo2K3plS3FaZ0lFZ1doNlpQTlVYLzNjL0w3TkFkTVM0MVFnYnBMbmJnNlRP?=
 =?utf-8?B?ektjNFo0L0pjYXU1VkFyUll0aGNNYVdRbGJzeWQ0WG9MMzZTcUJ1a1VEZnhG?=
 =?utf-8?B?WUJnNDNjUGtxSi9pb0JZSTRPRktDRWFhQVU4dzRwMENHRDkwR0dJU2FUanRp?=
 =?utf-8?B?c1FUTDd6RXQ5ZFpQUXZHR2RtSXF2WEt4T0lDdkxFUkdYSXVWMm9TSStwdGI2?=
 =?utf-8?B?STZzK2N5MEhRYTVMQTZzdW1pakNkeHUvYzQ0S1RJekxpUVdhOWEzbExZeXlI?=
 =?utf-8?B?SnRkYUN2RlNlaklUaU43OFdOdmxQUWYvajUvbmt5N1o1MFV4TXVNalFiQnZD?=
 =?utf-8?B?V2F3QXZiUHR4UVZMVENTOXN5Z3Vvbkk4dGl2QTlxazRYS0NqNzdkYTB3ZHhk?=
 =?utf-8?B?QkZ4Ny9Gamc0aDJ1bXFHVmU3Q2lMbC9Ta2FoNmgxbENlUS93cWRPL2h0dXdh?=
 =?utf-8?B?dHBNQTRPNE9aRjhwRS9pQkUwbHdOTDI2b296OVowbTFoTHE0TGUzWGJ3aXZN?=
 =?utf-8?B?N016TWpQTDE0NVdMb3FwZG5yYlhPTkZkdGdHN0NKMXg3enRqOEJJSjY3b20v?=
 =?utf-8?B?UHliQmhsYXhBa09CL3dINnBRUGxwMnhXdzliQTdaZ3Y5UTljVG8wdTR1Zitp?=
 =?utf-8?B?a3RvemtsQ2NjZ2ErWXQySmEveFJ2NHlrM0crcUtqeUZDeEJVSXo0SjVXeXN5?=
 =?utf-8?B?NXdoY2ZoQnZmcGx3R3NnZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG4xcFkybWVVUFl5aFhqREpkWHVobS85WTUvTkhJdVVEN3JZNWxOTVI3ZHBL?=
 =?utf-8?B?eWJxL2ROOWRKWXBTTEt2MVVtNDVKRElrSi9yUUVmM0c3VEVOWDJpeTl5Zkxi?=
 =?utf-8?B?NVF0ZFc2d3FrODF5RDhaTWh5emJmdzVQV3VHS0JCOFpJdmpXd3oyVklBeUVr?=
 =?utf-8?B?VHF4Sk1oL1dxQjBiN3o4Mm5ha3FLc0pmSEhsMFllMHF1VG11MTRUaEV4cHFu?=
 =?utf-8?B?NllKbEg3UitkcTlOVitrY1ZlT3VFbkhkNXdQMTVKdVJjcTlsOHNVMWU3VmdB?=
 =?utf-8?B?eUZTNmg1MGg5aVAzSFBrMGJaRnY1aWZlR2l2WFNrK1FUZStNNE1SdWsreS9k?=
 =?utf-8?B?c2pSUVE5NXl1RWZScVc4Vm9FejdobitsdGg1OEJJcllzVmwwdHdXQVZxWmZJ?=
 =?utf-8?B?UU5ZYjl2UXdTdVA1c2c2azlPSnFoZm13ODhqM0NUZ2hvY0FmcDRTSnBIVXpk?=
 =?utf-8?B?SmJnQ3VZZEVodGw5QXJncFAxTkg4YnBZVWZSNldUamlSQ0ZUd0ptUFVBRk5Z?=
 =?utf-8?B?U2Z5VzlxOFpwMVVLc2c1TVdnamhXblJaNUc4Tm01Z2xyVFJrelBVa0N6TS9L?=
 =?utf-8?B?NFkrS1lUNmpwTW9MTE5DK0NNd0YwSkhpT0ZEM2VqRlM1RGFFTC9aUlNKV2Fy?=
 =?utf-8?B?QnNKUXZveFZZaTF4RkJPLzhPTDN0YlVySHVCYmtINHltWTRUU1Rhd2RZenVk?=
 =?utf-8?B?R2ZvRzhFSHV2N0dITS9hTFIzeWZDbnpDRXRyOWZHNlVla3pEeFhCRUREeXhh?=
 =?utf-8?B?U2hiMXppNnZsVVlHaG1kK01YTk1acG1hWjFTcmt3NHcvTDVNVkErbGVTWHJo?=
 =?utf-8?B?S3VpeDVXdlJwTlYyN0tsbjZmNEZtaVpCZ1NCQlE5WUt6NkpCWWFHRXR1YUhu?=
 =?utf-8?B?UGVRYmJLS2tvWHp2dWF0MjNDeXVOcEljVkJWaVJqWjloL2IzelE0NHZsbXM2?=
 =?utf-8?B?OEJtdlAxM0VJQmtFRUtCSnI3emhiai9HWDUvTG5iL1Vkb3VZNHpkNDltVXJE?=
 =?utf-8?B?djVqZUVWaExreDVEYVoyN09MTmZTVU1BMlc5ektMYWp6bENZZ3NpNmVjMmEx?=
 =?utf-8?B?YU5LeGdHa1QrYzZlR2tJZGlLd1V5VDNOQzE0dXA0a2d2d3Rld0pSaG5WUERP?=
 =?utf-8?B?VlRhR1VjczI3UG5wM2pseTkyZ0RqeG94UkVScXVwU1Z0VFVnalhxczlXSHhv?=
 =?utf-8?B?bThKTmRUK3FFRzF6K2JWMEVURUtUMXNwTGRBby9IZExkSG05QUdITzlISlpF?=
 =?utf-8?B?ampoU3crOU5hNGFqYThoTkVPalkyVS9ZZUZsMDhvanNkSHRKWjlqQkU4eXdN?=
 =?utf-8?B?elpUc093WnlSWDFsWkw4OVpXY0ZYdzBLQ2w3cnFwSHpMcXg3TkF5OWhZSTYy?=
 =?utf-8?B?TjBHWTBwdXpyT1cvU0FJRTg3cGRuUGNGNVkrREUxQlIrV1lZRS9QS1VuMnZo?=
 =?utf-8?B?MTlwUGxvQ3QybWQ1Z1BUWnRJMFVQWE9Pd08raURRVHZKOGpQeitxVnR5cm5U?=
 =?utf-8?B?U0ZqZk02dDVmRFZ1MGFLM0VCMFdaOU5PaVNRNE0ybDRYZ2VqUGxzd2J4UUhO?=
 =?utf-8?B?Z1lOSTFVcnRvcUNadnNib2F2Q3lLZlJwbDNMZVRJUi9DcUhFb3g4OE1BKzJB?=
 =?utf-8?B?d0tOTk5Tc216SEIxaVpnTUxidHYwZzRLWDU5OVI3K2dWWlIwd29BQjlFcXNV?=
 =?utf-8?B?TG1PSnI3aWprVHVLTWs5cG9BQ0N5WWJGR2JnYkxQL3FaQWhJTFdsRWhzRnJJ?=
 =?utf-8?B?TWRQTHZXbm9NQjB0eXU3WXJjeVN3WDY4Q0tUaTlLNU5LYXk4NCt6TUFRdnBZ?=
 =?utf-8?B?aklXVTVIT25VUnZHTWNnWldLa00yWDRvSDJHMHlIS0s0aUxzYWRaUExjQm1L?=
 =?utf-8?B?MmpEMkdBR2YvMXFBTnJwZEg4RE9nV2NDZ3QxTU55anhmQkY1NXRCWTczdDl5?=
 =?utf-8?B?cWpnOXFzaGFhcjlqZjl6cWdnbEp5U01zNVc3MWp0MXl2a3Y5MTk0N25VUVZq?=
 =?utf-8?B?TFNpdTZoa3VkSCtkZTRJZjlNT1lqMVlqbW9QZjZ2R01Dc29MS0ZuVk9veldX?=
 =?utf-8?B?dGZRQll4WWpUVWkxbHRGdUdKV0F6eE92RWFMV0tsditXYVBhaU1xVk1rS0FZ?=
 =?utf-8?Q?5Ck7dohsC6w/9484nTGJ8kvyx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d073222e-f488-418e-296a-08dd0eb6ed8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 07:41:38.8779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Celg8a2v12AqMoT2h1XFzAjimeCifPSDHwizklVZgHaY0z1tllnAl6wZLItfDtQWsxDsPG5AgMERmnk2ENOJUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10461

PiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBN
YXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgMjYsIDIwMjQgNjoyNCBQTQ0KPiA+ID4gVG86IENhcmxvcyBTb25nIDxjYXJs
b3Muc29uZ0BueHAuY29tPg0KPiA+ID4gQ2M6IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsg
by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU7DQo+ID4gPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGFu
ZGkuc2h5dGlAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsNCj4gPiA+IHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsgaW14QGxpc3RzLmxpbnV4LmRldjsN
Cj4gPiA+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsNCj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+
IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjJdIGkyYzogaW14OiBzdXBwb3J0IERNQSBkZWZl
ciBwcm9iaW5nDQo+ID4gPg0KPiA+ID4gT24gMjYuMTEuMjAyNCAxMDoxNToyNywgQ2FybG9zIFNv
bmcgd3JvdGU6DQo+ID4gPiA+ID4gPiAgc3RhdGljIHZvaWQgaTJjX2lteF9kbWFfY2FsbGJhY2so
dm9pZCAqYXJnKSBAQCAtMTgwMyw2DQo+ID4gPiA+ID4gPiArMTgwNCwxMyBAQCBzdGF0aWMgaW50
IGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4gPiA+
ICAJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KPiA+ID4gPiA+ID4gIAkJZ290byBjbGtfbm90
aWZpZXJfdW5yZWdpc3RlcjsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArCS8qIEluaXQgRE1B
IGNvbmZpZyBpZiBzdXBwb3J0ZWQgKi8NCj4gPiA+ID4gPiA+ICsJcmV0ID0gaTJjX2lteF9kbWFf
cmVxdWVzdChpMmNfaW14LCBwaHlfYWRkcik7DQo+ID4gPiA+ID4gPiArCWlmIChyZXQgPT0gLUVQ
Uk9CRV9ERUZFUikgew0KPiA+ID4gPiA+ID4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiRE1BIG5v
dCByZWFkeSwgZ28gZGVmZXIgcHJvYmUhXG4iKTsNCj4gPiA+ID4gPiA+ICsJCWdvdG8gY2xrX25v
dGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gPiA+ID4gPiArCX0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IERvbid0IHNwYW0gdGhlIGxvZ3MgaWYgdGhlIGRyaXZlciBkZWZlcnMgcHJvYmluZywgaXQncyBu
b3QgYSBlcnJvci4NCj4gPiA+ID4gPiBBbmQgaXQgbG9va3Mgc3RyYW5nZSB0byBpZ25vcmUgYWxs
IG90aGVyIGVycm9ycyBoZXJlLiBFaXRoZXIgYWRkDQo+ID4gPiA+ID4gYSBjb21tZW50IGhlcmUs
IHNvbWV0aGluZyBsaWtlICJjb250aW51ZSB3aXRob3V0IERNQSIsIG9yIGxldA0KPiA+ID4gPiA+
IHRoZSBmdW5jdGlvbiByZXR1cm4NCj4gPiA+ID4gPiAwIGluIGNhc2UgdGhlIGRyaXZlciBzaG91
bGQgY29udGludWUgYW5kIHByb3BhZ2F0ZSB0aGUgZXJyb3IgaWYNCj4gPiA+ID4gPiB0aGUgY2Fs
bGVyIHNob3VsZCB0YWtlIGNhcmUgb2YgaXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
SGksDQo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uISBJIGFncmVlIHdpdGgg
eW91Lg0KPiA+ID4gPiBJIHdpbGwgY2hhbmdlIHRvIHRoaXMgbG9naWM6DQo+ID4gPiA+IAlyZXQg
PSBpMmNfaW14X2RtYV9yZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4gPiA+ID4gCWlmIChy
ZXQpIHsNCj4gPiA+ID4gCQlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+ID4gPiA+IAkJCWdv
dG8gY2xrX25vdGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gPiA+IAkJZGV2X2luZm8oJnBkZXYtPmRl
diwgInVzZSBwaW8gbW9kZVxuIik7DQo+ID4gPiA+IAl9DQo+ID4gPiA+DQo+ID4gPiA+IFJldCA9
IDAgIC0tLS0tPiAgZW5hYmxlIERNQSBzdWNjZXNzZnVsbHkgIC0tLS0tLS0+IG5vIHByaW50DQo+
ID4gPiA+IFJldCE9MCAgLS0tLS0+ICBkZWZlciBwcm9iZSAtLS0tLS0tLS0+IG5vIHByaW50IGFu
ZCB0cnkgYWdhaW4NCj4gPiA+ID4gUmV0IT0wICAtLS0tLT4gIGZhaWwgdG8gZW5hYmxlIERNQSAt
LS0tLS0+IHJlbWluZCBub3cgaXMgdXNpbmcgcGlvDQo+ID4gPiA+IG1vZGUNCj4gPiA+ID4NCj4g
PiA+ID4gRG8geW91IHRoaW5rIHRoZSBsb2dpYyBpcyBhY2NlcHRhYmxlPw0KPiA+ID4NCj4gPiA+
IFllcywgdGhlIG90aGVyIG9wdGlvbiBpcyB0byBtb3ZlIHRoZSBsb2dpYyBpbnRvDQo+ID4gPiBp
MmNfaW14X2RtYV9yZXF1ZXN0KCkgYW5kIGxldCBpdCByZXR1cm4gMCBpbiBjYXNlIG9mIERNQSBv
ciBmYWxsYmFjaw0KPiA+ID4gdG8gUElPLCBvciBhbiBlcnJvciBpbiBjYXNlIG9mIHByb2JlIGRl
ZmVyIG9yIGEgZmF0YWwgZXJyb3IuDQo+ID4gPg0KPiA+ID4gVGhpcyB3YXkgdGhlIHByb2JlIGZ1
bmN0aW9uIHdpbGwgbG9vayBsaWtlIHRoaXM6DQo+ID4gPg0KPiA+ID4gICAgICByZXQgPSBpMmNf
aW14X2RtYV9yZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4gPiA+ICAgICAgaWYgKHJldCkN
Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBy
ZXQsICJGYWlsZWQgdG8NCj4gPiA+IHNldHVwIERNQVxuIik7DQo+ID4gPg0KPiA+DQo+ID4gU29y
cnksIEkgaGF2ZSBzb21lIGRpZmZlcmVudCBpZGVhcy4uLg0KPiA+IDEuIERNQSBtb2RlIHNob3Vs
ZCBiZSBvcHRpb25hbCBmb3IgaTJjLWlteCwgYmVjYXVzZSBpMmMtaW14IGNhbiBhY2NlcHQgRE1B
DQo+IG1vZGUgbm90IGVuYWJsZWQsIGJlY2F1c2UgaXQgc3RpbGwgY2FuIHdvcmsgaW4gQ1BVIG1v
ZGUuDQo+IA0KPiBBQ0sNCj4gDQo+ID4gICBJZiB3ZSB1c2UgcmV0dXJuIGRldl9lcnJfcHJvYmUo
KSwgd2UgaGF2ZSB0byByZXR1cm4gZXJyb3IgYXQNCj4gaTJjX2lteF9kbWFfcmVxdWVzdCgpIGZv
ciAic29tZSBmYXRhbCBlcnJvciIsIGl0IHdpbGwgY2F1c2UgaTJjX2FkYXB0ZXIgY2FuIG5vdA0K
PiBiZSByZWdpc3RlcmVkLCB0aGVuIGtpbGwgaTJjIGFkYXB0ZXIgcmVnaXN0ZXIuDQo+IA0KPiBp
MmNfaW14X2RtYV9yZXF1ZXN0IHNob3VsZCBvbmx5IHJldHVybiBhbiBlcnJvciBpZiBQSU8gbW9k
ZSBpcyBub3QgYW4gb3B0aW9uLg0KPiANCj4gPiAgIElmIHdlIGFsd2F5cyByZXR1cm4gMCBhdCBp
MmNfaW14X2RtYV9yZXF1ZXN0KCksIGRldl9lcnJfcHJvYmUgd2lsbCBub3QNCj4gd29yayBmb3Jl
dmVyLiBTbyBmcm9tIG15IHBvaW50LCBpZiBETUEgaXMgbm90IHdvcmtpbmcgd2VsbCwganVzdCBv
dXRwdXQgYSBsb2cgdG8NCj4gcmVtaW5kIG5vdyBpMmMgaXMgYWx3YXlzDQo+ID4gICB3b3JraW5n
IGF0IENQVSBtb2RlLCB3ZSBoYXZlIG5vIERNQSwgdGhpcyBpcyBlbm91Z2guDQo+IA0KPiBBQ0sN
Cj4gDQo+ID4gMi4gd2hlbiByZWFsbHkgZGVmZXIgcHJvYmUsIHJldHVybiBkZXZfZXJyX3Byb2Jl
IHdpbGwgcmV0dXJuIGRlZmVyIHByb2JlDQo+IGRpcmVjdGx5LCBidXQgd2Ugc3RpbGwgbmVlZCB0
byBnb3RvIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyIGJyYW5jaCB0byBmcmVlIGlycSwNCj4gY2xr
X25vdGlmaWVyX3VucmVnaXN0ZXIgYW5kIGRpc2FibGUgcnVudGltZSBwbS4NCj4gPiAgIFNvIHdl
IHN0aWxsIG5lZWQgbW9yZSBqdWRnZW1lbnQgYXQgcHJvYmUgZnVuY3Rpb24gdG8gaGFuZGxlIHRo
aXMuDQo+IA0KPiBOb3QgcXVpdGUgImRldl9lcnJfcHJvYmUoKSIgd2lsbCBub3QgZGVmZXIgcHJv
YmUgZGlyZWN0bHksIHRoZSByZXR1cm4gaW4gInJldHVybg0KPiBkZXZfZXJyX3Byb2JlKCk7IiBk
b2VzLiBUaGlzIHNob3VsZCB3b3JrOg0KPiANCj4gICAgICAgICByZXQgPSBpMmNfaW14X2RtYV9y
ZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4gICAgICAgICBpZiAocmV0KSB7DQo+ICAgICAg
ICAgICAgICAgICBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgIkZhaWxlZCB0byBzZXR1
cA0KPiBETUFcbiIpOw0KPiAgICAgICAgICAgICAgICAgZ290byBjbGtfbm90aWZpZXJfdW5yZWdp
c3RlcjsNCj4gICAgICAgICB9DQo+IA0KPiANCj4gPiBTbyBJIHByZWZlciB0aGlzIGxvZ2ljOg0K
PiANCj4gVGhpcyBhbHNvIHdvcmtzLCBMR1RNIQ0KPiANCj4gPiByZXQgPSBpMmNfaW14X2RtYV9y
ZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsgaWYgKHJldCkgew0KPiA+IAlpZiAocmV0ID09IC1F
UFJPQkVfREVGRVIpDQo+ID4gCQlnb3RvIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyOw0KPiA+IAlk
ZXZfaW5mbygmcGRldi0+ZGV2LCAidXNlIHBpbyBtb2RlXG4iKTsgfQ0KPiANCg0KSSBoYXZlIGNh
cmVmdWxseSBjb25zaWRlcmVkIHlvdXIgc3VnZ2VzdGlvbi4gDQpJZiBETUEgZmFpbCwgaTJjIG5l
ZWRzIHRvIHNob3cgZXJyb3IgbG9nIGluZGVlZC4NClNvIEkgbWFkZSBWMyBwYXRjaCwgaXMgaXQg
d2hhdCB3ZSBleHBlY3RlZD8NCg0KDQo+IE1hcmMNCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUu
Sy4gICAgICAgICAgICAgICAgIHwgTWFyYyBLbGVpbmUtQnVkZGUgICAgICAgICAgfA0KPiBFbWJl
ZGRlZCBMaW51eCAgICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRl
IHwNCj4gVmVydHJldHVuZyBOw7xybmJlcmcgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIx
LTIwNjkxNy0xMjkgfA0KPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiB8IEZheDog
ICArNDktNTEyMS0yMDY5MTctOSAgIHwNCg==

