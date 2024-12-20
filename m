Return-Path: <linux-i2c+bounces-8657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 887749F8EDF
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 10:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8F66166E5C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 09:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FE11A9B42;
	Fri, 20 Dec 2024 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sj0sEW57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2050.outbound.protection.outlook.com [40.107.241.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B331A8419;
	Fri, 20 Dec 2024 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686609; cv=fail; b=D/cyA7emnpHHY3ayXaymblrdI69vBvjz2cpNH/WE4iISor1sfyhJuqpmAy/S1BYDOXTfRNDom8K7XvicsZnS2fLseTXcR4DwE7yBkNCMVpiO9qn9W/6TKUBkkX6HLjUMLDcxtXMw+h+wPqvZQSk4axaXOC41iv7pp0tGlHUPizc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686609; c=relaxed/simple;
	bh=Fo/TjLpZ2dbtEnRhLU+hr+WApq95Pqzxr+BfzAr3zBc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JTkTaH5eD+nsQZcmpCnwRTyMX9qqoEev6j7jCKVPoVm6hFlrj7pB4FigwXHqc4m73PphS+3jEmer44Zot/88z8A98OmWzcnibAGKwNQJ9PgV0ZO2Cj00i2b2jjsZ5uVuP/8ulqhizOFOFlpe4+ORjWp2blNf3GeODWCHlOyj6cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sj0sEW57; arc=fail smtp.client-ip=40.107.241.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcRMrUvUheO70GqNxRD6PHVnxyX1mkf4lAI/PFLwaSNf/54LpAWCYdq/yXfa+1/CvigcEYGtWShauPE0YVfdiMq8M8DhbTNqImE5fLalRo9aJ7VTTcn6m3ziBmLU2RPHyuwBFUrygTqMdGTgTQgyNs/xhKIHJ9QzofCeo7LR3cLfJJMqCarEt5Vi76vHBNF20ijmSueUrYDQD/NMiHLR9s+Omiwfh6obv2/XN6J1T6p7Y0MJPSq0+243jTMckx3QVKPIZor+eCGXDoXScmATlchYw2jRIqqW+q+zXipll7iYVunl+4bSqq1LO/WhJ7eFn8e1NMpjUOc4fi8c1z1BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo/TjLpZ2dbtEnRhLU+hr+WApq95Pqzxr+BfzAr3zBc=;
 b=KiNRunI6YG8DeHYbdM5nOudtZ/XwhdGa8BC7vxsXgRTJbpyfQtyfB9L74heOcFp1Mkpe4J/U86FCUGfH2e2z93sn4faaMJ/GM50SUBGb9ZND1qE/DSgW4NhdHfIHMDs83k5BJB24UFyfCEfHdahwj1XZ8dfSde8+D5IrTvrdLXv9XDi0HG6c1oa0+lsboiy2mfxBTENZfD5nfNxDQEvJxNCUQ5YPi+6VV0TMdJLhKR9GMEwOsU0DiKQK9tVjdMEv+9vFN1PXtye1uLmvJXkHHmrj0f5wpzQIZI7gN/dNY3Skca8qDv6YgJ07gQ1ptAug2yJaHqzpRQ7XTf8wPrgPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo/TjLpZ2dbtEnRhLU+hr+WApq95Pqzxr+BfzAr3zBc=;
 b=Sj0sEW57VfxwgMS4z5/mXuKhm5GoWNc96PZQ8du/1VOuhivu8zYtaUeGsIzkJdIWjTo3LpGcfpUNzks/VrxFpoew8MueFyW7iUY1ICQYQe4kMbXHrbuVP0QY7ds3Nj5gzz8qPoI3I6JJM3tV57RDLtTIF9SpwCC71Rgf7nJ2mbeCJQV15qGSwPce8WtZcAhCjO+kdg7pUDTsVd02DpJvvw0TkVKCdMi6KxEfO7ONdh2MdX2AWr59ENX/TUYMCqaHWxhk4aeHdsdk6b3TKPotVxM7f0VlV2N9snCxshe6My3dT5/F9cmjjRTbR3QwVcdQd77HJWBSpC9uNffpY9eWbw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AS4PR04MB9267.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 20 Dec
 2024 09:23:24 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 09:23:24 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Oleksij Rempel
	<o.rempel@pengutronix.de>
CC: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Index: AQHbUsDRYsO3wC2uo0+aTdCykAiVXw==
Date: Fri, 20 Dec 2024 09:23:23 +0000
Message-ID:
 <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
In-Reply-To: <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AS4PR04MB9267:EE_
x-ms-office365-filtering-correlation-id: b8279789-aaf1-4bbf-3120-08dd20d7f3fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkFIOUUvcERpZkpRWndlbkNGUHo3clk0bUx5RUc1V2c5Tzh3MFZNU1dkei9u?=
 =?utf-8?B?SUFBMUthK1VEM3RleHVKZTJYU0FrVCtMSGJTb1lsV2FhMlRjVEl0VTdodzBR?=
 =?utf-8?B?NDZrRmhiS2MvQ045VGFsR1NDUmdaS2p0dER3THVXbjlJQXRnUXJTRk43USsr?=
 =?utf-8?B?YVhBMDNucDEvMUpycWdKYjE5TStPMHNzR3FyNHExMk5VeHhiNUNKSklVNVN2?=
 =?utf-8?B?UG9ONzFrMjdDeTZRd1lNSEh1Q1dUYS9ZVitRaUFzWWk2NnRwNGRjYnA4Q21T?=
 =?utf-8?B?VmVBK0x5bWZCWGFITkp5ZStQMkZmRWtLcWZDZXE0N0tOVWtWMmROY3E2dFNJ?=
 =?utf-8?B?RHV3TVV5TlJpUjhnTTJlRndndXZXQ3pEM28xK3NHZitZYTZHRmNFak1KZVY3?=
 =?utf-8?B?SHp0UHZtWkpzUU56V1lMSFJoTE90d3FGMDZjVlBKU01XUXVxTEtRYkovSlQ0?=
 =?utf-8?B?K3pwNVZOWDNCeW5HVm83ZUdiS3pTWDhRZ29xSm9QcWxPMWJJRGhwdXkwNTdU?=
 =?utf-8?B?UTc1bnZMRC9rOXcrcWxrbWRDZU9FVmVnaHNTZjZxNmF1a3p2YnFnSTBYYkcr?=
 =?utf-8?B?WTJBUStzQUZObm44cVFiMnpqRFR4NWcveU9ScDFRaDNzRFl1dzU1QUxybEJ1?=
 =?utf-8?B?OU92MUV0ZUZ0aEJTNUhxZmJwNk9UNjFMNDBpbFFZaFQ5NlBiditrM2VTMi9U?=
 =?utf-8?B?Q1Q2cEdOb010djBtQlhyRkFtS3ZMMTFLQzhmM3ZJVXlhNVZXSWN1QlNOVTAr?=
 =?utf-8?B?RWZLTFdudWVIbXRNU2xxa0xjam9qWTE4dU9LUkliRFB0YmxMeWVYOU0rTWZw?=
 =?utf-8?B?SjZvNmo1Nk1WMXl3c2pLd0x0WG4rdnZGc3F1U3o4MXY0cEFQN1A5NU1iS0JX?=
 =?utf-8?B?bUJHTTZLMUU4R3ArMnJZZnFIU2gvaXlRNDRpM2kxTVZaSy96aFlKSU9qYmtv?=
 =?utf-8?B?TFRNTGtwUkJpaWhNcW1FMGdMbEFxU21JeUNWKytlN1ZQdFljbjdNd3MrdnZp?=
 =?utf-8?B?b092aXpKZ2xIdkNrSkZ4MTRMUmVJUjYwcjAxUXhkK2tKTTlSakJ4WXRxUE1Y?=
 =?utf-8?B?aTFzZTdtem9uSTQzLys4NzZ1Wmp2blRna2FGSkFsMTB0SHBuY1k3MUJHL1Vh?=
 =?utf-8?B?ZEhscjc3NGtXMndkUTRndHZPcDZoRkZraURhVUN2aVFFZTVRL3NnR0J6TkRG?=
 =?utf-8?B?VlluaFJXaFdzdVAzWnJzQmRiSE1NRmdrWlpYT0xFMnlpNjh6VHV1SGJMTGpF?=
 =?utf-8?B?SG05Q1BKaTA1aUNiZUhGdHU1SDdaNURPWUpTbGpaSDJCTTNORUZIY2U1K2dN?=
 =?utf-8?B?d3hrWHZ5bXdwbEt5alBpNmR5Um93KzhmbU9DbCsvOEZjSitJWHpjcVFhU3NJ?=
 =?utf-8?B?T1VuNXVnb1JNaHh6cTBNenMvUFl0YlNOTk5ISlNLTXFMNzZlUFlNdFB4bDJC?=
 =?utf-8?B?N0hSbmpjTE1MNnZuNUQxcE1oMkJOaWVXVkh2MU83cHlwVTN5YW9kL09ZL1J0?=
 =?utf-8?B?OFY0ejZxN01zNGFmMGtFSDlURXRFUGd0K0pqU3hiMHE3Si9BT09oYjRibjNG?=
 =?utf-8?B?bUJtemJrRmVudmVFekVQK000MzViMEZHZlI3N2ErQ0l6MUtwckZTZkhFR1pq?=
 =?utf-8?B?RFBvRlg4NWNVUGlPK2xBRi9Da3lEUzIySFgvL2xNbUlWWUZUYkpodmxrWVh5?=
 =?utf-8?B?aTh2Ny9yM0RUU0RRSzRBcFhYMFRubTl0dXErb3FGV2g1TEhKamF3VUM0eGVW?=
 =?utf-8?B?NG5ST0VjS29ySXJHT3BhSVAvY01ud2FTR0RkSmZpdS9LeUpPOW9kUXNmV21B?=
 =?utf-8?B?ZzJ4akI1bWsxUU9OQ2hzZ1lRdVhrbHZOZlpZa3FuUFp2ckZFWjduYlVIbnE0?=
 =?utf-8?Q?QA2TOBcxr5zQr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anNOTUUrZEltVGRvcUZ2QjlpS2NOM04zVHhkZFl5bTM0dlhZZzVPM2R6dDRD?=
 =?utf-8?B?d0JxN1NweEdIZHZkQU9zRU1IK1NKNWJZZ1llYmordkpiYlhMMktDVnVsTm1B?=
 =?utf-8?B?Tzc0dm9VTy9ETE9DcExrdFQ1QnRsMThLdXNsNGdXanRGdVE4RGtvZ2ZTYkxy?=
 =?utf-8?B?M0NWcExkYTBpM0hFaGorc3NteTlqU1FqRTBycXlBYzduYkswYkRqVFA4MTA2?=
 =?utf-8?B?N1ErMUN4Q1JTRnVmRVNlakxudWowNXQ0NFJIeGFNVHQ1d1lLSWdQNTBWd2VE?=
 =?utf-8?B?N3NOWmJTVEtsejdLWkdkOS9Pdk8vZ2pzUkxPaFBrVWpGR1Y3OC9sS3hMSDhQ?=
 =?utf-8?B?S1E4SisydUVhVmRVYjd6b0h4SFljZGZMczkrTTNlYUNNQjhlSmcrNExjSDJN?=
 =?utf-8?B?YkZQRWRvMjd0LyttTG43RXNmbzI4N1Z0bmpuQUZaZWdhUE44MGRMc3o1N1NT?=
 =?utf-8?B?M3pITUZLNnl4Rk9XNzJoWTZpNmg0b1A5b1VRSCtTY0FiTnIwRWM4RFREQUFO?=
 =?utf-8?B?emVWMFJDdGR2dG5QVm11VTB5WnUwLy9hNmhNdG1VY29QZEN2NVJqRmFhY2Zo?=
 =?utf-8?B?Z2N6TEtVVDlpdjJUSmRwZGp2ZFd5VnlIZXE1ZG9sSW1RMnZRb1FETTUveThM?=
 =?utf-8?B?UWl4ZTBJOGtEOENMTllVcVIra1lYcEtpNWp2dDJ4aVVwZVdkOStmUGtWNHR4?=
 =?utf-8?B?Rkh5WmRsWlNxbHNOYXJkK1RHNytGbDlianVjbzRTV2Z2bTk1aVFTVUEzWkxo?=
 =?utf-8?B?aThhcGpVZDBnV1BEVEg5U0xmdUVYeGlibGs3TENYOVl6MHU3TitEQkZBTTdl?=
 =?utf-8?B?OU1iOGxpdEgySTQrZUNWS0dpNU1uTFpFb0s0NUVhYmdIcFlncHRDdDE1OWg2?=
 =?utf-8?B?aVBuK1JWeGVwTGVnUDJwYW85amljS2lXSVVuY1AzZG1nVjhnZ0twZ3FIVDNK?=
 =?utf-8?B?S3J1bXBDQXNjM0tOU09DeloveFpMTW1uTEsyZ2tWb2FaTWFCNXJOU0EwUmk3?=
 =?utf-8?B?TUR6Ti9HaDRnZ2kra1J1ZVhNSmJIbytNSUFpc1ZJMHF1aGRka3c1QTI1dWtk?=
 =?utf-8?B?YnNuRHdFY1Nyanh2ZldKak5KT0lPNGpNVWlndFBJY1lhWHZmVGRqVWdjaVJL?=
 =?utf-8?B?MzNDcEswVGZOT3VYanpJbTliZkdPSEhtdHlVMGxlZmo1bFN1ZU9QN2N3WFZX?=
 =?utf-8?B?STVRQkJuRGdlT0VTMzJwbDd4MkJ3d25lS2pibTRyNmRRdGdPVExyTmJRNk5y?=
 =?utf-8?B?bWNicEZLeEtrdGUveitPK3VLamtGQnhaUFNNdGVQblRJMlB6eW50amJoUk1Z?=
 =?utf-8?B?c0REa1Z2ZXFFUkJSMnBYc3MrNU9ieVRxQ09qNUQxaE5QVTVwL093WC9DUklx?=
 =?utf-8?B?WUtFN3FLUDVyWEdPS1hEL3FrN2FTSmljNmtGNmRTbkd6b2VrOFVCUHplRzVl?=
 =?utf-8?B?ZHBaSGgvVFJMUzVRaEdBNi9WY08vRFdkeHVQRy9CNXV6UzdiaUFzR1A3S2Fv?=
 =?utf-8?B?UHFjNU12bGk5YkI3MXJTMGhpM1Z2REdKVUkyUHREVlhBV1ZhMUxkSUZNdnQ4?=
 =?utf-8?B?a3FtRWxHWE1CYldvVjJuNlRxampBVU9jSzZLdWJHZUIyQWVoNFI1K25ucXZs?=
 =?utf-8?B?Um54SVpUWm1GZ0ptSGFobXNqN3o4VVl5Tzl5NzIzdENlUDZDMnZ6Z3pwTGZk?=
 =?utf-8?B?UmwvZXFvRzBnS0Q1bnlVWGhNSVU3MVF0TkliN2lnbnhTM3RXVWcxbHNYK0hG?=
 =?utf-8?B?d25MRXIvSHdkNXNmd2ltbjRTY0NqTDQ5UmQzVjUyWVpFelBET05xaHBEWkRD?=
 =?utf-8?B?bnZxaFJ5MFlpMSt6SnVOdzZiOWwxbUl0S25tSlc5clFUWlMvUkM3SWZrZGo3?=
 =?utf-8?B?VVRWQ0NoNGI5bDVvRGlhWEVYZDI1NUFpOVFna0U0MVVIeDA3czZYQUtwQlY5?=
 =?utf-8?B?UlNVY0t4UTMwcDlWMXZPaXVOVFJpd0s1emttNGhmN1dML1c4S1RUZzZ2UWNi?=
 =?utf-8?B?eEFORVZzWi9vZXRyOGlxcHhtUWM5cDIzaklackFBbklpZXkvQ1lRSnpYQ2tG?=
 =?utf-8?B?Y1RKZ1hJMkpLTy9FbHdmTXBiVUNId3VzSGxWK0FIeWsrbURXZ3luUkRQdW1O?=
 =?utf-8?Q?7Cg5KOAzFtoRdmuDNKbHxk9cR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b8279789-aaf1-4bbf-3120-08dd20d7f3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 09:23:23.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oap5DtJivz9PlFjR5WDIoHGazS7SltuIYrM3pEKajhqEgTaZMtRLdvamoctfghSkviQWhT03T4pgGxap2Bzr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9267

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWhtYWQgRmF0b3VtIDxh
LmZhdG91bUBwZW5ndXRyb25peC5kZT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyMCwgMjAy
NCA0OjQwIFBNDQo+IFRvOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT47IE9sZWtz
aWogUmVtcGVsDQo+IDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IEFuZGkgU2h5dGkg
PGFuZGkuc2h5dGlAa2VybmVsLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsNCj4g
a2VybmVsQHBlbmd1dHJvbml4LmRlOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1
dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5v
cmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2xhcmsgV2FuZw0KPiA8eGlh
b25pbmcud2FuZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY1XSBpMmM6
IGlteDogc3VwcG9ydCBETUEgZGVmZXIgcHJvYmluZw0KPg0KPiBDYXV0aW9uOiBUaGlzIGlzIGFu
IGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3IN
Cj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdl
IHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMNCj4gZW1haWwnIGJ1dHRvbg0KPg0KPg0KPiBIaSwNCj4N
Cj4gT24gMjAuMTIuMjQgMDk6MDYsIENhcmxvcyBTb25nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBPbiBGcmksIERlYyAyMCwgMjAyNCBhdCAwNzozODo0N0FN
ICswMDAwLCBDYXJsb3MgU29uZyB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+Pj4+IEZyb206IE9sZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRyb25peC5k
ZT4NCj4gPj4+PiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDIwLCAyMDI0IDM6MzUgUE0NCj4gPj4+
PiBUbzogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4NCj4gPj4+PiBDYzog
Q2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+OyBBbmRpIFNoeXRpDQo+ID4+Pj4gPGFu
ZGkuc2h5dGlAa2VybmVsLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsNCj4gPj4+
PiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU7DQo+ID4+Pj4gZmVzdGV2YW1AZ21haWwuY29tOyBsaW51eC1pMmNAdmdl
ci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiA+Pj4+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+ID4+Pj4gU3ViamVjdDog
W0VYVF0gUmU6IFtQQVRDSCB2NV0gaTJjOiBpbXg6IHN1cHBvcnQgRE1BIGRlZmVyIHByb2JpbmcN
Cj4NCj4gPj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyB3aGF0IHlvdSB3YW50IHRvIHNlZSwgcmlnaHQ/
DQo+ID4+Pj4+DQo+ID4+Pj4+IFRoaXMgbG9zZXMgdGhlIGluZm9ybWF0aW9uIHdoeSB0aGUgZXJy
b3IgaGFwcGVucyAocmV0KS4gVXNpbmcNCj4gPj4+Pj4gZGV2X2Vycl9wcm9iZSBldmVuIGlmIG5v
IHByb2JlIGRlZmVycmFsIGlzIGV4cGVjdGVkIGluIHRoYXQgYnJhbmNoDQo+ID4+Pj4+IGlzIHBl
cmZlY3RseSBmaW5lIGFuZCB0aGUga2VybmVsLWRvYyBldmVuIHBvaW50cyBpdCBvdXQ6DQo+ID4+
Pj4+DQo+ID4+Pj4+ICAgVXNpbmcgdGhpcyBoZWxwZXIgaW4geW91ciBwcm9iZSBmdW5jdGlvbiBp
cyB0b3RhbGx5IGZpbmUgZXZlbiBpZiBAZXJyDQo+ID4+Pj4+ICAgaXMga25vd24gdG8gbmV2ZXIg
YmUgLUVQUk9CRV9ERUZFUi4NCj4gPj4+Pg0KPiA+Pj4+IFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRi
YWNrLiBXaGlsZSBJIHJlY29nbml6ZSB0aGUgYmVuZWZpdHMgb2YNCj4gPj4+PiBkZXZfZXJyX3By
b2JlKCkgZm9yIGNvbXBhY3QgYW5kIHN0YW5kYXJkaXplZCBlcnJvciBoYW5kbGluZywgdXNpbmcN
Cj4gPj4+PiBpdCB3aXRob3V0IHJldHVybmluZyBpdHMgcmVzdWx0IHJhaXNlcyBhIHJlZCBmbGFn
Lg0KPg0KPiBBZ3JlZWQsIHdoaWNoIGlzIHdoYXQgc3Bhd25lZCB0aGlzIHRocmVhZCBpbiB0aGUg
Zmlyc3QgcGxhY2UuDQo+DQo+IElmIHdlIHdhbnQgdG8gaWdub3JlIGVycm9ycyBpbnRlbnRpb25h
bGx5LCBJIHRoaW5rIGEgY29tbWVudCBsaWtlIHRoZSBmb2xsb3dpbmcNCj4gd291bGQgbWFrZSB0
aGlzIGNsZWFyZXI6DQo+DQo+ICAgLyoNCj4gICAgKiBBcyB3ZSBjYW4gYWx3YXlzIGZhbGwgYmFj
ayB0byBQSU8sIGxldCdzIGlnbm9yZSB0aGUgZXJyb3Igc2V0dGluZyB1cA0KPiAgICAqIERNQSBh
bmQgc2VlIGlmIHdlIHJ1biBpbnRvIGVycm9ycyB3aGlsZSBzZXR0aW5nIHVwIFBJTyBtb2RlLg0K
PiAgICAqLw0KPg0KPg0KPiA+Pj4+IFRoZSBmdW5jdGlvbidzIHByaW1hcnkgcHVycG9zZSBpcyB0
byBjb21iaW5lIGVycm9yIGxvZ2dpbmcgd2l0aA0KPiA+Pj4+IHJldHVybmluZyB0aGUgZXJyb3Ig
Y29kZS4gSWYgdGhlIHJldHVybiB2YWx1ZSBpcyBub3QgdXNlZCwgaXQgY2FuDQo+ID4+Pj4gY3Jl
YXRlIGNvbmZ1c2lvbiBhbmQgc3VnZ2VzdHMgcG90ZW50aWFsIG92ZXJzaWdodCBvciB1bmludGVu
ZGVkDQo+ID4+Pj4gYmVoYXZpb3IuIFRoaXMgbWlzdXNlIG1pZ2h0IG1pc2xlYWQgcmVhZGVycyBp
bnRvIHRoaW5raW5nIHRoYXQgdGhlDQo+ID4+Pj4gZnVuY3Rpb24gYWx3YXlzIHJldHVybnMgYXQg
dGhhdCBwb2ludCwgd2hpY2ggaXMgbm90IHRoZSBjYXNlIGhlcmUuDQo+ID4+Pj4NCj4gPj4+PiBJ
biB0aGlzIHNjZW5hcmlvLCB1c2luZyBkZXZfZXJyKCkgZGlyZWN0bHkgaXMgbW9yZSBleHBsaWNp
dCBhbmQNCj4gPj4+PiBhdm9pZHMgYW55IGFtYmlndWl0eSBhYm91dCB0aGUgY29udHJvbCBmbG93
IG9yIGVycm9yIGhhbmRsaW5nDQo+ID4+Pj4gaW50ZW50LiBJdCBrZWVwcyB0aGUgY29kZSBjbGVh
ciBhbmQgYWxpZ25lZCB3aXRoIGl0cyBhY3R1YWwgYmVoYXZpb3IuDQo+DQo+IFRoaXMgaXMgYSBm
YWlyIHBvaW50LiBJIGRvbid0IG1pbmQgd2hldGhlciB3ZSB1c2UgZGV2X2Vycl9wcm9iZSBvciBk
ZXZfZXJyIHdpdGgNCj4gYSByZXR1cm4gY29kZSwgaXQncyB1cCB0byB5b3UgdWx0aW1hdGVseS4g
SSBqdXN0IHdhbnRlZCB0aGUgZXJyb3IgY29kZSB0byBiZQ0KPiBpbmNsdWRlZCBhbmQgSSB0aGlu
ayBhIGNvbW1lbnQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8gYXZvaWQgY29uZnVzaW9uDQo+IChw
cm92aWRlZCB3ZSBrZWVwIGJlaGF2aW9yIGFzLWlzKS4NCj4NCj4gPj4+IGhvdyBhYm91dCB0aGlz
Pw0KPiA+Pj4NCj4gPj4+ICsgICAgICAgcmV0ID0gaTJjX2lteF9kbWFfcmVxdWVzdChpMmNfaW14
LCBwaHlfYWRkcik7DQo+ID4+PiArICAgICAgIGlmIChyZXQpIHsNCj4gPj4+ICsgICAgICAgICAg
ICAgICBpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyOw0KPiA+Pj4gKyAgICAgICAgICAgICAg
IGVsc2UgaWYgKHJldCA9PSAtRU5PREVWKQ0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZGV2X2RiZygmcGRldi0+ZGV2LCAiT25seSB1c2UgUElPDQo+IG1vZGVcbiIpOw0KPiA+Pj4gKyAg
ICAgICAgICAgICAgIGVsc2UNCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
JnBkZXYtPmRldiwgIkZhaWxlZCB0byBzZXR1cCBETUENCj4gPj4+ICsgKCVkKSwNCj4gPj4gb25s
eSB1c2UgUElPIG1vZGVcbiIsIHJldCk7DQo+ID4+PiArICAgICAgIH0NCj4gPj4NCj4gPj4gUGxl
YXNlIHVzZSBodW1hbiByZWFkYWJsZSB2ZXJzaW9uIG9mIGVycm9yIHZhbHVlLiBJbiB0aGlzIGNh
c2UgaXQNCj4gPj4gd2lsbA0KPiA+PiBiZToNCj4gPj4gICBkZXZfZXJyKCZwZGV2LT5kZXYsICJG
YWlsZWQgdG8gc2V0dXAgRE1BICglcGUpLCBvbmx5IHVzZSBQSU8NCj4gPj4gbW9kZVxuIiwgRVJS
X1BUUihyZXQpKTsNCj4NCj4gU291bmRzIGdvb2QgdG8gbWUuDQo+DQo+ID4gSGksIHRoZSByZXQg
aXMgZnJvbSBpMmNfaW14X2RtYV9yZXF1ZXN0KCkgYW5kIGxvb2sgbGlrZSB0aGF0IHJldCBoYXMN
Cj4gPiBiZWVuIGNvbnZlcnRlZCBieSBQVFJfRVJSLCBTbyB0aGUgcmV0IGVycm9yIGhhcyBiZWVu
IGh1bWFuIHJlYWRhYmxlDQo+IHZlcnNpb24/DQo+DQo+IEkgYW0gbm90IHN1cmUgSSB1bmRlcnN0
YW5kIHRoZSBxdWVzdGlvbi4gRVJSX1BUUigpIG1ha2VzIGFuIGVycm9yIHBvaW50ZXINCj4gYW5k
ICVwZSBmb3JtYXRzIHRoYXQgcG9pbnRlciBhcyBlcnJvciBtZXNzYWdlLiBTbyB5b3UgZG9uJ3Qg
bmVlZCB0byBjaGFuZ2UNCj4gYW55IGZ1bmN0aW9uIHJldHVybiB0eXBlcyB1bmxlc3MgbmVlZGVk
LCBqdXN0IGF0IHRoZSBlbmQgcHJpbnQgaXQgd2l0aCAlcGUNCj4gaW5zdGVhZCBvZiAlZCAoYW5k
IGFmdGVyIGVycm9yIHBvaW50ZXIgY29udmVyc2lvbiBpZiBuZWVkZWQpLg0KPg0KPiBDaGVlcnMs
DQo+IEFobWFkDQo+DQoNClNvcnJ5LCBJIGRvbid0IGtub3cgaWYgSSB1bmRlcnN0YW5kIGl0IGlu
Y29ycmVjdGx5Lg0KSSByZXZpZXcgb3RoZXIgZHJpdmVyIGNvZGUsIG1vc3QgY2hvb3NlIHRvIHJl
dHVybiBlcnJvciB2YWx1ZSBidXQgbm90IGFuIGVycm9yIHBvaW50ZXIuDQpTaG91bGRuJ3QgZXJy
b3IgdmFsdWUg4oCLYmUgbW9yZSByZWFkYWJsZSB0aGFuIGVycm9yIHBvaW50ZXJzPw0KV2hlbiB3
ZSBzZWUgLTExMCB3ZSBrbm93IFRJTUVPVVQgYW5kIHdlIHNlZSAtMTIgd2Uga25vdyBOTyBNRU0u
DQoNCmkyY19pbXhfZG1hX3JlcXVlc3QgaXMgdXNpbmcgUFRSX0VSUiB0byBjb252ZXJ0IHBvaW50
ZXIgdG8gZXJyb3IgdmFsdWVbMV0uDQpJIGRvbid0IGtub3cgd2h5IG5lZWQgdG8gdXNlIEVSUl9Q
VFIgdG8gcmVjb252ZXJ0IHRoZSB2YWx1ZSB0byBwb2ludGVyOg0KDQpkZXZfZXJyKCZwZGV2LT5k
ZXYsICJGYWlsZWQgdG8gc2V0dXAgRE1BICglcGUpLCBvbmx5IHVzZSBQSU8gbW9kZVxuIiwgRVJS
X1BUUihyZXQpKTsNCg0KSXMgdGhlcmUgc29tZSBzdHJvbmcgcmVhc29uPw0KDQpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvaW14L0FNMFBSMDQwMk1CMzkzNzQxOUJCQjU4Qjc1RkI4RjhERTJE
RTgwNzJAQU0wUFIwNDAyTUIzOTM3LmV1cnByZDA0LnByb2Qub3V0bG9vay5jb20vDQo+DQo+IC0t
DQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+IHwNCj4g
U3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gaHR0cDovL3d3
dy5wZW4vDQo+IGd1dHJvbml4LmRlJTJGJmRhdGE9MDUlN0MwMiU3Q2Nhcmxvcy5zb25nJTQwbnhw
LmNvbSU3QzU5NDQ5N2RiMWI1DQo+IDQ0ZTQ3OWE4ZjA4ZGQyMGQxZTg4ZSU3QzY4NmVhMWQzYmMy
YjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzANCj4gJTdDNjM4NzAyODA4MTA0OTAzMTMxJTdD
VW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2kNCj4gT25SeWRXVXNJbFlpT2lJ
d0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUQ0K
PiAlM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPUVuaHNJRmxCb29xakIlMkZTUldGN3VBcVJIRTN5
TjZyYmREDQo+IDF5UXVlVHJSdXMlM0QmcmVzZXJ2ZWQ9MCAgfA0KPiAzMTEzNyBIaWxkZXNoZWlt
LCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTANCj4g
fA0KPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6DQo+
ICs0OS01MTIxLTIwNjkxNy01NTU1IHwNCg==

