Return-Path: <linux-i2c+bounces-7535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D89AE1C9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECEE01F241C1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42521C07D2;
	Thu, 24 Oct 2024 09:58:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD791B85C4
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729763888; cv=none; b=rsb69L/kbge2RWUWHsC6rSCvLSg0FK0HdnNhExZ391TbW8RjElvmByizo+c1HQZBOgGXgDDH65KYngTSOFZ4iBwQlDPkeofz0MUx7RZ2K/GOIhpF451kGYzmlfLXszrWTpk02Fcl9FoAd/6tUr0WeYuHdexjH8ZkXdvpAZEnpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729763888; c=relaxed/simple;
	bh=hmNoUJOm+bj8veyYXhIGwnX5DtxzL9QZIj2btrckT60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/0q5yZp0lLeEZ6fwvgb3/DAzS152S2DGbnekajY2Yc46JLlwPGWsyVAuyWg3V0sn+vsrloSGFDfA+FfnJQMMHc9E2PtHRvGgqrRnE1h0kp5UWHinulWg5sB1yadm6eUeBfmwcQ94Zpkov785/HZelQZeu8nyR2VfTyo5vEythE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3uax-0007SO-SI; Thu, 24 Oct 2024 11:57:31 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3uaw-000B1Z-1s;
	Thu, 24 Oct 2024 11:57:30 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2999E35D971;
	Thu, 24 Oct 2024 09:57:30 +0000 (UTC)
Date: Thu, 24 Oct 2024 11:57:29 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20241024-ladybug-of-silent-holiness-498562-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mngoatx2xdrr45s4"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-2-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--mngoatx2xdrr45s4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 24.10.2024 16:59:14, Ming Yu wrote:
> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev =3D interface_to_usbdev(iface);
> +	struct device *dev =3D &udev->dev;
> +	struct usb_host_interface *interface;
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct nct6694 *nct6694;
> +	int pipe, maxp, bulk_pipe;
> +	int ret =3D EINVAL;
> +
> +	interface =3D iface->cur_altsetting;
> +	/* Binding interface class : 0xFF */
> +	if (interface->desc.bInterfaceClass !=3D USB_CLASS_VENDOR_SPEC ||
> +	    interface->desc.bInterfaceSubClass !=3D 0x00 ||
> +	    interface->desc.bInterfaceProtocol !=3D 0x00)
> +		return -ENODEV;

I think you can use USB_DEVICE_INFO() and remove this manual check

https://elixir.bootlin.com/linux/v6.11.5/source/include/linux/usb.h#L1056

[...]

> +
> +static const struct usb_device_id nct6694_ids[] =3D {
> +	{ USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--mngoatx2xdrr45s4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaGgcACgkQKDiiPnot
vG8YiQf/bRkt59QCQTqv2A9MhX1wIK2oTcc9JJY7HruR3mItUAqf1X0TEFMjA+Qw
M9K/3KtK3rWW4F9fE3yLNYHqiP/fnv20U5Cn027fKzg9YOvSlkgOdScDLashOG2k
RQ/SG5iSXjlZ/1JYnx8HIOmUgsU29jFm7vdcyeeI1hUO2qrE0QBVqMLp/hG4DsTa
kjqf/x0Hj57Vfgx08DRC+XNBrjhy6CCdvzr0be8DktMRz/uZVX5FFYrI0b240gWQ
a3JvsvFdG19vPQGXj5eo4Oc03Y5lNmQuj3e0v0dwu2y5prM51p9lwd7MjiL3o9nn
MuVo6YfRtzv/4M/EZCeqs+ocjpOSlA==
=5R+0
-----END PGP SIGNATURE-----

--mngoatx2xdrr45s4--

