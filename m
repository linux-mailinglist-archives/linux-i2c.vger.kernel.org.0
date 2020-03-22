Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6687C18E9F2
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 17:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgCVQAn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 12:00:43 -0400
Received: from sauhun.de ([88.99.104.3]:51172 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgCVQAn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 12:00:43 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id ADCB32C0064;
        Sun, 22 Mar 2020 17:00:40 +0100 (CET)
Date:   Sun, 22 Mar 2020 17:00:40 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chuhong Yuan <hslester96@gmail.com>,
        Jan Glauber <jglauber@cavium.com>
Cc:     David Daney <david.daney@cavium.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: thunderx: Add missed pci_release_regions
Message-ID: <20200322160040.GD1091@ninjato>
References: <20191206075349.18297-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
In-Reply-To: <20191206075349.18297-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 03:53:49PM +0800, Chuhong Yuan wrote:
> The driver forgets to call pci_release_regions() in probe failure
> and remove.
> Add the missed calls to fix it.
>=20
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Jan, any comment to this patch?

Chuhong Yang, please make sure you have a proper To-Header next time!

> ---
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busse=
s/i2c-thunderx-pcidrv.c
> index 19f8eec38717..31f7e254e99f 100644
> --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> @@ -172,8 +172,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pde=
v,
>  		return ret;
> =20
>  	i2c->twsi_base =3D pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
> -	if (!i2c->twsi_base)
> -		return -EINVAL;
> +	if (!i2c->twsi_base) {
> +		ret =3D -EINVAL;
> +		goto error_release_regions;
> +	}
> =20
>  	thunder_i2c_clock_enable(dev, i2c);
>  	ret =3D device_property_read_u32(dev, "clock-frequency", &i2c->twsi_fre=
q);
> @@ -189,16 +191,16 @@ static int thunder_i2c_probe_pci(struct pci_dev *pd=
ev,
> =20
>  	ret =3D pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
>  	if (ret < 0)
> -		goto error;
> +		goto error_disable_clock;
> =20
>  	ret =3D devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr, =
0,
>  			       DRV_NAME, i2c);
>  	if (ret)
> -		goto error;
> +		goto error_disable_clock;
> =20
>  	ret =3D octeon_i2c_init_lowlevel(i2c);
>  	if (ret)
> -		goto error;
> +		goto error_disable_clock;
> =20
>  	octeon_i2c_set_clock(i2c);
> =20
> @@ -214,7 +216,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
> =20
>  	ret =3D i2c_add_adapter(&i2c->adap);
>  	if (ret)
> -		goto error;
> +		goto error_disable_clock;
> =20
>  	dev_info(i2c->dev, "Probed. Set system clock to %u\n", i2c->sys_freq);
> =20
> @@ -224,8 +226,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pde=
v,
> =20
>  	return 0;
> =20
> -error:
> +error_disable_clock:
>  	thunder_i2c_clock_disable(dev, i2c->clk);
> +error_release_regions:
> +	pci_release_regions(pdev);
>  	return ret;
>  }
> =20
> @@ -236,6 +240,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *pd=
ev)
>  	thunder_i2c_smbus_remove(i2c);
>  	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
>  	i2c_del_adapter(&i2c->adap);
> +	pci_release_regions(pdev);
>  }
> =20
>  static const struct pci_device_id thunder_i2c_pci_id_table[] =3D {
> --=20
> 2.24.0
>=20

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53i6gACgkQFA3kzBSg
Kbak5BAAoEmoF7vf0DlvwMvEh2XuDo71I8d3Zmetn9FCGVpebdlyzdWFnsfCHqDu
bYztVMExdM32UGRLOzROtmbN7/Y7dLSmWZ301NrI9lStFnuMKPwTAbR0vZn8KAee
QLDSC5MkF8fl7eisQ+PwTqfF34pOTBljEOYijiV+0QGObjlF5Xy8mB/DOyGwnwhX
0MKbdMXihTZRYDe2AOnBY78LARy10eZlClVnmDMCNqBJC4dZjRXCawspwzlIeywE
s0eyokf0799Fy2Vwsqc3Ebvk6WUpDudLKo54BvnnsJcXfN440vDSoW5P8xbI6HsR
w4Cq29lNd94u3kGMxjdg3LMaqDxf90fAhkDKRCFxJY4BzNChTSmgSUD2UbRGKGHQ
9gGqWmGSRx1qqrog0zolPhGP1s6fULoIkyqLYVH5fMLQbbJUGcxFNj3OAGuOJ5Q9
rfd2+lDA3tdQw/0NncOeB3Qr6VeGlQTUGv5clFhSXsxCVOdVX0T2FDJuJHP3Z1pe
8upjPoKeIlXs3Z9fsJIO1OOWvT2K+nvVLkbE56OVXwXqJONa9CdKtk2tTiWm4s4o
K8DL7FVMOIqJ7mOw8j5u4x+wEwAPanWlBUVOPbTrAXPbmrsSQSQFX/srF/XcGuWb
9BALH6uiD51Pfst3kjIpkQ/829zhxg7efY6wFEPbK1Ptus7+hn8=
=ZCWF
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
