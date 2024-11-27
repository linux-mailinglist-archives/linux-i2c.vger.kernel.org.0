Return-Path: <linux-i2c+bounces-8243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F39DA60A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 11:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB4BB2148D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F3A198826;
	Wed, 27 Nov 2024 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cTwtdbD/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B2145B0F;
	Wed, 27 Nov 2024 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704191; cv=fail; b=C+UwIECfISY6SxlJeJpeqd5pMEo6e/L3yEiLnjkXiXlOE/OqUmTi0s9WooC6O1P8/M7lWksTCkWYpHXzi/wWegbp8gTaQP2S7sDZF/U1LrAA5tAM4QJZHukKv8R6Kak3WnJvTivrD1S7sjI8H7OuroorIK6ryZMMPgNWiMPdce8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704191; c=relaxed/simple;
	bh=8juaH6ZZhp6oUqPrTlvLQF+ZpGjHtrZsELLqO3pCQRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rmmC1ZKmWfHs+iXO0+qkO44C2zyf/aTiaKAbVQr8rUtqImgP/l/Fd7i1DxIx9ERl5TreCkCAeUW6opDWdlmgaDHSZkTN49DmVkawCthJPIUYlfSrP2EPOwCKclYrk3YNB5TKYr+ld/FUQwEpKsLs/LX7yGOjTtw1BMQQoYs6w3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cTwtdbD/; arc=fail smtp.client-ip=40.107.247.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhejRXZNOdPXxkcgJq94SQju7xFr9AHxXIjz+33f/PfJ0ZMkF8sGO0ce7KmAxoS10YvK0CsHICbtYDjRRkpv1faGA3rJrbtYXAd2eYoWI7y9KC1Jjb3L01/7Raij9xlpn47XyczenhClEGLNBwjPa1iNWnlUQjJYyZc9jz1zU6VLdeFHobP+C02PAFyD/7nuThe7Qt3+nhC9Ef7VAp2cPRk1jm4Y8nFW9yPoGWEKAhULOH/KY0QiedGNYPxVYYQEly8+Q4M37UffCJgrQbXFss6gbN3Vi6Ierx0RVvS8KYlPSBQQ9z5LSE/ZJM1KU9dOU/ogB9Miyu07KMXFVCdgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXCVNBd69jHrs1nIIWqlj8hWyBNypqhT+TOh03YiFtw=;
 b=xMi6zfj36bMJtg0wKJr1Ow9I8yuGIMREbtAs0zwSq69v2doCx8kCM5AmTJjr3R7+FfAD6THgP8BoTJKw2U8urPlIibfvFJSLDOpFdl8EQ0OTwulBnQySP5GDOu3HXmMW4h9/R2HpK2ABwP9HEA+K+NxcaDpANbCNMtTExHUMM+wEjlN5GQY5imqaW3WB5iqKnln2Tfk14fZ7gPYgH2XFhdsmoFNiRQiLVOb/vmw/iIEUdFq0XSMSyhy/qI639YlPGcrHAvj1uJIgGiQSh3PkR12nVi+IVrRuiybGtwBRjkJobmbteo/AQpJsmTWBt+0GIl1WRy31JbJNdcF+YqtS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXCVNBd69jHrs1nIIWqlj8hWyBNypqhT+TOh03YiFtw=;
 b=cTwtdbD/2/1zg5nIp3crYjo8ZqGmJc56XoF+NF7Nh59TJq7i8j6ync9sot9J9WO5FeZUHIiyeXahOXNHNEKI6Dbrm9RWmuZ/B5/T6Iz4v9x7Ey3pa2Ib0vPbF69RgTjOewRK/TcGqm25BFWvxfcEIYap3f10e9tN2P+4jdxIOxgSoBLmt4/ssdMVungryHNjLzbY842ecbGmhBOBlwFrIN9TOVpcN9IQJSYfglGXUio0FT3Iu5tciekZEVCZ04Wt0z58jmJSWDoCaoXerUh8p28dJLFRsDy9B7qZqcadrdTjg8TdiCh6Yex30eS7qmKdbCigHLRNZwPDzNwYmECb9w==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 10:43:04 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 10:43:04 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, "mkl@pengutronix.de"
	<mkl@pengutronix.de>, Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v4] i2c: imx: support DMA defer probing
Thread-Index: AQHbQLkj2JmsLENAeEerpa0YTZxURQ==
Date: Wed, 27 Nov 2024 10:43:04 +0000
Message-ID:
 <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241127083818.2108201-1-carlos.song@nxp.com>
 <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
In-Reply-To: <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|PA4PR04MB9224:EE_
x-ms-office365-filtering-correlation-id: 474f73de-f239-459b-f7b2-08dd0ed045bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Zw4driscAPviCDU6+WhpG7ExEoQa/11A7EG6LVJq0LkhtIhBY63VifDV/C/Z?=
 =?us-ascii?Q?cg3hvf0JBXihc14ZOXtQ6NXVWrw+uHdx2ybjj1EUdNB8zRsF/mUnea7M7Gju?=
 =?us-ascii?Q?fRs4I2vKY48Ehf8kKTGXiLwqB1qFgSM1PbjTcWTk/5WHv5iVOBzXdCDb3xzb?=
 =?us-ascii?Q?zpoiFjiddZqNMW5ZwD2OffveGnSJgU7nKk3CIFhkt3N2bYrpyUjOGjpYZw0H?=
 =?us-ascii?Q?NsLeqVc64nbX1dVuCoM39LjTFQIf/LyTPiYHoC2YXNHNXeY1rsqB8NkzAqe1?=
 =?us-ascii?Q?sGCa2Ec012rLZtnUK3YmRm1A4cBLPcCRA66HYPvRH53nixQ8eOTaGczdLGp+?=
 =?us-ascii?Q?OFOgsZxrzQB4ypGfhSEql1XAuKws/jOn4OPUg4zxwPmrGhq+rSZVVo8ByEEa?=
 =?us-ascii?Q?WpNTG9dnuFw3nS81h7jZtlyHYyY3FOQtH4S4TJ+eryHYP5ntZPakk8ormY/y?=
 =?us-ascii?Q?9roDmi6uHV2ztAetmnrp67f23u4CdiKXA/Xd7WmWNvBlZnCGE3HR5sAe4/+0?=
 =?us-ascii?Q?DN9/OJE4UHygNUSZMVERNRS/FCnL0NJ+B5Oobml9gZzoL6mNVyqS5d1gb8Fn?=
 =?us-ascii?Q?VME6GV9Nq+sSp0cqCt1PgTg6JCyyLO6ke05sI+F8cup2/Mix1dj4FWPHj94s?=
 =?us-ascii?Q?8MMIFj04gjDBUWuEaKvhMZBjb7ebRybDulEogOQdI8+Ahn4oP91JGBvV9NuM?=
 =?us-ascii?Q?GNi0wXSW5uvjmuBGwunFL8MN7Rnpo74JiQU3RhKzua4qJe2vVP9Od8OuXX/q?=
 =?us-ascii?Q?pCrfgfCRMEewxnPpfJ6Ko5gX6McoVbVIIuxhZnDmi1R+usLyo71nN0AXii0p?=
 =?us-ascii?Q?a60zUMLBbfMDBzEkbQ/ck5SXwav9FY0pAjbqtVg1QOXJMCFode4ncLIsa5X4?=
 =?us-ascii?Q?ORZ/iUc4qFSyP4zsc+XFlyINm0Ul28jNhaZOegHIJZ1vpSAgpJm5tlCl1djo?=
 =?us-ascii?Q?iTwYFjbL00BAdNzTdOQE/EqChirRhSG0RgnWuUFFLDgUsE2cJLQS4N2IgD1H?=
 =?us-ascii?Q?Zw8HUMiUBPpyxXLaqSydUJ2dLHb1jy62zl0B1TG6J4xF/6tP8ku1NjV/12ZL?=
 =?us-ascii?Q?lcbP+LqdXqniM12VV4ztSf1xdXaqWKwaOjZL1A5mCzVwi3HFB+1SlOOkm/XT?=
 =?us-ascii?Q?or5JpAydvSzgzJBCRN5NooOMf5FREKDRPUZig4XIlF3soXyPIEeDxB2xII35?=
 =?us-ascii?Q?VW3zcZTH8ZRfOI1X63aOU6MPmoNLJzDWPKinK8HRnIpiANVPXY7ZbTqIigrg?=
 =?us-ascii?Q?lqhl6al9IjW5cVnT6RvESFp0mn5YqCI+7GKxZ26ddMM+s5D789kg/J6wM/3W?=
 =?us-ascii?Q?QTf1+EKTsVnOy5GLF4m/XKRcBbIBa3AbNKFvA4ceQQvEghCapnh+S5IEMWUY?=
 =?us-ascii?Q?TGJe+EY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0h6UtcE3OsWc/7s3aeEd8wr1Km1pRA7x85Jn8PpUBEX0fyJYTYoRoRRyFvFd?=
 =?us-ascii?Q?otGLS1xeKLIJc4xlQDoD2eGEHIRCaysucpI7AvInO12IbphCX5eAwKwqxFs7?=
 =?us-ascii?Q?DaMo/lof3edvDJx0GkMmG2lWrdPe9BuFS6a7S1RcoFlWhiDT83DApVm5s7pI?=
 =?us-ascii?Q?yDmHG/cm7WnJaMkEl6yaUgZ9DG3hVYWyJFUzVvo8K6zKYvvDJgQy7QuVNqSB?=
 =?us-ascii?Q?90ANbdMcISwNSGej0UjzlyAo52A6wICcD96jAKefk3Jz1hDCpRVK+nt8joDk?=
 =?us-ascii?Q?0wnc6pbZtCxoJbZFsW9t1fEucyNl6L/11MyCuYj1YBhc+ZImx9Ex8fBAH7WH?=
 =?us-ascii?Q?pCvoVAMYyHs/swqAO0So2nW5BdZYCoHfz9T1vKs1Hww1I3uLwGWIzxJXJz/o?=
 =?us-ascii?Q?qeXwYCMeeTKiOgAzfhBMXsy2837n3g+mtyYLH2E9NNkvGPHTgkRCYjtbTlwn?=
 =?us-ascii?Q?jCzIUGqbwSypL3Gfs2yTW6fK7vruxyJsrt6AnXsrRApJ8JK9HEBwXWXS4ves?=
 =?us-ascii?Q?unt2S+wLnMZxucleogOGVi/y9rUArldvqAFL7AzshzRzlqviVNJBejk7VxMm?=
 =?us-ascii?Q?0aOgcEu66lxbhGqYo8CZ7m1A9iDGKYHSD3at8sRWu0slpJ93tU6g5hkzxbey?=
 =?us-ascii?Q?mxnKNq8MZUJew78tsz5xvTrIc9i6w/vXs1amrE7hXcOjMQLy/XS4ordng9fW?=
 =?us-ascii?Q?fHbns3as5rcDcTOUZtu3Xaz1VN83x3YWPBSc9qllfpwHwxQ9MpAi4RT0LSka?=
 =?us-ascii?Q?iyP5suVkJe+LU1p3obMAySEhhqD3bvCTylpcQW01f6x1EsnPosv1h9ymi8hr?=
 =?us-ascii?Q?uwOMO2j+derJCjWOg1pinFQBag63y5MnYlCC4Z87lMMvhjG2QXwHoe410HFu?=
 =?us-ascii?Q?aDtPy0LaLCa0bqnM3NmWDB/p6rKjD3iwzLVzzV3d13fO4CkDK3tHI1nkufcv?=
 =?us-ascii?Q?eGeGHJt3qfg91rGS1lOZWr44fUeiNfg7agpo9INX3SsBvtaD0ZuexC1ZELEt?=
 =?us-ascii?Q?UMbP4wZiqV2xtUf6bZIQT215QzSiHZcNSdcDcB4jQl1SmnDlKJEWmWLe++3y?=
 =?us-ascii?Q?OK+2Bw3REzojq2s2pgi4ZHyP/mS71Wj8Jh/VvqjIPB3R7gh9SlbwMHTUbZuc?=
 =?us-ascii?Q?l73vQTtAQfx1Ez8NdQBcVLOPHTXC+NSrxZGur+QuDCKB/Q7a9cB83SZdA4Ho?=
 =?us-ascii?Q?nqdnKDF8L9nW62mg7DpR3iyCdp03KxbRPzmvqHeOmFUksD+OJ/I1QweUDici?=
 =?us-ascii?Q?6ubrlGXq3I4RwP4hME81QltAFNEf2YDLKFZl6n1DVWKTk5cWFDUo3q98YqVk?=
 =?us-ascii?Q?TKB6Q1z1cQIRs68oxQ9A5F/7Eyhbs1DfBnx+iB1tral09kFpAJSWg+QC+JNu?=
 =?us-ascii?Q?8J2wb54/eWoV0PWFQh6GT8eR1ShomCSqIsymbqiSC99gjVL1nZBCXxpVb26k?=
 =?us-ascii?Q?R7AZARyWTe+quBI+xyFjpeHi3Oif4z91EiJmO2bP2VoVVRw+dyS1JKny8aNh?=
 =?us-ascii?Q?npdjXGmgUFFzckRBl1k5WNibCBFwxCDtMHiX1+eEy5UthiEmUOyxnhL9HNLb?=
 =?us-ascii?Q?uH8RCD47cBY2hgVk7dU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474f73de-f239-459b-f7b2-08dd0ed045bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 10:43:04.2209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWCoiBsb9vGixGz2655BMEAzRqBvcwrEs3I39bVp043BGsRv47SIghLLPkaPB5U+pWyQr1xPSA4fa47YcR8XMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224



> -----Original Message-----
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Sent: Wednesday, November 27, 2024 4:38 PM
> To: Carlos Song <carlos.song@nxp.com>; mkl@pengutronix.de; Frank Li
> <frank.li@nxp.com>; o.rempel@pengutronix.de; kernel@pengutronix.de;
> andi.shyti@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com
> Cc: imx@lists.linux.dev; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v4] i2c: imx: support DMA defer probing
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> Hello Carlos,
>
> On 27.11.24 09:38, carlos.song@nxp.com wrote:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > Return -EPROBE_DEFER when dma_request_slave_channel() because DMA
> > driver have not ready yet.
> >
> > Move i2c_imx_dma_request() before registering I2C adapter to avoid
> > infinite loop of .probe() calls to the same driver, see "e8c220fac415
> > Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> > and "Documentation/driver-api/driver-model/driver.rst".
> >
> > Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> > are unavailable.
>
> Please try to address open questions before sending new versions of the p=
atch
> set. Otherwise, it's difficult to follow the conversation.
>
> Did you see my question[1] on your v2:
>

Hi, thank you so much! So sorry about it... I missed it yesterday. I will a=
nswer your question[1] in this mail.


> | Wouldn't this break probe for all i2c-imx users who have
> | CONFIG_IMX_SDMA disabled?
> |

I have tested i2c probe at IMX and LS platform when DMA disabled, it won't =
break i2c-imx probe.
When require DMA channel in i2c_imx_dma_request, find no devices and return
-ENODEV, as you see at V4 patch, it will continue to probe and work in PIO =
mode.
I2C adapter should keep available whatever DMA mode is or isn't enabled.

> | Also I am wondering on what kernel version and what configuration
> | (CONFIG_I2C_IMX=3D?, CONFIG_IMX_SDMA=3D?) you have that made you run in=
to
> | this situation.
> |

I want to correct something, these code about DMA in i2c-imx.c is for eDMA =
not for SDMA.
For eDMA mode, I have tested this patch at layerscape-1043 platform. My pat=
ch is based on
cfba9f07a1d6 (tag: next-20241122, origin/master, origin/HEAD).

Test log is :
No apply this patch:
CONFIG_I2C_IMX=3Dy
CONFIG_FSL_EDMA=3Dy
root@ls1043ardb:~# dmesg | grep i2c
[    1.162053] i2c i2c-0: IMX I2C adapter registered
[    1.166826] i2c i2c-0: using dma0chan16 (tx) and dma0chan17 (rx) for DMA=
 transfers
[    4.722057] i2c_dev: i2c /dev entries driver

Not apply the patch:
CONFIG_I2C_IMX=3Dy
CONFIG_FSL_EDMA=3Dm
root@ls1043ardb:~# dmesg | grep i2c
[    1.166381] i2c i2c-0: IMX I2C adapter registered
[    4.719226] i2c_dev: i2c /dev entries driver
(result shows i2c not enabled the eDMA mode)
root@ls1043ardb:~# i2cdetect -y -l
i2c-0   i2c             2180000.i2c                             I2C adapter
root@ls1043ardb:~# i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         08 -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

After apply the patch:
CONFIG_I2C_IMX=3Dy
CONFIG_FSL_EDMA=3Dm
root@ls1043ardb:~#
root@ls1043ardb:~# dmesg | grep i2c
[    4.697046] i2c_dev: i2c /dev entries driver
[    7.304142] imx-i2c 2180000.i2c: using dma0chan16 (tx) and dma0chan17 (r=
x) for DMA transfers
[    7.313532] i2c i2c-0: IMX I2C adapter registered
(result shows i2c probed after eDMA module installed)
root@ls1043ardb:~#
root@ls1043ardb:~# i2cdetect -y -l
i2c-0   i2c             2180000.i2c                             I2C adapter
root@ls1043ardb:~# i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         08 -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
70: -- -- -- -- -- -- -- --


> | I'd have expected that with fw_devlink enabled, the I2C controller
> | wouldn't be probed before the DMA provider is available.
>

This is a legacy patch, it has been in our local tree for a long time. The =
related history is relatively vague.
I reproduced the problem and found this patch is effective, so I referred t=
he community patch and
legacy patch to rewrite the commit log(I am not sure if this would happened=
 in some cases so I kept this information).
Now it seems that these descriptions are redundant. I should completely rem=
oved this in the commit log:
    Move i2c_imx_dma_request() before registering I2C adapter to avoid
    infinite loop of .probe() calls to the same driver, see "e8c220fac415
    Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
    and "Documentation/driver-api/driver-model/driver.rst".

[1]: https://lore.kernel.org/all/19a43db4-db5c-4638-9778-d94fb571a206@pengu=
tronix.de/
[2]:https://lore.kernel.org/all/153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengut=
ronix.de/

> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > ---
> > Change for V4:
> > - Output "Only use PIO mode" log in debug level when no DMA configure.
> > Change for V3:
> > - According to Marc's comment, remove error print when defer probe.
> >   Add info log when DMA has not been enabled and add error log when
> >   DMA error, both won't stuck the i2c adapter register, just for remind=
ing,
> >   i2c adapter is working only in PIO mode.
> > Change for V2:
> > - According to Frank's comments, wrap at 75 char and Simplify fix code
> >   at i2c_imx_dma_request().
> > - Use strict patch check, fix alignment warning at
> > i2c_imx_dma_request()
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
> >  1 file changed, 23 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index 5ed4cb61e262..b11d66d56c55 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct
> > imx_i2c_struct *i2c_imx)  }
> >
> >  /* Functions for DMA support */
> > -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> > -                                             dma_addr_t
> phy_addr)
> > +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> > +dma_addr_t phy_addr)
> >  {
> >       struct imx_i2c_dma *dma;
> >       struct dma_slave_config dma_sconfig;
> > -     struct device *dev =3D &i2c_imx->adapter.dev;
> > +     struct device *dev =3D i2c_imx->adapter.dev.parent;
> >       int ret;
> >
> >       dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> >       if (!dma)
> > -             return;
> > +             return -ENOMEM;
> >
> >       dma->chan_tx =3D dma_request_chan(dev, "tx");
> >       if (IS_ERR(dma->chan_tx)) {
> > @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct
> imx_i2c_struct *i2c_imx,
> >       dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
> >               dma_chan_name(dma->chan_tx),
> > dma_chan_name(dma->chan_rx));
> >
> > -     return;
> > +     return 0;
> >
> >  fail_rx:
> >       dma_release_channel(dma->chan_rx);
> > @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct
> imx_i2c_struct *i2c_imx,
> >       dma_release_channel(dma->chan_tx);
> >  fail_al:
> >       devm_kfree(dev, dma);
> > +
> > +     return ret;
> >  }
> >
> >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,23 @@
> > static int i2c_imx_probe(struct platform_device *pdev)
> >       if (ret =3D=3D -EPROBE_DEFER)
> >               goto clk_notifier_unregister;
> >
> > +     /*
> > +      * Init DMA config if supported, -ENODEV means DMA not enabled at
> > +      * this platform, that is not a real error, so just remind "only
> > +      * PIO mode is used". If DMA is enabled, but meet error when requ=
est
> > +      * DMA channel, error should be showed in probe error log. PIO mo=
de
> > +      * should be available regardless of DMA.
> > +      */
> > +     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > +     if (ret) {
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     goto clk_notifier_unregister;
> > +             else if (ret =3D=3D -ENODEV)
> > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > +             else
> > +                     dev_err_probe(&pdev->dev, ret, "Failed to setup
> DMA, only use PIO mode\n");
> > +     }
> > +
> >       /* Add I2C adapter */
> >       ret =3D i2c_add_numbered_adapter(&i2c_imx->adapter);
> >       if (ret < 0)
> > @@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
> >               i2c_imx->adapter.name);
> >       dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
> >
> > -     /* Init DMA config if supported */
> > -     i2c_imx_dma_request(i2c_imx, phy_addr);
> > -
> >       return 0;   /* Return OK */
> >
> >  clk_notifier_unregister:
>
>
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C1acf840d499f
> 49a7872408dd0ebedc39%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638682935131084746%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s
> data=3DY9Qn9XEk15yu4CespwsNu6hl3%2FqfNTvEeOn4ZvnGxbo%3D&reserved=3D0
> |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

