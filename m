Return-Path: <linux-i2c+bounces-9637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E6A4940B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 09:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB563B0425
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 08:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66626253F30;
	Fri, 28 Feb 2025 08:53:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E324FC08
	for <linux-i2c@vger.kernel.org>; Fri, 28 Feb 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732788; cv=none; b=Uam03r7kJtvbuYLBAQAZrfX0olsWbPr+9dDg5Ly1PhUKyscVOV6njvtf216+l7a++hgWYw05XWvd/A85274WI0kTIy8nMnTYv4OqctYpM4IsS9EoHZ4tXrGVT+LJsLh0LSDI0WlJyXRfgGATCWlYKfgdBw0rfDfD1/mnJSu8XB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732788; c=relaxed/simple;
	bh=qNe0LEGqpQQi8GIgH/wydL5K/ZSIvkZpuYesUP7jE8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjP5gpvPpCRZLgE7xin6T/aH9ce7kNDvDq+nCl8SJIelYT993QVO4xsa/UALbFFQb6Zp+q9QPw3fdB+MOv7T8ZnL9XWfr761gGyOVGuDlk4W66Srb27RaiEAzaYDtPneb4oUFAFVk4sPK9igt/ffeGOxiAmcIXuah13r4LslXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnw6m-0005fo-VB; Fri, 28 Feb 2025 09:52:36 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnw6j-003GS3-27;
	Fri, 28 Feb 2025 09:52:33 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 28E693CDF52;
	Fri, 28 Feb 2025 08:52:33 +0000 (UTC)
Date: Fri, 28 Feb 2025 09:52:31 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250228-married-bullfrog-of-reading-89042b-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thau7tfhkoq4fek3"
Content-Disposition: inline
In-Reply-To: <20250225081644.3524915-2-a0282524688@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--thau7tfhkoq4fek3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 25.02.2025 16:16:38, Ming Yu wrote:

[...]

> +static int nct6694_usb_probe(struct usb_interface *iface,
> +			     const struct usb_device_id *id)
> +{
> +	struct usb_device *udev =3D interface_to_usbdev(iface);
> +	struct usb_endpoint_descriptor *int_endpoint;
> +	struct usb_host_interface *interface;
> +	struct device *dev =3D &iface->dev;
> +	struct nct6694 *nct6694;
> +	int pipe, maxp;
> +	int ret;
> +
> +	nct6694 =3D devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> +	if (!nct6694)
> +		return -ENOMEM;
> +
> +	pipe =3D usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> +	maxp =3D usb_maxpacket(udev, pipe);
> +
> +	nct6694->usb_msg =3D devm_kzalloc(dev, sizeof(union nct6694_usb_msg), G=
FP_KERNEL);
> +	if (!nct6694->usb_msg)
> +		return -ENOMEM;
> +
> +	nct6694->int_buffer =3D devm_kzalloc(dev, maxp, GFP_KERNEL);
> +	if (!nct6694->int_buffer)
> +		return -ENOMEM;
> +
> +	nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> +	if (!nct6694->int_in_urb)
> +		return -ENOMEM;
> +
> +	nct6694->domain =3D irq_domain_add_simple(NULL, NCT6694_NR_IRQS, 0,
> +						&nct6694_irq_domain_ops,
> +						nct6694);
> +	if (!nct6694->domain) {
> +		ret =3D -ENODEV;
> +		goto err_urb;
> +	}
> +
> +	nct6694->dev =3D dev;
> +	nct6694->udev =3D udev;
> +	nct6694->timeout =3D NCT6694_URB_TIMEOUT;	/* Wait until URB completes */

Why do you need this variable? You can directly use NCT6694_URB_TIMEOUT
in the usb_bulk_msg() and friends calls.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--thau7tfhkoq4fek3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfBeUwACgkQDHRl3/mQ
kZwj8Qf/ZqqBAFXxAYb+Ol2EYuIUSztYKNYnXALK+Hmv/b3tCAl+WuYuPRuK3nal
tYrpJPUVfYcm7WGux3J3oGKiRAZDaOMCPHitSwdEscltvot8zwcA0hHcKqL7Itij
Qu5x/rzaoPfQAc7vMQ1EFTQZRJEtrQUP2xe4c4tH+bSDbG0rWNy7I824ATNnl8mi
UlFsGcRv6QZB0DtF7LX4qme7Ufm2+Io91ImVCkN19DH2Q3yW6rjTyQwEs9ZNBsgj
X9rbbaIqxYYtkYD+4oJ0wC6OqIBhyuzTJvOWp8WOUb3rjgCuELkVrST4Jz86u/oy
/+qVxFkZP/3CWH8ORdrd3TAfXxZSUQ==
=5Ywe
-----END PGP SIGNATURE-----

--thau7tfhkoq4fek3--

