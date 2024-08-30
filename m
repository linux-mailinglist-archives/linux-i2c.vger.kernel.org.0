Return-Path: <linux-i2c+bounces-5955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8FA965C21
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 10:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 439FD1C235A2
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 08:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A05916F0E3;
	Fri, 30 Aug 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LkLQdMPC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731816C440;
	Fri, 30 Aug 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008004; cv=fail; b=FNHij80Z9JCh/gVJSU1uvPJZPQBr6zG67E44ENAzO4HTaNEEzNa9nmHlVyB1QvauIAS71UPeAqANssxPNpBEeXy7A3jwSvpq2RBSQRAgzqwnz0I6D175Zxxv5/o7U0/srFoNf4p3wxcs0YhbBkmyJzSGGG3LFnGSw6uTkvwgwfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008004; c=relaxed/simple;
	bh=fbfz1qjavxhnV9EqXzJwRp/jVL66gwj9Y67l7rlp3NM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G2rEMBPnpKl8rugzACUDxLEF6eEx0Cc9IRQu8FbWlaGtURWJGGWhhlLwtV9rzwZya8qSweMdIIAFmusaUsdk3ju4elC/eBGx5VWQTufcJbRTWRAo8ZKtfxwC/rnHpja6jbi3xUXuBiSmuSDlW5a2oNgHn2nnnzNW68YkEwtbELE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LkLQdMPC; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rnl1TyjuE4B0ParDCeECnl1isTHF0woL8PwO8OodL7lUt9Mece7eCATRWNkHdgMylxQHv/kve2fyP/MKyHNNiyqXFptB8LT2hgoQ8CiKvwM4ejjFq2IoEikW7IoLpPtsgMQPXW5k3JGSO+FFb7zqkBYDvHXBVQM1CUVc8EJL0gisrtdHD1pSexXwfEsFVBcVLz1UNkkO8aaSY5g2xctF58OxrB/a1VZIsBj+AZM2sYKA/Mf3bBLmaqFzeAFInFMgAYeOnAeoFI2XQLqfnqp4T9oGVTZW/sCu/wBZ2lm8mvKEM5WdGV3OjHII9buwpaY0LYbBN+Xuotjd/XSM4i7FHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zra1kmcFz1EShNTItiMpu7YsYwA1ARyFnst97ldpSD4=;
 b=qcGPUQtSb311j/UBwK4EVIfOK/JnXwfvVI6AUMndnlE8Qp1f/fCIwiTrbOJFh0UmdEsLkANLtfpw6cJz6Oe91ya0bqYDBmXidYE42YdMAF2gHde+hQcYbCdNdEOD8D6CsweToCvPT6KD6AVz1uBF4vWxQgXIp8NXElyJcfnjyw1uaKvw5xtgMg9DqqOr00Euop5hbLHOHLGtAgEEmyfgmBIz0m3h1JxVmCstm0Pajw8JMU67lKRosHRsX5ecGLu7X2jvsugFPI3H5oBqVabIvOSTLf4Og5z9uxcMrQxOkWD3o0sRACtuCStY0gf8lXUzErUHwSZTsrOrrb25/u6ypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zra1kmcFz1EShNTItiMpu7YsYwA1ARyFnst97ldpSD4=;
 b=LkLQdMPCIzRFBd9AE2rVASVpOJPYUbXs0SgsPz2ayUcsF/M91xmyMReeVglToJ1j5MXtVN77vqflzsv/NvNqyCdT3Fxrz79i136tip1F6htg1OcFDoMUKSDUqgpFFlwrEXq0Ar/IePOz8KhHQ1iS1xE8ZW6xzrHbTy1zKd88BKaigWdRCE+1D4Jw8ftxzNqCFCU4AEH5x/dM2+VGBSb5fo8S4wnHQzZUkL+/r2UUAmAJMZkhPM69Zh+CxJleT2yLjGycleaulyyKmQBetXzu31sl4AutqfP7iDf3RB3GxTON/V711t5pH/3kLbZbPSs7new2ty63KcviTiF0r1kobA==
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com (2603:10a6:10:1a::19)
 by VI1PR04MB9785.eurprd04.prod.outlook.com (2603:10a6:800:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:53:16 +0000
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::68ea:5937:4fa7:db2b]) by DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::68ea:5937:4fa7:db2b%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 08:53:16 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to
 avoid operate clk frequently
Thread-Topic: [EXT] Re: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to
 avoid operate clk frequently
Thread-Index: AQHa+fXXc1yrMzyuwkKbQjkjZbk2B7I+D/AAgAD7X/A=
Date: Fri, 30 Aug 2024 08:53:16 +0000
Message-ID:
 <DB7PR04MB500383BFE3957B1E422270AEE8972@DB7PR04MB5003.eurprd04.prod.outlook.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com>
 <20240829093722.2714921-5-carlos.song@nxp.com> <4375906.ejJDZkT8p0@steina-w>
In-Reply-To: <4375906.ejJDZkT8p0@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5003:EE_|VI1PR04MB9785:EE_
x-ms-office365-filtering-correlation-id: 98bd7bbd-cf9f-4931-5761-08dcc8d1307e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iAXepNUxjFAK2zdm0vjGCnw6qoJJeisqRKJKxYnTB/EfWSCMCIlGqDGHRd?=
 =?iso-8859-1?Q?4DOW8AOJlzmEcVhHDBAhHKqR9ezoMFqGWBe6J07u3afFo8QNvwevb8pcCp?=
 =?iso-8859-1?Q?AiW2/FQ4qHh2KErsuXE8fD8Aq2zoXPr63TRNkIsZPRj1ndOUV4ZML7LMjm?=
 =?iso-8859-1?Q?4MuwJiyQXMPJGPe+yBQfVXoh94w9oPtjYe4FXEDvUGm64RHN3m1G/KkgXT?=
 =?iso-8859-1?Q?vLTAvvRhS4QWbUVqhDJu1feAbchDxQ2+SQuLvxbW2RHCPUhQGFDhwucJSQ?=
 =?iso-8859-1?Q?0mSQdcSH6VvLKUsIcSpGaMM8ExLy17v1vOvFyvuLqRcO+zyY3PmthKEVLJ?=
 =?iso-8859-1?Q?gn92rGV9CbQFW6ADR4V7+9CWrNjZtbejcBe9coyKak/Ztaq+QRikShL+HY?=
 =?iso-8859-1?Q?R2d/4y4WDW5v7wnuxc5m2Bt3P++YpitCtoWEonQbynNNx9abumRfbK/kEK?=
 =?iso-8859-1?Q?5/bKXgTzcH+ZEZ5JSuPC9FJO3DdK9rMiccE3sxTg0j1QYzai7i9ayPy8Wr?=
 =?iso-8859-1?Q?n39U+zsX/72S3x9UyGW0r/huV6uQOLW5xf43+nlrJbayHYe2uCT9Ebj+71?=
 =?iso-8859-1?Q?CgW38F7OFJ0YNiV3XjmCrtebnDQw1OQlHINKEPmX28IWkjPKEK51WiJIHw?=
 =?iso-8859-1?Q?XYEFjhgTm9jvuAf/87IcsaKcTOCDIXUCP+RTd9I1X50Dc09Ho17emOb2ia?=
 =?iso-8859-1?Q?pzN2TpHE2LwQ+gilxWMwCAY+hZelIzMlSrnMqf0pDBWJNbm+RIful4gsGX?=
 =?iso-8859-1?Q?x/IlbX7JeYmHHYL6YpbUTqE6ACUIyHzVjbxuZx2BSieGx2ECx1zVq6G8N2?=
 =?iso-8859-1?Q?swKVH3juq3lfxK/HQsikPe97SEuW7IfMHhpHnMvKy/hMtS+IYTmaqDBHJB?=
 =?iso-8859-1?Q?0Zt/wntvebW6jT7rPlCJRip+0f3O1KFf1JbLpNpEKa4JWUAncn1wLdG/h1?=
 =?iso-8859-1?Q?mL18RyRHvznyw3kZvgNSeoLWTgNI0SnPpTme06z47CLVnlPRrP0l3GLaJf?=
 =?iso-8859-1?Q?p0yBz2KhioxCbeWHknQ2RL7+rmMU2nN037+k6mHIBEQ6WJrYitfPnZdjLl?=
 =?iso-8859-1?Q?bvVEPcaL6MPH7ReDGZOqEGaFQWZK27LDS+p8uDoqDY5oO8HaIp29zPHqna?=
 =?iso-8859-1?Q?A1/IO4W3XVi46J3JHl/cG9xV88mFJmr9vU7i0ZowW5UyUekL95HspJtVHe?=
 =?iso-8859-1?Q?LQ83uxtkHK8Vm22GD1OAe92iYkTCmwYaqxtHXKexyzcqU4MVkEhIK8Ez45?=
 =?iso-8859-1?Q?zTk7278GNe0sAsGYjofnHke4swaNkDhPxIKentMULhDPyawMnTTIhl3fdD?=
 =?iso-8859-1?Q?E+03qmDfMyBvUqfX6F0x3A0MUMmfOAKeEdhZFGzWu2Mj0UTWJUVsdEWCaM?=
 =?iso-8859-1?Q?QR1dx/y8aCXN/oU2R/G1rQKWIduGsEkh8kyFpm/eqtBNEje5pVXm4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5003.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0SKL61UFwSxWEVkc4iCZxo/2tSml1y7wlBrf9chh/n44cu/jJPIxmeXe25?=
 =?iso-8859-1?Q?QXam3fKccsPsm2+FZGzFeeyUQ7ZwrlMhD7T0o1+MAqkIhZnthvPH4CFLwk?=
 =?iso-8859-1?Q?wZmhoMdh+T1NZOMXTBtaAn0i+/uqE3aALdJ7pRnKZ669MC96U9cKlcmzTe?=
 =?iso-8859-1?Q?gUfiFEEl5CheFXSzqp0bNNmpE+8p66S6/HNA4THmVhRewBiKzMnfXyQLYa?=
 =?iso-8859-1?Q?8I+7YFRZmgGli7h9qHP7UgT+mf0d4FiEZ3sxGdFYReJcUGBx4M0n1n6RS/?=
 =?iso-8859-1?Q?vGaweC++GWjqgavOYz0gd6r+qBheYqXUjZk1AcJ0DnjXTj1qmEaLENuvAm?=
 =?iso-8859-1?Q?RlEoNRPuk8nQ7yaNZCt3rnMG/2hcUBPAB+DlQ5eQ5okEtrFDRJ4LZgPGbn?=
 =?iso-8859-1?Q?IFhjk1e1gtup87ATRwpA3EbzxxcTPp7SS2O9dxJSvMd3z5+UisSpj9KYja?=
 =?iso-8859-1?Q?vhHO/kyHHJKX1OVJm9+PSbXSsdpvu2gLtn7OE1TshvNIOLJZ/ppEZS8N+2?=
 =?iso-8859-1?Q?Sf3GY2h6lbUHWZpAUQmHR3wgqOdoaMtgI67xmLpFJh8wsSoraEoxaTEx6d?=
 =?iso-8859-1?Q?KsWwolfNpPRxFQow0tOIqM0qBKRKeSNefSzgfKLmoyFep1qr1kjvB9w2/1?=
 =?iso-8859-1?Q?7BVKZQCr0tJpb4kmOIh72iFUiUkq2sAqzSe1zmnwOchsAUQcm/dsBRxtvw?=
 =?iso-8859-1?Q?e6b28d+Aq3E+Yk6KukbNncwPtixgRxX1xj00fMGFaCKcqEliZFByX+ocyI?=
 =?iso-8859-1?Q?GUyMfymvtrIRX5ukDMZDFNYKBlWPOMVk8yDzsohXqDlOvQYsYPlBy/4Uuh?=
 =?iso-8859-1?Q?F/NsGwurZYji6NHVtOx5VPQH2zmPg+OIugatsKVBtObJ+/W7EVrAnTxGR+?=
 =?iso-8859-1?Q?6alEt7mTJ+mhklKmeY9d3SFWOrmoylig9yc+h3/w+LsLfE3tMh8pJAzFG1?=
 =?iso-8859-1?Q?uvYXb09OwaJyd28KMUptB+/R2iUBODnW82vrqc7IAG0hDPT5VmpZ5E0w64?=
 =?iso-8859-1?Q?k7CisXy+ma4BtpD7zJIjI9jMM1Q0V3s7aYN1gwz4ISLMlvM5t9YqhzoXvT?=
 =?iso-8859-1?Q?s31Mfg+0L+2TsyOuyE1nIzRQC1RJiRafDapdEs6IjGuXgQnr67K6/w2Sxv?=
 =?iso-8859-1?Q?O/RmXfPWbiw0occp0an+CkUTHjKs6YjnsSB9jrbssgPNRPyn5WLvR95Iy1?=
 =?iso-8859-1?Q?JYbhO1pLjh/3c+e5BrleoivBcsof1ZPXft4b1F1UCcODT/CM1/uqIuhRQI?=
 =?iso-8859-1?Q?1jH6s+imam1Qfh5o3aoyBCFAEyIuPZ/QTPl3HBkj8k8XIgY5pHb4wDsx9Z?=
 =?iso-8859-1?Q?Z1pdXjUAjWS82jOA8brQqGeGJ1/3gO72ruelwYIlKYQH/aDt6qbi6UbJIA?=
 =?iso-8859-1?Q?kX4SNx7oM1nqWJCCianICAylSU/rXOptj3t/Q4WOo96TzC4fxHBW9DlgaX?=
 =?iso-8859-1?Q?oJ9vmebFyFD8kAfcLnNGl+vxQ6XJ76wIN8188slilskjaSXdR9zTP0tLt1?=
 =?iso-8859-1?Q?+/iUdT2NqE2mdmPU3ixZBakSaCvlxUjGTYTqf4IUd5tI3qZPlnEVro3wwc?=
 =?iso-8859-1?Q?Rn90v4bn2xdlsp5WEtEKr29mczePTumTho1gdSwYGP7uEh0D+T+52Wbktd?=
 =?iso-8859-1?Q?MDWCZNI79f3SIdmD0Je8mNGkVfO/UwcGNG?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bd7bbd-cf9f-4931-5761-08dcc8d1307e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:53:16.6474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NB7dnRXXFbLvLsh6Q7fry0DPqNveKYEHuDCnmE74dZjq1/Psr7tqxfl/B0p/SuQ6NZkR+UrTc11yXlcsns+GFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9785



> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Thursday, August 29, 2024 6:55 PM
> To: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Carlo=
s Song
> <carlos.song@nxp.com>
> Subject: [EXT] Re: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to avo=
id
> operate clk frequently
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> Hi,
>
> Am Donnerstag, 29. August 2024, 11:37:22 CEST schrieb carlos.song@nxp.com=
:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > Switching the clock frequently will affect the data transmission
> > efficiency, and prolong the timeout to reduce autosuspend times for
> > lpi2c.
>
> Efficiency as in throughput or total time per transfer? Do you have any n=
umbers?
>

Hi, Thank your for your quick ack!

Apologies for the unclear explanation. The efficiency I'm referring to isn'=
t just for I2C. For platforms with SC firmware
like the 8X series, every i2c transfer to enable or disable the clock notif=
ies the SC firmware to perform a clock operation.
So if the autosuspend time is short, i2c may enable and disable clock frequ=
ently, it will occupy resources of the SC firmware.

Therefore, we add this patch to minimize the excessive sc firmware resource=
 waste caused by frequent I2C clock enable/disable operations.


> Best regards,
> Alexander
>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 210d505db76d..cc5e5d96aacd 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -129,7 +129,7 @@
> >  #define I2C_CLK_RATIO        2
> >  #define CHUNK_DATA   256
> >
> > -#define I2C_PM_TIMEOUT               10 /* ms */
> > +#define I2C_PM_TIMEOUT               1000 /* ms */
> >  #define I2C_DMA_THRESHOLD    8 /* bytes */
> >
> >  enum lpi2c_imx_mode {
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-g/
> roup.com%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C85ca11fd9cff416
> ea43108dcc8191786%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C
> 638605257330352810%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdat
> a=3DAV343gx9HRiXKLNQk5kBKj%2FfJM0p%2FSLKG%2FQFuQg64I0%3D&reserved
> =3D0
>


