Return-Path: <linux-i2c+bounces-6569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43297566A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A2B1C2319D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09A419F104;
	Wed, 11 Sep 2024 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Eh57ACuP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22619CC05;
	Wed, 11 Sep 2024 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726067267; cv=fail; b=fmk9IzMd053xh8NlXYioX6wSeiWkpdmeruatXtub7sa4WbtGfXVJVqDlmiKMJVH/eweuU/8EBLERxaciXxfjBFxKJyDUkDjFFD48K6kOsFx2Wt8CDdkf1huI9BOUl2LWxVNro/ob+XIDSH14s2IwNGLOhrDFfna6piiekdG+6C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726067267; c=relaxed/simple;
	bh=ajNWLFu3b6ZBhLxvQj+MMSj3NyDJR0TrhQTSlsdi8aA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=odMsFoDIcIyOE8//Qsq/xmc2kJ+mYK2GX8KhOvKvVssA3YHt9uhCevTi9ZYbPdGhfddH3dUufLyf55p3og56bJwavaAuVeH9Ll0Dfsveo3k9S7vgdbdpM9bKpGJLxFPVouEm930dtcRHRjOW6L1mhyIPOq/gvtEiIedn67l53DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Eh57ACuP; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5kdDBxGQ0ctgsTAPmkAUbjs3M3LgzASQb0Lt80MP82Qc4pbcyx5XyuGupYCW0nD1krowqQ/QxKx9XLfay5gC+fPEQ/UPGy6hO6heJmFmPzVJdYvkIWduHrneGnzxPd0GRK8QcSUFLIFSNsIk/B+QzTJIilrVtBkNuGfDlqVQLacgVHRjfMph+j/+rIq/hF52kZimIYxThTIDlmU+6YJ100PlhZ4Uj12wzWMc00BdICLpyNIsYKiaaJ0tiycxIQ7OXdIFjy39cbrm1rJznZtX3H5Foz2ly8aE5hxDg+K0ofalK17P9ghVOcupLHy9LZ55CCKf5avhVPir6m2QPtZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBA3+Vh1nPDmhimCulkoicVF3NNPnirzNOQFT1EAnbo=;
 b=aX+HjiOas/gpunRDUTsW2ExUl3BdVdo80yUIL0F+1xFwQkNSdMkVjv4rfprZv5cMooKpnbixTrtOS+rNhvrCuG1eTLV4uukvTT+jMDl5MmC1QnRmgyYA5s2HrO9nJ8TQtVYFhAgPWklEsl0zQKWh6Is+3AzkbBW98WhTpCjGCXOzptgjHfh4+YIeeL8Ky3BA+t4MOSn6vkydGBn9YyGejFjYGnizhfLKR4MhtMlXWj7YG+i+GO6X2A3V4sr51vMvL4uE8IApzoKCvgcYbpjjWgolIK9wozs4auIr22KhBmf3+FRzAxWfECpKPfuPG8WRfI6FaUwS7mA6sufR/dDFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBA3+Vh1nPDmhimCulkoicVF3NNPnirzNOQFT1EAnbo=;
 b=Eh57ACuPOu6dTSaSh34DBhANRfJ0pe04gnFd0sWrd5QZLR7DL5Vvaxz/ZhC0khclRCTiZ+LoluTDN1DYSDu6mwa53PB8y5J8JRnSlzXeAtjapOnREsLHPXK8vP5aMAWfARHpgmyINQ4uM+asklS7Ng5donqmv3HTD2ac+xA4CDhvNhMzOjs9eDxajd82Fda21ufZMC2SMM/qOR7oFySL9jaugpxrwFQMzSfllfpIpw6bKlTXqtjhzOW0dlbVUlBVCkdq0HKunk5bynt9YoGjhQOX//MxgXQonatAaX6rohoewPrrgRJjX+f4+bpjsTknc6szhwGD9cGtwcME5hiUGQ==
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 15:07:42 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%6]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 15:07:42 +0000
From: Carlos Song <carlos.song@nxp.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, Aisheng Dong
	<aisheng.dong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Frank Li
	<frank.li@nxp.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3] i2c: imx-lpi2c: add target mode support
Thread-Topic: [PATCH V3] i2c: imx-lpi2c: add target mode support
Thread-Index: AQHbBFrMyX1Un6wBy0aAdJBl4rG8DbJSrXiA
Date: Wed, 11 Sep 2024 15:07:42 +0000
Message-ID:
 <VI1PR04MB50055F0397031B6518E49751E89B2@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20240911150537.192570-1-carlos.song@nxp.com>
In-Reply-To: <20240911150537.192570-1-carlos.song@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|AS8PR04MB8119:EE_
x-ms-office365-filtering-correlation-id: 26d1d1a9-0ab8-481c-3317-08dcd2737be6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RuLWWETUBjc84OtWkjUULSLPS/+79ymY2vXpbbwcjbN08zonFyqJ0dFkcPFB?=
 =?us-ascii?Q?2iRgc39R3zv5WH3YgrBHgx95fQJFstNZCh1+RbOVfaycR0WD3Az5v2oL1o8J?=
 =?us-ascii?Q?vh8+0K4PWaezOSvXLQA8UDX5gjdOf0koRrbNEHugpXOiV2Wvn+LoKrzLJSWW?=
 =?us-ascii?Q?NEcE6rRHUAlhUnCLxn4gDosnv4IAOTTHC7dqVStKf9/MgeK8V4e4eyNlwEqH?=
 =?us-ascii?Q?5leb7bciVnCMn1zwVMiAxECVyLR3D+W7LQ4Y1Va/J8JbShvhbSXt3B5Niy4M?=
 =?us-ascii?Q?RpNu+uSTL+15QoCCQLNhwkxrh7XLtr9IEkRKO5XBZO1fKiH3X3W5600n7NUN?=
 =?us-ascii?Q?XtJIsV7hcATSi0fb2+uDBoTvbFttY6Tln7Z97eluRHv31f1CZmexr3Qbtw6s?=
 =?us-ascii?Q?FVrVkn8G+xHRlvVqeeaWzP8N1CJSIG/tfSycmQxiKd9wTZ7pQqyu/hzfLoTF?=
 =?us-ascii?Q?CJMyRQb8CADmQKLOoG+WG0xFfSRKg7jJSH7Cxa9JXBetW1vBePcfcfox8gTU?=
 =?us-ascii?Q?j79NKDXCO25lrIjwgfaBhDUqN+UbZCkG/MFhwWqFtoPH5lJkx3npGgIvws1q?=
 =?us-ascii?Q?xSWWyTOszDEHmY72iJbfxaSV2U6cpTefXY6g0dmKrCT04Kzji0g7Udv7ZrlI?=
 =?us-ascii?Q?vTrVclLDn3nbDubXbNG4RtE1PLCa26dt70OEGUpuRAJRueV8twpVdgMqC68q?=
 =?us-ascii?Q?Vn57nGMRz2FGMHdcr8rD3p4EzgmDwr+iDSo9WZ3NvdcRvSQ/y7Po/Pa1p01Z?=
 =?us-ascii?Q?hHzZj7Tmg+zlcWe9/wkeieoDsHgpAXaw8Zigka7znAlakyUqq/j/KaX+I3Hu?=
 =?us-ascii?Q?d+MKy+vXsWz6/X+R/7RidZ3qSUYaxc1XJ3euMRfYm5Wohoh59yYuwUgv2oDt?=
 =?us-ascii?Q?/gko8RptpXgb35iWo2LPtSEDNYFEW7bP0YaO4q8G18V8unBiHbs74x2O22Lp?=
 =?us-ascii?Q?cvxZqsQy6khVXtRZyPdiMlMfXeYSTQwuAlkVR5yeL6EDFRcJxaGsdscJcpqR?=
 =?us-ascii?Q?QmAZW7op53ngA35j4rMvuNRMoZ7S2Hn8AnLuv8e7KDK/9tLvdRUpjQ3ZJYVH?=
 =?us-ascii?Q?T9XXF4K10XIgBlbdug4AP3ePTxY45gat5+j9ETiA3ROMxGYLMmyKkYDXOEo+?=
 =?us-ascii?Q?dpFG2LBQd7U/5HKHmqt2kvIvdSasRmTcggi8I0DOJD77dlv3EVSsNCFfBxbg?=
 =?us-ascii?Q?fBAFcJeVMVX0KpzeJmeGr7AyzzFW32Lc7hA99ekjc0SaOjtPIFslrlLF4goy?=
 =?us-ascii?Q?BFcLXtgeD7Xb3tnS6Y1GTnDzAJ75NL/k5Q+HlgT0nFCK8CsXzotOVeJOYZBM?=
 =?us-ascii?Q?QvbB+6G3OAlNhzwI8FIg6Zh2s4HyEpYrxrYuOvj0ofo0kTCXktIaddS9dr1l?=
 =?us-ascii?Q?5s9mr5iJdkeeisDS3CYPciBGFe/2kgJ3D1CBLaXcopdXWRBZWA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?usM2iNcIBgbleiwaCVdgICuMgGzx0IvM5j/TcRlk4XS6PGzfkUfC5nM145Jk?=
 =?us-ascii?Q?MoxQbKW2kZaGyaPF6LW9VHTV6OqEd8YaA/kCIgKjrL/ULYvTO7jJgWLqW71h?=
 =?us-ascii?Q?l4MntA6DEtDt/t3iSYhTB2nfrT6M8cnICWfB2N8Wh2G/QHYS7TdBKjWFzSut?=
 =?us-ascii?Q?9XcjpvEu1bgolBSBF+iJsnVHmu7aA9Cho9cIDOVzFX1A+Jx0L4PSiV9AhzgF?=
 =?us-ascii?Q?/YXsHMo34ZcgDjEhpbxyDckYIeTC7R4jNeReW0r/HN0Y8dhQrLKG+udroXhk?=
 =?us-ascii?Q?VgHZ2UT1mhLNKYrjjYxCbWJfGkepI655uttcQWL0/IgoJLQKs9Focq4on7+5?=
 =?us-ascii?Q?FaGQJ3GirZW0mTYgFlgkPDLqoPkmuVTQ8a7VklCGn1c8E0IKbJ5IpOpfgKlZ?=
 =?us-ascii?Q?Iy6wHFjX5cUoo08nigLJ5YtbHCM+u3HhcvgP4OmixCeViuofWvfvM77vUrL2?=
 =?us-ascii?Q?yiO3d/Eu4Ol/ui+76x4wG+l+7C+1ItrGJFqdSMFqtMSP9eHfGCAmFtAa2Zgi?=
 =?us-ascii?Q?PzdAzC6PShr7Q/RVM0bAX30/vmbASZIZJt9IPaS8DA6qyB04e9iCfB6SE/W5?=
 =?us-ascii?Q?R3DOITVBUvgpUV++rh+saFDLOe6lLUEDV/cz8lagWfNHINknboSG/3RfwCqo?=
 =?us-ascii?Q?fHx15Az+TlCXult6+glybyt7xencP71hs2iv0dsW4ZrpCMe2Z43goUjRnnhd?=
 =?us-ascii?Q?vv2D4khZz30XoFYAQmLjIUttQRmueBEjm4FlzRgtFnnLX0OPNTtNPfTwKL7S?=
 =?us-ascii?Q?CS3qpd1z2S2DV4wqcvuMj8YRNEPRkfo4C27ZfnX4gPCVn6LiYYOcDY0iy64G?=
 =?us-ascii?Q?rDir0uRmxt6sX+FG/A3df8JiGYGGFKq4kVt+gUcmJGQvIi9ENFRT8BiXD0Qo?=
 =?us-ascii?Q?Oxzww/xhBrPOh9437qw3hfjfasqeyv/XDEm3jzS2CU95Zk/e4d+zbM/zdXwr?=
 =?us-ascii?Q?D0XnbecVGGfKuCkM0o1PkxntXQVcsixrMuG9pb7TTT2Ii13Mu9atlqhh9iyo?=
 =?us-ascii?Q?HHxGxTH2SpVWG1wauTxGbSS03ak3O3LjYJNQ0PDzvWcDzU5FmINmlK3f5+lG?=
 =?us-ascii?Q?myewMFiG9ljOk3QttmDU0HeZTc9x6k1IJGszELYAM6upsAApQMrzCt1AePkx?=
 =?us-ascii?Q?ZTVNX7/xlm1fPX2or45x2PaAi+xCO/rOoLc8AdgO4PtPGAUMUztCj9VL5MRi?=
 =?us-ascii?Q?6xeA9hi+j7fOvlHfVqRDPCwmh6nVylYkgm30nAUWW3GmhtVBcupj795fIJa/?=
 =?us-ascii?Q?/oj9JUUf5Co+o+IpcTrJuLZ4ZWWmlht2My0DjlRFALAcL1r3WLhhbAvYfSoH?=
 =?us-ascii?Q?M9eUflirD/7EHwJsbW7XpwnICKG9EGKo74fW3dnRXLThd/M60NOZ6reL+qoY?=
 =?us-ascii?Q?TMR7pYQnOoo+E7CdKii0SUejbqIUqZ6p2FnIpxATpPnHmQsYtWmxPTvKFC3q?=
 =?us-ascii?Q?FEVML0j7bYqrznTZ7jxoo876VPNtLcmFrb1KQNLm7h5Yu9N5cdVXH44K5QtN?=
 =?us-ascii?Q?LzucSieT8CwFVgZKp7Gb8gZr1mTt9yTgQNZ9R/+mbt269KsQcJUpeW4JXNWO?=
 =?us-ascii?Q?62FBtipDE85g2Q4kwaU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d1d1a9-0ab8-481c-3317-08dcd2737be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 15:07:42.1336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: my53VZzV8k6M/zZWWHrJpyPxV7LnfhWnzuXRFlY1LI9BB6YaNZNfKRzELp04plPTiAvVZ4KGjo2OGpmIADdLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119

> LPI2C support master controller and target controller enabled simultaneou=
sly.
> Both controllers share same SDA/SCL lines and interrupt source but has
> separate control and status registers.
> Even if target mode is enabled, LPI2C can still work normally as master
> controller at the same time.
>=20
> This patch supports basic target data read/write operations in 7-bit targ=
et
> address. LPI2C target mode can be enabled by using I2C slave backend. I2C
> slave backend behave like a standard I2C client. For simple use and test,=
 Linux
> I2C slave EEPROM backend can be used.
>=20

Hi, Andi

Just now I found I still have work to do! Before I notice to need to enrich=
 commit log only.
Oh..It's a little embarrassing. Sorry for missing other comment. I will sen=
d V4 then finish the rest:).

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for V3:
> - According to Andi's suggestion, enrich this patch commit log.
>   No code change.
> Change for V2:
> - remove unused variable 'lpi2c_imx' in lpi2c_suspend_noirq.
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 252 ++++++++++++++++++++++++++++-
>  1 file changed, 248 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index f2bbd9898551..2d68faf6847e 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -43,6 +43,20 @@
>  #define LPI2C_MTDR	0x60	/* i2c master TX data register */
>  #define LPI2C_MRDR	0x70	/* i2c master RX data register */
>=20
> +#define LPI2C_SCR	0x110	/* i2c target contrl register */
> +#define LPI2C_SSR	0x114	/* i2c target status register */
> +#define LPI2C_SIER	0x118	/* i2c target interrupt enable */
> +#define LPI2C_SDER	0x11C	/* i2c target DMA enable */
> +#define LPI2C_SCFGR0	0x120	/* i2c target configuration */
> +#define LPI2C_SCFGR1	0x124	/* i2c target configuration */
> +#define LPI2C_SCFGR2	0x128	/* i2c target configuration */
> +#define LPI2C_SAMR	0x140	/* i2c target address match */
> +#define LPI2C_SASR	0x150	/* i2c target address status */
> +#define LPI2C_STAR	0x154	/* i2c target transmit ACK */
> +#define LPI2C_STDR	0x160	/* i2c target transmit data */
> +#define LPI2C_SRDR	0x170	/* i2c target receive data */
> +#define LPI2C_SRDROR	0x178	/* i2c target receive data read only */
> +
>  /* i2c command */
>  #define TRAN_DATA	0X00
>  #define RECV_DATA	0X01
> @@ -76,6 +90,42 @@
>  #define MDER_TDDE	BIT(0)
>  #define MDER_RDDE	BIT(1)
>=20
> +#define SCR_SEN		BIT(0)
> +#define SCR_RST		BIT(1)
> +#define SCR_FILTEN	BIT(4)
> +#define SCR_RTF		BIT(8)
> +#define SCR_RRF		BIT(9)
> +#define SCFGR1_RXSTALL	BIT(1)
> +#define SCFGR1_TXDSTALL	BIT(2)
> +#define SCFGR2_FILTSDA_SHIFT	24
> +#define SCFGR2_FILTSCL_SHIFT	16
> +#define SCFGR2_CLKHOLD(x)	(x)
> +#define SCFGR2_FILTSDA(x)	((x) << SCFGR2_FILTSDA_SHIFT)
> +#define SCFGR2_FILTSCL(x)	((x) << SCFGR2_FILTSCL_SHIFT)
> +#define SSR_TDF		BIT(0)
> +#define SSR_RDF		BIT(1)
> +#define SSR_AVF		BIT(2)
> +#define SSR_TAF		BIT(3)
> +#define SSR_RSF		BIT(8)
> +#define SSR_SDF		BIT(9)
> +#define SSR_BEF		BIT(10)
> +#define SSR_FEF		BIT(11)
> +#define SSR_SBF		BIT(24)
> +#define SSR_BBF		BIT(25)
> +#define SSR_CLEAR_BITS	(SSR_RSF | SSR_SDF | SSR_BEF | SSR_FEF)
> +#define SIER_TDIE	BIT(0)
> +#define SIER_RDIE	BIT(1)
> +#define SIER_AVIE	BIT(2)
> +#define SIER_TAIE	BIT(3)
> +#define SIER_RSIE	BIT(8)
> +#define SIER_SDIE	BIT(9)
> +#define SIER_BEIE	BIT(10)
> +#define SIER_FEIE	BIT(11)
> +#define SIER_AM0F	BIT(12)
> +#define SASR_READ_REQ	0x1
> +#define SLAVE_INT_FLAG	(SIER_TDIE | SIER_RDIE | SIER_AVIE | \
> +						SIER_SDIE | SIER_BEIE)
> +
>  #define I2C_CLK_RATIO	2
>  #define CHUNK_DATA	256
>=20
> @@ -134,6 +184,7 @@ struct lpi2c_imx_struct {
>  	struct i2c_bus_recovery_info rinfo;
>  	bool			can_use_dma;
>  	struct lpi2c_imx_dma	*dma;
> +	struct i2c_client	*target;
>  };
>=20
>  static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx, @@ -95=
8,9
> +1009,57 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  	return (result < 0) ? result : num;
>  }
>=20
> -static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
> +static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_i=
mx,
> +					   u32 ssr, u32 sier_filter)
> +{
> +	u8 value;
> +	u32 sasr;
> +
> +	/* Arbitration lost */
> +	if (sier_filter & SSR_BEF) {
> +		writel(0, lpi2c_imx->base + LPI2C_SIER);
> +		return IRQ_HANDLED;
> +	}
> +
> +	/* Address detected */
> +	if (sier_filter & SSR_AVF) {
> +		sasr =3D readl(lpi2c_imx->base + LPI2C_SASR);
> +		if (SASR_READ_REQ & sasr) {
> +			/* Read request */
> +			i2c_slave_event(lpi2c_imx->target,
> I2C_SLAVE_READ_REQUESTED, &value);
> +			writel(value, lpi2c_imx->base + LPI2C_STDR);
> +			goto ret;
> +		} else {
> +			/* Write request */
> +			i2c_slave_event(lpi2c_imx->target,
> I2C_SLAVE_WRITE_REQUESTED, &value);
> +		}
> +	}
> +
> +	if (sier_filter & SSR_SDF) {
> +		/* STOP */
> +		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_STOP, &value);
> +	}
> +
> +	if (sier_filter & SSR_TDF) {
> +		/* Target send data */
> +		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_PROCESSED,
> &value);
> +		writel(value, lpi2c_imx->base + LPI2C_STDR);
> +	}
> +
> +	if (sier_filter & SSR_RDF) {
> +		/* Target receive data */
> +		value =3D readl(lpi2c_imx->base + LPI2C_SRDR);
> +		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +	}
> +
> +ret:
> +	/* Clear SSR */
> +	writel(ssr & SSR_CLEAR_BITS, lpi2c_imx->base + LPI2C_SSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct
> +*lpi2c_imx)
>  {
> -	struct lpi2c_imx_struct *lpi2c_imx =3D dev_id;
>  	unsigned int enabled;
>  	unsigned int temp;
>=20
> @@ -980,6 +1079,119 @@ static irqreturn_t lpi2c_imx_isr(int irq, void
> *dev_id)
>  	return IRQ_HANDLED;
>  }
>=20
> +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id) {
> +	struct lpi2c_imx_struct *lpi2c_imx =3D dev_id;
> +	u32 ssr, sier_filter;
> +	unsigned int scr;
> +
> +	if (lpi2c_imx->target) {
> +		scr =3D readl(lpi2c_imx->base + LPI2C_SCR);
> +		ssr =3D readl(lpi2c_imx->base + LPI2C_SSR);
> +		sier_filter =3D ssr & readl(lpi2c_imx->base + LPI2C_SIER);
> +		if ((scr & SCR_SEN) && sier_filter)
> +			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
> +		else
> +			return lpi2c_imx_master_isr(lpi2c_imx);
> +	} else {
> +		return lpi2c_imx_master_isr(lpi2c_imx);
> +	}
> +}
> +
> +static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx) {
> +	int temp;
> +
> +	/* reset target module */
> +	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
> +	writel(0, lpi2c_imx->base + LPI2C_SCR);
> +
> +	/* Set target addr */
> +	writel((lpi2c_imx->target->addr << 1), lpi2c_imx->base + LPI2C_SAMR);
> +
> +	writel(SCFGR1_RXSTALL | SCFGR1_TXDSTALL, lpi2c_imx->base +
> +LPI2C_SCFGR1);
> +
> +	/*
> +	 * set SCFGR2: FILTSDA, FILTSCL and CLKHOLD
> +	 *
> +	 * FILTSCL/FILTSDA can eliminate signal skew. It should generally be
> +	 * set to the same value and should be set >=3D 50ns.
> +	 *
> +	 * CLKHOLD is only used when clock stretching is enabled, but it will
> +	 * extend the clock stretching to ensure there is an additional delay
> +	 * between the target driving SDA and the target releasing the SCL pin.
> +	 *
> +	 * CLKHOLD setting is crucial for lpi2c target. When master read data
> +	 * from target, if there is a delay caused by cpu idle, excessive load,
> +	 * or other delays between two bytes in one message transmission. so it
> +	 * will cause a short interval time between the driving SDA signal and
> +	 * releasing SCL signal. Lpi2c master will mistakenly think it is a sto=
p
> +	 * signal resulting in an arbitration failure. This issue can be avoide=
d
> +	 * by setting CLKHOLD.
> +	 *
> +	 * In order to ensure lpi2c function normally when the lpi2c speed is a=
s
> +	 * low as 100kHz, CLKHOLD should be set 3 and it is also compatible wit=
h
> +	 * higher clock frequency like 400kHz and 1MHz.
> +	 */
> +	temp =3D SCFGR2_FILTSDA(2) | SCFGR2_FILTSCL(2) | SCFGR2_CLKHOLD(3);
> +	writel(temp, lpi2c_imx->base + LPI2C_SCFGR2);
> +
> +	/*
> +	 * Enable module:
> +	 * SCR_FILTEN can enable digital filter and output delay counter for LP=
I2C
> +	 * target mode. So SCR_FILTEN need be asserted when enable SDA/SCL
> FILTER
> +	 * and CLKHOLD.
> +	 */
> +	writel(SCR_SEN | SCR_FILTEN, lpi2c_imx->base + LPI2C_SCR);
> +
> +	/* Enable interrupt from i2c module */
> +	writel(SLAVE_INT_FLAG, lpi2c_imx->base + LPI2C_SIER); }
> +
> +static int lpi2c_imx_reg_target(struct i2c_client *client) {
> +	struct lpi2c_imx_struct *lpi2c_imx =3D i2c_get_adapdata(client->adapter=
);
> +	int ret;
> +
> +	if (lpi2c_imx->target)
> +		return -EBUSY;
> +
> +	lpi2c_imx->target =3D client;
> +
> +	ret =3D pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
> +	if (ret < 0) {
> +		dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c controller");
> +		return ret;
> +	}
> +
> +	lpi2c_imx_target_init(lpi2c_imx);
> +
> +	return 0;
> +}
> +
> +static int lpi2c_imx_unreg_target(struct i2c_client *client) {
> +	struct lpi2c_imx_struct *lpi2c_imx =3D i2c_get_adapdata(client->adapter=
);
> +	int ret;
> +
> +	if (!lpi2c_imx->target)
> +		return -EINVAL;
> +
> +	/* Reset target address. */
> +	writel(0, lpi2c_imx->base + LPI2C_SAMR);
> +
> +	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
> +	writel(0, lpi2c_imx->base + LPI2C_SCR);
> +
> +	lpi2c_imx->target =3D NULL;
> +
> +	ret =3D pm_runtime_put_sync(lpi2c_imx->adapter.dev.parent);
> +	if (ret < 0)
> +		dev_err(&lpi2c_imx->adapter.dev, "failed to suspend i2c controller");
> +
> +	return ret;
> +}
> +
>  static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_i=
mx,
>  				  struct platform_device *pdev)
>  {
> @@ -1055,6 +1267,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter
> *adapter)  static const struct i2c_algorithm lpi2c_imx_algo =3D {
>  	.master_xfer	=3D lpi2c_imx_xfer,
>  	.functionality	=3D lpi2c_imx_func,
> +	.reg_slave	=3D lpi2c_imx_reg_target,
> +	.unreg_slave	=3D lpi2c_imx_unreg_target,
>  };
>=20
>  static const struct of_device_id lpi2c_imx_of_match[] =3D { @@ -1205,9
> +1419,39 @@ static int __maybe_unused lpi2c_runtime_resume(struct device
> *dev)
>  	return 0;
>  }
>=20
> +static int lpi2c_suspend_noirq(struct device *dev) {
> +	int ret;
> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int lpi2c_resume_noirq(struct device *dev) {
> +	struct lpi2c_imx_struct *lpi2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If i2c module powered down in system suspend, register
> +	 * value will lose. So reinit target when system resume.
> +	 */
> +	if (lpi2c_imx->target)
> +		lpi2c_imx_target_init(lpi2c_imx);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops lpi2c_pm_ops =3D {
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				      pm_runtime_force_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
> +				      lpi2c_resume_noirq)
>  	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
>  			   lpi2c_runtime_resume, NULL)
>  };
> --
> 2.34.1


