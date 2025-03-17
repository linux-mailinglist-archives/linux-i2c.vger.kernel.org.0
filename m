Return-Path: <linux-i2c+bounces-9842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFDA63B81
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 03:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001E93ACF3B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 02:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B2E1547C9;
	Mon, 17 Mar 2025 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnlD1Ep4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8C028E8;
	Mon, 17 Mar 2025 02:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742178421; cv=none; b=Frvy59g/8B7c/nPSxHDXKkCnpNB1KuU3KfExS4AcoDagMcYi/6bIC3cqD4mRs9kTUJ4cEK9TwwaCF0hi5RhwzfaRL7jjRC7wPhoxyCXxr5AC53urJmZMDL8YxJA2bc+uIXZxWRA6BXOfQKUwImjOHJiIoHa5NcpEYxq2BvY0dfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742178421; c=relaxed/simple;
	bh=5vhLGktHPhjtW/GXQtwrN69gvCvTY5yz3MTavCEdYw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehTXqy5CavtEsGpxAP7uGl6n1yr4hXl0DS5CFQWudG22oGtNKGCqAmnv1sWyhMnsaDWdTttyo5PMv0bRMuTAm+mZTPFLLFa+DnhivhYnrAAp2NLbJqW+iCxBDnAyS9pWIlPk0F2TQJ+m5ASGHIUdct6Fu0bCA20HcVsZ9ZWj7ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnlD1Ep4; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e6405b5cd9bso1616136276.1;
        Sun, 16 Mar 2025 19:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742178419; x=1742783219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu2GsgQsdgmuAVjnZCRZ1iMk0CgeXo/QNGYVH+hlGfc=;
        b=YnlD1Ep4o+5teNy3L1E5To2v2+40ICRA4N9P7v5b/7WQJSa9t4Evi2ZPiew26ynNc4
         A1K/TS7uBheNRVUiDToC+k1Gi1RmVHJmGDiwzBZOpsP5GbsoAG5RZtOMXOizIZqzOlp5
         qIHZdMYOPIJauCwwO05lt2FRZNTE+QjoXAYJa9TIOfBP8xz5VtjfvYhn7zsJrp6oV9Cv
         Xwrdb1EjEDtTzIzjMFEwlk3iSImXQuEmINwlLOROo2BkdZy8uwzZ8i6fh16KNz7kfnyu
         XHXu42uuuO940q4Q77MRbmid6gIxyeb37hnAFoyl0YChvJ8MMGbZw3tpyxkcCEgqtNUj
         klgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742178419; x=1742783219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu2GsgQsdgmuAVjnZCRZ1iMk0CgeXo/QNGYVH+hlGfc=;
        b=YDjTPGE4/GvBswB1Wnk9uzm3dzWrbwgA1FtqxPXLpP5PmDSWVx69THR54bn3v3ZWfT
         RyWgGGwSPgjThJFMAM4v7vGueiyE12w+y+JvZsH30eLlpixzpgurGK0/qAnqxhsRqLHO
         +osmFzuWatjnp7cgkbgl0j6srz2FZTTZRv9hTiG6KoDcrVjvuj7OvtR06OcSo30SUzV2
         tu0DB2G9P93wfmlyPbSKICPb0phAFo6nAjPrQm2y+uoAxn3aCAc9xaTP/i8+ivXBl3JY
         AjhP/hPH9f9diKONwS+V1xk9Z2HJfSM6ElnLYfsPqhluyn1kO7P902GtP3G3hnybR27r
         1ZYw==
X-Forwarded-Encrypted: i=1; AJvYcCU7aqef7lyWlTUjw5nSK2MQR3m2jf1E+pxVaVYlSU0+YzPHjLaB8ugt7qnXA45I1veBD7TVTKhUCBez@vger.kernel.org, AJvYcCUTuJw0yjT5GiraBIu2DG9KbUTqQD2xQyAq8QLSGrT6F+LcDxwyuIua3XsDHPLr9U/UCXHVrypFtX8=@vger.kernel.org, AJvYcCVrEXB3tM/NaXbcC4UJwWkomVMGfJwPZuGo1aGX8EfNUCOAklC+jLdt8kQ6Tvzjb0KVDKAQ299TngwaxKQ=@vger.kernel.org, AJvYcCW0ln1rWRDtcXOJr82j1RI7AGzOVOeCg2H/BgvFr8Id7Wkg/rwuvPuGNDp9diOfiqXeaJTdlBPjcWgt46yg@vger.kernel.org, AJvYcCWBGwHlJlvgDQ8oEOIy6R3QYSYuHOpKpflOx5ylVKsgYgr2OEywFRA8l4K0EHLIwr27B1E2TiJzsxGgYQ==@vger.kernel.org, AJvYcCWRL87U7AzdJZGnEr+bwgEbQsbXnNRqEFVzPw1+dvCV483LeuQW2PZfowACNbw7i/rVUgw0p/yi2mIE@vger.kernel.org, AJvYcCX4stDUfr6Gw9wzVFHSaTcvQBVNbPxI1XCpPxI1fiyGhFkkRnzeh/oDXG+I9goZRT088CK1gB4A@vger.kernel.org, AJvYcCX5Y8Fhf5bt9HcS3+o/oehqXRBzCVvLeXAwk11BN4x6q7TjxBDunyl5063brhXbyRS74gdwW83Kt2OCu0SthDI=@vger.kernel.org, AJvYcCXR3U1boaaf/LdZ6ViIiEGo6HeIGYkAM/eU5PTT/i6Ln8C6E4s8sIRY9XlXAEks6eC9IOpv/4ilZWtL@vger.kernel.org
X-Gm-Message-State: AOJu0YwMYx1od/RW3jq9NJYmarohorzuDsCibxS76dgX0snd45Jvi3lt
	nZhvpR/AZB+RSxF/UyChs9G0h8xZZnqdDykbgfkkEdSP5MPCaHyc3ETnSTkoPoujghQkx7fOsIN
	BHwHp0uUuUlevZ0IQ7m5RKexTNHU=
X-Gm-Gg: ASbGnctIxYEkLumvGfmejiVRt81b5FxtdPhYQarzko5QYC/l/z5WEPxzKA6qgUy0tI7
	QpfqmoyzK6Wsw1jiZ+SNF0+jnJw0Z2+Fm4k6Gxm4jXXajXCCa8hGIm1Oksw35evsSWmYme5VpAi
	UbxpEUD0kCjycB5eKvhBiR+cceZc2NEV352/Z+eZrYqyUB0Pgf7yjnrcp/rrvMVi1QwmUUpg0=
X-Google-Smtp-Source: AGHT+IHrNs3BjFu4lZLRoyKVBpzLNfOIlauSqHuJLzyLvOq1H8+kKGrfADJGl6Sbe6IxIIMg72a3jsbz5evZ/CbNya4=
X-Received: by 2002:a05:6902:2788:b0:e63:c936:c07f with SMTP id
 3f1490d57ef6-e63f870c83dmr12994290276.2.1742178418960; Sun, 16 Mar 2025
 19:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com> <20250228-married-bullfrog-of-reading-89042b-mkl@pengutronix.de>
In-Reply-To: <20250228-married-bullfrog-of-reading-89042b-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 17 Mar 2025 10:26:47 +0800
X-Gm-Features: AQ5f1Jp7tg2D7CsEfZE57l_02NxRc7WNgBELb0_1TanqpJB_kChtq-QCtEIIQLU
Message-ID: <CAOoeyxVqeuThjodnN61HLAKkuwSjCz0Mdd2a--icafPwHv_aiA@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marc,

Thank you for reviewing,

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +static int nct6694_usb_probe(struct usb_interface *iface,
> > +                          const struct usb_device_id *id)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct usb_endpoint_descriptor *int_endpoint;
> > +     struct usb_host_interface *interface;
> > +     struct device *dev =3D &iface->dev;
> > +     struct nct6694 *nct6694;
> > +     int pipe, maxp;
> > +     int ret;
> > +
> > +     nct6694 =3D devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> > +     if (!nct6694)
> > +             return -ENOMEM;
> > +
> > +     pipe =3D usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> > +     maxp =3D usb_maxpacket(udev, pipe);
> > +
> > +     nct6694->usb_msg =3D devm_kzalloc(dev, sizeof(union nct6694_usb_m=
sg), GFP_KERNEL);
> > +     if (!nct6694->usb_msg)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_buffer =3D devm_kzalloc(dev, maxp, GFP_KERNEL);
> > +     if (!nct6694->int_buffer)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!nct6694->int_in_urb)
> > +             return -ENOMEM;
> > +
> > +     nct6694->domain =3D irq_domain_add_simple(NULL, NCT6694_NR_IRQS, =
0,
> > +                                             &nct6694_irq_domain_ops,
> > +                                             nct6694);
> > +     if (!nct6694->domain) {
> > +             ret =3D -ENODEV;
> > +             goto err_urb;
> > +     }
> > +
> > +     nct6694->dev =3D dev;
> > +     nct6694->udev =3D udev;
> > +     nct6694->timeout =3D NCT6694_URB_TIMEOUT; /* Wait until URB compl=
etes */
>
> Why do you need this variable? You can directly use NCT6694_URB_TIMEOUT
> in the usb_bulk_msg() and friends calls.
>

Okay, I will make the modifications in the next patch.


Best regards,
Ming

