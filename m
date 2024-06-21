Return-Path: <linux-i2c+bounces-4200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D0912515
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178151C216E4
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C2F152166;
	Fri, 21 Jun 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K4OPmJwt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2062.outbound.protection.outlook.com [40.107.114.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6767014F9EF;
	Fri, 21 Jun 2024 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972662; cv=fail; b=MVPHWhE5HEYgNs6H+rXKi72H1JccNWP8n9syaTrvGz8JD+5vnAu+Wza92cH6oCtVkuBLfacj+9TCaRZ1Y+hlYzkuZGfgnccRzuSFhIxY6SVFDuQYRBqGpZSi+i3Z3I/aDNaFBH2X4x3aMm0cVFZ9ons0Xq8YiIgsNuLtQyos30s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972662; c=relaxed/simple;
	bh=REBbVNdrzdvldTEyKBwWWdH3M2jbmw9y3e7aJ4m2nMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=teZSfd2E7P3MWyIxw2iP6/9q5zzQZa9bhhd8a9jzOqWXpBs00ofx921JysJKRivMEbJbPcqFgSf+5bKzdGnCTCDedB37EHKuDZAt4iro5QC2RXz0OPKKQ+AsMiVQIgnilO79n7n82qojGtgLdXpWmsbqPqCPe7DqJr2GSQp9RKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K4OPmJwt; arc=fail smtp.client-ip=40.107.114.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU7p/bo45EPgRn9GaO71q2ro/as+tZjBhCHiwjzH+xIm1Xdfce1wjeqPbgU5MzZzdTWk7+dsNJwvf7s+PZAhUplLi1wNY6/8XOPkS0unZjBInXzYalH+m/nE/QWppYzSXUy1G8AqvxrSYoXbXyyWThPF4K7Hdq2n8vmqpKoVSkj194KGD4ZrDGB5KtjCPTqrVhF+i2mzKScdLugn1B0Z38jgACo2tmcejZbExAChZtuKAxudzlerrrUEmrBYFZeVCjiqCZp2lhuhq2QT5px/vhfeZyUzCzf4veENgU+yHbYjYtfq++8Mug/pjpCntuINqr2FeCB5N/uGZvjMr2GfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np1h4nA/PSSNZjccWY1PdAbJ1xlCAshtd86YALxcor4=;
 b=cjue6jahCu/cdl/qPBdgx8Q+UELU55a1tx1FNlazzJb/3+Sx5Y1edHJd+MEBwbuALsSIcGpCo9OYuiAC6aFpy9ras8dh5JIEInkRIdRuynJSyBKF0IBbxPgFe7oNbnrx7x2Z9rSCMIkP6fGzpMEq5/i9RmHk8EiZEwsPiSPaQQVDque+2IioURhhY0BUheKpiOBimU9Hot5XWsUHEyYREqzeoOMgeSII7NMlqqPz3DZiJoy9A7xVvBGrakO/4AQ/MfF+N/1vNBJRH5OBtVJJUwm6ZpBNBknZ9+pr3CcTbnYAYjO95dbpdjG/CMsH9NMK5hCwVzXMvlSMmDj0z8QqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np1h4nA/PSSNZjccWY1PdAbJ1xlCAshtd86YALxcor4=;
 b=K4OPmJwt0jVw0hLg8oJM3oVNHemPlhIe1DY+LdzX3rMaBVDc9lv2fhhmTfJpkUvcjSVd2qys16Xsc7ckkG+ZplcSR5Lck8T3tQOMWtcSgMFi1TRpyUz4CdwwPeAoQOu1r9Njg4LqfuiROzUQ3ztWB+euXjq2pa6/anNpvTY3Nt0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6545.jpnprd01.prod.outlook.com (2603:1096:604:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 12:24:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 12:24:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Topic: [PATCH 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Index: AQHaw82dsK1KJ2FIsESc1p9TGoJ/ebHSIphg
Date: Fri, 21 Jun 2024 12:24:15 +0000
Message-ID:
 <TY3PR01MB1134618ADDB552893DB00C58E86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240621112303.1607621-5-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6545:EE_
x-ms-office365-filtering-correlation-id: bfa31958-a415-4ad9-c678-08dc91ed10a1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|366013|7416011|1800799021|38070700015|921017;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BvZxb98meijHTm2SEcG8dwXCRWqlFohq5578nx7uRWXoKYOlz984dSYAZNKR?=
 =?us-ascii?Q?kSr3DqL9qLprsxdGGgk2fLbnVPxQA8nI+NrlXx+vEcDXQ7G/3bvYSMvzHCwd?=
 =?us-ascii?Q?/UPBir0tWqpanhn6OoNzq/ipeVb+AgaKvHQkfO5B0FFDFmvic3NwOeKfQDix?=
 =?us-ascii?Q?cydsyO1Z+kNOs9RdypXk2QQPvcAPCE2bWcxaUem6SEMfRUp2t900FNDBkHqz?=
 =?us-ascii?Q?o2GYJBy+lbS5byUWv6ngMPDyhL/xZkW2peqeJ+9REi/3IZS4mPkrblKA6ajo?=
 =?us-ascii?Q?s5/VJr4GD6YXlFkviFGRzzKTfQmLgPtv03BjiYVSHSDr36ZLSDeC/PkKQkMR?=
 =?us-ascii?Q?XnqwyzDGnJiELd8soTo8tSMXqb3KvJp7FkxkOmazq6uWXz4DskamURbJJSlz?=
 =?us-ascii?Q?Gi4z70JkOE+z4O88aqWzALXF2PtV62MyhfwabSQA7wNO+IoDPdiDrLuf63IZ?=
 =?us-ascii?Q?LV8CNapPMk/N80pnA7mAJ+KE+mWf9ci5xMTs/SfbLEW/wbNU0QYEzG7BqL1j?=
 =?us-ascii?Q?6HxbwxnhZhprgndfPUeiHyk0Gvw3rGIc16Jt0RtISiBEmL/TGCeRjMR063St?=
 =?us-ascii?Q?5ePWNsWG0HEo8CpXm8bZkzQNdLdJqVTYEPsn+Eum919ZD5s2G/uAmpstf1+f?=
 =?us-ascii?Q?0c823OFoOlfWX4f9FEGoVeqLXG09zZiOcYRRhVZZyzL2enfdtqcfCIoWnJta?=
 =?us-ascii?Q?Mk3qYg8DOnHujFy5NXjUNRTlOwqKGV6HViO54dTY118Vdo3lqWzTleC0C7RN?=
 =?us-ascii?Q?1Je2fkonJT2aZm7FWMGfwIfDHXMuWaSCk4ISnvFS2L0vQnUVi0x2ei7VcZrk?=
 =?us-ascii?Q?IsVInKCnjhkmI9f6oZegOumIwpJaqWDhY91YXBe+BMYcIVUWXQ4P6t9NmEbM?=
 =?us-ascii?Q?HdIb0LwiIzueb6j1wbfWS+u+rF/itoTKtyHS23vrrO8ibekhMiFtz1Rug/PK?=
 =?us-ascii?Q?EINZkkliJ15DLJhNB+MfWYdT4oZamNEMBFBTdOrHD89oErs+je51p9g7s6+9?=
 =?us-ascii?Q?/twzKJwEZPR60xeWyZmLv91NRypSbrHPt0GXlStL2hT6kmPKErtcmxJkWi8d?=
 =?us-ascii?Q?8xYQ9KSj6IqiksrQMGeNr/aI0Oq9unacroD3eEpmGHEL8ccJovoIllrsHLz2?=
 =?us-ascii?Q?K1d0/23YfPRFo1zLsgjh2jjR0VVRictIb0X5DKqXW2aRVuLsKyehUWMM0AiH?=
 =?us-ascii?Q?L/kCD8MxeK5QD7iAnEvmkBO+Ewtrr7RkZHrlw3iMHERbGkfzyzp9oykAMCJq?=
 =?us-ascii?Q?M2Z5GC/WKFFLAXRS9DDbVXbUy8JqqjcOaeXwZMxdTWKSA3JbPKL9BtRMB2gm?=
 =?us-ascii?Q?TBCyHjjRBUeuj9kp5W6kN8nm3tasKBNfXiUoOlLMYjEFrg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(7416011)(1800799021)(38070700015)(921017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?srz8slnnAxtavzoIYUjLVz03NrGXBFkbvS8r1w9gjOsRNuOCTtSJkcuCsGix?=
 =?us-ascii?Q?nNzzHxoxT87tqoh2LBoXD50O8Xvfy4pNltUKgaX/oNYaSvKFGSvUVzPDOmvS?=
 =?us-ascii?Q?WqIynI2Awwi6mLyUs+oCT7wrLex/Z3BdDl68jaTwa8H57+pYxmceVDXLKYg3?=
 =?us-ascii?Q?hr54XB23RHh8DKqKPxeEo6mE9sj2dCdIkr+BP3FNduJ06F0yji2dE6AltLxA?=
 =?us-ascii?Q?PhdXNnMeWkoVlW/m5gs6/1ktgPWvzLbSBEmLFws7I+57czQa0/8qCxWuaUge?=
 =?us-ascii?Q?pqEbIP18vobI8t5Gv9B1vneoDUA1PFoZaD7Ukpaa9wT+FZgAJlzID5j38FfO?=
 =?us-ascii?Q?Gil23sL9cRpEosOP06Im4okoRb7sHp4Obiblk22VyGqzYfTlan4NJb5eLZWe?=
 =?us-ascii?Q?jrs4gYC+tYDhtgi/0+deXHsZOQtz/fXTV5v3Kkf+/5ieBsUZ7vdY9Au5LGef?=
 =?us-ascii?Q?1sF++qD8HVqTkNuLWA3f4Wz9lI8WsDUrBEJNYz/p8bCc4bn7+0haurSJoqCj?=
 =?us-ascii?Q?0xhPxA5JXgntFdJM7k4n3pK+KkoJ/pejh5ojrZHyfKX3q+FUTXW/HFgqN0af?=
 =?us-ascii?Q?MANCqC9EbU/e1i3lmxnKsh6Do+YTap8RFSp3W9jeosyyqVypVnXL2iUXzgIj?=
 =?us-ascii?Q?ofnmj8VzEW3EDhI3r2uccPDhseYv729voq15xz8vV1I+m2nKZW11K8g1Jiuf?=
 =?us-ascii?Q?BbUNOXolZPz7HEzC3ynjyRvQnzbjfIkdgymVJb369/BEb7YCZQcIt2Z4XZWK?=
 =?us-ascii?Q?cEpTthJncWkFeY38XSUshhoegfaFi85m+VemVnL+oS3rZLnqnpT6xlmnBV17?=
 =?us-ascii?Q?d59mRumnbIaoj0Nx+W9FJAG160Nx6U81G6Gf3XtX1DOrQ+iMbPrVOQUX2RFX?=
 =?us-ascii?Q?5cmD2/F1lUF+ZA8LxMYweL7hHtpk9/qsEVPCpem1X6wMEVEx/fqBZ0DhO5EI?=
 =?us-ascii?Q?9zymWcjg4vRTFOqeFZduYksGAzegPV8yX1xe6ASoIXBfV9vTwbKYYpr9c68c?=
 =?us-ascii?Q?QitCOiT0v6ckaU+ci2PQ0fES6YBKxDvGp5CkOOplbu/+6kFgPtOAgmX+gBiq?=
 =?us-ascii?Q?oIqMMTKG85YyE084slgvJ2PNFQRjFGNpfiPIam0ka/Eo6PUmXhm5yoslDVe/?=
 =?us-ascii?Q?m/Xv41cSHzVbty7N/gw7OTjXPdkJGg3asETBDtnnPNJge8zzzbz0J22VPz/u?=
 =?us-ascii?Q?u+TLlOCNReLNiwiFp+IvUY7kGxTK39fr6KKSRd37Gf1TzIg9Fy5jjPUddoSB?=
 =?us-ascii?Q?1fMtA/NGrXUJ648q4+z5arBIKLSmL8dSF9erG5j2kH63uU+xkMpcuzvpb/nG?=
 =?us-ascii?Q?5AUqBuPi62XMkhKdgVEYw4j5GU7JYZrp3veUxXeYpvoHq82t8uiRday2OEr2?=
 =?us-ascii?Q?1dZ3ldMZfetLvs7M26pFicI0f2PfT//4yw+wWE/9oAtUpYDWvGJ+i15yoaT8?=
 =?us-ascii?Q?2izPh2V0ekK68lfYFjkXqwhUVZ85RjX5OMWaPsy++zNeEdQ9GX3qBgyb/klu?=
 =?us-ascii?Q?fPQir6OuFV93p0wSB4Ab/aywh1MzFAeRxqsTvHJbCaPc8X9bRbhamPKivmmH?=
 =?us-ascii?Q?w8gcAgmZZGmktzMZTxibJ+1coNzaEsHC47NCPfjgX0RDnlG24O/n943eAsDl?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa31958-a415-4ad9-c678-08dc91ed10a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 12:24:15.2012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRU37izxAGf8Jx8CbvL3SormK+Krd4rs3V31VhaeJ3pMDhUEugalwtRGUkQdUPtJNW2k+R7y8i/+4doEN3Mk5hxzmBKLF6HJzkSx3LOmvIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6545

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Friday, June 21, 2024 12:23 PM
> Subject: [PATCH 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> pm_runtime_get_sync() may return with error. In case it returns with erro=
r
> dev->power.usage_count needs to be decremented.
> dev->pm_runtime_resume_and_get()
> takes care of this. Thus use it.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 83e4d5e14ab6..6b739483ef37 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>  	char *name;
>  };
>=20
> +static const char * const riic_rpm_err_msg =3D "Failed to runtime
> +resume";
> +
>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)=
  {
>  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10 +135,14 =
@@ static int
> riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	struct riic_dev *riic =3D i2c_get_adapdata(adap);
>  	struct device *dev =3D adap->dev.parent;
>  	unsigned long time_left;
> -	int i;
> +	int i, ret;
>  	u8 start_bit;
>=20
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +		return ret;
> +	}
>=20
>  	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
>  		riic->err =3D -EBUSY;
> @@ -301,6 +307,7 @@ static const struct i2c_algorithm riic_algo =3D {
>=20
>  static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)  {
> +	int ret;
>  	unsigned long rate;
>  	int total_ticks, cks, brl, brh;
>  	struct device *dev =3D riic->adapter.dev.parent; @@ -379,7 +386,11 @@ s=
tatic int
> riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  		 t->scl_fall_ns / (1000000000 / rate),
>  		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
>=20
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +		return ret;
> +	}
>=20
>  	/* Changing the order of accessing IICRST and ICE may break things! */
>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1); @@ -498,8 +50=
9,14 @@ static void
> riic_i2c_remove(struct platform_device *pdev)  {
>  	struct riic_dev *riic =3D platform_get_drvdata(pdev);
>  	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +		return;
> +	}

This change will lead to resource leak. Maybe if there is error
skip accessing the register. Or restore previous code,
just ignore condition in remove.

There are other place in i2c core driver where this call can fail.
You could fix as well.
https://elixir.bootlin.com/linux/v6.10-rc4/source/drivers/i2c/i2c-core-base=
.c#L509

Cheers,
Biju

>=20
> -	pm_runtime_get_sync(dev);
>  	riic_writeb(riic, 0, RIIC_ICIER);
>  	pm_runtime_put(dev);
>  	i2c_del_adapter(&riic->adapter);
> --
> 2.39.2
>=20


