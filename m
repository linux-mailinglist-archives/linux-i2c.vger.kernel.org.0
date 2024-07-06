Return-Path: <linux-i2c+bounces-4728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B50929359
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9B61F21CFB
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08016BFB5;
	Sat,  6 Jul 2024 11:44:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E97172F;
	Sat,  6 Jul 2024 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720266254; cv=none; b=nWAtL5s4b8rinntk+vcxScfP/aJBnGj2Iv0z6uzaiix1F7/huLrHWugIa3uBg03YQfKHn/GQ1L02bDyK9DQYzzCAJsTfDoxQOqi7kCQsBdi2sI2bVuv8+/s76/W3O+eBABpLDN6uVs/Qx5XXLQxEPop9riPYLhSXQFczYc9hYCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720266254; c=relaxed/simple;
	bh=3WQQrxcBcr055f1jLShA2iF0olkPjnm/KLdE+z7pmYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZMzVasOakrj039uhAyux56EIfFWuODpsCkpdvMnYIx5NWLGQY+H5DlhMFo05eCAMj3+ZNpIo8nqxyjB/ukuh6cD5OnmjpHfwwDTZn1YtwsyGA6HzeuP07TA7FkIBhWr1HJ/JQn5+VMZ8NDHp8Wgvm1jK1JR0sgsgm8RE4dFp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e9fe05354so3519913e87.1;
        Sat, 06 Jul 2024 04:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720266250; x=1720871050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+134akog2wvWq0vXgpMfAQRTi+1SDwDutTFUFvF3Uc=;
        b=T1A8XVYdgsR+5hcers5LCZyPFzcyj90056gdve3UEsXOu1K9o22KOr5laQbwE769eK
         fmbmdKx/KZMKFLKqI6oSM7AFOL4C3KHJCRRv7evVFYxxRV4BoY5WHDN6kNQdVGQ1rME8
         iu5/vEUcAF+fqbIsCHbnJlzx1VziSSwuLLYOH8StdA1LQSiKSi9VTx+1KEx3hoA4Q1q+
         qa9RgVPQk68yKTrxvkaI0wXhMFIjUd2IEjnhtNTvOgI/a0KotHCQ6Yqdv5jbViJSm/NX
         JVvs3Ojj0oWXGWJi8AhaeHHrpJ4kX2tDMCYIwDgJqnuHtee4DNVzurNS8HZAPV4/Ev3h
         vtEg==
X-Forwarded-Encrypted: i=1; AJvYcCU9nOaeT3/RM6eYa9rvBIomFrundrG7P9MIOcvq4ItpOeR+rc+SZy/3kPmJg4GfifWMauM6J5K6xC0qpWV1TAkDezUoekt4nTl2Grc9
X-Gm-Message-State: AOJu0Yxz+spKaV1WOVOMIBtnzTVnP5c7i7wIm4sJ+7jMLDi4BTGE6YAJ
	VSRaLvoFt3sU2oe2ZW9wUxy6l2YYubqOA1AXSUbKyB3B+1BsIrNu7fi8Mpm+
X-Google-Smtp-Source: AGHT+IFF0xwnieRUYX6JcOX+8hVZktq+p6bp7JjZxIdSCMtHYnaNLkOZAt0o8lRnFlRnuB4EydEeMg==
X-Received: by 2002:a05:6512:4804:b0:52c:b09e:136d with SMTP id 2adb3069b0e04-52ea063aa83mr5154514e87.32.1720266249479;
        Sat, 06 Jul 2024 04:44:09 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2f63csm3043861e87.215.2024.07.06.04.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 04:44:08 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ee88c4443eso27128721fa.3;
        Sat, 06 Jul 2024 04:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxy3LKJBWIqp/PXg9kv957bngWVYqw7j7mvOTVTbDA1oeovbsoPr06Bvxb4i7Ug0k6R8ywwJ6M/Ntn+Yg5dOqrp/9OZ9CGUwJK5Ieu
X-Received: by 2002:a05:651c:d3:b0:2ee:56b0:38e3 with SMTP id
 38308e7fff4ca-2ee8f9ae2bdmr48618231fa.24.1720266248186; Sat, 06 Jul 2024
 04:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com> <20240706112116.24543-49-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240706112116.24543-49-wsa+renesas@sang-engineering.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 6 Jul 2024 19:43:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66u=QhV_EWAbqD9i1ZgVyAToTSr6L8m6ShJyCsimqGzfg@mail.gmail.com>
Message-ID: <CAGb2v66u=QhV_EWAbqD9i1ZgVyAToTSr6L8m6ShJyCsimqGzfg@mail.gmail.com>
Subject: Re: [PATCH v2 48/60] i2c: sun6i-p2wi: reword according to newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 7:22=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index 85e035e7a1d7..074eade6c4a4 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -10,7 +10,7 @@
>   * The P2WI controller looks like an SMBus controller which only support=
s byte
>   * data transfers. But, it differs from standard SMBus protocol on sever=
al
>   * aspects:
> - * - it supports only one slave device, and thus drop the address field
> + * - it supports only one target device, and thus drop the address field
>   * - it adds a parity bit every 8bits of data
>   * - only one read access is required to read a byte (instead of a write
>   *   followed by a read access in standard SMBus protocol)
> @@ -88,7 +88,7 @@ struct p2wi {
>         void __iomem *regs;
>         struct clk *clk;
>         struct reset_control *rstc;
> -       int slave_addr;
> +       int target_addr;
>  };
>
>  static irqreturn_t p2wi_interrupt(int irq, void *dev_id)
> @@ -121,7 +121,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         struct p2wi *p2wi =3D i2c_get_adapdata(adap);
>         unsigned long dlen =3D P2WI_DLEN_DATA_LENGTH(1);
>
> -       if (p2wi->slave_addr >=3D 0 && addr !=3D p2wi->slave_addr) {
> +       if (p2wi->target_addr >=3D 0 && addr !=3D p2wi->target_addr) {
>                 dev_err(&adap->dev, "invalid P2WI address\n");
>                 return -EINVAL;
>         }
> @@ -188,7 +188,7 @@ static int p2wi_probe(struct platform_device *pdev)
>         unsigned long parent_clk_freq;
>         u32 clk_freq =3D I2C_MAX_STANDARD_MODE_FREQ;
>         struct p2wi *p2wi;
> -       u32 slave_addr;
> +       u32 target_addr;
>         int clk_div;
>         int irq;
>         int ret;
> @@ -207,7 +207,7 @@ static int p2wi_probe(struct platform_device *pdev)
>         }
>
>         if (of_get_child_count(np) > 1) {
> -               dev_err(dev, "P2WI only supports one slave device\n");
> +               dev_err(dev, "P2WI only supports one target device\n");
>                 return -EINVAL;
>         }
>
> @@ -215,24 +215,24 @@ static int p2wi_probe(struct platform_device *pdev)
>         if (!p2wi)
>                 return -ENOMEM;
>
> -       p2wi->slave_addr =3D -1;
> +       p2wi->target_addr =3D -1;
>
>         /*
>          * Authorize a p2wi node without any children to be able to use a=
n
>          * i2c-dev from userpace.
> -        * In this case the slave_addr is set to -1 and won't be checked =
when
> +        * In this case the target_addr is set to -1 and won't be checked=
 when
>          * launching a P2WI transfer.
>          */
>         childnp =3D of_get_next_available_child(np, NULL);
>         if (childnp) {
> -               ret =3D of_property_read_u32(childnp, "reg", &slave_addr)=
;
> +               ret =3D of_property_read_u32(childnp, "reg", &target_addr=
);
>                 if (ret) {
> -                       dev_err(dev, "invalid slave address on node %pOF\=
n",
> +                       dev_err(dev, "invalid target address on node %pOF=
\n",
>                                 childnp);
>                         return -EINVAL;
>                 }
>
> -               p2wi->slave_addr =3D slave_addr;
> +               p2wi->target_addr =3D target_addr;
>         }
>
>         p2wi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> --
> 2.43.0
>

