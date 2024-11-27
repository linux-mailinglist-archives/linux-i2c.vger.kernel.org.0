Return-Path: <linux-i2c+bounces-8238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA679DA3A7
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 09:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69C111664A2
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AEA149DF0;
	Wed, 27 Nov 2024 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IZCI2llv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B5208A5;
	Wed, 27 Nov 2024 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695506; cv=fail; b=pvDpQ9itjl09VAQRKyYUpZfNyT5KNVgRxvtzoI0Mw6YOl5O3cdjLFdAFT9BNexhAqHo6oEaGNNH+x/rrSEfo5Ua/aYuRjpa7ad1+/cEwEqvC5El11yXWLHthOmf8DocaLAnIYkFJog5kmVTbqUmPWgLEDdbxkatBmRao0MWFQ0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695506; c=relaxed/simple;
	bh=fI59AJdKyMnR2Nu/GtxY9W/dgWprGfqr4gvZpJsbx5A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m4ak7eCrfI9NUVBDObSkGYrLlwVcY76ccWXHva2vTnTuZvhx8ktE+QHrEtx3FsG+V68A4VAGw410LuLE7REJYvsDYv4iGtEHkdLioVwHbymbrU+taYd3UH6/Mc2aJmXLUVXn3T47IeVE7o9+UOMynx3BI3zGNhOHhe8FmAXhC8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IZCI2llv; arc=fail smtp.client-ip=40.107.247.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aho31aVfRUy6q920Eiv8MKoa11lHYZa9wjmY1ZHdKEeRwYJAZPo2J3QXdR+dbXj3loA5MYMPt5mOYCkqhs9bRowcJC4g+RssrrIbWYZqjk79/OKh0cxbVAfYDv26s1+pgslrTHn8MINxKhEHfbn+0GJXdDgyStx5cZGTRenPazKt6hHNxxsQlDHWmQDITV0XwCvo2c7pOIL0gaIaVEkwIS+Vt9xCFjWlPT43kmk/l3jmT4MK864Nxgy9KgY++svI/6f5o26n7eocIcJgsRxzpagx/n+BGeirrKIWFLJxWrrlMvFipEDlq6zJ2wavPFYt4/onzjLH8F/W3OcYO1mkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI59AJdKyMnR2Nu/GtxY9W/dgWprGfqr4gvZpJsbx5A=;
 b=H6CMxXHlnyTPlHanDSgPEo/3OiFkpdbG4Nti7hZxGI2mL0agV2RKcQDDNSoaPu8j0mJuAM8dLMIZDKHtMU4/heI6UA3UeOEDVoP7IuLx+ig9K5Klg5mnKtnjYG+QHIBFHAQDBnWkQL3H7b7OXx1pfgh/fDOEjEr8MZn9XboSA7oRb0I5sIxBh+syP4A+gYcPdsNDYbRy+13N2ZKSxPV6wueslN7ICS4ob38cEjb/Kmp0cy5/bhh/dlVitobK7JXiDaihAZrXntw6dwu0t+2yDIqYX11UlElOXAJlaVxKsB70vcSK6zd0saX/yBsZJejzi1w+DF/T3sDZssNgRQTYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fI59AJdKyMnR2Nu/GtxY9W/dgWprGfqr4gvZpJsbx5A=;
 b=IZCI2llvqXJD5Z971kNC38fTTw2cZTEGV+gjUyEAaDhoH8caDWHDfKG4RXTA0i+taBTKHKpPMCdP2UeG3o1jUeleas4EC39yrKGBOEuWHdI6DWeTu7bU1smhqOiJAhrk/Hxzy3QZWXXnqNFOFN7eHZrT9rqr3810ZM2ekgxz4mWDFqqyieA48KJLdnTN31quxmRu51a3HLWJMUJr8U00Ry9F10k0JrH6sDOPubTa0UgIsrnZ+ecF5n3/OizIU6pE9tSE9UsYWOBEFIC4sEizN82kn3VglVIGpcRD7cjkPAjhjazbj6SA8Ui56S39yxBCnR6rOcHs3BVQZooU8xKiJA==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by GVXPR04MB10972.eurprd04.prod.outlook.com (2603:10a6:150:224::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 08:18:21 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 08:18:19 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
Thread-Topic: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
Thread-Index: AQHbQJ8J8oaex7XlfkCmdO+XVwVKZrLKvokAgAABAECAAAObgIAAAWNQ
Date: Wed, 27 Nov 2024 08:18:19 +0000
Message-ID:
 <AM0PR0402MB3937DD279DF6EE1CD65A6E13E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241127074458.2102112-1-carlos.song@nxp.com>
 <20241127-ninja-dormouse-of-bloom-8ee494-mkl@pengutronix.de>
 <AM0PR0402MB3937614F4866F4F15D2FDA21E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241127-analytic-azure-hamster-727fd8-mkl@pengutronix.de>
In-Reply-To: <20241127-analytic-azure-hamster-727fd8-mkl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|GVXPR04MB10972:EE_
x-ms-office365-filtering-correlation-id: 89b1d6eb-f0e0-40f6-c4ca-08dd0ebc0d61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHRVZXZxU1YwUVlGRmoySHRxUnNURktZVHFnWVQxMEQwQXNMeTY3Z21QYmp0?=
 =?utf-8?B?THFTYUFqVEpMYlBDU3JqWDlxUStEdWgrOFZTR1R6cG52OTVtc1R6K1dDRkQv?=
 =?utf-8?B?V2RNZGN1WHFXRVpOc0FaNFVNb3hVazNCYzZybFlNUE43YS85UVkrMm8wZFBR?=
 =?utf-8?B?L1hOeDA2NDkzdGJhYnhmUjZ2bWxaUVZHTGRMaFVocnZhbkxVVUlPRDdVWHdS?=
 =?utf-8?B?T3p2Wk82UWs2azRBaU1hazVvNTFpb0hldUxBR2N3NmN3OG84Q1ZLaDU4eFp1?=
 =?utf-8?B?YUtTV0tYaFZvcjVHci9RQVA3R0tpa3ptQ0FsQ2ZxMEN6STYxQU9IeHU1b3R3?=
 =?utf-8?B?aW93eDhHanZTVWMxM3ZCR0MrZnpsWDZ0TXZ5by9oN2ZSRHJ6dHMwVS9LWDdK?=
 =?utf-8?B?NnNVeEhVU1VYV3BLcTluZ3h5QzUxZ1VvU2grNFNHbUxnemhtZDlTQ2ZYVm9V?=
 =?utf-8?B?VGxCNHgyS0w2aTJzSm4rdlR1UllkVCs5QUMwekkzQkR1WXk5OXRsenhIeE5E?=
 =?utf-8?B?M1hBa0FtUWZXUmdzcEpycWlnVU8yR1FVZ1doOGJXcVVYZUcwdGkxRFJ0K08z?=
 =?utf-8?B?ZmlCNlB3dTBkQkR2VGQveXBnSTUyL1ZIK1hzMzJhTjQzeFAwVlpHWHlVZHFs?=
 =?utf-8?B?b2R5YkpMckZpdzBIa0YvNXpXa3R6UHhXVU1Vamp6bUsrQklWTEZEOGtOa3ZH?=
 =?utf-8?B?bEhpcnVTbTE4dHJyOW4rMkZJV1pHRkcwWmViZG45SGRLcEhvOExiWUZTSHdY?=
 =?utf-8?B?eU1zdGxlYjNYbHU2eGRDdDMxOFdhRTVCV25vVDFwRlhkbldPV2ZwREpaV2Ex?=
 =?utf-8?B?N3dkdVJZcEFDeEZsVFd4ZXlhTGxFTXJ1L01Ec0pHbzROVkRJL3kyalZ4SmI1?=
 =?utf-8?B?c2Z4alVQNDZyeDRMUWZvbGpuRHIzRWppR2FUTUFja3Roa25WaGJ0aTE0NG5F?=
 =?utf-8?B?SjJxMDhJT09vUWlCditzZ2gveWRLRVZOZHAwczNQdGgwVUxHWHEwT1ZpSVhB?=
 =?utf-8?B?OTFWc2JpdlJFT1VKRjF0KzdDdnE0WCswZDdrSlJ2VnlxQk92ZUJKcUlkZTFX?=
 =?utf-8?B?WGtkUFJKZk5HTmgwcHFaOFZ2UlE1c3h1RjY4OWExNVpGc01xRnFtSmRybHFo?=
 =?utf-8?B?eTJrT2NHZHZ5UHFhZkxRb1k1Vi96TTd4RCtPbWlRVGlqcEo0eG0vZForUGZQ?=
 =?utf-8?B?S0d6SURETGlzVXB3cUpTeC9iZUxNSm5pejJpNlk4OGU0Q3VYSDcvM0R6NW84?=
 =?utf-8?B?TjBvZkFZbmJpRlRDM3FYd3UrQ1ExWVFwbzN1R2hpcDh6RUUzNFlJaFR0S29x?=
 =?utf-8?B?K01meHNFVVFLRlJMbnlweVFpMFM0UXZUYjI4NEFRK3NGcmdNVHRRd1FJYUNK?=
 =?utf-8?B?S0NTcFdmWGxGTEdNUUdHNzE3Y0ZZRFN4R2VldnNZTGE5dUpJSi94TmR2TlZO?=
 =?utf-8?B?OVhRYzJFaDhxTm5PeGdCRjZtWVdHUW1SQ2JIM2dGYWo0d25QdVl4dDU4VVpC?=
 =?utf-8?B?M215VEZwazlTYlA2eUtXMk9XaWxVYk9IT2k0eFFTb2s0dEtFWDU4WnV4VlNu?=
 =?utf-8?B?T3JWWkV3U3poQm1PU3kyWDBiUlZVMERRc0pVUmNlT0RWeDRER0pmcmJyU01s?=
 =?utf-8?B?SU1RazBUQ25qYkUzNjQya2dwSHJRZk5JUVpSdG1sOXBpMDZndEFsc0Fta0NG?=
 =?utf-8?B?ek1BeWNrckVVbk9ZVnV3cFdEN3dMR2svNzhhT2RCSURrV1lkcDRZZ0pPNUkr?=
 =?utf-8?B?ZHpqc21JMGxzNXRlaU4rNDhHS3oxSExNQ0Y1YThCNlBqZ1VGWmwwdWNaMllu?=
 =?utf-8?B?bXRzZ0UxTlN2UmUyNEZDdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTVuak1HWDBEN2daT3h6aFdSaXN0ZG81WmMyeVhuQ1djUWg5bWpBTzkrQmhT?=
 =?utf-8?B?TDlsSVhkUnE1QTM2dk5zOUhBZ0pHdUNlaFNZcXc2SmhBUnNIdHVKOHFobXZR?=
 =?utf-8?B?UExVWWFRaU5kZC83bzZqUzRiVisyWUhBQjM3aC94ZC9nWHFLdnc1ZXJTdHlX?=
 =?utf-8?B?UkZOeTl2MklhRk1DR3hhMGpaQkZzYnFMYTZlckFlaHJ5VmwrM1dna29MTGdC?=
 =?utf-8?B?UGdaaUNVNVprdzlDcmxPUjdNVE50SXo1Z3BZWjR4N2crdzVFd0ZGcFM4RmdC?=
 =?utf-8?B?QjZZMFdCSTZrWUg1YVl4disrd1ZNcGh4N2lndDNSQlR6MWRMZlF1dXFXTmxR?=
 =?utf-8?B?WXRiTjZtQWthTDlZOTR2TmhlTzd1dXRJbUx4elc5Zmo2Uy92d3FZVzMrZk1m?=
 =?utf-8?B?TVJFZGJYZzVyZTBGa1k0M3pMVDVkOHhmMGRuc1ladGhadUg3ZHJhMDBVNVI0?=
 =?utf-8?B?ZVVNdTNxV0tpYzVJV21kVkpPMVBQYS94QnlCenpWOXlSYkE2SWYzV0ROWmdw?=
 =?utf-8?B?Q0xocGMzM0sxL2JqV2N6TExKcnlpb0lvNHZTWmpUa3NYZUlqeUxNbDZ2R3BX?=
 =?utf-8?B?dGpwUlVnNmdNTmFpbW9VUm01K1JjYkVlNU84Z2hQN1FHWnc0QmFMcDFvWmRw?=
 =?utf-8?B?aVdYTzZQZ243T29rYXdDYjJNVkJNWVhJWG1VSDFTNDZveE9GVTRCTlBwR3M3?=
 =?utf-8?B?c1F1T3hoYm5DNEtWSmJMVWRDdjZ3OFJQNVdTRjQ2c2dSWVVnR0ZRa1JtNW50?=
 =?utf-8?B?QXRpcWlvS3RZeEdzSXJpS1JFY2t5azJrazVRaU9YeEhGdGRVNnJMK3MvUXl2?=
 =?utf-8?B?S1pJVmpxbGk0Tzh2cVRqWWtpRmJuVWJqNUhlUU15NDJkbDdEVTFEREd3Yitx?=
 =?utf-8?B?UWJCbUFucHZaNktEeS9uaElveWRjNGFpUFlreW54clcwQlVCWVlUNlpFdkMx?=
 =?utf-8?B?TkI3amIvYjUxT2xNWGU2bWdoeXVjc1NVTkNRZVYwdmxVcVRqS0VjOXRZaDVl?=
 =?utf-8?B?ZXpjZXk1ek4zdEc2Y0syN2RtTkVHRnVpZ3dodmJvRjY5TlVqS1ZjWkkrRExr?=
 =?utf-8?B?ZkJnZDFESzc4c0QyTERBdlFTNENpWVZhR3NTVzZ0MjAwNmR1Ny9hODZPTURy?=
 =?utf-8?B?MXlEVE9yQ0dTREFBdzBxRkFXU3lLRzh0emVGL3NQNmQ3amliSWE3Z04xNTdV?=
 =?utf-8?B?TVFoQUhZc3lyYi9NZjcrak1wbDZzYkJkVTgzRERLQjZJaTRPVDlXUEdVT1V2?=
 =?utf-8?B?NUdTL3FKdElXZ215dU0vdE95aHZqNEVGR1dqSTEzcEJzQ3AwcS96UWgrdXFl?=
 =?utf-8?B?ZTdCRHhja3o4VXgyb1lvREhieWFDK25ZRmk0bHNVZXZIQmxLaXRGUHBzSS8v?=
 =?utf-8?B?VUV3eTBGTEp4dWlzWUxKSy9jQWxKRzFhc3ppQm5KUmpKd1dVNmxLT3FYd2JJ?=
 =?utf-8?B?MXhBdUpRcDBJeUczWGdjc1UzTEhqdGxvTVo2SzJ2NjFwUm4yeXJmSGU3WHk2?=
 =?utf-8?B?M2g1cDc1V1IzbE5DTTdsNmhYdElvRUlUMEt0QjZ0ZC9vanZna0V2ZXVmR0I0?=
 =?utf-8?B?b2l0amhxb2RnVHRDdkNZVnc5VkVyQWU0WUNJTU5jS1liRk1mWElVT0dNWlVW?=
 =?utf-8?B?M2YzTllqdjFYN0lwUWRXYU5EeC80OFFwbFVJL3hXNmdOK1hSdXNqaTJOaEUz?=
 =?utf-8?B?Qk1HT2grVzAzNDNNcjU4SldSK24xN0dCbTg4ZlVhVUpRcDl0YmduOU94bWMv?=
 =?utf-8?B?TEV6VGgvdU5ySkJiR0RSSUxGcnlKVW9QRlFiV0JMdGl4eDBvM2U2UVFoLzVP?=
 =?utf-8?B?VzYzMXZiV0lVMzVxVFd1SVZtKzBFNGozbWpoOUZVTHgwUHg3WnJPcHdlVXA0?=
 =?utf-8?B?ekhtekJyZmIxOUc0NFlqRUNvNUxXemRYK1p4K2VUa0o4RG5EVlEvN2lCOEJB?=
 =?utf-8?B?enE1YXZGY09QYmM1Ly9kSVM3ZXRGSi81OEJnUzlCelBSbG9kUFlydGFnRTNF?=
 =?utf-8?B?c1hzRE8weFhpVUxSOW9yTzFyZmpGb2FuZnFMamxYZy81OHVYSWlyNFNKSzlh?=
 =?utf-8?B?UkxTWmJQckFZMDdId3VoK050Qm05MCs3K3hOcnpkTzJTQVBNTjlrYXdTdHY0?=
 =?utf-8?Q?VJvPAuxus8oS2q/UtHjtMKXLa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b1d6eb-f0e0-40f6-c4ca-08dd0ebc0d61
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 08:18:19.7192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpEO/C9ZYRYosPm6jrFaNedZrHxuwhjM9ezIQS/NS6JgDrDEzQVCRpP806jM+3AtTkFDk2VbVCmsGLHFM5N2pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10972

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyYyBLbGVpbmUtQnVk
ZGUgPG1rbEBwZW5ndXRyb25peC5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNywg
MjAyNCAzOjU5IFBNDQo+IFRvOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4g
Q2M6IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgby5yZW1wZWxAcGVuZ3V0cm9uaXguZGU7
IA0KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGFuZGkuc2h5dGlAa2VybmVsLm9yZzsgc2hhd25n
dW9Aa2VybmVsLm9yZzsgDQo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWls
LmNvbTsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgDQo+IGlteEBsaXN0cy5saW51eC5kZXY7
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogUkU6IFtFWFRdIFJlOiBbUEFUQ0ggdjNdIGky
YzogaW14OiBzdXBwb3J0IERNQSBkZWZlciANCj4gcHJvYmluZw0KPiANCj4gT24gMjcuMTEuMjAy
NCAwNzo0ODoxMywgQ2FybG9zIFNvbmcgd3JvdGU6DQo+ID4gPiA+ICBzdGF0aWMgdm9pZCBpMmNf
aW14X2RtYV9jYWxsYmFjayh2b2lkICphcmcpIEBAIC0xODAzLDYgKzE4MDQsMjMgDQo+ID4gPiA+
IEBAIHN0YXRpYyBpbnQgaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiA+ID4gPiAgCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikNCj4gPiA+ID4gIAkJZ290byBj
bGtfbm90aWZpZXJfdW5yZWdpc3RlcjsNCj4gPiA+ID4NCj4gPiA+ID4gKwkvKg0KPiA+ID4gPiAr
CSAqIEluaXQgRE1BIGNvbmZpZyBpZiBzdXBwb3J0ZWQsIC1FTk9ERVYgbWVhbnMgRE1BIG5vdCBl
bmFibGVkIGF0DQo+ID4gPiA+ICsJICogdGhpcyBwbGF0Zm9ybSwgdGhhdCBpcyBub3QgYSByZWFs
IGVycm9yLCBzbyBqdXN0IHJlbWluZCAib25seQ0KPiA+ID4gPiArCSAqIFBJTyBtb2RlIGlzIHVz
ZWQiLiBJZiBETUEgaXMgZW5hYmxlZCwgYnV0IG1lZXQgZXJyb3Igd2hlbg0KPiByZXF1ZXN0DQo+
ID4gPiA+ICsJICogRE1BIGNoYW5uZWwsIGVycm9yIHNob3VsZCBiZSBzaG93ZWQgaW4gcHJvYmUg
ZXJyb3IgbG9nLiBQSU8gbW9kZQ0KPiA+ID4gPiArCSAqIHNob3VsZCBiZSBhdmFpbGFibGUgcmVn
YXJkbGVzcyBvZiBETUEuDQo+ID4gPiA+ICsJICovDQo+ID4gPiA+ICsJcmV0ID0gaTJjX2lteF9k
bWFfcmVxdWVzdChpMmNfaW14LCBwaHlfYWRkcik7DQo+ID4gPiA+ICsJaWYgKHJldCkgew0KPiA+
ID4gPiArCQlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+ID4gPiA+ICsJCQlnb3RvIGNsa19u
b3RpZmllcl91bnJlZ2lzdGVyOw0KPiA+ID4gPiArCQllbHNlIGlmIChyZXQgPT0gLUVOT0RFVikN
Cj4gPiA+ID4gKwkJCWRldl9pbmZvKCZwZGV2LT5kZXYsICJPbmx5IHVzZSBQSU8gbW9kZVxuIik7
DQo+ID4gPg0KPiA+ID4gT24gYSBzeXN0ZW0gd2l0aG91dCBETUEgY29uZmlndXJlZCwgd2l0aCB0
aGlzIHBhdGNoIHdlIG5vdyBnZXQgDQo+ID4gPiB0aGlzIGluZm8gbWVzc2FnZSB0aGF0IHdhc24n
dCB0aGVyZSBiZWZvcmUuIEkgdGhpbmsgdGhpcyBtaWdodCANCj4gPiA+IGFubm95IHNvbWUgcGVv
cGxlLCBzbyB5b3Ugc2hvdWxkIHJlbW92ZSBpdC4NCj4gPiA+DQo+ID4NCj4gPiA6LSkgaGhoLCBn
ZXQgaXQuDQo+IA0KPiBTb21lIHRoaW5ncyBsb29rIHJlYXNvbmFibGUgd2hlbiBkaXNjdXNzaW5n
IHRoZSBwYXRjaCwgYnV0IHdoZW4geW91IA0KPiBzZWUgdGhlIG5ldywgY2xlYW5lZC11cCB2ZXJz
aW9uLCB5b3UgaW1tZWRpYXRlbHkgcmVhbGl6ZSB0aGF0IHRoaXMgaXMgDQo+IGdvaW5nIHRvIGFu
bm95IHBlb3BsZSA6KQ0KPiANCg0KU3VjaCB2YWx1YWJsZSBleHBlcmllbmNlfiBUaGFuayB5b3Ug
dmVyeSBtdWNoLCBNYXJjISBUaGlzIGlzIGRlZmluaXRlbHkgd2hhdCBJIGhhdmVuJ3QgdGhvdWdo
dCBhYm91dCBiZWZvcmUuDQpJJ2xsIHBheSBtb3JlIGF0dGVudGlvbiBpbiB0aGUgZnV0dXJlLiA6
KQ0KDQo+ID4gSG93IGFib3V0IGNoYW5nZSB0byBkZXZfZGJnPw0KPiANCj4gR29vZCBpZGVhLg0K
PiANCldpbGwgZml4IGl0IGF0IFY0Lg0KDQo+IHJlZ2FyZHMsDQo+IE1hcmMNCj4gDQo+IC0tDQo+
IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgIHwgTWFyYyBLbGVpbmUtQnVkZGUgICAg
ICAgICAgfA0KPiBFbWJlZGRlZCBMaW51eCAgICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3
LnBlbmd1dHJvbml4LmRlIHwNCj4gVmVydHJldHVuZyBOw7xybmJlcmcgICAgICAgICAgICAgIHwg
UGhvbmU6ICs0OS01MTIxLTIwNjkxNy0xMjkgfA0KPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBI
UkEgMjY4NiB8IEZheDogICArNDktNTEyMS0yMDY5MTctOSAgIHwNCg==

