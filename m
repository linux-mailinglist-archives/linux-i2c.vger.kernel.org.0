Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BC7A5D43
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 23:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfIBVC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 17:02:29 -0400
Received: from sauhun.de ([88.99.104.3]:44198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbfIBVC3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 17:02:29 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id 79B4D2C0165;
        Mon,  2 Sep 2019 23:02:26 +0200 (CEST)
Date:   Mon, 2 Sep 2019 23:02:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Chuanhua Han <chuanhua.han@nxp.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
Subject: Re: [PATCH] ACPI: support for NXP i2c controller
Message-ID: <20190902210226.GC7253@kunai>
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
 <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 10:56:22PM +0200, Rafael J. Wysocki wrote:
> On Thu, Jul 11, 2019 at 12:35 PM Chuanhua Han <chuanhua.han@nxp.com> wrot=
e:
> >
> > Enable NXP i2c controller to boot with ACPI
> >
> > Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> > Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
> > Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
>=20
> Wolfram, any objections to this from the i2c side?

CCing the new maintainer of this driver...

>=20
> > ---
> >  drivers/acpi/acpi_apd.c      |  6 ++++++
> >  drivers/i2c/busses/i2c-imx.c | 15 +++++++++++++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> > index ff47317..cf8566c 100644
> > --- a/drivers/acpi/acpi_apd.c
> > +++ b/drivers/acpi/acpi_apd.c
> > @@ -165,6 +165,11 @@ static const struct apd_device_desc thunderx2_i2c_=
desc =3D {
> >         .fixed_clk_rate =3D 125000000,
> >  };
> >
> > +static const struct apd_device_desc nxp_i2c_desc =3D {
> > +       .setup =3D acpi_apd_setup,
> > +       .fixed_clk_rate =3D 350000000,
> > +};
> > +
> >  static const struct apd_device_desc hip08_spi_desc =3D {
> >         .setup =3D acpi_apd_setup,
> >         .fixed_clk_rate =3D 250000000,
> > @@ -238,6 +243,7 @@ static const struct acpi_device_id acpi_apd_device_=
ids[] =3D {
> >         { "HISI02A1", APD_ADDR(hip07_i2c_desc) },
> >         { "HISI02A2", APD_ADDR(hip08_i2c_desc) },
> >         { "HISI0173", APD_ADDR(hip08_spi_desc) },
> > +       { "NXP0001", APD_ADDR(nxp_i2c_desc) },
> >  #endif
> >         { }
> >  };
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index b1b8b93..99f9b96 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -44,6 +44,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> > +#include <linux/acpi.h>
> >
> >  /* This will be the driver name the kernel reports */
> >  #define DRIVER_NAME "imx-i2c"
> > @@ -255,6 +256,12 @@ static const struct of_device_id i2c_imx_dt_ids[] =
=3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
> >
> > +static const struct acpi_device_id i2c_imx_acpi_ids[] =3D {
> > +       {"NXP0001", .driver_data =3D (kernel_ulong_t)&vf610_i2c_hwdata},
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
> > +
> >  static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)
> >  {
> >         return i2c_imx->hwdata->devtype =3D=3D IMX1_I2C;
> > @@ -1052,6 +1059,9 @@ static int i2c_imx_probe(struct platform_device *=
pdev)
> >  {
> >         const struct of_device_id *of_id =3D of_match_device(i2c_imx_dt=
_ids,
> >                                                            &pdev->dev);
> > +       const struct acpi_device_id *acpi_id =3D
> > +                       acpi_match_device(i2c_imx_acpi_ids,
> > +                                         &pdev->dev);
> >         struct imx_i2c_struct *i2c_imx;
> >         struct resource *res;
> >         struct imxi2c_platform_data *pdata =3D dev_get_platdata(&pdev->=
dev);
> > @@ -1079,6 +1089,9 @@ static int i2c_imx_probe(struct platform_device *=
pdev)
> >
> >         if (of_id)
> >                 i2c_imx->hwdata =3D of_id->data;
> > +       else if (acpi_id)
> > +               i2c_imx->hwdata =3D (struct imx_i2c_hwdata *)
> > +                               acpi_id->driver_data;
> >         else
> >                 i2c_imx->hwdata =3D (struct imx_i2c_hwdata *)
> >                                 platform_get_device_id(pdev)->driver_da=
ta;
> > @@ -1091,6 +1104,7 @@ static int i2c_imx_probe(struct platform_device *=
pdev)
> >         i2c_imx->adapter.nr             =3D pdev->id;
> >         i2c_imx->adapter.dev.of_node    =3D pdev->dev.of_node;
> >         i2c_imx->base                   =3D base;
> > +       ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev-=
>dev));
> >
> >         /* Get I2C clock */
> >         i2c_imx->clk =3D devm_clk_get(&pdev->dev, NULL);
> > @@ -1253,6 +1267,7 @@ static struct platform_driver i2c_imx_driver =3D {
> >                 .name =3D DRIVER_NAME,
> >                 .pm =3D &i2c_imx_pm_ops,
> >                 .of_match_table =3D i2c_imx_dt_ids,
> > +               .acpi_match_table =3D ACPI_PTR(i2c_imx_acpi_ids),
> >         },
> >         .id_table =3D imx_i2c_devtype,
> >  };
> > --
> > 2.9.5
> >

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1tg2EACgkQFA3kzBSg
KbZjdQ//fUFpSzgjzQ8pjBl6JVroHT8jzq2aP30gEwpsl/FI14JgShodic81qs0q
9s7imcri7trPcIJolZPmqdZ7GOrTxQq1N2I2B0EnS+krBEOMj8WS2B1TOxhpeAdC
wXSQIEkEtXV+XKxGGhNNnw20GJp9OEzsbGbqOAv8hL3toI2MOjTJn0lv+tuWJpPB
LhL5DfizUp24aocb8Y7pp5XBCGYm+X2wekkTuGQ6G9S/ApfgfTjGncIhmacD07ML
H9/z0Gq9WNpQz/5knUquLANiUFA9VjNrxup3jHFMCCnUxvdO5RzY76X0kxWiWXru
CexaoxPMsQ18J/jQFdEw0y3buiTjHOgs0ipAMY41gCMM3LcdbBwUbDqg94FtK+f2
rsKzrBA9yAJ5v8nqb9GQSwYrFV40fMpYjEWbac+aptlA4dArLcpQZdmeXgvpzhR8
9g7djI6+V0/M+LqyAFuCLoy4luTszOe1FdOrOHiO+4Yx2La2+JKSuGu1uM80eBWs
Ea4l1PtgSsjVNs7Xq5VYO6v4J8SK2XGNAazdQOMAHONtmoUIL4QQhuyCrFOh2MbR
BSgZLZc2cDusYZRk6IU87a7o6tAFb8FYlJrlrPFN/Cv29zzat0kilpi4t4Pqqpx5
9Kgsq4dCj8enN/LGbWPC3HkuKV9LATHJcD5FyE8k0EGRJ/3RvIw=
=y6Va
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
