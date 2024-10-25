Return-Path: <linux-i2c+bounces-7568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F29AFBE7
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E3D1F244F5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC0A1C7B75;
	Fri, 25 Oct 2024 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQTivFSN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AEE18C029;
	Fri, 25 Oct 2024 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843391; cv=none; b=YsprWUVz+lctpu5J3xgPbKnxx0I/3gZ85GpjHTVVgkaOHHnLpxoMHGeIwGzwcKJgYqBWzKKDh4dC+EjgOL71eXLtNqBBxJVgAhprMJDjwilKZuUZxo8SXEGThPlEJo4Jx4Z/bUTpVBFviemTyk/tUSxz/7LVaBGqOvReSDl3Hbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843391; c=relaxed/simple;
	bh=2VSpbF9QgUyzaQEWrQk8hJO6e6PKVeTvG1IyDPemi5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tjhr3GhpnpkYKNduRRuPlf3qgLd4fxYxn1jZSIE88GrUtbcIO4kucdB4PvjBZ/xZJX4iEwVWhP32e3O1MPVMH4dske048s7HgaASHLrm1b/Y/4uknKabn7RlUAy/dFewI3haexZAMforFlVtMBJBoyPVHs/4L/GJnRbbTqGqs/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQTivFSN; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2e32bc454fso1891551276.2;
        Fri, 25 Oct 2024 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843388; x=1730448188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIKVp8gwvgvokOujtTW+vUkLfr6ndcUZeZvgHv9P0I4=;
        b=DQTivFSNrIk5FRaPc/6B6E2G6dY35XK0LtrfcI5mZooc1/Tx7s5LmC61q7dPDCu6Z/
         Ewr3K3xAfrqOn/xbZl5tzolwhWk2bdnLRkxsCOcGBEif6bVXIV4ynAkRSXOKaUsYvDI1
         +M7JfZb6YDZXVHUmBlHXAeQ/B95Ip2MHa6XBVEjrCPoX885QtubTnP1ABKZR0xX8Khcj
         xGtYCq+8Ot6NIsfISL+iI5j3vmYeEeL3q0yn9sHQWSw98/sThhiH4j5/ShUF5X6Pe+tS
         A9i+H64C/+Abfa2EFoGmz/D5UdnPyyHJNmeHZb2BgBuh/qAmXACrynwMo8VBeXEAZ7Ut
         z6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843388; x=1730448188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIKVp8gwvgvokOujtTW+vUkLfr6ndcUZeZvgHv9P0I4=;
        b=VmwvuMk7aCHzCuITyoiXsJfh+9O2J0IbKs0IQVWFTDMT/pyZseMzt9TsFjpEbL6Xgv
         8fkseo3tzjLR6lh66D46Bv/ud5vy9SRmz7odWCX2z267CRAH4JQGRqQF6iBcvag+1VT9
         cWEWaZ3RJ4Npi6XhYDmY1E2pQ1mH/amleaGxMLAgmpj74nRfcyiGXhLCODUw+NzxzgWR
         ABs4vzeNmD36s+rxmQ1XKTiGggzZPfVof9vD7MCnLTkmhBeBZT4OCy3ejgG3vqY8ZK4w
         8f6BgunZq6/ur9YTqBEa5MAGV1GY4F1+dvkDPVshs8hQE2I5c4iDUb712VLd5Z/zDcVx
         tWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJSKf8W12eTdDcc+bdjdVsE0OOjOfah7KCs4AEbx+qxV0fiMOGDD/8zoWUZ2GCtBwxUQwp4fEUkcXS@vger.kernel.org, AJvYcCULyOqNyFAyhEBISmwt+d3LcMdRcxqtb/mXuvZiCPAjsuLRcXNuhAOBzJRmsNMiChsgh56YuDmwYYWI@vger.kernel.org, AJvYcCV/ilkeK9CtcBVn2l2vhzALuTm/wnoBFFTjNw2AuthH8wunpwINxQueIr0jYkd9rDTvYTKt/oEGLSnN5Q==@vger.kernel.org, AJvYcCVDjnaLce124BMnt2TDy1vPaUy4W9WoPoMA5xrKk6gyUC6RN5InhkCt8nT3Rz29F17tM/ZoWklppozAjPpT/WY=@vger.kernel.org, AJvYcCVmNjPYVbLibk6Y+Z1/dJpDYaWz6Cz+i3PpktxXDvfwPcK3Aq5EBXny1FnASCoFa3Q9bA3Z3hSpw8ch7UHi@vger.kernel.org, AJvYcCWZqpztcCYyGYBN05od2gBz4TDH9fDb9D7sQDtDiGoAmaktyrrR6B1SuMVNngg8Nevdna/ohT5u@vger.kernel.org, AJvYcCWyLKI8kXh4hCQFGon8u56fcA6xbE5o0gPDwgqOS7OcqWPCuCkllOH+KVippsInQUGx3vk1i9mVkZ+U@vger.kernel.org, AJvYcCXEreK7yeJzyabJBC6crAg0X6jtv7YSQLfGCCpKZnxAlYWUh9RRIlnj43XAzMxBE/S80e/zHpq2EQN/4xg=@vger.kernel.org, AJvYcCXIrkVouW0e6wEP/VGHuUnQgb84bk9WpbLOPRzhHckB3HjXKw30zmQD1rxyD3eCdJ3l0UMeDXDcmTiS@vger.kernel.org, AJvYcCXMSXDylsUGGQzbXk+6g5yTNX9mNvDj
 1iPAYeM5XPdJ4q9KmvoHWE8NZJI4IHh8V5uV7+RWnrHmVWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0mT/5nM/zwdqSGX+xNE/75aYcNAnF9IzbQCybYAg4LhLqVJb
	y0Q9GeeBYtvmuLfGNR7kty2N1dKYhCHUteMMoxAXcfz5GEzbCkhSAoGvY+qtJw49TsFSXXERv1s
	jd4GCJTm/YYfFjqVGKvgckbO+8oY=
X-Google-Smtp-Source: AGHT+IFhrGBtY0FaeflceMDB1cNsUQVzIQ4voOhihnV+lleVBBTJOSnfbOCIkX3S7pNEnyVeC1zDaDXZcGY1K2C1DNM=
X-Received: by 2002:a05:6902:2086:b0:e2b:d7e4:e5b4 with SMTP id
 3f1490d57ef6-e2f2fc077b2mr4962592276.51.1729843388381; Fri, 25 Oct 2024
 01:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-ladybug-of-silent-holiness-498562-mkl@pengutronix.de>
In-Reply-To: <20241024-ladybug-of-silent-holiness-498562-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 16:02:57 +0800
Message-ID: <CAOoeyxV=tziXgDKZr+deGpm5xjNiHgd5ykW04=JT6ESnBN7Xmg@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, resending this email in plain text format.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:57=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 24.10.2024 16:59:14, Ming Yu wrote:
> > +static int nct6694_usb_probe(struct usb_interface *iface,
> > +                          const struct usb_device_id *id)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct device *dev =3D &udev->dev;
> > +     struct usb_host_interface *interface;
> > +     struct usb_endpoint_descriptor *int_endpoint;
> > +     struct nct6694 *nct6694;
> > +     int pipe, maxp, bulk_pipe;
> > +     int ret =3D EINVAL;
> > +
> > +     interface =3D iface->cur_altsetting;
> > +     /* Binding interface class : 0xFF */
> > +     if (interface->desc.bInterfaceClass !=3D USB_CLASS_VENDOR_SPEC ||
> > +         interface->desc.bInterfaceSubClass !=3D 0x00 ||
> > +         interface->desc.bInterfaceProtocol !=3D 0x00)
> > +             return -ENODEV;
>
> I think you can use USB_DEVICE_INFO() and remove this manual check
>
> https://elixir.bootlin.com/linux/v6.11.5/source/include/linux/usb.h#L1056
>
> [...]

[Ming] Okay! I'll remove it and change USB_DEVICE()
to USB_DEVICE_AND_INTERFACE_INFO().

>
> > +
> > +static const struct usb_device_id nct6694_ids[] =3D {
> > +     { USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(usb, nct6694_ids);
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

