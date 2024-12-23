Return-Path: <linux-i2c+bounces-8692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835B9FA929
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 03:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C54B7A1D7E
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 02:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70CC1CD2B;
	Mon, 23 Dec 2024 02:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxxeYLlI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232152C9D;
	Mon, 23 Dec 2024 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734919358; cv=none; b=C0h4W58KchgVlEmEBjBEZAH+JBhUTV9jT4r5nZ0/CjySqBP8yazr3l0zYak1143qp9RCKmGo8MMHp9NdYWSAMtPu08zp/92zBkDXzZApDIi9/TfBvCVTM2ui9+n+lR2DvIiroOxnEDTxcHhDCwttO7WENE0OramuSZdfLEwzruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734919358; c=relaxed/simple;
	bh=hDwgk4YnS14Zw0anugYcAF073H40TkjuiCjStqOE1Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6ILrWcpF6jtIfaPQt8/8K0ANXK+EUGd+5SvKk7LDvxHajGQDpsvHPogoiXb/CTC+AjSycTXmjlPVdLegeLE9eCttBROLD1PpLQuRcLCHtaLaGNdi1MB+lrQa5XE8twtFoH0R7vfJ0m4qoYaiJ4tTrPS5zE+Yiey5fZO14VHm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxxeYLlI; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f277a1ecfdso27155777b3.2;
        Sun, 22 Dec 2024 18:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734919356; x=1735524156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWZIgy+0S/H+y/so5WCbIeW2FOwDIQJ5iQBURdCXRRw=;
        b=lxxeYLlINhLD+ImvnrpjM++3AGP8HlRZLm1tRTINo49FXvylBGlCMIjFIBimc6fJTw
         fjgQCMUll2ugAzID76m7+D8HUO8u4F5ye/sj1ztkrsQYHjwYLbjDQa6FrVHWEXcMSYW4
         JWeGRCMHyP3q74S/bXD5jsG+IraLsX6VfwNxh7wa8w7JKNUNhGbxym2QAG5uiXEjfFOf
         SnYuaAJ8nzlOTwYKjIYbgNhTwdo/6UjwBCfm3eJozdJ4NkmIJ6oRmflXHJFQ/zrLVD8o
         TXYeyj99l3DQg0JnvJ8gjEFmmaBQSMuegVUkynRlx9/zOT2RXE9V6XTUBBBEWX9ivlwb
         jinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734919356; x=1735524156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWZIgy+0S/H+y/so5WCbIeW2FOwDIQJ5iQBURdCXRRw=;
        b=GS51bSpACfjpSyjGMJB55N26zYfcEKLwvQQRSnleVg13EcUQnJRd/mrKJ35CNkbuKw
         /k3q/9vzt3xfyViADE0vjrLE32xuC2SgEfFE12Y/Zdik3T9kFzCtVjjF5r5hf13O5nGX
         CALhGGJyw/noll6qEbdKQSRbLRAHGsYiM/Mcj6gfC2YiHZee5Z4M2ufDOI+qcs0hKdZG
         XaWs/AM92WwlNfStH4N2a0yDutzU+6e5G2X4zxb7EGV6pnr2o9SpnTOcYCpytl0ODC2I
         Je/A+0rw9IzPp0cvf0CSp+0i4m273776uOdFS+XDdjLAkPZ90/BEe8FsIKe/iWvr5rtl
         3lOw==
X-Forwarded-Encrypted: i=1; AJvYcCUCZzYRBB7IYXPV3yQyh9XGW3oZaku7HQwiO5pcTspSESQe91i7QxKie3oJ1fpez990HgWmSLLz5DV+K5ZKtkM=@vger.kernel.org, AJvYcCV1pP1RmNs3to93FRgKGkueZ0uP03szmsXbd3FWUstYjmGXb/zNn9DUSDIKk2Wnv9YVqwQQG3Mk@vger.kernel.org, AJvYcCVLbvrY6D5vwL6ukvwljIl+PUVKyAKOCyqcVtW6uXcobSDXo4BI23rE9Idbwullus7bY8xyIp6OUCDNLew=@vger.kernel.org, AJvYcCW6i+XQMLJTtntEsPpvBi7kIpBA0HquxIkbEzpM12AWF4FQ7tyXr1W2DIQ8FmWZUCLFbhTLUvDxoDqA@vger.kernel.org, AJvYcCWBy1ZKar4AnMRYV4w9wNaWZVy7q3CGaK+JPc7+Glrq8td/dXw6G/BPsRHlACOm3QozqKPa3WJFjXn1pw==@vger.kernel.org, AJvYcCX3URqzOyGnpKYtHUz+/y1mioAatPpM7X3j/MwYdhzGO+KPUfyE13zLGnqPeYuNgFnF1TNg8EqixvmZuP69@vger.kernel.org, AJvYcCX4HgkVC4MsP2MHoTe78yNnZKNGlu+juv9AJK8fre5hSqZQBs1fM5VOvOiLDFtX9z/CnMSNczaCDz8=@vger.kernel.org, AJvYcCXd5I+JnVkIAjdSlfpG5MBN+y/SQVgleL6yMUjtplNoE7bi5sUDN2T02vNEJ+JVBP97hSV6HBMGlimL@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJ35yV3pWbB2xcXdTG6Tw52I7/3ZRRdi5rfDJVeosPrB1pBId
	nRM+iULVzQOiLts4Jsx2iCHJbBKgcbK+9r1WM4QEZCZdYadHbPnhByvKTEU9iQibQYnelEGzvgt
	oiKKqyXvV495z0+9niIKoFp4WEFc=
X-Gm-Gg: ASbGncs15qugOe4cxZRPfi3rJZznUGLK0wT+Ebn/rUF9QbgS8Nq4cYnay3N8f9+uIqo
	ncGPA/NIrwFgwbuTP5FQPC9rg5eUKl/xnPbhm
X-Google-Smtp-Source: AGHT+IF6pazXRJti4UPTc19n5K42GP6BUICPCkP8VvhGHIDse6qSkPZU2suwHfp4YXYqVtL17+FvFjV7ppY8C2P9Ew8=
X-Received: by 2002:a05:690c:4d81:b0:6ef:5fee:1ca3 with SMTP id
 00721157ae682-6f3f8110012mr74666977b3.10.1734919355993; Sun, 22 Dec 2024
 18:02:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-3-tmyu0@nuvoton.com>
 <CACRpkdajLe94novxjsHkCCx3m5raB0DxMnnSegCqkdWxRoWazw@mail.gmail.com>
In-Reply-To: <CACRpkdajLe94novxjsHkCCx3m5raB0DxMnnSegCqkdWxRoWazw@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 23 Dec 2024 10:02:24 +0800
Message-ID: <CAOoeyxX+jTVB3T9Eu_66b9gHZbnbLpVKa=QK7F1YDkfsWdxo9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linus,

Thank you for your comments,

Linus Walleij <linus.walleij@linaro.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
20=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:42=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Ming,
>
> thanks for your patch!
>
> Some nits below:
>
> On Tue, Dec 10, 2024 at 11:46=E2=80=AFAM Ming Yu <a0282524688@gmail.com> =
wrote:
>
> > This driver supports GPIO and IRQ functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> (...)
> > +#include <linux/gpio/driver.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> #include <linux/bits.h>
> is missing, include it explicitly.
>
> > +       return !(BIT(offset) & data->xmit_buf);
>
> Here you use the BIT() macro from <linux/bits.h>
>

Understood. I will add the header in the next patch.

> > +static int nct6694_direction_input(struct gpio_chip *gpio, unsigned in=
t offset)
> > +{
> > +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> > +       int ret;
> > +
> > +       guard(mutex)(&data->lock);
> > +
> > +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> > +                              NCT6694_GPO_DIR + data->group,
> > +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       data->xmit_buf &=3D ~(1 << offset);
>
> data->xmit_buf &=3D ~BIT(offset);
>

Okay! Fix it in the v4.

> > +static int nct6694_direction_output(struct gpio_chip *gpio,
> > +                                   unsigned int offset, int val)
> > +{
> > +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> > +       int ret;
> > +
> > +       guard(mutex)(&data->lock);
> > +
> > +       /* Set direction to output */
> > +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> > +                              NCT6694_GPO_DIR + data->group,
> > +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       data->xmit_buf |=3D (1 << offset);
>
> data->xmit_buf |=3D BIT(offset);
>

Okay! Fix it in the v4.

> > +       if (val)
> > +               data->xmit_buf |=3D (1 << offset);
> > +       else
> > +               data->xmit_buf &=3D ~(1 << offset);
>
> Same
>

Okay! Fix it in the v4.

> > +static void nct6694_set_value(struct gpio_chip *gpio, unsigned int off=
set,
> > +                             int val)
> > +{
> (...)
> > +       if (val)
> > +               data->xmit_buf |=3D (1 << offset);
> > +       else
> > +               data->xmit_buf &=3D ~(1 << offset);
>
> Same
>

Okay! Fix it in the v4.

> > +static irqreturn_t nct6694_irq_handler(int irq, void *priv)
> > +{
> > +       struct nct6694_gpio_data *data =3D priv;
> > +       unsigned char status;
> > +
> > +       guard(mutex)(&data->lock);
> > +
> > +       nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> > +                        NCT6694_GPI_STS + data->group,
> > +                        NCT6694_GPIO_LEN, &data->xmit_buf);
> > +
> > +       status =3D data->xmit_buf;
> > +
> > +       while (status) {
> > +               int bit =3D __ffs(status);
> > +
> > +               data->xmit_buf =3D BIT(bit);
> > +               handle_nested_irq(irq_find_mapping(data->gpio.irq.domai=
n, bit));
> > +               status &=3D ~(1 << bit);
>
> Same
>
> Just use BIT() consistently please.
>

Okay! Fix it in the v4.

Best regards,
Ming

