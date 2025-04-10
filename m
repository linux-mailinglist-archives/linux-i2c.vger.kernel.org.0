Return-Path: <linux-i2c+bounces-10245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE9A836CB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 04:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC4607B0287
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 02:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A191EA7D4;
	Thu, 10 Apr 2025 02:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmidTwk5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C91E9B12;
	Thu, 10 Apr 2025 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253143; cv=none; b=nHjQM66NMMz3ztN6RkBOBt58nDiNU0OYnVAs10Zq+18yi2Kitg8A2kZKaw0ckLWCnnp6NNC8p5Kv2MLgLbfrTOQixlpgFrkTNw2OJXVQ3nyE1wdeov5Kj0WBsLv/idXiMXD9TYWATUZEoAxZcR/MJiyDgzc+GVFJbdUg4Ncm6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253143; c=relaxed/simple;
	bh=KQEZ6JB9t3IyUQNsiOrY7AJyXfw3Qo1A9Jq0dntRkQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q79gRVRc1y/aR9ZKqAhbRTG1Pu8uE13nltyLslq9CsdWzW/Zo8GelH85JN3TdYzR/quCe/zMkk+NnGu6mLN2e1M1NFlGkzLF0SUYEt0YYfXigGilkdGsWja1q0HimXQWiDQiSpyEejre1/XYs2e5KcxMmoGHoGOZt4RgE4tX4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmidTwk5; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e643f235a34so245437276.1;
        Wed, 09 Apr 2025 19:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744253140; x=1744857940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0znVcofdMZqSyY8rQG7+aec/wD05C2MOziJfKOlp+SY=;
        b=nmidTwk560GLmGFg2K40a/+bFqQ8E5tLP8c1xw+sA1WoI6ognbi+0DJdU8tcIZ0Ehv
         bRj8BIsiTxP0bB4RFlO1jEqR/Lv35zliMCm8zQ/kEQSsllDYQ96s+Dm9Ge6a3LLYW6Vr
         HslVQsuKPDkeUENTYQfCkw/iUMKGgpCu5KZqcHT7CXi2uzRXJ+ZfgUbReqTNuBz+qztR
         ozCah6jcBLwayHQ2MwOzN3aCgwM3blod7iks79UdJyx+JqqOc03iGssbs5T6AYnsBxHY
         ZOdcd8Dwe1o+BsNwdiUT3MvJko0dYWorRZK0jIuNh2HFv/W4DAtKygh21C52X027G6S3
         mJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253140; x=1744857940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0znVcofdMZqSyY8rQG7+aec/wD05C2MOziJfKOlp+SY=;
        b=XKr7gIvibpLRWvZVHHHghhe43MUNqIOW65c63D4T+WQZoSOfdmxzXYd3oOeMH5CL1E
         3WQNE86hXZtOJHHaEM+QnP6Ln/DsPeTM+SwZtDMwifGP4SH6eFIjSyMmhtqvvnXb/Z8I
         fW/Ngq41sE+bQlsRDEIWdL9jcAGZWH8oZzaWd4wHIqgCdUoDnSF1yW6VkQZd5z+CqaS7
         vd9lJbWged/WWKjQKXf5xW7lwCx164MqXefrUSqYxKPsnlHhcAdHwWDswScCzoXvVr+X
         3CA1478p/Y2UwrszjMbz/X+iZ4IwSl/f/P9llyF1ztp8W3KX7WVJ+NxbUDfAYqy+fLXv
         A5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8yPY2krDaIEGwCCqJgYgghggiKx4cVXKvEpNhoRG8AyNF6F0e+vxwvi/RZejIasKbwexgdLH935qa@vger.kernel.org, AJvYcCUGOOiTbxsqJHI9ISmlu0D8+HAFyXr58U1n7UlCmldGCfWRnhmS15iwOitPKndNY+86voWjEFeRdtsGHYQ=@vger.kernel.org, AJvYcCUhpVQ/F1a9qgnPVIWTuSwWHZN3yX8l92EdEDvygXRXRjEcmIfzarz/nXpzN2cl2k2uCW0Bhp/v+1tHe/g50Ec=@vger.kernel.org, AJvYcCUrsFBhU1OO5+PljPdEQ7okjpYFWn9VvsWxo6gIjRRIIt8WQf7An/O1TSXZQNL3/q/+zV0wBdh+256HEy8f@vger.kernel.org, AJvYcCV6jubxqhTke9bmkte5duvKmbgMlKvjWyn8u7zDLNzgPxhGA4cKv9sft2r/Q+rqoTzSYYrenyC6b58Xmg==@vger.kernel.org, AJvYcCVd8A/6MR/rtcZbPCFJTBgDvMbcpErNah6DvLXqOtpiG/LVbXSbqvdw722JRm5w+rX17pabABGHYZNS@vger.kernel.org, AJvYcCVsz4Af2fWwLxmXi69nTEiwZAbhIOh+Qwpc4ag0XX7qCemJcnu5lwC0EaeIBkr7KgxGY7/P3am8BcI=@vger.kernel.org, AJvYcCXlyPrqWPU3/ogI/h2HZ6qyOUB43dkHRCZaDK581rrWN5QXYD6Fg7BzSilZ6kpbS8BbHTFzhvaCSEeh@vger.kernel.org, AJvYcCXvt7OGFyztPZ6kEbGQ8Dgt9YKsz5FdnTN2vhmaDM0ynG2X6KOpe/PzugcDL7jolwblimWAJ65Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzGyq8yXog+Mxja3B62XE510IaihgcCYC+bE27JAm/bbhHLEKxP
	VKt1h/SGrSI5GHfa+5Asg2RIMiZZa12GwJ7cnLnDP73uXjGkNcTOKbUIU2dhtTBJuZDra9HO7/d
	9NkD2y2v/8hFB7/s6E+tpuJF446Y=
X-Gm-Gg: ASbGncslzyd+DvcB0Cma93sLR7pOiZMBgsKltTP0+VMpQQteBemMyoy14e3iiiEakZT
	omGtXGR41P6VwiCLXRV7VYg/3+vOXEqeYQuH0zugEwyG5Xvz5Nh7Dh64rWylwwrQUL6YtMP+pmQ
	9QeUZKAB/M3z1hzehPDVvfEFH8U0vtuFfj4MTI5L8Xv7IYtH9R2tjrn2B3
X-Google-Smtp-Source: AGHT+IETiR/1KKEvz2i91Lzay52EaRmEEzm9KCbaz7jAfvh7zeS7SKPtkYiHbWjyz5dZb3/vI/JCYJ/mC4Z8SvrnQbw=
X-Received: by 2002:a05:6902:2503:b0:e5b:1b55:1325 with SMTP id
 3f1490d57ef6-e703e15f292mr1852380276.25.1744253140506; Wed, 09 Apr 2025
 19:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409082752.3697532-1-tmyu0@nuvoton.com> <20250409082752.3697532-3-tmyu0@nuvoton.com>
 <CAMRc=Meb9wbhd_wH0OBGAivgUA3-3_+-E5neE+b32T54zQkQjg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb9wbhd_wH0OBGAivgUA3-3_+-E5neE+b32T54zQkQjg@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 10 Apr 2025 10:45:29 +0800
X-Gm-Features: ATxdqUHvPStCEjIlmPeYzUqkG4uY8NTbLVYUUSUQKfLVy60efJKv3B8SbaTKJeo
Message-ID: <CAOoeyxV3WajFf+YCAP6y5pzEmQdcNHrU2yFqU9LGgO1e8Faq5g@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: lee@kernel.org, linus.walleij@linaro.org, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bartosz,

Thank you for reviewing.

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2025=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > +static int nct6694_gpio_probe(struct platform_device *pdev)
> > +{
> > +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +       struct device *dev =3D &pdev->dev;
> > +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +       struct nct6694_gpio_data *data;
> > +       struct gpio_irq_chip *girq;
> > +       int ret, irq, i;
> > +       char **names;
> > +
> > +       irq =3D irq_create_mapping(nct6694->domain,
> > +                                NCT6694_IRQ_GPIO0 + cell->id);
> > +       if (!irq)
> > +               return -EINVAL;
> > +
> > +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data) {
> > +               ret =3D -ENOMEM;
> > +               goto dispose_irq;
> > +       }
> > +
> > +       names =3D devm_kcalloc(dev, NCT6694_NR_GPIO, sizeof(char *),
> > +                            GFP_KERNEL);
> > +       if (!names) {
> > +               ret =3D -ENOMEM;
> > +               goto dispose_irq;
> > +       }
> > +
> > +       for (i =3D 0; i < NCT6694_NR_GPIO; i++) {
> > +               names[i] =3D devm_kasprintf(dev, GFP_KERNEL, "GPIO%X%d"=
,
> > +                                         cell->id, i);
> > +               if (!names[i]) {
> > +                       ret =3D -ENOMEM;
> > +                       goto dispose_irq;
> > +               }
> > +       }
> > +
> > +       data->irq =3D irq;
> > +       data->nct6694 =3D nct6694;
> > +       data->group =3D cell->id;
> > +
> > +       data->gpio.names                =3D (const char * const*)names;
> > +       data->gpio.label                =3D pdev->name;
> > +       data->gpio.direction_input      =3D nct6694_direction_input;
> > +       data->gpio.get                  =3D nct6694_get_value;
> > +       data->gpio.direction_output     =3D nct6694_direction_output;
> > +       data->gpio.set                  =3D nct6694_set_value;
>
> Please use the set_rv variant, regular set is deprecated now.
>

Understood. Fix it in v10.

> > +       data->gpio.get_direction        =3D nct6694_get_direction;
> > +       data->gpio.set_config           =3D nct6694_set_config;
> > +       data->gpio.init_valid_mask      =3D nct6694_init_valid_mask;
> > +       data->gpio.base                 =3D -1;
> > +       data->gpio.can_sleep            =3D false;
> > +       data->gpio.owner                =3D THIS_MODULE;
> > +       data->gpio.ngpio                =3D NCT6694_NR_GPIO;
> > +
> > +       platform_set_drvdata(pdev, data);
> > +
> > +       ret =3D devm_mutex_init(dev, &data->lock);
> > +       if (ret)
> > +               goto dispose_irq;
> > +
> > +       ret =3D devm_mutex_init(dev, &data->irq_lock);
> > +       if (ret)
> > +               goto dispose_irq;
> > +
> > +       ret =3D nct6694_get_irq_trig(data);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Failed to get irq trigger type=
\n");
> > +               goto dispose_irq;
> > +       }
> > +
> > +       girq =3D &data->gpio.irq;
> > +       gpio_irq_chip_set_chip(girq, &nct6694_irq_chip);
> > +       girq->parent_handler =3D NULL;
> > +       girq->num_parents =3D 0;
> > +       girq->parents =3D NULL;
> > +       girq->default_type =3D IRQ_TYPE_NONE;
> > +       girq->handler =3D handle_level_irq;
> > +       girq->threaded =3D true;
> > +
> > +       ret =3D devm_request_threaded_irq(dev, irq, NULL, nct6694_irq_h=
andler,
> > +                                       IRQF_ONESHOT | IRQF_SHARED,
> > +                                       "gpio-nct6694", data);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Failed to request irq\n");
> > +               goto dispose_irq;
> > +       }
> > +
> > +       ret =3D devm_gpiochip_add_data(dev, &data->gpio, data);
> > +       if (ret)
> > +               goto dispose_irq;
> > +
> > +       return 0;
> > +
> > +dispose_irq:
> > +       irq_dispose_mapping(irq);
> > +       return ret;
> > +}
> > +
> > +static void nct6694_gpio_remove(struct platform_device *pdev)
> > +{
> > +       struct nct6694_gpio_data *data =3D platform_get_drvdata(pdev);
> > +
> > +       devm_free_irq(&pdev->dev, data->irq, data);
>
> That's definitely not right. If you need to use the devm_free variant
> in remove(), then you're doing something wrong. Most likely you can
> rely on the devres release path here...
>
> > +       irq_dispose_mapping(data->irq);
>
> ... and schedule this as a custom devm action.
>

Okay, I will add the devm_add_action_or_reset() to call
irq_dispose_mapping() in the next patch.


Best regards,
Ming

