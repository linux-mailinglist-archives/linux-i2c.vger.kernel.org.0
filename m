Return-Path: <linux-i2c+bounces-8461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE349EDFC9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 08:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA0E286244
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 07:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3B5204F6C;
	Thu, 12 Dec 2024 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WolaB3IN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF3288DA;
	Thu, 12 Dec 2024 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733986926; cv=none; b=gwVxsc9vPw2TOpjMq+CBX+Rw/0B+qf4H6YSkhm3AmUx9cPNyzLAvJN9iyZxyqmKbUg6j8fWj2Vxff/DEw/3//QwbK1D7YNcihtOCgVyP9uxqbvWsFjC+wJUww069AG4fbAv/M9Jmzp5rxN6pBVDyKmec3q7iZx5d9pNW6gDygvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733986926; c=relaxed/simple;
	bh=wbTqd8TPPjxYXP1zKGXFI2x00mOdOXssSkhfYc/0fgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUSSFqoNXOhEGW8r2QoLyESCF7grZfhBKqUIUETlBUTMjRYVKunUmkmLBIFxeKQUCf+yl9uZD2XRkc+zRznknowWm13bh94zs+E/l1BVdgQBv45WSDD/zNcsFK0Gx0yM9demcH8zND89HaoBG1BUG9dsaSrj5ahoXILfsnYR8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WolaB3IN; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6eff5f99de4so3223987b3.1;
        Wed, 11 Dec 2024 23:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986924; x=1734591724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKrPssl5ptxpuCfiwGMsPZMTvrn0Pjz0iVG975wfYS4=;
        b=WolaB3INgbL7Da+sXx4uDyH6IIA2r59PmatBOc2DcDuwGxP9f2mq1A7FLeEnXOEPmj
         1EcEnUG1L3rNI43MEV2ldTTPj1mpAx7RgFygakiQtFZNBLUcNYrRxx0jK5XkASAEruKZ
         xnwK/fHlajrHBjyI2HLZ0xGFb1P7QgvvMlurTM9nut1aT6pMuS3Tab5akEXvaRBtKuMI
         gOXepV5crYoiQFQbH819IHfAeqtfQe1f9yY6odyCRz4V8j9lTEn2UtGu/+q33S3Ahgx4
         mlS+ydNGEXN81AgsPVbUcs/9cEr61/pC+HD5K/8JIjib99xDpUX5OHGgfvtSx/xKXyaI
         JHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986924; x=1734591724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKrPssl5ptxpuCfiwGMsPZMTvrn0Pjz0iVG975wfYS4=;
        b=W/LSsQMTKzYPH9MUiw3dRufmcVyQ1tHDKRLolIF5A2kHiZzx/K0iV5PPRQtAHu0x3z
         +Jutb92+JrBod3AsTT/Lr0QzvoqzgEqZkL9ECJugPWM74ZnckBNDCFHeJGRLoRJm4kOk
         Jh7r974bMgNrl7IQ78KthsDm/B9P4IHyvS9qe1ZOPwblfndr9JCHLh/IQlXKqV0/cf0i
         s6Z5suxa4B7Ve++5ex1GZm58dgS/eJC4hXrVCo0u3snT5cYm3aWuv8ijckv9Awra+WMP
         w6wS0gk4/94vVm7mplzDJQFq11UlIexvVOWQdJJBLP/mo8XqmHEypnX3B8kvvw8rRzZl
         UaHw==
X-Forwarded-Encrypted: i=1; AJvYcCU6VyTAW/5UuNCcOf2Hf0rsGs89Csq5thdPXxXQJWNR0HeGI1490NnSnzHsymVYUAdntKevz8/e@vger.kernel.org, AJvYcCV/Zx6W8XO6m3CiXWKKpUlyAy7RAaTBtse/6iKruF/BIjtiHvJe6iFIAFmI5pn6uQgErcTYgnqexH02@vger.kernel.org, AJvYcCV2OLZ1b2Y1c9oHx5e8Sy4zoxkLO9oNlnwEocEI7w80wlmKAOK0fLGEli34D0Qv5pNDwL64Shixfo3huCA=@vger.kernel.org, AJvYcCVvFA6CTF+dzAwXgU7rqHVLVNI2P8q/XZJSvAlfSxDq2RK+02jl5mlfPLBqqgBclZK3IWBX+mKUXPY=@vger.kernel.org, AJvYcCWBzwcJZF18YkVkLDa2gZOyaucL++/624pkLczBZ7TnhoBLvFT9Kgm/XAMSiZQVCWXsWb2TCAnnZLTG@vger.kernel.org, AJvYcCXSaUcvDk9SfaWOmB2Re8cZP0eWzz0JHIozyzLbJOEf+ceMTW2GnF8G2KArMbqjQLT/ztj85aPDgNjbJdxSHkw=@vger.kernel.org, AJvYcCXxNJUNOublxZW0+fku9cobwQGiYYEYAibCLWwsKvk0YxbvIpkZVDblF+hGb2N3CD6Ky0OjZi7b1xo6bA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz8P0hxAK0vLbWPzhJa/IVwskoVvdbxMSQZw+0sXJ34aoHWfxe
	0XjePH6JkbfkXjH4pvaj47F/eILIiC//TFshGalPKcnG0p8DZEEEDciB5+qhQ1Tv9CawCgM8lgK
	4b9MigUAa4lhaE1nHv31mEh8z68E=
X-Gm-Gg: ASbGnct7hMz3F1NHjMFYCa5AyEmBzzSljNAsWBY2b4H9JHIMIOLnlECaEfu65LSnzaV
	LtVLavGypU7s2TX2G+p4OW4BE3BHSi+qkRjDIQS7gUUiKCFcPeaXOKPFBS5mWh+aPwbh/dc0=
X-Google-Smtp-Source: AGHT+IFhv4QyHcNAajVgFrqbIVUujoYsNm1PsFdg3x7M+LbdO2uCN7G0YuFwTVKJ2c8fgexcq19wksQCuFGSHyGv1xQ=
X-Received: by 2002:a05:690c:6e03:b0:6ef:8122:282f with SMTP id
 00721157ae682-6f1a508837dmr20566937b3.24.1733986924068; Wed, 11 Dec 2024
 23:02:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-2-tmyu0@nuvoton.com>
 <47f720f8-90d7-4444-bfde-fb76ec2a2f0f@wanadoo.fr>
In-Reply-To: <47f720f8-90d7-4444-bfde-fb76ec2a2f0f@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 12 Dec 2024 15:01:53 +0800
Message-ID: <CAOoeyxXC5zj5R1qV-WSakJmh_q8vK0oh_sjg1VZK=dvhaZdYCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christophe,

Thank you for your comments,

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2024=E5=B9=B41=
2=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:44=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> > +                  u16 length, void *buf)
> > +{
> > +     struct nct6694_cmd_header *cmd_header =3D nct6694->cmd_header;
> > +     struct nct6694_response_header *response_header =3D nct6694->resp=
onse_header;
> > +     struct usb_device *udev =3D nct6694->udev;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
>
> Nitpick: This could be moved a few lines below, should it still comply
> with your coding style.
>

I think the lock should be placed here to prevent the cmd_header from
being overwritten by another caller.
Could you share your perspective on this?

> > +
> > +     /* Send command packet to USB device */
> > +     cmd_header->mod =3D mod;
> > +     cmd_header->cmd =3D offset & 0xFF;
> > +     cmd_header->sel =3D (offset >> 8) & 0xFF;
> > +     cmd_header->hctrl =3D NCT6694_HCTRL_GET;
> > +     cmd_header->len =3D length;
> > +
> > +     ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT=
_EP),
> > +                        cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_=
EP),
> > +                        response_header, NCT6694_CMD_PACKET_SZ, &rx_le=
n,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_=
EP),
> > +                        buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->=
timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return nct6694_response_err_handling(nct6694, response_header->st=
s);
> > +}
> > +EXPORT_SYMBOL(nct6694_read_msg);
> > +
> > +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> > +                   u16 length, void *buf)
> > +{
> > +     struct nct6694_cmd_header *cmd_header =3D nct6694->cmd_header;
> > +     struct nct6694_response_header *response_header =3D nct6694->resp=
onse_header;
> > +     struct usb_device *udev =3D nct6694->udev;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
>
> Nitpick: This could be moved a few lines below, should it still comply
> with your coding style.
>

I think the lock should be placed here to prevent the cmd_header from
being overwritten by another caller.
Could you share your perspective on this?

> > +
> > +     /* Send command packet to USB device  */
>
> Nitpick: double space before */
>

Fix it in v4.

> > +     cmd_header->mod =3D mod;
> > +     cmd_header->cmd =3D offset & 0xFF;
> > +     cmd_header->sel =3D (offset >> 8) & 0xFF;
> > +     cmd_header->hctrl =3D NCT6694_HCTRL_SET;
> > +     cmd_header->len =3D length;
>
> ...
>
> > +static struct irq_chip nct6694_irq_chip =3D {
>
> const?
>

Fix it in v4.

> > +     .name =3D "nct6694-irq",
> > +     .flags =3D IRQCHIP_SKIP_SET_WAKE,
> > +     .irq_bus_lock =3D nct6694_irq_lock,
> > +     .irq_bus_sync_unlock =3D nct6694_irq_sync_unlock,
> > +     .irq_enable =3D nct6694_irq_enable,
> > +     .irq_disable =3D nct6694_irq_disable,
> > +};
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
> > +     struct nct6694_cmd_header *cmd_header;
> > +     struct nct6694_response_header *response_header;
> > +     int pipe, maxp;
> > +     int ret;
> > +
> > +     interface =3D iface->cur_altsetting;
> > +
> > +     int_endpoint =3D &interface->endpoint[0].desc;
> > +     if (!usb_endpoint_is_int_in(int_endpoint))
> > +             return -ENODEV;
> > +
> > +     nct6694 =3D devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> > +     if (!nct6694)
> > +             return -ENOMEM;
> > +
> > +     pipe =3D usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> > +     maxp =3D usb_maxpacket(udev, pipe);
> > +
> > +     cmd_header =3D devm_kzalloc(dev, sizeof(*cmd_header),
> > +                               GFP_KERNEL);
> > +     if (!cmd_header)
> > +             return -ENOMEM;
> > +
> > +     response_header =3D devm_kzalloc(dev, sizeof(*response_header),
> > +                                    GFP_KERNEL);
> > +     if (!response_header)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_buffer =3D devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
> > +                                        sizeof(unsigned char), GFP_KER=
NEL);
>
> Why for cmd_header and response_header we use a temp variable, while
> here we update directly nct6694->int_buffer?
>
> It would save a few LoC do remove this temp var.
>

Fix it in v4.

> > +     if (!nct6694->int_buffer)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!nct6694->int_in_urb)
> > +             return -ENOMEM;
>
> ...
>

Best regards,
Ming

