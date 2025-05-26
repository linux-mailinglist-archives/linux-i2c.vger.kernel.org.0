Return-Path: <linux-i2c+bounces-11135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6160AC386D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 06:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75FB018904DF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 04:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D9719E971;
	Mon, 26 May 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVivXdLq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C95136E;
	Mon, 26 May 2025 04:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748232559; cv=none; b=CfJ09hLIrEvSMkWiAel2XzZ6bwK1yzsK6LlT6ZeaJNYxV4ipQc7+6nouMaPR5Z9KvIbEL3mSX6JA2rG3xICo8658HYpu/0GymWg2OnPuHKl24cxKKilrVL9ndWcJCZdw6OzahG+YuHXD+gLK9a/WIKVmqxzN3RmGKqwZ0LAaFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748232559; c=relaxed/simple;
	bh=zFybjZBAwqOPQRHXISprk73GwCPp84zyLJgW8FKg/fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqkCmsOYAQuu4Yd9h+79msDwfUname1jEt7o+c0a1ooNNPyp8pwgLfaUDUaC2v0EzgJh+Ew4Ombbct7GU/nrmrNvGI8bHvs5XQOzFmaehVjyf4NOcYPDovMbnVU8LUF0rjvy/C3PcCzqhZb5bxgafspzXPDTiQ7vdZ2+tHi/X3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVivXdLq; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e5d3d52c0so2402147b3.1;
        Sun, 25 May 2025 21:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748232556; x=1748837356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRsxlN+6DHzqakc/p1oPgH+ae8ppKGO0+KoYULOIVI0=;
        b=TVivXdLq76AhnHHkzroOgsyCuYAWACJMpQbzoJ7zzIqx4sMX1/bK0wmpuVG29BoE80
         2TVfruSM1mZYX3IjzUFopwYoaxCIvwQ3Q/BZ0MhK+KBd88nAN8zi/1SsKcL+KMpxDjpH
         fIlDoyW0u9h9KnYUPMGa9SNQsVQKwY0Dh4NxzAiUn1b38uydMS9MBaVma8trlXDOzmHL
         c+R8ZFQaz5/87teROwIr8CHaBDuUNELoOS0orCxrd0PizfweUKDwvRJf8/hdH3hVOaSR
         ayUCuCayGhCdm93OXYoIpKi+8XxNUA1x7vgckRbYJZunF57bXqXMgpH9WImQ4Pc4bOrK
         prOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748232556; x=1748837356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRsxlN+6DHzqakc/p1oPgH+ae8ppKGO0+KoYULOIVI0=;
        b=t7KodSWX+3a08g0YssMVp7EiOaxQ/37yptEu4dXqtHzsM2DUPJxAde9ZsbRNCJ1mrG
         fuhM7Mh9vXb0LZ2zKrlRc6H5QZPd9rRd11ngtr+iFcQQ5IsJlf847Ns6maZrDfLakwPu
         6pgx3WWTQt1S1lFPN/t69MCf5oDE/tP4bvHQzEgZsbpYc+AX+/DsTbnTEA9tOS8BMeZt
         AIqsneUzj3CLSyZ3CQTfZ1n6wxDApjxGRZbYGWT2eCZfx8A7f08wg0rp5hCJMe6Avlez
         MVGXI1bx6yMF6ZwsGdXw+HCFfvAK2l5+cZq9M3RBZRrzY2+s0jLLEDMmdxasFgGrziQu
         pKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBt9EJsYCu35F4KxgnmZlEK+jC3q+EOXc/J9kzmyPpgknqeWbBlP08ZqE3oDPvp2KY8o6PjKZeiG4aSnWt@vger.kernel.org, AJvYcCUkKjPNkMLUzulsj2MQSsl+juYf9Z/VftXbqNUlrqRBujS4BWxmmO8b8H0XeEo1wccm7/EZSMy19u7v@vger.kernel.org, AJvYcCV2mX69Vso3ZYevmPQSJF5LXKcVOgO+ZleuSLBuaC+GfMVJzUrJPw5Z+wyE6h59cKu3hpKD4O4RCYF/@vger.kernel.org, AJvYcCVtKDyNBMV1IW7K6H/NDBvtnALkzMS844P+mBn0CDXHsXAKuk32UCvDP6WrU1NvlWiQyflTBPy2uFA=@vger.kernel.org, AJvYcCVw/XiSZjG8SatQwvPVUGqE6SwVxbH1pUgaVSsf3vvGOjUurPU7ynRWXcQ8kLaPqSEjZf3I45qu@vger.kernel.org, AJvYcCWtFwB7GVaCi7Tt4YKzN/sGCTShHvOgFsAGSOkW5C0eBFYg9JyNU/Ok3dwYfQg8Hq2R2XI+TAfPucO0uqBxFmw=@vger.kernel.org, AJvYcCX5ELNH/KqGsHf6g6fHghAfySkm+cj2ifwlnxZRNowBUxj3oGDkuCcYPLEkJjUczzhrEtJMPG3PWUYkTQ==@vger.kernel.org, AJvYcCXZEtZpEUiCbxtRxePoBzIJY5ORFxhTJAfd+9zYTekwRuCQpNJcny9bjLUtQtyRVgUQZF7h7yLGh7Wu@vger.kernel.org, AJvYcCXwaHTqBYQ9xv4mdpk9J4sDpgg65QISxAwDUr8dzSQY7qujtaTNvZ2leyh7vgWvFi3MmRnebWoMfc1p5eA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtv38zQdX1e+ZjL+IPWFDkJegkLUij6GvqQNPkPkZ+XKgHL+Z3
	Lz38q4u0QMLsI/HWEUnm8H71S8y8nleE4I+nCCB1XqikKrezzO7J0F8MP0st0sPBV7MNjL3NOex
	9z/Pve0Q+2aROvuZWWs+GiCVQ3zNJZ6M=
X-Gm-Gg: ASbGncskpFWKtf1ZBJn6jFjthx7i5cSClwpusjr5RJREo9IEX9Mgzqgf2gGkk1GErA4
	SbsN244Mz/PHcGvkO51MbIXCF3SFRjxBLV4jEf4kQXleXpXneXUZeEXmMhsrty/P4UNO/OZzng5
	t5kK9o+LBQ4VCJYNl38ZGnig4jP9S6IuQH4hg1SajgfkRFFmmZmS1tntXkLwURnZ0bn5U=
X-Google-Smtp-Source: AGHT+IFD4nkg9WD+T6GdV6j4yA+x5r2Vrje8LG18zmUMxyOuvQsEyEx7MaBiv8GoPkxW33bEG6Oq5m6STvO6yCEYoKU=
X-Received: by 2002:a05:690c:660f:b0:70d:f3f9:189c with SMTP id
 00721157ae682-70e2da77feamr74948577b3.24.1748232556257; Sun, 25 May 2025
 21:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520020355.3885597-1-tmyu0@nuvoton.com> <20250520020355.3885597-6-tmyu0@nuvoton.com>
 <4cc7d25b-35de-4303-94cf-7a8e33bdd246@roeck-us.net>
In-Reply-To: <4cc7d25b-35de-4303-94cf-7a8e33bdd246@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 26 May 2025 12:09:05 +0800
X-Gm-Features: AX0GCFs-oVdTFcQ06xtCcdpDTQZ0ix05e7U2vH5otbE_aO34st4zkTxf4Ye5r-U
Message-ID: <CAOoeyxWoShYNPtBtvOHeYa439cwF-e0ZXRqyOOPGQ+Vqo0HWig@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Guenter Roeck <linux@roeck-us.net>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for reviewing,

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2025=E5=B9=B45=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > +static unsigned int timeout[NCT6694_WDT_MAX_DEVS] =3D {
> > +     [0 ... (NCT6694_WDT_MAX_DEVS - 1)] =3D NCT6694_DEFAULT_TIMEOUT
> > +};
> > +module_param_array(timeout, int, NULL, 0644);
> > +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> > +
> > +static unsigned int pretimeout[NCT6694_WDT_MAX_DEVS] =3D {
> > +     [0 ... (NCT6694_WDT_MAX_DEVS - 1)] =3D NCT6694_DEFAULT_PRETIMEOUT
> > +};
> > +module_param_array(pretimeout, int, NULL, 0644);
> > +MODULE_PARM_DESC(pretimeout, "Watchdog pre-timeout in seconds");
> > +
>
> How is this supposed to work if there are multiple NCT6694 in the system =
?
>

As far as I can tell, they only share the same default timeout and
pretimeout values, which can be overriden using ioctl for individual
devices.

> > +static bool nowayout =3D WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (d=
efault=3D"
> > +                        __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
...
> > +static int nct6694_wdt_setting(struct watchdog_device *wdev,
> > +                            u32 timeout_val, u8 timeout_act,
> > +                            u32 pretimeout_val, u8 pretimeout_act)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694_wdt_setup *setup =3D &data->msg->setup;
> > +     const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_WDT_MOD,
> > +             .cmd =3D NCT6694_WDT_SETUP,
> > +             .sel =3D NCT6694_WDT_SETUP_SEL(data->wdev_idx),
> > +             .len =3D cpu_to_le16(sizeof(*setup))
> > +     };
> > +     unsigned int timeout_fmt, pretimeout_fmt;
> > +
> > +     guard(mutex)(&data->lock);
> > +
>
> Watchdog drivers are already mutex protected in the watchdog core.
>

Okay, I will remove the mutex in v12.

> > +     if (pretimeout_val =3D=3D 0)
> > +             pretimeout_act =3D NCT6694_ACTION_NONE;
> > +
> > +     timeout_fmt =3D (timeout_val * 1000) | (timeout_act << 24);
> > +     pretimeout_fmt =3D (pretimeout_val * 1000) | (pretimeout_act << 2=
4);
> > +
> > +     memset(setup, 0, sizeof(*setup));
> > +     setup->timeout =3D cpu_to_le32(timeout_fmt);
> > +     setup->pretimeout =3D cpu_to_le32(pretimeout_fmt);
> > +
> > +     return nct6694_write_msg(data->nct6694, &cmd_hd, setup);
> > +}
...
> > +static int nct6694_wdt_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_wdt_data *data;
> > +     struct watchdog_device *wdev;
> > +     int ret, wdev_idx;
> > +
> > +     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->msg =3D devm_kzalloc(dev, sizeof(union nct6694_wdt_msg),
> > +                              GFP_KERNEL);
> > +     if (!data->msg)
> > +             return -ENOMEM;
> > +
> > +     wdev_idx =3D ida_alloc(&nct6694_wdt_ida, GFP_KERNEL);
> > +     if (wdev_idx < 0)
> > +             return wdev_idx;
> > +
>
> Sorry, I fail to understand why this is needed or even makes sense.
> That ID is global, so if there is more than one chip they all get more or
> less random IDs assigned. Why would that be valuable or necessary ?
> If it is just necessary to give the watchdog different IDs, and the
> values don't matter, why not just use pdev->id ?
> I guess that won't work either because it is used as array index below.
> You'll have to find a different means to identify which of the two watchd=
ogs
> is handled by this instance of the driver.
>
> This warrants a detailed explanation why there need to be globally unique=
 IDs
> across multiple chips.
>

I will update the code to use pdev->id as assigned by the MFD in the next p=
atch.

> > +     ret =3D devm_add_action_or_reset(dev, nct6694_wdt_ida_remove, dat=
a);
> > +     if (ret)
> > +             return ret;
> > +
> > +     data->dev =3D dev;
> > +     data->nct6694 =3D nct6694;
> > +     data->wdev_idx =3D wdev_idx;
> > +
> > +     wdev =3D &data->wdev;
> > +     wdev->info =3D &nct6694_wdt_info;
> > +     wdev->ops =3D &nct6694_wdt_ops;
> > +     wdev->timeout =3D timeout[wdev_idx];
> > +     wdev->pretimeout =3D pretimeout[wdev_idx];
> > +     if (timeout[wdev_idx] < pretimeout[wdev_idx]) {
>
> Maybe I am missing it, but I don't see where wdev_idx is bound to [0,1].
> It is global. There could be a dozen of those chips connected through
> USB.
>
> > +             dev_warn(data->dev, "pretimeout < timeout. Setting to zer=
o\n");
> > +             wdev->pretimeout =3D 0;
> > +     }
> > +


Best regards,
Ming

