Return-Path: <linux-i2c+bounces-1420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897D836DE0
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 18:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A87F1C27E3D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 17:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF804645E;
	Mon, 22 Jan 2024 16:57:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2057.outbound.protection.partner.outlook.cn [139.219.146.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2D3A8E2;
	Mon, 22 Jan 2024 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705942632; cv=fail; b=pBLGtQfuJcRJNomeotCYEAXhR0vMwWTZtXtJitBEY7q6a17xzu0EA9tEAWxyziK/ThrXD39EqdcyDujl50r1CUIUFx3BjaKtnw84/93BO9pLgWU8+iY7U3kMifrSvClsaROrUzWpdyXhDtDgVAJO7MRm5SnDtqZ+Hy+HXWymze0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705942632; c=relaxed/simple;
	bh=TeWBd3lxDKyJEKfAvOWflPjtVrDNUw1rgQWCFmF/5UM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OS6YnEqnpqS3CBwOfWPk1RD8ZlhMQJWEkX+47qsRYkEVCEUXk9ER1Tzk5ElNDg8t+7FfOsg3ePIzpXT+Nkir2xf3xhgVgShL+QSrtJ2LKbi1lrb4hrAMuXNdpU3bLKEFyhWE7wzM1o9ZLLxNfy77EhLZVfTDa+K3In7OcGEJ4mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyMdW28wiQ+QmGKk5TKklRi87W+OqZFRYBiy9TFE0sy0mBsqeAH14GioPYfwN5Y6UcohqKQPVkVbd6BqL0zlseGkGbFl6UBg/3VbT/WlhMcmGOyX0BJRKObonK/mJ04ag38pIZIt0F5sISuetzfJS9qgAlw+0nPxQcm/ogsyV1D3zi39sa3SGfuJNBjwJiFbOOwb4jdTOnX8Ho6h1I8nQtNNDKLQrLZWHTak7yTtal/iV84UpTw79Wv1PflfRg7BEOQ2DAM3suND7ryoEKiZcj1TCWuYrRd6skn1kmjoO3sMmcjBWjHBVm6Rjc4P0NBm83BzlNPBa5VmCSVE1izdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQq7S/W3Qy29Sh/tbfjq0EGLfQyC3WHla1aexAS78HQ=;
 b=RM5gpXMVTwZIdAIIm93q4S0PPyifMHO9/bKwi9e+Qmex4Grz9foECWUK9XNmUJPR9gqc5SnAps3w6AyeAhtxz86u8Ydhee1Jt1iQ2A0V9Q+zJjILgRc10FQokzZvZp4BbRWz6B7gd09dgNdqmqTOyssQHnZC1m/4eYiw6gi3zp5JcVWfRBigl2YRuxqXY5iaq08cf4u3kvPnfoqxX1wskXGHZFVGQvICfjNVbgHIk+pPaBh4oVzOil6VTY3jQGPiJH1Ewde1rJhqu/F/GtS1aQki6C4AkuKYjci/th7FAYZXTbwmJ+gOSNbwGdWKe7obviHpO2H1WNBewIqgsl/z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1048.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 16:23:16 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::1dbb:b090:7d89:4e22]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::1dbb:b090:7d89:4e22%4])
 with mapi id 15.20.7202.034; Mon, 22 Jan 2024 16:23:16 +0000
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
Thread-Index: AQHaSneNdhHjB60n1E+M74xAv32s77Dkvb6AgAE6hjA=
Date: Mon, 22 Jan 2024 16:23:16 +0000
Message-ID:
 <ZQ0PR01MB1160390D00404D24A31A1522EB75A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
 <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
In-Reply-To: <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1048:EE_
x-ms-office365-filtering-correlation-id: 458e650d-c763-44f6-07a5-08dc1b66705d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 k2SAPWtNg1XLU2eG950ZWsayk8AJXYsi+f0X5xuNs4yLYyGkDuSevxWHJX6O8XfBTJuT5CIrti1Cb0+AJvLYUnPkoSMd7XlV81HZ2FbeMsbHDRGGhcwYYDzFJyNOYaYse7PuQZhta1tbLkS5Ek36f8+7rB8TjP8nwGyHESneGSxPnRCtAmW6/eUVHOuIk3Rva7Dm23Me2VjUM9PBwxKp8gVuDN5YdwXDYPVeRTLQq5wfwTVNdZoN4tzvoLfEUDcyUUoNsoegExwqby1M7kBN5o8NRxM4Fe8BY446J+3s2Jme8lYsqZh5P2QTygBC50gOemLd1fvjjJmuLs6xCtfpeHJUCyGzEbOKYE0//BcgjmLjXDOhsuaC5AD7VYCHUMSMKNTwW4tl6VVb3JMtNhW0htW15+7I1dtdltZrZS0O5tju2haj3qHTmMl6YmB43ckqTZ4RAZSD5woUGeBDp6ec/3jI7wRpU3NxVDb3ulM0ZfDHZ+JulNMXBsw2MH6xOROGAu70utDGaORpuCxX04WX5tHPIr5WlRmSHbYYdtp9ULynGK7z2IM1l7emBDbfj6gX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38070700009)(15650500001)(33656002)(40180700001)(2906002)(41320700001)(41300700001)(9686003)(7696005)(83380400001)(26005)(55016003)(66556008)(76116006)(6916009)(64756008)(66446008)(66476007)(54906003)(66946007)(86362001)(508600001)(71200400001)(966005)(122000001)(38100700002)(40160700002)(4326008)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nrxx4ZJBh17MIi77OGi7hk2Sm+VX0Dzf7dDNCHsqqPKk7De50061R1Mgt9zl?=
 =?us-ascii?Q?eI0a9YazlL1xDtgVgNo3NWewUIERlBVdTur2h7W2O8tKKxEX5Odb+Hx5bRjy?=
 =?us-ascii?Q?N6/cNN1TE65vfDOnWfQg3+nquPuthLMre1J+A5T3Tt+/Zj1KnthsnX0aHVl+?=
 =?us-ascii?Q?BGQ3O2R5VJafrvbnoajrVFZ5Nyd/sZ86wtycJNNHQ3pLiVe/B68eb/MGT/gx?=
 =?us-ascii?Q?t55K+nYQDqY9RY7yJZ+JHa/YkpBgkqKlEH/GVjGLLfjZ2pp7DT9kVtpdoCKx?=
 =?us-ascii?Q?Dqv0WJlxocSru6N0JIBdrjeS5MCtGiKKpK9WAc3V8mYfd+e4WpoSCpEAwwIa?=
 =?us-ascii?Q?6DvRxBXHJn2ka92Ak3GtThtIjXeXMJIHTVotJVcSLEqUrIzdqFXhTrHE5KLr?=
 =?us-ascii?Q?Vn0oLCw8rkq0YeBtRqFTKGzotxVxlx+l1qzyCRPHUENQmCWboahgZA4k/NXP?=
 =?us-ascii?Q?SQ0P51G5xmsUrUcak9/Axyx6d3E6NGL4ZUPLKwQ17NukNCxkbrUj3gTpgcyV?=
 =?us-ascii?Q?FHa0QbBiniR0dFc/urA8tCX7CBSf5/t4Vn+A3camQmdcWvvnrj0ofa9RQgs9?=
 =?us-ascii?Q?W69dMOkq1BHu0hRlHF2GQYvwMcFwNqsdJm3mdZVpLfW7AJsr9e21asv5WCzC?=
 =?us-ascii?Q?FSsWyq9u+zGFzr9BdJYAM2xKeAti61NmltV8U1GVa3QwmxlM/ulPUt8jFQQM?=
 =?us-ascii?Q?lqkWvJtN094n7B2gxC4X/ECacwdW9Po3l0KFkJj5N3tXM92wirtCY1NyQ21D?=
 =?us-ascii?Q?fQrDz75mdFtBpB2cITLBXu/an3TxONsFrt57U9h4LrcL5BfMoPfOFInmI/Vs?=
 =?us-ascii?Q?oQdNiYOieM/eFLUAyX78EtOpajrqOfoeMAptIf7loFVFsCBM9cldDk4Iaz/T?=
 =?us-ascii?Q?pkk8oxbjyxgRbp5SVTTN5utFlPQDxObgTliebs+bgAqFCPt/FfbWUMvt83mM?=
 =?us-ascii?Q?T3B2WYdtJRldjJ0qOdd4k9V/a5OL9j2WrKDxtmGvkXS7p+Gm76AEgvaMqbLN?=
 =?us-ascii?Q?HIfEXSm4yIzOE+OE8W+A/UNGZ1txrbaVUrfU9/4UV5/2Sc4TkeFjPmA3/k2Z?=
 =?us-ascii?Q?jqEy4K5wuaPp3afQXH74nHMQomEbe0M+XI+L4Bb8OEtbH6hyqa38GherLpL9?=
 =?us-ascii?Q?hTLCAXL0DZpVuG5fl2T1jZWnbdJ/TBnUxyOGS63YuuI+pUHqTMnjpa69woB7?=
 =?us-ascii?Q?TTN+Bm1YmozO2iY3w+ngQGKvqQnN2iXi9vR6iJvVAxcGkCK/1H8nBCoBrPcB?=
 =?us-ascii?Q?02E7EGKC/V4a57IzpcM9ztfxWaGTWzxB+eoMqRCRB/Jc7cUpUTQS3uEc8ME5?=
 =?us-ascii?Q?hvFM+nqAhDbsRTAQFcx1jf6plhztp435fIYvmCuc0YzmhpCE2chhZoUKDD5q?=
 =?us-ascii?Q?SWkTu3EBKhtk0HWOmx5jyFcnJ36V7S8iYvl1EOtxZca39QyF6XenUzXL6mpJ?=
 =?us-ascii?Q?XHFVu5WgmxHRNIQsKeslmpki4MSC2oleRHJaklcIppZA3FrTDoOMYhHlZjqb?=
 =?us-ascii?Q?Sv+CO/pGiCvNkpFBXi8398GQ/1Qgf3Ib9qrhTyvIl8eFaPoUpG6saXV2/uNz?=
 =?us-ascii?Q?aBicdx7eorkSJfPWuxs8paIsf/RBaU2qVoB7jeBOosMCyP3UT73AlxbJM/Ga?=
 =?us-ascii?Q?YA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 458e650d-c763-44f6-07a5-08dc1b66705d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 16:23:16.4975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qo+fnng5MabgUKB/T3CQR/hnfr3fXtsgOHTEZ6DJazb6RzZtu+U3SjdWE4TAkO3mQk3cKGe/4bYnn7kJSE3yA1ev8EHKfXycWQXr9zbk2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1048

Hi Andi,
>=20
> Hi Ji Sheng,
>=20
> I'm not fully conviced here.
>=20
> On Fri, Jan 19, 2024 at 09:33:26AM +0800, Ji Sheng Teoh wrote:
> > Enable device system suspend and resume PM support, and mark the
> > device state as suspended during system suspend to reject any data tran=
sfer.
> >
> > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > ---
> > Initial v2 was archived, previous discussion can be found in [1].
> > [1]:
> > https://lore.kernel.org/all/20231209131516.1916550-1-jisheng.teoh@star
> > fivetech.com/
> >
> > Changes since v1:
> > - Add missing err assignment in cdns_i2c_resume().
> > ---
> >  drivers/i2c/busses/i2c-cadence.c | 33
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-cadence.c
> > b/drivers/i2c/busses/i2c-cadence.c
> > index de3f58b60dce..4bb7d6756947 100644
> > --- a/drivers/i2c/busses/i2c-cadence.c
> > +++ b/drivers/i2c/busses/i2c-cadence.c
> > @@ -1176,6 +1176,18 @@ static int __maybe_unused cdns_i2c_runtime_suspe=
nd(struct device *dev)
> >  	return 0;
> >  }
> >
> > +static int __maybe_unused cdns_i2c_suspend(struct device *dev) {
> > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > +
> > +	i2c_mark_adapter_suspended(&xi2c->adap);
>=20
> this should go before the return '0' after checking that cdns_i2c_runtime=
_suspend(), even though we know it always returns '0', we
> still can use likely or unlikely.
>=20

Ok, that works for me. Will move it right before return '0', and append 'un=
likely' to the runtime suspend check.
eg:
+if (unlikely(!pm_runtime_status_suspended(dev)))
+	cdns_i2c_runtime_suspend(dev);
+
+i2c_mark_adapter_suspended(&xi2c->adap);
+
+return 0;

> > +	if (!pm_runtime_status_suspended(dev))
> > +		return cdns_i2c_runtime_suspend(dev);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * cdns_i2c_init -  Controller initialisation
> >   * @id:		Device private data structure
> > @@ -1219,7 +1231,28 @@ static int __maybe_unused cdns_i2c_runtime_resum=
e(struct device *dev)
> >  	return 0;
> >  }
> >
> > +static int __maybe_unused cdns_i2c_resume(struct device *dev) {
> > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > +	int err;
> > +
> > +	err =3D cdns_i2c_runtime_resume(dev);
> > +	if (err)
> > +		return err;
> > +
> > +	if (pm_runtime_status_suspended(dev)) {
> > +		err =3D cdns_i2c_runtime_suspend(dev);
> > +		if (err)
> > +			return err;
>=20
> We call the cdns_i2c_resume() functions to come up from a suspended state=
. But, if we fail to resume, we call the suspend and return
> '0' (because this always returns '0').
>=20
> In other words, if we take this path, we call resume, but we still end up=
 suspended and return success.
>=20
> Andi
>=20

My understanding is that during system level resume 'cdns_i2c_resume()', th=
e i2c device itself can still be held in runtime suspend regardless of the =
change in system level PM.
Looking back at this, we invoke cdns_i2c_runtime_resume() to enable clock a=
nd init the i2c device, the runtime PM state is still unchanged and kept su=
spended.
pm_runtime_status_suspended() will be evaluated as true, and runtime suspen=
d 'cdns_i2c_runtime_suspend()' is invoked to disable the clock. This balanc=
es the clock count enabled earlier.
The runtime PM state is only resumed during cdns_i2c_master_xfer() through =
pm_runtime_resume_and_get(), and subsequently kept suspended through pm_run=
time_put_autosuspend().
Since the cdns_i2c_runtime_suspend() always return '0', I will simplify the=
m as follow:
+if (pm_runtime_status_suspended(dev))
+	cdns_i2c_runtime_suspend(dev);

> > +	}
> > +
> > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct dev_pm_ops cdns_i2c_dev_pm_ops =3D {
> > +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(cdns_i2c_suspend, cdns_i2c_resume)
> >  	SET_RUNTIME_PM_OPS(cdns_i2c_runtime_suspend,
> >  			   cdns_i2c_runtime_resume, NULL)
> >  };
> > --
> > 2.43.0
> >

