Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B817494D03
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbiATLbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbiATLbK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:31:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C80FC06173F
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 03:31:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nAVeb-0003Ed-UQ; Thu, 20 Jan 2022 12:30:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nAVeZ-00BLYg-Sj; Thu, 20 Jan 2022 12:30:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nAVeY-000E9C-HJ; Thu, 20 Jan 2022 12:30:54 +0100
Date:   Thu, 20 Jan 2022 12:30:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of
 of_*()
Message-ID: <20220120113054.lmd5rmvmflaf7v7t@pengutronix.de>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vd=gxF9jFMvRw3qM9rfsxxCsO8qYXKVheuhjOV7ypU9og@mail.gmail.com>
 <DM5PR12MB18509C555A8A6F5891F0CC28C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75VfVJo=8FPX_Pw15X5B3awFXpuEq+=LryxB6M4Ub-YJ7uA@mail.gmail.com>
 <DM5PR12MB185098D36F665AC5702D47DDC05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
 <CAHp75VfVt0b+rBTfvTTj4-M11DrM2EGdqb4NNNTq0ApvR+gpDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cdxvf7ymm4mv6sgi"
Content-Disposition: inline
In-Reply-To: <CAHp75VfVt0b+rBTfvTTj4-M11DrM2EGdqb4NNNTq0ApvR+gpDg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cdxvf7ymm4mv6sgi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 12:43:02PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 20, 2022 at 12:29 PM Akhil R <akhilrajeev@nvidia.com> wrote:
> >
> > > ...
> > >
> > > > > This change reveals potential issue:
> > > > >
> > > > > > -               irq =3D of_irq_get_byname(adapter->dev.of_node,=
 "smbus_alert");
> > > > > > +               irq =3D device_irq_get_byname(adapter->dev.pare=
nt,
> > > "smbus_alert");
> > > > >
> > > > > >                 if (irq <=3D 0)
> > > > >
> > > > > I guess this '=3D 0' part should be fixed first.
> > > >
> > > > '0' is a failure as per the documentation of of_irq_get_byname() as=
 well as
> > > > of_irq_get(). The case is different for acpi_irq_get(), but it is h=
andled in
> > > > fwnode_irq_get(). If I understood it right, a return value of '0' s=
hould be
> > > > considered a failure here.
> > >
> > > Depends. I have no idea what the original code does here. But
> > > returning an error or 0 from this function seems confusing to me.
> > >
> > The description in of_irq_get*() says -
> > /* Return: Linux IRQ number on success, or 0 on the IRQ mapping failure=
, or
> >  * -EPROBE_DEFER if the IRQ domain is not yet created, or error code in=
 case
> >  * of any other failure.
> >  */
> > As I see from the code of fwnode_irq_get(), which is used in this case,=
 returns
> > either the return value of of_irq_get() or error code from acpi_irq_get=
() when
> > it fails, or res.start if it didn't fail. I guess, any of these would n=
ot be 0 unless
> > there is an error.
>=20
> of_irq_get*() seems inconsistent...
>=20
> Uwe, what do you think?

Yeah, this is something I stumbled over during the platform_get_irq*()
discussion. But I don't feel like investing any more energy there.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cdxvf7ymm4mv6sgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHpR+sACgkQwfwUeK3K
7AlVDQf/UyEbXUuWCywlD2V5dd6jAINm1Cg0yyuFPxHty9d7WFBu0iL+OmYwdKsf
VNESVe1lcz+AUYaov33RaM0cMCqR2tZ+i3tnoyxBH80xIRTE0ncyW1zhg0pxkQnE
vQZRkHAjVtz1DzmOKVP1FPCRqh0H9LmZXfaSJL7lhHDLe5WgAhzXszGDVY1J9xZi
tlR1vB91vzTk/+TLVsj3l+NU5qbrhqx6Cqwktlnn00XX9QMkH5+FApDMC8NfZ9qI
CMAh5RjiEBoZEKQY70Ix70kyVLAblmNkVY5rvbie9YoZ+fBMMpRNdykLgPqPUaBv
kEdOP8qlPlbAKVs7MmUfMgtl+IVocg==
=bB3r
-----END PGP SIGNATURE-----

--cdxvf7ymm4mv6sgi--
