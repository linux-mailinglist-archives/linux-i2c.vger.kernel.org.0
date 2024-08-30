Return-Path: <linux-i2c+bounces-5954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2515965C1F
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 10:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5F79B22E42
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 08:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CA216DC34;
	Fri, 30 Aug 2024 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TaeVbkk4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63616C440;
	Fri, 30 Aug 2024 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007997; cv=fail; b=MTxb9dKY0jHfmdWJScJ9jnl+TNkAM/0NvEKZeehet/lmHqCtptwc9TtIJ7uTNCdXkmkPe37nnFtxmFlyqN345Jr0GBsggawgFcXewtOVU1d5hDEindkI2uEyz/54ToYwqv/4TMJYRvT7KaxQitBE1AjwHVWCFpGSILYuWqvDtUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007997; c=relaxed/simple;
	bh=9EQIfXtSXNUAI72FlWgO+yt1DnJF7Ja7Jmz/NNQHklg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=atlIWOyrUfPbFq9bxSL7eulKKCPHKHtRiTsFtoNjzdnQF0WpI761h2/NCFfVBtQSYio8PNoGkVhK0IGMvYGN8KJjuYx0JAkA31IQwwBptaDGaQaAlvWfF9yjEMtj9OZKSF3U46/KRdTNFZ9spkCBSkBbKm47uYu8EjJpylbwB/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TaeVbkk4; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwU5qLN0yXaGVvOozJoJfDcT+1D9S2uWnaQ9jA+E5aCZlE5ARo2EeZ5BAQuOTDWkbaFVSEpnMV0QoW0mAC/6enWGG52XsTehKRhI9KeM0WTLykTEQ5k5e8/zSh1MtfkBQJJSl3n45wOhRO6ynbYTEM56x4IdL5EzxPM5k0H+eq30wOYrnafp3qZKJbF8gQag9vSwhMgjeeqNg1vRezHcCTClcl6i1h+lDuBbe9zDaN81c3GwkDqzVoYtw06wiuqBRIAlhs/xb3pXf8PEaAupWEqzU7bMgDmTVlrM9Pdkol9RlXttulfp4wcHD1g2fHSB8/Fw3O1ev3zkoS2U2oHNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56pFMN2RcK0Z90OVGdETmIZfme64/XYqRkxmoQgMsL0=;
 b=In+pD8fhWk1jt1EN7niL7I/kWhGSKy0QsHVkfYF32R/KAniaMNILGJXATk9DTLEL9/8lmovAN7qg10HI3koF4Hs3QAxDXfo9bT8WXtiLoKucNTAxmcjoamKwSe4pdDqnywhxqOLwAL1vn7krR1wO4fLGLXTEO9Lp4Gu6kVsstAipevc6ZjkyY9GuitEcTBLlUrZqqU5weOp68S6TfnAUXYls1fwz9B8biaxzf3jteDQjS6DIe8atxkW2l+vrONwSymollA6bR1+OdEq36QF+xthLxBe4Qcq8aO1C5gfv7hAYgWQ6ofTRNdU+43+tNksiTnCadxEYTbQNTXdHEWcAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56pFMN2RcK0Z90OVGdETmIZfme64/XYqRkxmoQgMsL0=;
 b=TaeVbkk4VdPJBJa+9UYhz00/8g8dLCfu0Xx2PsliEejcxawiT844fSlMwsEsMsqScx8bqSuzj2GcriB3EKgoKUIY+RyxsbeJ9QEsdMCh062pDCDi4ctYKKZoj+CUd3gGuavO19QdP6iiocXy5p5UnrKYkgU8/bUDEpMCSfd5OS+tMI7KVz5Z43VndDD3Za4qXz3je0rtRHc6BozR01G3KE9Ysu9QRHvBfttXHwC+sC7Gk+mEHWNuaUbg1LsZVpwqibArZ7jChINzDpTy57rY3nOS/w43j2AbehssuRkk3DI5xasm0EwCKLfJJg8cvy6l4J+C0HPhmvepQ5zXF4RZkg==
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com (2603:10a6:10:1a::19)
 by VI1PR04MB9785.eurprd04.prod.outlook.com (2603:10a6:800:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:53:12 +0000
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::68ea:5937:4fa7:db2b]) by DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::68ea:5937:4fa7:db2b%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 08:53:12 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, Aisheng Dong <aisheng.dong@nxp.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 2/5] i2c: imx-lpi2c: add IRQF_NO_SUSPEND IRQ
 flag
Thread-Topic: [EXT] Re: [PATCH 2/5] i2c: imx-lpi2c: add IRQF_NO_SUSPEND IRQ
 flag
Thread-Index: AQHa+fXPBP1oyM+4lUOBc+M/ckznqbI+Dy0AgAFKhGA=
Date: Fri, 30 Aug 2024 08:53:12 +0000
Message-ID:
 <DB7PR04MB5003B70ADC8388F878E06BB3E8972@DB7PR04MB5003.eurprd04.prod.outlook.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com>
 <20240829093722.2714921-2-carlos.song@nxp.com>
 <6bc3f830-13dc-4df1-ad41-6228976c0dcd@gmx.net>
In-Reply-To: <6bc3f830-13dc-4df1-ad41-6228976c0dcd@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5003:EE_|VI1PR04MB9785:EE_
x-ms-office365-filtering-correlation-id: e51ccd7a-ee61-473d-4e72-08dcc8d12dec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gPbxUkneu7LdV6XxX9ec4R+hc0pPNXoWCJ1gFdKk5WNw+w2qCJP1xng+dKB7?=
 =?us-ascii?Q?IG4cqnuUd8GvAcCA/yCxRJ1jGdc8ulEAeu875Fx7tnRNJG9gJuGrZpMzqTTz?=
 =?us-ascii?Q?vWiAX73VKkmRatimeC6Sfw9Kh6u8w2IVF/LM548jTGxPRGQfolLxALDEEf0T?=
 =?us-ascii?Q?M7uNP+8tM9AvOxPbaqvPbRPG2hWstrDg/prM3KvPZ36BIATIr8FZA2iLeqv5?=
 =?us-ascii?Q?E8GSs2i7B7q2LD1h0p9SvwKtAchsOk6PoclOXEe+/Q3FHIYzh60V1ts26Ix1?=
 =?us-ascii?Q?om2Wk+lrXbvEQstj1xwfKDUbRCHdWMbt+y214yYTX5K2rb4MaEBUOKps83tD?=
 =?us-ascii?Q?wNBnFK50aOv9Yry1DSEN7SB2rU3Jm3kZ6zxt53O1F8OnL2GbaRkZvBWl9OQe?=
 =?us-ascii?Q?Crd+SDMJ/sG2IiQ24cWtKE7n22DirNwKQnp4Qcj+JkWvtY61SUr6YfWiVrYm?=
 =?us-ascii?Q?Q5Eaqyh1fxyzr7Gcax9DilnM10qHuVUtR/WDDuTeDu/NXiaD8AMMQQSw4HzK?=
 =?us-ascii?Q?l9P+5RBiU5UEIDwM5soyqCIdWbN73QkUUXVshSgQXMJVaQQkjIrGsknEtl2R?=
 =?us-ascii?Q?uCATHRRCvUXtVYFm/dEh02P5Z4BWwjhiLkGtvGobQqemOV1EZ711Fv8TFPTq?=
 =?us-ascii?Q?DXuqXigOrTvQhnIBRmevVcJFGMxLrsIASVmYPZ8YTTykwx1NO2Bs3uXEsYqZ?=
 =?us-ascii?Q?qIJoPGXp5N2GRR0DOtF8zV1F+rJCke0+nYXsZQsvBe/2aBr6DwK36Oc2kM/h?=
 =?us-ascii?Q?6QOXfO9ik58ra4WfcX78q+yHavxKoIvAlsjvAalLPhPAdFsPPjLzrJF8VB6f?=
 =?us-ascii?Q?gz6S8Qehxcfabq7ofQLTCrZI455O5OVXcVsGG+VbFzknWzmEXFGtiBzhbVt8?=
 =?us-ascii?Q?9C+Mdv8YN3lghK7A98NmG3NsFuhGVCuzWWDOO1kx+LwXb3EIf1+y0M0/HOAG?=
 =?us-ascii?Q?BaqtUybE6n8sq3rcu/AolRHSOZowQoQmFWGUBqyckpQqp3h8Ubxw3j+dlxfv?=
 =?us-ascii?Q?IUQni4KD6qppUAnh83jhVF5qgDJtHff6gLZOBPi1BX2JmjmOH4KhkEgTCDC0?=
 =?us-ascii?Q?V1hrm9I2PmuoPXse1ApqY4qx6CpCSsdGA+M8CDJ+Fgi8GWRxYrFAHXkban+g?=
 =?us-ascii?Q?ednLQ7vagRVmI8J7IerGETPO1yMpxKdJDEgxjERSdQHcGDfL9wf1oItMbIyg?=
 =?us-ascii?Q?zi2E411q/FmuwGK2QxctVTWnNM7m6VKeFbcgwkVHDVpVBP0ao3Zv+8VjDutF?=
 =?us-ascii?Q?vz5hSWmQkiFs+B8bh9d2MTNBODunxHBNXXYeaVlHlsyJgYWj31ZFqCXtyVfx?=
 =?us-ascii?Q?15Crsk0HplndvbWuZvlQQ0ZOB5gN7/Dzov3OPAswq6Mh/rR9eFLnHQdcx3/v?=
 =?us-ascii?Q?jkWqhDIcCumOltGRFOWXTcX5sYUzjfIuMRVuUvazJSl9CKHS2Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5003.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+LZBLTUFFMp0S518/n8n8mgK+hnLPL8oCX6es+F6PKThOIYHrzR2msPMTIau?=
 =?us-ascii?Q?KnhYWu9W73zyi8JBdD3tdleBFKW3EQEvLSupsD2Jp09xtMKNcW3MeR33fxJt?=
 =?us-ascii?Q?3Jbon2h85L3QOnlFC903MqfHSclDHmJSycfgpvkKL4J5lTXy1PddnTF76elb?=
 =?us-ascii?Q?1rV37MlxDkrtktK/9NmRSulvtq3Ud0A6LTDtbhJ5hkePRdJmCHQj90J/mkS7?=
 =?us-ascii?Q?Kt4aGULMq+DeL7u0yYJB7/QoFTM1l/GFRqLIu+IFWh6JcPlnlZZ350y0IbkN?=
 =?us-ascii?Q?YvpkDoQNvnAY7pTNAq2VWYYmG/to+8rSR2MQfxM7PESV+w1jtoIgqmfELfnr?=
 =?us-ascii?Q?egzP7MASO6QSynweWSkuLu+vqTj0bdTPKTiKMBOEUvLGAXz49SSiw99Eq7cV?=
 =?us-ascii?Q?hlKy13a3OapvOf80YDfiaFBngIxWK6kZ8AVMiQCTx8eJqtvcz+J5NS5Kr8A+?=
 =?us-ascii?Q?iuCw7nN2gupBnXiKDLl6nqaNosASB36BvIHiw7b2iWdnW1ojgZMypZg0YKfz?=
 =?us-ascii?Q?OA2Pp7WfD6pBfZC6BOEwqgwVU2H6N/dJ8UBXwfGLMNrKmr1lsw5kU79bTE2J?=
 =?us-ascii?Q?BQk14odXQ4k7Eozw73vBoVO0UVwpNFBhtaETQH6JiJ0dVEkGzGAKDmmzgbrw?=
 =?us-ascii?Q?PNxR7i/rFaDXiGMTmpKL+s69MAvw6Y303fQvh/Vnv16LJqs3H0WYqguceYoJ?=
 =?us-ascii?Q?W88bmqyaAPYBPSuPKV11ean2GPuE9DFw2H8MeNkqNT5lrnKLkIMATQXnl5Xv?=
 =?us-ascii?Q?SVdbl/uQI62dqWUd0ajiqHwIrHe9DrHVzBaqT3P7Rbjhbjo3mSgQacRSnNWH?=
 =?us-ascii?Q?6yP3b0OZ0mPifRklVDG/X90cheYcHOTIHdzAEHgrmkWQH0U1cChCgyPdx4eH?=
 =?us-ascii?Q?f4FeTpXaLbt0Hx9lBfIO2IYa3vJHSP2poQiMjCcaZwhqZ7Z/bq+SywDeLeBp?=
 =?us-ascii?Q?CdwEhIS2XgghRLrFDfiD6/SWg5Wg+z3TJmSvtwvVppeoXrIF2Y7ZUj+kENa4?=
 =?us-ascii?Q?UQ9rWPGpC9GwmI/JbFwa8NiBigBdGOAcx9Wb30doBVJLsVs3CFD2+ozB17FD?=
 =?us-ascii?Q?OR9t89h1vZVjhCV6Nd2vU1wMOTy+fpTlQtJRMXljj2r9CfPMp+9bUd+GrHQZ?=
 =?us-ascii?Q?fyHHugo6/dRNV4Af7r1/fNBk/7nzWLvW7LlTOCsJ5jsZN1p2h+2JEuPHQYGA?=
 =?us-ascii?Q?SozlJrIjIFtEfFCevB5W0H5yDcWGtxtz0AuYueTJGMVx8KCk9ACSZT0ufs0X?=
 =?us-ascii?Q?4Dqa+7WSVhbRxge/Hea8uJmBBBBFl8P1tmsbz2dFSbNKCtCwYyJY20P/X7xs?=
 =?us-ascii?Q?Cua4X5mwgDI2COoRKaLUAblBtGrccB56FieUibG/Vo23PAVtYUUNGmWN9PWi?=
 =?us-ascii?Q?VT1f2OqYMPVFPzNTr4AeqhwwKVENjqozSSrCJ4N7P1msZNgGyRKEbKZUglZM?=
 =?us-ascii?Q?eQkbKRFQcf8DuCI7Ds9EwtQ+HPpDG85MwoUxPzPoR8c56WMf/UzjLSCKKgtw?=
 =?us-ascii?Q?suFAktQM7h7kg7xrP5LzsXOjfuhl1JxSUK2QoSV9Fu+ReOvn1DnjXKRB/fex?=
 =?us-ascii?Q?MnbV37lsfpWKytv3pORWdg1ujimLFffRri7KAbmy?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5003.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51ccd7a-ee61-473d-4e72-08dcc8d12dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:53:12.3647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: menLjVDmgqBaA03qETg9Q+2KWCoqBnpVo332xOIgE9nO3hdk+Q+ulQH0hSD+eky3bTmYz22Ygd1yEqHSdAlVHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9785



> -----Original Message-----
> From: Stefan Wahren <wahrenst@gmx.net>
> Sent: Thursday, August 29, 2024 6:53 PM
> To: Carlos Song <carlos.song@nxp.com>; Aisheng Dong
> <aisheng.dong@nxp.com>; andi.shyti@kernel.org; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com
> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH 2/5] i2c: imx-lpi2c: add IRQF_NO_SUSPEND IRQ fl=
ag
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> Am 29.08.24 um 11:37 schrieb carlos.song@nxp.com:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > Set IRQF_NO_SUSPEND flag when request_irq(). Some devices such as
> > extend GPIO will need i2c transfer during the entire system suspend
> > and resume period so keep it enabled.
> do you mean GPIO expander which are connected to I2C?
>=20
> Do the mentioned expander have a dedicated IRQ line or does the host need=
s to
> poll I2C?
>=20
Hi,

Yes, we have both gpio expanders. But devices polling i2c may have a strong=
er need for this.
Like pmic, it may use i2c transfer at any time regardless of whether the sy=
stem enters suspend or disables irq.
This flag is added to make the I2c irq won't be mask in the system suspend.

But I find that it is not enough if just add this flag. Because lpi2c clock=
 is enabled at rpm function. If rpm is disabled,
the lpi2c still can not work. So I will add an extra patch to make lpi2c ca=
n work also at no irq stage. I will send this patch
with this in next new patch serials.

> Best regards
>=20
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index c8f3dadfb36e..23f83f10d5f6 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -1309,7 +1309,7 @@ static int lpi2c_imx_probe(struct platform_device
> *pdev)
> >       if (ret)
> >               lpi2c_imx->bitrate =3D I2C_MAX_STANDARD_MODE_FREQ;
> >
> > -     ret =3D devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
> > +     ret =3D devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr,
> > + IRQF_NO_SUSPEND,
> >                              pdev->name, lpi2c_imx);
> >       if (ret)
> >               return dev_err_probe(&pdev->dev, ret, "can't claim irq
> > %d\n", irq);


