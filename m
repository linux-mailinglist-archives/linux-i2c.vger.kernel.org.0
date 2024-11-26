Return-Path: <linux-i2c+bounces-8228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C9E9D9734
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 13:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4121651BD
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A81D1D0143;
	Tue, 26 Nov 2024 12:22:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB97B674
	for <linux-i2c@vger.kernel.org>; Tue, 26 Nov 2024 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732623761; cv=none; b=DXpZ8r/FzKP9E0u48HjSyvKs9/Q0kIWSHhDRB7jLoKAGqJYSadTP4OHYmjBoEr1p9SwxOBMoy8azWxQNC9eXZy2auzzV6aICwPyNzxce9NuIWU+28e7GYZaP/YO4G+1FJtjllHxHr6dJfef74u7622mM9zLVddEdZpZf6rIQ1BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732623761; c=relaxed/simple;
	bh=sxANsnnHq2WZR9GJfTpBnZWa1T1LusjZLL7HmFVS+DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSUUwJ+Xousknv6pO/hAoklxvRZOp4pzqeQFiykeqcp9F0NO/bx4EqNg7JZ3iSv6MKf6MMYXAzDQo7F2+BxfT1DC8BC0MK9+Klo9ik+r0Wmzxv0GQdnQEx7r8YRilbZSxcKDYC1NE8CYnTHNyhNHzfjJD5p6q+aWTI+y04jZ9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFuaH-00037b-Rb; Tue, 26 Nov 2024 13:22:25 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFuaG-000FQ2-1a;
	Tue, 26 Nov 2024 13:22:25 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DDEDD37DA05;
	Tue, 26 Nov 2024 12:22:24 +0000 (UTC)
Date: Tue, 26 Nov 2024 13:22:24 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Message-ID: <20241126-fat-orthodox-eel-5389b4-mkl@pengutronix.de>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
 <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qr4ed5s4vw2t4oyl"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--qr4ed5s4vw2t4oyl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 26.11.2024 12:07:59, Carlos Song wrote:
>=20
>=20
> > -----Original Message-----
> > From: Marc Kleine-Budde <mkl@pengutronix.de>
> > Sent: Tuesday, November 26, 2024 6:24 PM
> > To: Carlos Song <carlos.song@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; o.rempel@pengutronix.de;
> > kernel@pengutronix.de; andi.shyti@kernel.org; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH v2] i2c: imx: support DMA defer probing
> >=20
> > On 26.11.2024 10:15:27, Carlos Song wrote:
> > > > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,13
> > > > > @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > >  	if (ret =3D=3D -EPROBE_DEFER)
> > > > >  		goto clk_notifier_unregister;
> > > > >
> > > > > +	/* Init DMA config if supported */
> > > > > +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > > +	if (ret =3D=3D -EPROBE_DEFER) {
> > > > > +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> > > > > +		goto clk_notifier_unregister;
> > > > > +	}
> > > >
> > > > Don't spam the logs if the driver defers probing, it's not a error.
> > > > And it looks strange to ignore all other errors here. Either add a
> > > > comment here, something like "continue without DMA", or let the
> > > > function return
> > > > 0 in case the driver should continue and propagate the error if the
> > > > caller should take care of it.
> > > >
> > >
> > > Hi,
> > > Thank you for your suggestion! I agree with you.
> > > I will change to this logic:
> > > 	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > 	if (ret) {
> > > 		if (ret =3D=3D -EPROBE_DEFER)
> > > 			goto clk_notifier_unregister;
> > > 		dev_info(&pdev->dev, "use pio mode\n");
> > > 	}
> > >
> > > Ret =3D 0  ----->  enable DMA successfully  -------> no print
> > > Ret!=3D0  ----->  defer probe ---------> no print and try again
> > > Ret!=3D0  ----->  fail to enable DMA ------> remind now is using pio
> > > mode
> > >
> > > Do you think the logic is acceptable?
> >=20
> > Yes, the other option is to move the logic into i2c_imx_dma_request() a=
nd let it
> > return 0 in case of DMA or fallback to PIO, or an error in case of prob=
e defer or a
> > fatal error.
> >=20
> > This way the probe function will look like this:
> >=20
> >      ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> >      if (ret)
> >                 return dev_err_probe(&pdev->dev, ret, "Failed to setup
> > DMA\n");
> >=20
>=20
> Sorry, I have some different ideas...
> 1. DMA mode should be optional for i2c-imx, because i2c-imx can accept DM=
A mode not enabled, because it still can work in CPU mode.

ACK

>   If we use return dev_err_probe(), we have to return error at i2c_imx_dm=
a_request() for "some fatal error", it will cause i2c_adapter can not be re=
gistered, then kill i2c adapter register.

i2c_imx_dma_request should only return an error if PIO mode is not an
option.

>   If we always return 0 at i2c_imx_dma_request(), dev_err_probe will not =
work forever. So from my point, if DMA is not working well, just output a l=
og to remind now i2c is always
>   working at CPU mode, we have no DMA, this is enough.

ACK

> 2. when really defer probe, return dev_err_probe will return defer probe =
directly, but we still need to goto clk_notifier_unregister branch to free =
irq, clk_notifier_unregister and disable runtime pm.
>   So we still need more judgement at probe function to handle this.

Not quite "dev_err_probe()" will not defer probe directly, the return in
"return dev_err_probe();" does. This should work:

        ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
        if (ret) {
                dev_err_probe(&pdev->dev, ret, "Failed to setup  DMA\n");
                goto clk_notifier_unregister;
        }
       =20

> So I prefer this logic:

This also works, LGTM!

> ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> if (ret) {
> 	if (ret =3D=3D -EPROBE_DEFER)
> 		goto clk_notifier_unregister;
> 	dev_info(&pdev->dev, "use pio mode\n");
> }

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--qr4ed5s4vw2t4oyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFvX0ACgkQKDiiPnot
vG+dBgf+NxAQrj6iLQlHEDMSbH2IoHlWMH26HaT5bjMhCGW3CptsWot7YKtEg+YW
0SkJ1U4ivNltky6GMzPVIZoWSTCtSapzrRR9mAWkzHCM7dh3HHxCnzIs7XsVRzy5
RKvBuFJsn3Fz5hs9fK8wV8ucV5tT03Y5Z4wKaIy2NQSsVLT6oKbH+/JIYhZ58Lej
0aYVZWy+4vPQpMDQ/HjtR2eJPbEWlqzawiIJUH/qfH4mYYC+uOSAXQJRPMzlDIN0
mJcGyG8ID4UxGJF1dYkjgSLFB/SuFbW+HF978op+twrxKW7nJUTQhx1XhacjOY9o
/ms5T9s/qWQro5T8tSYiF8SInL7CZw==
=p1Q5
-----END PGP SIGNATURE-----

--qr4ed5s4vw2t4oyl--

