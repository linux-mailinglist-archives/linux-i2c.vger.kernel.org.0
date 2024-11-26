Return-Path: <linux-i2c+bounces-8226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B429D9576
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 11:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C5D168286
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 10:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8436B1CB337;
	Tue, 26 Nov 2024 10:24:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894518FDBA
	for <linux-i2c@vger.kernel.org>; Tue, 26 Nov 2024 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732616645; cv=none; b=eMhEHe48Y2o/yeUdu/qjNx6hnTDds8wOu46A1gpeAGCKOZBQf+22SrXwzErIzBkVZFNI7qDLeoto4Pj60cSpCL16BqK70YmOfh1Lal7SDyE9eHIFc2O7/9Cmk+HxNmpy5dVEgNR2rOcMR5RBZ0f4fLatGxmKGyyYxO7XKhD+kFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732616645; c=relaxed/simple;
	bh=Gl1YzyF45JshhprewtQzalCtCwzj+O7eTYyonCHwwWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmbUfbOiQjOtMpi/p0iasHbhwtab7J1krVPh4w3Dpzexm9FCa2IDxFXR4zsE3wSvr/YJFlLJqCI1E/N1hCe6pZkb3qrBIiv309TMb5/XKHMIsmt5Onop7MO7HNiQelTO28yKfViu0MMKl8Oaj+UcKJnXaZbSUFhIoOU5WbAj4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFsja-00033P-Dp; Tue, 26 Nov 2024 11:23:54 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFsjZ-000ERt-18;
	Tue, 26 Nov 2024 11:23:54 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C120437D8B6;
	Tue, 26 Nov 2024 10:23:53 +0000 (UTC)
Date: Tue, 26 Nov 2024 11:23:53 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Message-ID: <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvifcaczcjfl73wu"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--pvifcaczcjfl73wu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 26.11.2024 10:15:27, Carlos Song wrote:
> > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,13 @@
> > > static int i2c_imx_probe(struct platform_device *pdev)
> > >  	if (ret =3D=3D -EPROBE_DEFER)
> > >  		goto clk_notifier_unregister;
> > >
> > > +	/* Init DMA config if supported */
> > > +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +	if (ret =3D=3D -EPROBE_DEFER) {
> > > +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> > > +		goto clk_notifier_unregister;
> > > +	}
> >=20
> > Don't spam the logs if the driver defers probing, it's not a error. And=
 it looks
> > strange to ignore all other errors here. Either add a comment here, som=
ething
> > like "continue without DMA", or let the function return
> > 0 in case the driver should continue and propagate the error if the cal=
ler should
> > take care of it.
> >=20
>=20
> Hi,
> Thank you for your suggestion! I agree with you.
> I will change to this logic:
> 	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> 	if (ret) {
> 		if (ret =3D=3D -EPROBE_DEFER)
> 			goto clk_notifier_unregister;
> 		dev_info(&pdev->dev, "use pio mode\n");
> 	}
>=20
> Ret =3D 0  ----->  enable DMA successfully  -------> no print
> Ret!=3D0  ----->  defer probe ---------> no print and try again
> Ret!=3D0  ----->  fail to enable DMA ------> remind now is using pio mode
>=20
> Do you think the logic is acceptable?

Yes, the other option is to move the logic into i2c_imx_dma_request()
and let it return 0 in case of DMA or fallback to PIO, or an error in
case of probe defer or a fatal error.

This way the probe function will look like this:

     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
     if (ret)
                return dev_err_probe(&pdev->dev, ret, "Failed to setup DMA\=
n");


regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pvifcaczcjfl73wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFobYACgkQKDiiPnot
vG9Llwf/Wiv7XC46iia/74g2fDIJu4YvYXnAdteDyubnJwlpk/staezEgeh11+FB
V7BahH36iz1E3w0phN/JpzgZxKjpHDACgm7iDoil6/VHUZFJYbxFCiwQnbGYBpTv
ekAyLcdsfDhSEP8sPTaraAiCQVZT/7C7Vjxk6kMrqaOEELTkZ+nRl5OW0Ym0SWhZ
ID8m4rQyNzbxUMZg0/dEbyCcf6E2CJzUe8diixOc4DT1VtLWqEW0qHvZdsBMn7fW
a6+F68O4oQD8pPC1lm1/yvUmwMY/RqWfXhT9cJU3ArxfqJsEFKeLEI5I0DIymosh
p/S7I/1xEjQhBCPW0NTMyMUBqsdoAg==
=L7AI
-----END PGP SIGNATURE-----

--pvifcaczcjfl73wu--

