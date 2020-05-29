Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B2F1E7B1A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 13:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgE2LBF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 07:01:05 -0400
Received: from sauhun.de ([88.99.104.3]:49008 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgE2LBE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 May 2020 07:01:04 -0400
Received: from localhost (p54b33184.dip0.t-ipconnect.de [84.179.49.132])
        by pokefinder.org (Postfix) with ESMTPSA id 8A1C02C2034;
        Fri, 29 May 2020 13:01:02 +0200 (CEST)
Date:   Fri, 29 May 2020 13:01:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chuhong Yuan <hslester96@gmail.com>,
        Jan Glauber <jglauber@cavium.com>
Cc:     David Daney <david.daney@cavium.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: thunderx: Add missed pci_release_regions
Message-ID: <20200529110102.GD3417@ninjato>
References: <20191206075349.18297-1-hslester96@gmail.com>
 <20200322160040.GD1091@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Content-Disposition: inline
In-Reply-To: <20200322160040.GD1091@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2020 at 05:00:40PM +0100, Wolfram Sang wrote:
> On Fri, Dec 06, 2019 at 03:53:49PM +0800, Chuhong Yuan wrote:
> > The driver forgets to call pci_release_regions() in probe failure
> > and remove.
> > Add the missed calls to fix it.
> >=20
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>=20
> Jan, any comment to this patch?

Jan, are you still there?

>=20
> Chuhong Yang, please make sure you have a proper To-Header next time!
>=20
> > ---
> >  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/bus=
ses/i2c-thunderx-pcidrv.c
> > index 19f8eec38717..31f7e254e99f 100644
> > --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> > +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> > @@ -172,8 +172,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *p=
dev,
> >  		return ret;
> > =20
> >  	i2c->twsi_base =3D pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
> > -	if (!i2c->twsi_base)
> > -		return -EINVAL;
> > +	if (!i2c->twsi_base) {
> > +		ret =3D -EINVAL;
> > +		goto error_release_regions;
> > +	}
> > =20
> >  	thunder_i2c_clock_enable(dev, i2c);
> >  	ret =3D device_property_read_u32(dev, "clock-frequency", &i2c->twsi_f=
req);
> > @@ -189,16 +191,16 @@ static int thunder_i2c_probe_pci(struct pci_dev *=
pdev,
> > =20
> >  	ret =3D pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
> >  	if (ret < 0)
> > -		goto error;
> > +		goto error_disable_clock;
> > =20
> >  	ret =3D devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr=
, 0,
> >  			       DRV_NAME, i2c);
> >  	if (ret)
> > -		goto error;
> > +		goto error_disable_clock;
> > =20
> >  	ret =3D octeon_i2c_init_lowlevel(i2c);
> >  	if (ret)
> > -		goto error;
> > +		goto error_disable_clock;
> > =20
> >  	octeon_i2c_set_clock(i2c);
> > =20
> > @@ -214,7 +216,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pd=
ev,
> > =20
> >  	ret =3D i2c_add_adapter(&i2c->adap);
> >  	if (ret)
> > -		goto error;
> > +		goto error_disable_clock;
> > =20
> >  	dev_info(i2c->dev, "Probed. Set system clock to %u\n", i2c->sys_freq);
> > =20
> > @@ -224,8 +226,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *p=
dev,
> > =20
> >  	return 0;
> > =20
> > -error:
> > +error_disable_clock:
> >  	thunder_i2c_clock_disable(dev, i2c->clk);
> > +error_release_regions:
> > +	pci_release_regions(pdev);
> >  	return ret;
> >  }
> > =20
> > @@ -236,6 +240,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *=
pdev)
> >  	thunder_i2c_smbus_remove(i2c);
> >  	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
> >  	i2c_del_adapter(&i2c->adap);
> > +	pci_release_regions(pdev);
> >  }
> > =20
> >  static const struct pci_device_id thunder_i2c_pci_id_table[] =3D {
> > --=20
> > 2.24.0
> >=20



--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Q624ACgkQFA3kzBSg
Kbbtpg/+L5P/8PE6Xaw90HATOaTCtM0KtQzkWcF6bGPAN/r0LBstX+5TjhIPyBnw
3A3kWp+YlFbM3WAbHM1erjMWlIygCzTgKMqPA3KwFvImJ0Bhfo04pptvbOB6QTIM
FuDBNIrM/QN5w59OzqkmhJ9OkXNNy64+KkVEUJSQcz4WnRinTgvyDPUdD0yHChtg
78rqAiq+1WZDUkQajoKLqnkEQjVVVOF+S5AxDwc0neS0H55TuvvFaPR2JTiVKp6T
VyCVe+lfS1v8m/2cQL4uxBLpxMwy7pr5eiaa9IF8XNmm5Ww+9ht7YWVnMn1KuOTM
LAVID31cxjmL3W+6IVuRkfOwu49/V6NeVezChD0+XO+Eue84R7j0mRJg2epwRWw3
xfMm6DKhwCNLOVpYCo9sCdkYB85Gg0ilaou6gYIpEiQmIzoXzjQ227BKh6kLwwj7
RBmVSPg17JRlYoXLrmoDGmjjBvNh5GKxR+RnfvtRdsf1kcBK3TdQtMWbhZrr5n/w
e5y6M6IHGUJ+ImsXWiwx3kZvee92wLcBvB3Zg17RGJBXI4IfP7/cu/iFttp58+Cu
h3+FBEwbyhkxq0OIqBSvk3jjDnSNh1Vyf9uP93bzVyuPCDH+4SqYR9psC8Fn4Wza
BNriZnMPXqFCdHEwkr96V+lRrnYhw2OvMryxYd6fk6vxA3FTGiQ=
=R2TX
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
