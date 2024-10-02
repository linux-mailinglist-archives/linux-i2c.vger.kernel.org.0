Return-Path: <linux-i2c+bounces-7171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06E98D027
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B03C1F22167
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F7019AD5C;
	Wed,  2 Oct 2024 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="no3Tc1cQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2117.outbound.protection.outlook.com [40.107.244.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8944714F9F1;
	Wed,  2 Oct 2024 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861467; cv=fail; b=JsNfyYH5PodNDhsoFZMDy0FOcYra6kHUPgjRAlGng5es4JhQcNlSWSF/ck5cO4/Hs0ewB+cgFmhms0dZ5UB39HIbqY+jjH22yRtBht0D/D4k+wJbU5XJbUvbDX0RVWkdo4jyneNsw564UOKCUn8YP2AtOe1Xxd6ZR9c+plKGj9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861467; c=relaxed/simple;
	bh=rbD2YCks0BYQ6/VPNERGW8k2bUbzl9tYIVc3K5z6Fk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KDLdfnYj+0vXkXJ/dUS3NE8dR1Ho0qQ/a7ZCyPdb2IPCm+DgWlHalDvETc+Oa6MzScFN2BXprj6kPFdMmhrQNhjpq4UCk8vsqlo3qDzncCsfTdjj2nA7WYtduGUYdbx04Ev0LwdBpW41QCLH28v2Zqo6Jlz7Q6WGHa0NY8VHhxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=no3Tc1cQ; arc=fail smtp.client-ip=40.107.244.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0xbXXbXvz1AGxQfintqlyPUXiIBjRbOQ0ZIcaHv8DfOaBtITzWP20iCcbRB+YhFotTbZam4ySVnFAQrwdjUokXA6NDjnIuAu02ODy1t6Ayo2LDfh1ns6u1ufUe46c4AWyOwL7As1rgVI2wUq9Vnz4jt27RE2W2niIHMx1RE6bkrzNhHUz/UC4CWoem4v2+jFdY8wUcf8Nuno0GVoMHLvxSVXlKP19JuINrNKQXW55qeXzs01/hi3fVwlsMCO8DT8AruLiqUxF1Rk/XHjhIyhai2LexIpzl8OHgd9HWSIRTVTM2geeHUCdzkzNKndIxclL9QDkF0JCVObYhLknftpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y75+lS4/X34HFe9V/NdRX57oGJLzxsCLn2dP3LZgELo=;
 b=rP1uM10nzjsEoKD/xONC67K4t8epp/m9DA9yxizrcd9dhV520wQpHPcvotURGt1E6WjIKSoP/T5NVMWe4IaLr+JBJKwEzOIv+hRj1W5gNMr7Aonk6dskyAklb1TiXTir3/HU/nmZWyl1A/SAKkOuuhZuxuOoKSA+qzwFIatzRsuBSU8E6PzD2E+8BNp9RKJfHgXHmQZNloXiHiH9UmxN0/HJDzO9qbq470mGRul9yN8dP/qANF+xG8Yao+SJMaN1ZYc1dZ5yLeO8B4Iy2f/vt9o7A8mTWU0TW3bCRhARHuPjmBgzMWZlPzr2a0tC/fz1iKdf3NXLUVwAu3h5nKWC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y75+lS4/X34HFe9V/NdRX57oGJLzxsCLn2dP3LZgELo=;
 b=no3Tc1cQ75EPU7PYP7wtgWCBEb178X6G1n9CgriJVbHgD/k0CcrcehUcKrCuLVOiABazuooOO1CG1IgQy7HDfya9zYsy1UEMkYDC6haf4eoqK4BLSDOE5eHBNNOSURb+u2U+Ei0djNwDRQSgAOfrEFu+mrjQcDb6GaYxymBjQiY=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by CH2PR14MB3722.namprd14.prod.outlook.com (2603:10b6:610:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 09:31:01 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 09:31:00 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, morgan chang
	<morgan.chang@kneron.us>, "mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
Subject: RE: [PATCH v3 2/2] i2c: dwsignware: determine HS tHIGH and tLOW based
 on HW parameters
Thread-Topic: [PATCH v3 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Thread-Index: AQHbE9w0Sra2RyfSFke7Tnu31GzDM7Jx3DIAgAFVAAA=
Date: Wed, 2 Oct 2024 09:31:00 +0000
Message-ID:
 <IA1PR14MB62241CADFE580EC861C591F58A702@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-3-michael.wu@kneron.us>
 <Zvvyii7aViGCklcT@smile.fi.intel.com>
In-Reply-To: <Zvvyii7aViGCklcT@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|CH2PR14MB3722:EE_
x-ms-office365-filtering-correlation-id: 0e94affa-5744-4216-cc87-08dce2c4edb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZrcAmyvbcNZ6aeVLgpsPSn9unh/yQreRVcCLQhbSJyuNg5IhQ34TGBrb27Vm?=
 =?us-ascii?Q?jD7uui25a8S5b/1cKsu/tBc0L7H+VqUVa8+XuHe1RE/Afeh+2RNggg49Sz9b?=
 =?us-ascii?Q?4QbWQ2C1Hb/3ifvNDunSgoJooNP8WPgpR2ootmCaCpGjuJMykAgIY5tJGsER?=
 =?us-ascii?Q?pPuEh05svk6kaWY6VlEazDVAgavHx2Any5EEJxIUT4UGLb6MHn5+c265Ljvt?=
 =?us-ascii?Q?XPfmv3B3sueQkNC9AR1Dnjc7Ieowqn7xqNEkQMl3Y2Q60eXYBVRs3Rpi89Mc?=
 =?us-ascii?Q?KwB2mKk0HoLLjSRZnlGnFdGle5h80OTKCrxMgsruGba8V/zfRuogw9/DqUAt?=
 =?us-ascii?Q?ymB341kTwDf0mnjRbSt7Spa4DzD6nlfmumebEKpd8MpiiTMmE4OCFqQSepwu?=
 =?us-ascii?Q?rJY+xxgm+geYvwTQzVY606o/sp0LHOdrvo4X/GeeSX6Gj79mTeau4PUa9Tac?=
 =?us-ascii?Q?4GLDUFuax0iYHtjx7c/joc2NghZVvzRctb3x5EJM99G0DV3OyeqyRsNv15iO?=
 =?us-ascii?Q?kFo0/Rp7j6txCARuG9kNaApFC1HxZcTiN+0vSrkZC/4m2DtkFp5JyPuGyNnr?=
 =?us-ascii?Q?vzd6tkm+xlkPX4GFteSAtRQRzo3xGqaSU8aAWGmr3fK2bBsJ091y9ONSibx2?=
 =?us-ascii?Q?u9RkF1cVBOQ+/BTRGOuP0+jBo5VA223XoH7gNoGYABt1wS5+5tRNPgNLZO+W?=
 =?us-ascii?Q?s9Thxt1h05WvWEGlqRBtX4ghqPRLBd96u0SOmdxrMGZFkSpe2ZlOR1h3vx3C?=
 =?us-ascii?Q?YgLhkqyOWausDO9fda53bxNTKHTIkZiwRA9SjP6sXZCbMrJ9x3Eu2pKr7epG?=
 =?us-ascii?Q?OM8qARK7oXt+l5tVoDQP3L/Oc4qVbVnm9fVJZCoGRc17A/qBHpu/HZRib0IV?=
 =?us-ascii?Q?VCliJsuCf4dI1vxEmAFHLCr8GhqYz7RNI9lCATi6BN1TdanqIooqNPrntfbO?=
 =?us-ascii?Q?zFjzxVYBgSJDxffY0bQDp9xvWdkexndHATBJbbpN41a98q6gvmR6w/XdqEeO?=
 =?us-ascii?Q?+9Bm1yE0nnNOdjEdCXacSwP60qB7hPD2AgvtuUDyB0bdpdf+RTghFsWL9lgx?=
 =?us-ascii?Q?l9ZWjtFTwalKVzFbkNKnULZaC3zL7nQrLK8mH4cX9r/pDSgXYz3+SCaDoXKY?=
 =?us-ascii?Q?kKFzzVaV3wom4H6pSADW4NDE4KU1P4ibdE5L53fAIzjKOjLaQxX18pDITvwD?=
 =?us-ascii?Q?MF8UiDKAQ5QSZShz7bYlTVqBLsz52/xfHaXcySyAkZAH+cMrqofq59cQM8Db?=
 =?us-ascii?Q?Sj27UrwObE3ZluAvDS49+QRMcNVTAkVD+sflg6jW6POxJ4aAtFAVzERg6EDX?=
 =?us-ascii?Q?RPvFPBNTGoJmKSZZMa/CSkc4aWmvda6hdPkLlQaPLoaiQOOi1+59+qeteReH?=
 =?us-ascii?Q?mg1y0Qw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kNzvvJQJrO2RQB+XDwb/GJdlTbWoehipIUYhvwhzBvMc9SqCJGeZ9hbkaMjX?=
 =?us-ascii?Q?IZZEGUtPHCx8zE+EexEXu+t+koL09ulzXzixhMhVpj4JexeF1Z//KJx9Z1A9?=
 =?us-ascii?Q?Srlbq1IaLkW5lAEGZV0vxYCwW7vZz8Mf4fbFXLivZn9PBQ+jeKvQzloZM9gb?=
 =?us-ascii?Q?PIxoBeAYXSLLMqN4rwKI/Uh/8as3Neh1HlU+6CHagQu0KulJZZ/NI4Kyrogz?=
 =?us-ascii?Q?Rz4LtkTuysJuq6Bo43x1BUQ6Km7vWjoKeLJXok043tGim3NaC/dsAtD3GiPE?=
 =?us-ascii?Q?5XzoEG32be7Fc/fOKmOmwQpWWlQxsOeaeDkwCq+H9nFGo0VYg3kBQogdKKzi?=
 =?us-ascii?Q?tMPN/M/4DwYD/ox77IJ05FdOZdyVNWZjY6uufTP4Ttb4FYQ6UMGrxwL4R3Q3?=
 =?us-ascii?Q?wUzZ8RRX0UyhTWtI+bJlNLKXokc0gLeaTTsF0h0lUVdztn/dwajU3iuvrKgd?=
 =?us-ascii?Q?LgIVfdSQJAkG+UUsTEtxMhWwndiRMf8oMx76JfODgKrgr2ubAkoHd5Z8NLVl?=
 =?us-ascii?Q?/QlhRtpKhCctXsvuZCCEHsXiSumzcZZdfOQuIQ0MlAHulnwjbcsOlsRG5U+C?=
 =?us-ascii?Q?Ph6vCWGqm+cv34seWFRB03eMdfTADf6DChyqlnygUe76NPT274PNTV2dVPnc?=
 =?us-ascii?Q?uLMGgJ3Wzz2BUTEzKRsOsRvoHK5RPePPl7jViIDvkU9flrk7gsJZBN52LO9Y?=
 =?us-ascii?Q?JJX8PLHzV1AUdZqdsaS6qvbcn+fxdHvgt+Xz7qENph3SGxQU3+IyLXBSyDwa?=
 =?us-ascii?Q?TeDLVDpqzKT9+HRgMhZa+o/stjk9lB+hAZY2flONHsr3UKYBXnHH34Jt4yDs?=
 =?us-ascii?Q?ClQ5euCGDMGMpiEc4bj2kituv0Rr7wRqnw8iR+rzC9MO1mcdwhquKF33lQpv?=
 =?us-ascii?Q?ztzjUXoNEQGMFXH1c/rEgyxi3gnXHY/cP2e2dnOpIdu1GuHB3MkygQcr4Zo0?=
 =?us-ascii?Q?z8+1yTv4rJ28V8FK2Ml+y4x+0n2PcybpmhtGY99wiTL7M7muF4disASvLRbk?=
 =?us-ascii?Q?s+HcesLziVqSqBSfmkTnt79IP3dkJPOOdOZUdtaY21YK/vl8akL4sFsXN3C2?=
 =?us-ascii?Q?r5t/sgcSA/tSPbkv+yDx3bLKlFT1EjlJ2LzJ4KWBL1ZXMM6ram5ejuFEGAb0?=
 =?us-ascii?Q?+ALiiVsfjYqMZbtfaIH4EBtaiT2sEeh42CLt8PUu0N/6pQ3ta6VBuz10EZzk?=
 =?us-ascii?Q?EJm1JCWt3DPcqISm1VBswmFErCkXh9vaB4zcsQ5F+xhSK8gsSXLHNHyj8SdU?=
 =?us-ascii?Q?R4b+/D6eyCvrLJk8mUCsW30sFf3+sOD/P15svsXGBemaJBbiWuwy/sFpbeNT?=
 =?us-ascii?Q?XjjcmtbUBKi2rU8BnxGwv6Z0MbWlzNOqL3NcLMjU1N/Sl5bob2gJzuBBnCEQ?=
 =?us-ascii?Q?QwfpTO5zRzvO9nT7jkEdeIyDSCXmi+9D9/2KOnGpZZZ0Wxpp1LQr84gejOof?=
 =?us-ascii?Q?y2hyALYnwkUGLG+6ndtwYtNOATMCzPgT7mbtcH1mGvIPRtGtfLCoXkymYyDE?=
 =?us-ascii?Q?ytNhjGDFSXn/E6n1n+mzWvpO6g/Raaq45A7ezbm1Ha71xkbHc9w1hR5M3h6y?=
 =?us-ascii?Q?9fU7ggpdxzhsTxQqJkc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e94affa-5744-4216-cc87-08dce2c4edb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 09:31:00.9055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDPi2XWwtzh6gZXgo36BtxxNxGdkeqrF86C7YJoRbaBsEt2WrJV+WtQNK0Ixf1bFnzb0DIHeWGwgtDIewOYf1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR14MB3722

Hi,

> On Tue, Oct 01, 2024 at 04:29:34PM +0800, Michael Wu wrote:
> > In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing paramete=
r
> > for High Speed Mode") hs_hcnt and hs_lcnt are calculated based on fixed
> > tHIGH =3D 160 and tLOW =3D 120. However, the set of these fixed values =
only
> > applies to the combination of hardware parameters IC_CAP_LOADING =3D
> 400pF
> > and IC_CLK_FREQ_OPTIMIZATION =3D 1. Outside of this combination, if the=
se
> > fixed tHIGH =3D 160 and tLOW =3D 120 are still used, the calculated hs_=
hcnt
> > and hs_lcnt may not be small enough, making it impossible for the SCL
> > frequency to reach 3.4 MHz.
> >
> > Section 3.15.4.5 in DesignWare DW_apb_i2b Databook v2.03 says that when
> > IC_CLK_FREQ_OPTIMIZATION =3D 0,
> >
> >     MIN_SCL_HIGHtime =3D 60 ns for 3.4 Mbps, bus loading =3D 100pF
> > 		     =3D 120 ns for 3.4 Mbps, bus loading =3D 400pF
> >     MIN_SCL_LOWtime =3D 160 ns for 3.4 Mbps, bus loading =3D 100pF
> > 		    =3D 320 ns for 3.4 Mbps, bus loading =3D 400pF
> >
> > and section 3.15.4.6 says that when IC_CLK_FREQ_OPTIMIZATION =3D 1,
> >
> >     MIN_SCL_HIGHtime =3D 60 ns for 3.4 Mbps, bus loading =3D 100pF
> > 		     =3D 160 ns for 3.4 Mbps, bus loading =3D 400pF
> >     MIN_SCL_LOWtime =3D 120 ns for 3.4 Mbps, bus loading =3D 100pF
> > 		    =3D 320 ns for 3.4 Mbps, bus loading =3D 400pF
> >
> > In order to calculate more accurate hs_hcnt amd hs_lcnt, two hardware
> > parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
> > considered together.
>=20
> ...
>=20
> > + * @bus_capacitance_pf: bus capacitance in picofarads
>=20
> Since it seems a new version of the series is warranted, and looking into
> the current kernel source (no other users of this unit were observed),
> I think we may do correct capitalisation here for the sake of physics
> and unit system, i.e.
>=20
>  * @bus_capacitance_pF: bus capacitance in picofarads

Are you serious? I have never seen capital letters used to declare a
variable name. Although checkpatch.pl does not consider this as an issue,
is this against everyone's custom or unspoken rules?

Sincerely,
Michael


