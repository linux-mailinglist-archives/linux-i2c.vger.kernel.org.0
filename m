Return-Path: <linux-i2c+bounces-1443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD583A407
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 09:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2594B2800D
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 08:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D3017578;
	Wed, 24 Jan 2024 08:22:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2056.outbound.protection.partner.outlook.cn [139.219.146.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FCE1754C;
	Wed, 24 Jan 2024 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706084550; cv=fail; b=S95Ihwk4N1nJpGv5Kw6gzN22Uup5oXStEMYgE5D6WB1DUqlTMoyCY+mtxaBjk1UDiK5MQ1yexOt3ZLezUeaAd7PNmbXbDkgTK86IAFrthaPIpaN0JYsqLBAuSBV0gvY7bzDN6vDoXZsSuNIOg495CknIuKiUAUNX4npYiz424zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706084550; c=relaxed/simple;
	bh=z339XeB7d4wHjNbjPFoCfYl75Y2xgvOwEruoW2KmNMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jVaop3MDd74AN2y6kSfXmiDAPD5gxuGNqTtVUs1lsntlT0plfswWx4wubsM37MedTealx/GQqic8Y2pDf4nv7VPNiBeuH9YRer2z7+xf/JvsD1Gxr3GJ1ob3CLiU1u9KzxEUEFHPg9CO6ZnOSNLdzZmUTauz/S0R3znWs+NUt6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2RWXLSODPEWB/AFqKPwuDRz5TjdVHZA7GcLtHAV4FbpHyHdwqlx2FyKd6XLO0oYs5unyj4Aw+opkdb6+aYqq8o9QVixbZg4kQ0pM+qIZgxgWRlB8aGRa4m4XQvjUJ69r2l5RKK9fGCQM7gTnrDcyUZcAW7SG0yQxUwXcHf/Blh7aTWDq25PrUTyiMBELZZfiCvvIhAhhGTr4rgKduGRFV+s9GzexhNhMyXVbL/kzoGcxw5+vYflXkLlASCqorquvvxtMk8CUCJ9lgYCueMSsHgASDeQJVkCSo617xKH3fdNhLLYB0Poa49o7pEC80+oobd0+4OwLmz2D4xtrj0CSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr1uqutgTLTCfSjl1082550ka1bGYOA9dViNN2c43pk=;
 b=h5dzi/7R+71IAsmB05nKia5djqlJmpRhbW5lu87XxE37ml7xtuGesQ0HHjSo2OQhITyqakBTU+U7Vird9PpLhLdpfBRIe+5OZcdu7KXFHtP/JhQ3mLKsF8Z3l8TptctfWsDxtJ9kRccj5yRheYTIlNco2rq0m3KG8yw8nEIvqlQwfdVEgbrivYxsLv4QHRHaPU2mFglMue4Z32/YlVNbUi0GpsQ/Mtu8MtUnc8TyokrkfZgotYzuAxHGleZrWdFb13qY7E6C/l78bbFZDOCGm07gXW/sH+G7b3rqiEOtxZGSTsLV7KaEM/Q6Tz+4V4VpbmKE4yknXD9r0QWM4AH68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1142.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 04:46:43 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::1dbb:b090:7d89:4e22]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::1dbb:b090:7d89:4e22%4])
 with mapi id 15.20.7228.022; Wed, 24 Jan 2024 04:46:43 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Thread-Topic: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Thread-Index: AQHaSneNdhHjB60n1E+M74xAv32s77Dkvb6AgAE6hjCAAelHAIAAgvhA
Date: Wed, 24 Jan 2024 04:46:43 +0000
Message-ID:
 <ZQ0PR01MB1160DC63A1CC70F79036057EEB7BA@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
 <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
 <ZQ0PR01MB1160390D00404D24A31A1522EB75A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
 <3w4vaxoderuhwkqec6rwem2wrjlvql2ohyh77zqpwege7ercpl@5ac4p5mw7nhp>
In-Reply-To: <3w4vaxoderuhwkqec6rwem2wrjlvql2ohyh77zqpwege7ercpl@5ac4p5mw7nhp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1142:EE_
x-ms-office365-filtering-correlation-id: e8afa126-99d6-400d-f493-08dc1c9776a7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tn76HVlfiqpK0a3vdRt9M0ISFRW+UxjRKI98oiYIL2wSaOvYHhNlLfD9iw2DvdM9jb5j2jxw1+TDka8Pxrz6p3lEMMzq81SC40AhzFjsHpE0EMk0c2nCXc3T+h9pKoBupenguJXvEVlg+x5qFi87XRVTmB2xIXw4nID6bS9tn0MQw3Ry9IWCz99IYyzfnq8zfzXJ9vpfmbzWm6zhyNguFUyYadx1u2viMzhai1w1KeJUk1QAoD9iCtFXsn/qeV1mZH264Xq3nSHUNzurLOFHnllo30wEhhZNZfUuqCdHkSbQYZOong9vOTvM9WC6JpVq9NSCI1yc9YVghKDpEQ5/uRtT4mHnZMQ3eEeEMmoSU/O7DA5dZqBx9z7YIHgFjlNO6Nux9Hkj60knFKn5fYDPa1sGQpr4V/8PEK/Kkf8hwGER+O5kS+A/JoLYRxDHVtWmuU/Jo8TmtSNPDEk35HpsinenN/PxBMk6NONKYIiKzyBYssdLnSqQK7wNerDICRvGmgPb79OmPU6LZQF8KYvAgEy8so7YlA0VC6DYSNrPaheeqzf3C13x4VGn9WKJb989
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39830400003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(71200400001)(508600001)(122000001)(55016003)(38100700002)(40160700002)(26005)(41320700001)(83380400001)(9686003)(7696005)(6916009)(33656002)(54906003)(5660300002)(64756008)(15650500001)(2906002)(40180700001)(8936002)(4326008)(8676002)(66476007)(38070700009)(66446008)(86362001)(66556008)(76116006)(66946007)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jsMWq/0e7XrxcvrzAJeCso8SEd0sMUTtARNDcxua+9dDbBSZZibXWHiXdzso?=
 =?us-ascii?Q?I2PgE4Dib70NHCUGgv9/fXvNhyGI1f40P8JJBed/ozxSmW4f2WxP3hNQmmNO?=
 =?us-ascii?Q?9GIcOxm+vE30/d08zXQTn0EEBYwoSVh13w7aQzJvENXVvUuyujIlOe+PHnfs?=
 =?us-ascii?Q?p/8f4nri58XRV+3OK46lUHF80WkYRD+a3G4pi7bjSOK11/hXdIgHwRZ/VBlP?=
 =?us-ascii?Q?IVDP95o+jryoAG8ePNpIrIMl5eHPpWHdLQYtDFi5PGPNjKClZ3QJniqVRmY8?=
 =?us-ascii?Q?IhojlIfAIaOzf8ZUqa7B/Yrb/osmhZkw0OT7nMSoFD+J1mNjIgSLOdDtkVst?=
 =?us-ascii?Q?7mY0BtW3u7dykvolOeFzUyWvVGC0/DLDB2cAjnIhW2r+a6Lk67xdoqFWSnz/?=
 =?us-ascii?Q?5lQoETHg5Q2c+/Es53SvIPmg/yCwEqaEicS7fQuMP9pUJr/LFxzGkQ8m7/9i?=
 =?us-ascii?Q?VCTmQLewcHcd7dPOsGlzZy6CDx0EN6q+CvphTMgEk+mgbMrdiqQQC+WNNPVO?=
 =?us-ascii?Q?uCTZNi/i1bMKhraUJa2E0BZUqP/Z8KBxbugShEyaehca66O1rvdWG1BVC3Wq?=
 =?us-ascii?Q?JlNzX1WWZzr3uGSkFMgy4u3kI9sVougVDs47GW2IwI3fj5AUIJPcgs+qoa6b?=
 =?us-ascii?Q?Kucho/lwIfUw1W64mZpoLCxpVGRR/KgYoFRus4/Xk3S0Rr2dHISRqicEq5RZ?=
 =?us-ascii?Q?ua54Rc0BGTZWljUrEMY0/h1OjclNd/OFtsj4/0mbwLelKDrkBSl9APdhaYaY?=
 =?us-ascii?Q?F5BL5jFShTZntNU+rhWf/r3bi1BdQwHHiBm5Q6bzQd+cWXvuPPRWWgs29K1y?=
 =?us-ascii?Q?3RV2TnSTvYTIq+ZP+H3I6pirNMPB5LyMMsN+49ut2tN3kGZbL+2wf17nc9hs?=
 =?us-ascii?Q?OAXzvoVPo/BDWXggWrJfMKhR6x+Aj7gkRATJjYFcDWPynIK0qWyiMFzmSXJl?=
 =?us-ascii?Q?MQdqx6DkUuVVRF931ufHqzpxM2YPGduJUb17HINB8ZgbXOTBAhk4dZo4hdg6?=
 =?us-ascii?Q?li4tb/gmCM3oh6YuHjbgTv4Qz1RW4CPYNs1H8G3ku7EHOUJ/b2kmlneAfE3f?=
 =?us-ascii?Q?Je0vPJvPnqK4XrMwX00JLrf6FXorL1t1OsiCMNYkHXEqLER9f41NXaI4PAFJ?=
 =?us-ascii?Q?iU4fsBB4Yv2CpL7Y6lPiDfRjpyU9XCuUjalEz36YaQ876WGyaDwKkEINjkWn?=
 =?us-ascii?Q?hXRCTfDuLL46m08o/crBZp+55jiEAP+MB8ejkP+vNRu7L8GlcvOv7DmHxohW?=
 =?us-ascii?Q?RyWNSiXKVULXgroEVYqgnhUqixvuu6xXfZSo5fcPozAJTC+6je+/Q/XJlwyH?=
 =?us-ascii?Q?m8F6Mc6tr/bxiWCT9jSKrTfQIO4HBiD9s/UQJxIfjkdNG0sSus3hr4S3JHJY?=
 =?us-ascii?Q?+eRviQ/clyLLBPGVqNUJyrqlB44cwnOyR7QmOfGlNIhABWPmezNorspZ5W/v?=
 =?us-ascii?Q?zh4f8FdZ9IHq49E0kJG7MgrXc/eDE3Z+wvcL90/cufsSGNvuhqV2lVZEWmdS?=
 =?us-ascii?Q?9UeYcyzB4G1DBguOO6P5Ybp3on/Eu011ciCGEAngD+8UAdcNXKqkvh1NtKsw?=
 =?us-ascii?Q?UQ4hWPjS2wHyRcr0XO3jn7Sgl29eL59WrziCGV3BdlUIKqrlh0aa/3dSwaFS?=
 =?us-ascii?Q?YQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e8afa126-99d6-400d-f493-08dc1c9776a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 04:46:43.5752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2sLuvy1qrLXEapVgfYnmHF9j0iXdsQ8miBskQzKh7267pWE8mnf1Rt5XcUqdqcDlEB8+ueD5I3Lt+N8ImC/dgL+LxFMwDM9604xsfUE+UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1142

Hi Andi,
>=20
> ...
>=20
> > > > +static int __maybe_unused cdns_i2c_resume(struct device *dev) {
> > > > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > > > +	int err;
> > > > +
> > > > +	err =3D cdns_i2c_runtime_resume(dev);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	if (pm_runtime_status_suspended(dev)) {
> > > > +		err =3D cdns_i2c_runtime_suspend(dev);
> > > > +		if (err)
> > > > +			return err;
> > >
> > > We call the cdns_i2c_resume() functions to come up from a suspended
> > > state. But, if we fail to resume, we call the suspend and return '0' =
(because this always returns '0').
> > >
> > > In other words, if we take this path, we call resume, but we still en=
d up suspended and return success.
> > >
> > > Andi
> > >
> >
> > My understanding is that during system level resume 'cdns_i2c_resume()'=
, the i2c device itself can still be held in runtime suspend
> regardless of the change in system level PM.
> > Looking back at this, we invoke cdns_i2c_runtime_resume() to enable clo=
ck and init the i2c device, the runtime PM state is still
> unchanged and kept suspended.
> > pm_runtime_status_suspended() will be evaluated as true, and runtime su=
spend 'cdns_i2c_runtime_suspend()' is invoked to
> disable the clock. This balances the clock count enabled earlier.
>=20
> If this is your issue, what if we do not enable the clock during resume? =
and we just mark the device as resumed?
>=20
That will work as well. The i2c device will be runtime resumed again during=
 cdns_i2c_master_xfer() anyway, but thought that it
would be a good idea to check if the i2c device is able runtime resume duri=
ng a system level resume.

> > The runtime PM state is only resumed during cdns_i2c_master_xfer() thro=
ugh pm_runtime_resume_and_get(), and subsequently
> kept suspended through pm_runtime_put_autosuspend().
> > Since the cdns_i2c_runtime_suspend() always return '0', I will simplify=
 them as follow:
> > +if (pm_runtime_status_suspended(dev))
> > +	cdns_i2c_runtime_suspend(dev);
>=20
> I'd prefer checking the error value, even though we are sure on the expec=
ted return. It's more future proof.
>=20
> Andi
>=20
Ok, I will keep the original changes.

> > > > +	}
> > > > +
> > > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > > +
> > > > +	return 0;
> > > > +}

