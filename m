Return-Path: <linux-i2c+bounces-7622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C69B2970
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493F31C219DB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE501D2B1B;
	Mon, 28 Oct 2024 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BivVRDzN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5B718D65C;
	Mon, 28 Oct 2024 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101077; cv=none; b=VVFgGXbRX00uh7+/rvwUhA+uPYIUqKVYRgrVT9OlICvUPQQDWY3VAp7fEYlOKigJUOqXHZGy9C7o4VcYuruZ/BJwS5C+jnqiXTRmKBdWmIEs0Nx2tRjtBozknIvwhMtp+kZQ16hJb/T7DOscsNpTyCo3J3gEh61tGBgC7lr+lG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101077; c=relaxed/simple;
	bh=ruN/420z3b1wnjd87sOahr4zGIjT2Cu7n4sM8yuT54o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6I52EEXPandAK0fUi9PU2/DQHDAA+0SHSw+JsZ6x99hPRtDKwKAVPQ9duBerPLk39X1BqITU6VjqIux3hk7MM8MWSKPaIP+tckR67dokgK+82qMJTKvVGf2fucc2nJYZyxxJVfGAn7aoLqA2j7sJcBmz4kVv4U39lwHB61zOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BivVRDzN; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e291f1d659aso4298171276.3;
        Mon, 28 Oct 2024 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730101074; x=1730705874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4OkPaMxm04jm0KOnFQqAtcSUWoQDpVpB5veezAdtVU=;
        b=BivVRDzNX1McrUUMZNQDvbkgQeRBNdmUgJ7Er0oYBcn9K34avvLD3oEaGgUaTbHx1x
         /8G4LgRE0gAcGa9EBdHu7LYp8fYU2VtZR8hDry0wgw5tBlU+fLgHCkGzo+I1nZaMhDKP
         xj96jtREsOkDk6pw33A2n6k3OF20801wk9fHbSa1M48YyjbfhOG1zqphgV+Lfk5hgZzP
         lozXBve/iOC6BPywWJa7cfps76y1FfZg2qqojGtpg/CtY++r8GgBO/nI+9b5ArcckHlz
         YbKLL1NssxziTqoTPv05RBM4za0+YdImTmR2b8fg/jGy0R/fSnAbZWbcGYRzvBLEgFYS
         YK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730101074; x=1730705874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4OkPaMxm04jm0KOnFQqAtcSUWoQDpVpB5veezAdtVU=;
        b=uh6cpaZNKMz5/KF9tJ5/ATNWWY/QDHHhbxBN9stUB6IjNp0OVSCG6Gc2zsOX6pYjqi
         5wc4xbmXyf30BeLm4h1qxRDNFMzpB/dX8KDGSlC61YqJHk9bRFiBXEGmF3eXhoTVw3yv
         pjE4C9CJQRgMJpj5Ig1XSzrg/1NivZz6nz7K+bpcK2dWDQUVQwBMQqgh23nqWNQSpsDP
         TtL5ikp5S+BCzcUtsd3znovKIUduuz9RN/hOsOMzOfpnTEuZgWpcYz870PEDX1qcdpzU
         Zd8M+UuqKGErFRMtgrYvTL/jcUQmB1m7jN1xcIPqkh3FlNkXoXM5u3cISDsTOLlXdxD8
         byWg==
X-Forwarded-Encrypted: i=1; AJvYcCUljvM14dO1itmfJszN/sOeY+0e34uKIfZjJ9MbSC7TPUqmxxqSKRo08FYE5IGHctciC+2r9q3gI4gv@vger.kernel.org, AJvYcCVG6e0p79tRhvcXkuVmr8o0VEqgGfN7vcCFFvr47dN0mQatGsObvo5ov0H/ip6VloHJfKAgn1F8NGmS@vger.kernel.org, AJvYcCVXbbsJh7SQ2caUhrFTPmu6PyyZQScIlrnhRumE8dHKGhBFYL8cQmi+DTfmv0r/a9IWDoxVKsM868y9nO8=@vger.kernel.org, AJvYcCVzXb7mwTmcDxRURyuKKLdFlP40K0IiBbRudcNgXIpd6eW3AfxNKyX0hAU35xDdabIj8AnznA1ghMpxWA==@vger.kernel.org, AJvYcCW6IivjeyKsnbZjg5mYG02IqsEIsUP15IHFAWGN3lDJdkGEJUUfkyzLvSpsDnb1FNbLF+ViMUyujKFX@vger.kernel.org, AJvYcCWFebGigia/lNUgzXHGtem6QABgZ3tLkCzJEJT20ZSC3n9c8dHcDRjpP3KGPqm5CRM9gqyloYteLBS+gmfP@vger.kernel.org, AJvYcCWOvSTUGInAH0KGE5GrRTT+fmVosyJmbEqMNwJ3cgXMUE4ckJen/wcPZvsYx0UUqqPzBAq8JlfdWQQuV//Y4/A=@vger.kernel.org, AJvYcCWcZsd6eN5X9BO65+CYasRM91Rb+Xgslrbo/Ed/lyhUx8tL7cyoJkL2ag7NgXZW8Wy/eG7iRLPH@vger.kernel.org, AJvYcCXFXVoTvsv9vvKj2TmNehY0ox+V2Abcp2TjaWI8qfBvotHovQK9lXjIW3523+sNOUA+VRE4w3u8Bq6k@vger.kernel.org, AJvYcCXVY2TLucS0HAPY2MbdqUxHn18OkgxV
 +NLpPyiS2wF2LzRHBFlm3x2uAv0HKrU8/FwClePOqN/XAxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNq5J9z0J/q4y+iTp6aEm3V5ykakSt5lS19PV8OmzQxpoiv2J
	IulPNWLOgopUfw9dYZej9P7/IPvgqumCp7tGutGlaJ3c9O5+BIGX9BO9Scq2K7ncc/hdI5p/528
	bfLLsRGF76F1qX4b5MK1751mN/SA=
X-Google-Smtp-Source: AGHT+IGG+sd5a6ZlflR/T5AMoo/rzP+HitP78/Q4CSUrJPoB5Q5bvXhaiPu1tpstJAYSFe9TTkXVw2vwpAQ+t7rdQnI=
X-Received: by 2002:a05:6902:2b87:b0:e30:835e:947f with SMTP id
 3f1490d57ef6-e3087c2253bmr4781623276.56.1730101074385; Mon, 28 Oct 2024
 00:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <5d1c39c3-b686-40ce-b8af-72dfddeb68da@wanadoo.fr>
In-Reply-To: <5d1c39c3-b686-40ce-b8af-72dfddeb68da@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 15:37:43 +0800
Message-ID: <CAOoeyxWd5D0bZ5S3zhF87XKgVgTgWsZFFpzXU-qv2hfMx6K1Ng@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christophe

Thank you for your comments,
I will update the code in the next patch.

Best regards,
Ming

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2024=E5=B9=B41=
0=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:58=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Le 24/10/2024 =C3=A0 10:59, Ming Yu a =C3=A9crit :
> > The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > PWM, and RTC.
> >
> > This driver implements USB device functionality and shares the
> > chip's peripherals as a child device.
> >
> > Each child device can use the USB functions nct6694_read_msg()
> > and nct6694_write_msg() to issue a command. They can also register
> > a handler function that will be called when the USB device receives
> > its interrupt pipe.
> >
> > Signed-off-by: Ming Yu <tmyu0-KrzQf0k3Iz9BDgjK7y7TUQ@public.gmane.org>
> > ---
>
> ...
>
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
>
> Nitpick: no need to init
>
> > +
> > +     interface =3D iface->cur_altsetting;
> > +     /* Binding interface class : 0xFF */
> > +     if (interface->desc.bInterfaceClass !=3D USB_CLASS_VENDOR_SPEC ||
> > +         interface->desc.bInterfaceSubClass !=3D 0x00 ||
> > +         interface->desc.bInterfaceProtocol !=3D 0x00)
> > +             return -ENODEV;
> > +
> > +     int_endpoint =3D &interface->endpoint[0].desc;
> > +     if (!usb_endpoint_is_int_in(int_endpoint))
> > +             return -ENODEV;
> > +
> > +     nct6694 =3D devm_kzalloc(&udev->dev, sizeof(*nct6694), GFP_KERNEL=
);
> > +     if (!nct6694)
> > +             return -ENOMEM;
> > +
> > +     pipe =3D usb_rcvintpipe(udev, INT_IN_ENDPOINT);
> > +     maxp =3D usb_maxpacket(udev, pipe);
> > +
> > +     nct6694->cmd_buffer =3D devm_kcalloc(dev, CMD_PACKET_SZ,
> > +                                        sizeof(unsigned char), GFP_KER=
NEL);
> > +     if (!nct6694->cmd_buffer)
> > +             return -ENOMEM;
> > +     nct6694->rx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > +                                       sizeof(unsigned char), GFP_KERN=
EL);
> > +     if (!nct6694->rx_buffer)
> > +             return -ENOMEM;
> > +     nct6694->tx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > +                                       sizeof(unsigned char), GFP_KERN=
EL);
> > +     if (!nct6694->tx_buffer)
> > +             return -ENOMEM;
> > +     nct6694->int_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > +                                        sizeof(unsigned char), GFP_KER=
NEL);
> > +     if (!nct6694->int_buffer)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!nct6694->int_in_urb) {
> > +             dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     /* Bulk pipe maximum packet for each transaction */
> > +     bulk_pipe =3D usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
> > +     nct6694->maxp =3D usb_maxpacket(udev, bulk_pipe);
> > +
> > +     mutex_init(&nct6694->access_lock);
> > +     nct6694->udev =3D udev;
> > +     nct6694->timeout =3D URB_TIMEOUT; /* Wait until urb complete */
> > +
> > +     INIT_LIST_HEAD(&nct6694->handler_list);
> > +     spin_lock_init(&nct6694->lock);
> > +
> > +     usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> > +                      nct6694->int_buffer, maxp, usb_int_callback,
> > +                      nct6694, int_endpoint->bInterval);
> > +     ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> > +     if (ret)
> > +             goto err_urb;
> > +
> > +     dev_set_drvdata(&udev->dev, nct6694);
> > +     usb_set_intfdata(iface, nct6694);
> > +
> > +     ret =3D mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
> > +                                   ARRAY_SIZE(nct6694_dev));
> > +     if (ret) {
> > +             dev_err(&udev->dev, "Failed to add mfd's child device\n")=
;
> > +             goto err_mfd;
> > +     }
> > +
> > +     nct6694->async_workqueue =3D alloc_ordered_workqueue("asyn_workqu=
eue", 0);
>
> Missing error handling.
>
> > +
> > +     dev_info(&udev->dev, "Probed device: (%04X:%04X)\n",
> > +              id->idVendor, id->idProduct);
> > +     return 0;
> > +
> > +err_mfd:
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +err_urb:
> > +     usb_free_urb(nct6694->int_in_urb);
> > +     return ret;
> > +}
> > +
> > +static void nct6694_usb_disconnect(struct usb_interface *iface)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
> > +
> > +     mfd_remove_devices(&udev->dev);
> > +     flush_workqueue(nct6694->async_workqueue);
> > +     destroy_workqueue(nct6694->async_workqueue);
> > +     usb_set_intfdata(iface, NULL);
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +     usb_free_urb(nct6694->int_in_urb);
> > +}
> > +
> > +static const struct usb_device_id nct6694_ids[] =3D {
> > +     { USB_DEVICE(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID)},
>
> Nitpick: space missing before the ending }
>
> > +     {},
>
> Nitpick: usually, no comma is added after a {} terminator.
>
> > +};
> > +MODULE_DEVICE_TABLE(usb, nct6694_ids);
>
> ...
>
> CJ

