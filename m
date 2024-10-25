Return-Path: <linux-i2c+bounces-7571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6949AFC4F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D9D01C21B1C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D971CC8AB;
	Fri, 25 Oct 2024 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh/nAKIS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6A1C2DAE;
	Fri, 25 Oct 2024 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729844057; cv=none; b=cJWi6C186B2SSuLx5oKw+fPDGs122p4XYpDhxn7Upa+8vuOlHV5/9mUqTm2nLjb52ro9K9Toc/T/+FpUZsEtX7sfN7EDCJHG2vmRdlsxwm7nYz4kPcCtGYSW9JVlfMAAnGy2uWm+GnZ0PbEuDiIqPB73A7sqqz3OXXq+9ahf4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729844057; c=relaxed/simple;
	bh=TAPPHqL2n0Xwr0NoSH36sJST1F+aVdGWi2GdH3wNlac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8wrkyWyYpfIl+qqM9OdfTq+oTARwv956g7Nlk3NemHIDlTQitDzDtyM7Ri7sWMoyqM/IRT036u6+GFULufFEaUrlSuVlJ0jeYFwcy85RvGCmkUbYSKt55A/5oO+1/A4FboHKJvTw0HcnvKuZxQqLiH/c3lpOnxFH/+1RbUFHe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh/nAKIS; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so2024195276.0;
        Fri, 25 Oct 2024 01:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729844054; x=1730448854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo/S0Z9d3Mx8O5eOyETMe7V1wC7hFxb1IEsYWjqKqQk=;
        b=nh/nAKIS3FbBfoLoBgjLdhr0aWMyaV3WkBjsucXN2YtFubXXHdw6Tng/jki6jAXQUO
         kvdAbadwuBCBLylNT49FmCj7iloOP3BqqNbrzxucsD0EVWgzALKX2hONsl6ezCrjYfnC
         F7hgoXQu4Ouf/oH+R932aLC2GvuhtbOQlt25eGny2t3faex/gVOeXikWNYxqLXxzxZoO
         APOWsanguH1/YIMTgbBREPEkuh7U8QLJqEf58HD+GVWYsrSKAWaEQ3o+JYgYOmwWG64Z
         HBkhBPqAVb727kLGRWgNlqjqQNtKTnIEDUM76XyFH8HchQqc8mQxVB+7yiM2B+wq3VeW
         +ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729844054; x=1730448854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jo/S0Z9d3Mx8O5eOyETMe7V1wC7hFxb1IEsYWjqKqQk=;
        b=T9xiiFY2X9S4/GaIYAA7oU/c4CL3KzSid2z3jUqt+K3kvofh5UJknDOmxaRzKlRqbx
         o8LQ5S8lOq6KwJ5wntPBKnMUasIRTHL2ux1LNUlrNjI3p4kAki6gJMWanjCaPxfezKKB
         rMy1Zhn2TyrTVN2bibaLaTlVO0rhtIXlKPiVpAoHeffF8IJIQpEM9uIDy5DAKXU4hF7W
         9Tq6vyS0L0IFw1zmTcJtvSVNz6XXbJ0ej55jtY/TbGNDiNAOXwGnNSDQQVIOxXx9VTT9
         sdF6k8dcKneurJs39lkYcxAYiMIaS+2K4NsEn9BDVve0KQn8kqq2QY5BCQro1StdAuhA
         C6YA==
X-Forwarded-Encrypted: i=1; AJvYcCU4+Ah7nVoXIwuRZEuHNbR0VrTi1gEMdDB9u3N1Eg/ACubD5Yjvn09xY9GGS169r5cnKpuW4hRowvYznNA=@vger.kernel.org, AJvYcCUEFVjr3OasxQgPx+7TdZPMTN7t4pW2qFAGhH4PUGagJyTW9LxM6O93kEzMUTOM7H1OlNcSzRpS1anLo3Cb@vger.kernel.org, AJvYcCUsPGaZ5R7Logx+EMmqpAODi7CV5WeuaXrnudpjpqnGNQ7cg5h0soKtOEwVogWoAVS4uoHbS2Slvb9/@vger.kernel.org, AJvYcCVLR9tlLTgc1IMBE36H1jLYIQtju2aqHMRfNB6lAU//gkCA83G4JTbpi4mtN1Hx0REIU6pfcfZBCdnn@vger.kernel.org, AJvYcCVsDrYI+0yd0haWsfC6LMpkncC2QShj2M+rhuc3bQLcLtn+VwYelyXC5uQ1QBoQITXii2DYfmBeuWlS1ypU+pA=@vger.kernel.org, AJvYcCWHGf5uCa4JvmSu2ZI8QaUKVaMT9jcC40LSrceZ5Tw89G80QA15Lcg2rZ7/iBTl+2DzhSAvy0h5ZFGbqg==@vger.kernel.org, AJvYcCWlXV7WsC0aDArgeW+I2yhEDxVRgWCJa39DBHs92fsb4G9w8fNz5JNoQozkLcYhQ6Hn767CrxJj@vger.kernel.org, AJvYcCX/D+Sa+2BkLpCx7v+rFyOPgr+jZ0IsbHbnskFBSxpT0oaKzmi6YMOtA/QdW1K1DiBe0Te3dVlouN0=@vger.kernel.org, AJvYcCXeE7q/RPCbbjGzeugeXEasAQvn/TKqGE5qaZGQ9Q8SodC9O9pZR6Fhq1bzJY4k86UrTHvzjZLRy8pW@vger.kernel.org, AJvYcCXlBgE5ECpxaPHY2AMY5YrwNa/K2UcB
 /SWJKgqs0CGyUlw1xG5WeNnihUL8dFks/D41YdJlg70btILr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzay+VbYb3fIT66zgx/MVI78L7CFGJCy4k/Pp1rp7WaaUKfoS8k
	6wPZq/n+C4OsGewHeH4Gfp2JniCUGI/guzN2kt69d5t+vfM6DWGyjG8ab+NLihyqz6mDcfcjl+K
	xONQgRDRyMhZaN+0qYtU0s2sfVg8=
X-Google-Smtp-Source: AGHT+IHWwn6ldcKO9RUgddlzHZLLBUXYX1h/LeWpLmoNkOiG3umKeZfWhL71WqRFX9+nAMhhyEMT1U/hQLjIcU3hOyM=
X-Received: by 2002:a05:6902:2782:b0:e28:ece9:fb01 with SMTP id
 3f1490d57ef6-e2e3a614e5bmr8423686276.7.1729844054340; Fri, 25 Oct 2024
 01:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de> <20241024-pumpkin-parrot-of-excellence-299c57-mkl@pengutronix.de>
In-Reply-To: <20241024-pumpkin-parrot-of-excellence-299c57-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 16:14:03 +0800
Message-ID: <CAOoeyxXX2fpHVJ8urLmy+pBjH1aRdYu6qrtwOmwUxTUyQq30DA@mail.gmail.com>
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

Dear Marc,

Excuse me, I'm a bit confused. Is there anything I need to
improve on?

Thanks,
Ming

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 24.10.2024 17:20:57, Marc Kleine-Budde wrote:
>
> [...]
>
> > > +   nct6694->cmd_buffer =3D devm_kcalloc(dev, CMD_PACKET_SZ,
> > > +                                      sizeof(unsigned char), GFP_KER=
NEL);
> > > +   if (!nct6694->cmd_buffer)
> > > +           return -ENOMEM;
> > > +   nct6694->rx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > > +                                     sizeof(unsigned char), GFP_KERN=
EL);
> > > +   if (!nct6694->rx_buffer)
> > > +           return -ENOMEM;
> > > +   nct6694->tx_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > > +                                     sizeof(unsigned char), GFP_KERN=
EL);
> > > +   if (!nct6694->tx_buffer)
> > > +           return -ENOMEM;
> > > +   nct6694->int_buffer =3D devm_kcalloc(dev, MAX_PACKET_SZ,
> > > +                                      sizeof(unsigned char), GFP_KER=
NEL);
> > > +   if (!nct6694->int_buffer)
> > > +           return -ENOMEM;
> > > +
> > > +   nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > > +   if (!nct6694->int_in_urb) {
> > > +           dev_err(&udev->dev, "Failed to allocate INT-in urb!\n");
> > > +           return -ENOMEM;
> > > +   }
> > > +
> > > +   /* Bulk pipe maximum packet for each transaction */
> > > +   bulk_pipe =3D usb_sndbulkpipe(udev, BULK_OUT_ENDPOINT);
> > > +   nct6694->maxp =3D usb_maxpacket(udev, bulk_pipe);
> > > +
> > > +   mutex_init(&nct6694->access_lock);
> > > +   nct6694->udev =3D udev;
> > > +   nct6694->timeout =3D URB_TIMEOUT; /* Wait until urb complete */
> > > +
> > > +   INIT_LIST_HEAD(&nct6694->handler_list);
> > > +   spin_lock_init(&nct6694->lock);
> > > +
> > > +   usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> > > +                    nct6694->int_buffer, maxp, usb_int_callback,
> > > +                    nct6694, int_endpoint->bInterval);
> > > +   ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> > > +   if (ret)
> > > +           goto err_urb;
> > > +
> > > +   dev_set_drvdata(&udev->dev, nct6694);
> > > +   usb_set_intfdata(iface, nct6694);
> > > +
> > > +   ret =3D mfd_add_hotplug_devices(&udev->dev, nct6694_dev,
> > > +                                 ARRAY_SIZE(nct6694_dev));
> > > +   if (ret) {
> > > +           dev_err(&udev->dev, "Failed to add mfd's child device\n")=
;
> > > +           goto err_mfd;
> > > +   }
> > > +
> > > +   nct6694->async_workqueue =3D alloc_ordered_workqueue("asyn_workqu=
eue", 0);
> >
> > Where is the async_workqueue used?
>
> Sorry - it's used in the driver, which live in separate directories -
> you can ignore this comment.
>
> But then the question comes up, it looks racy to _first_ add the devices
> and _then_ the workqueue.
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

