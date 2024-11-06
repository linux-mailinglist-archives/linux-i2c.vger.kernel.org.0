Return-Path: <linux-i2c+bounces-7822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85C9BE00A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87351C2118E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 08:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6871D4169;
	Wed,  6 Nov 2024 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B3ddA/vB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE81D2B0E
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880766; cv=none; b=pYsjNR9ogWMpnX/JHK9KfJklJeLDFG24xBUcp3o9eILc86z5e5m+scVGg/xJ/Q1kOQpQbbT5GTJhwbnujM2V8yn76xrsTGbRPkQ2ZExuiPTwU6VhwqTDkWIMimRqKpfTeizO2Q/A/px5ByXI2Wy4+v4nIsyRXhqWoLSmTzSs5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880766; c=relaxed/simple;
	bh=PwDGAlyKdmmc5GuuZqP8HMvO5lUzY6G+euYKC9FUcqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Up+rr43AwBEtpTLTxwQqyumFawumluR46RsPY5JH9EdyAD0SdtzN3Fm50/7UeVVQUS3w095G9YjdRaDU8Ne0IfyMhKWTpQVOUx/Gave7udKJ/Rl1qklbwerV47ciFRzPwKZ1wvlxKpSyFEsg0crYN12bdhySvbWeaY93g21kFL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B3ddA/vB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e3f35268so7775074e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730880762; x=1731485562; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=;
        b=B3ddA/vBt0Hc7oUKGDzzFg/sPp4o3tD87+JssBg/R+biyygmDpMyGiSxc0r0Ip4YdJ
         bt9kpPqoK57WoouGjpkgzkRYt+v8BHqMQ9dxhY1uYcY7RiVnmr607u7BS/3188dbzu05
         8ujZpdYdI5mmyjFRhFzXz32HUeBG7MfuHlMXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730880762; x=1731485562;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=;
        b=qN+z/b72lzERuAb8NnR1ipDR4S+pCjIfvN6YHshZpn9nCi2dpXZbm7VQxS+z52+ylT
         KtyIIiUfcRKNkiHew1yDQXNAbYM6b/PYeBNjeoyA6GpWzGs0v/Zo5JyJS6oGK77ksmEN
         eB3Uw5ZtdCZrJkIw04DUrBk0JHlej55GwGOtOZEWAUplAfhAm1rIJP4b6y0wDuJGm4/n
         iZpYBMhyHOpnualcZU50f68gJDgBhdT0XRRFiLbPTHf3/qVJwHfCgjkU/NLyXbiIeMi5
         NDybkvNDAYPaLglGFJcu/ZKmPSgrG067mtMKYpIQJJpKacX+K4QgY9U0qqdte2ecWgtv
         HHmA==
X-Forwarded-Encrypted: i=1; AJvYcCUP07zJ5X3xN3W9C/lbbB8EYPyK+FPvoMDr59fBx6pZJQ6JoVE7xOk/wQ+D41wU/GWB7/MIFREaYMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb95eVjPYe7IHLPORaKBW2ukOmJnnl7g84LIYFfwQjy4XqGoOm
	f4SUxI9YJwvZyHnhDKt/Ffp0zv1DOH32eGeUBav2mSGVKANXNmt5Fa2/IYs8IZWHee4Om0Q8p62
	d+RPBEvFWTWBTL9Pm+nNsFAddvy6+EKNKkeWw
X-Google-Smtp-Source: AGHT+IFnaWLxRM0mMC+tlxLZKaZ3C13GE82EXMBINEFxJtBK8SRUM88wS0f5O5dEyFh3FYLnqrjYeFV5SGWw53gqPvY=
X-Received: by 2002:a05:6512:6cd:b0:536:52ed:a23f with SMTP id
 2adb3069b0e04-53d65d945a9mr9893295e87.0.1730880762336; Wed, 06 Nov 2024
 00:12:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030072229.1013235-1-wenst@chromium.org> <20241030072229.1013235-6-wenst@chromium.org>
 <ZypER5bqLAlH7VxK@skv.local>
In-Reply-To: <ZypER5bqLAlH7VxK@skv.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Nov 2024 16:12:30 +0800
Message-ID: <CAGXv+5E5izmR0Oe8RK8eGRxV4vk+98yKJDMc5imgSznxPZp01Q@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple helpers
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:14=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> On 24-10-30 15:22, Chen-Yu Tsai wrote:
> > Add GPIO support to the simple helpers for the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > Regulator supplies were handled in the previous patch.
> >
> > The assumption is that the same class of components to be probed are
> > always connected in the same fashion with the same regulator supply
> > and GPIO. The names may vary due to binding differences, but the
> > physical layout does not change.
> >
> > This supports at most one GPIO pin. The user must specify the GPIO name=
,
> > the polarity, and the amount of time to wait after the GPIO is toggled.
> > Devices with more than one GPIO pin likely require specific power
> > sequencing beyond what generic code can easily support.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
>
> > diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-probe=
r.h
> > index df95aa6ad90e..a232f3cbb252 100644
> > --- a/include/linux/i2c-of-prober.h
> > +++ b/include/linux/i2c-of-prober.h
> > @@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const =
struct i2c_of_probe_cfg *cf
> >   *
> >   * The following helpers are provided:
> >   * * i2c_of_probe_simple_enable()
> > + * * i2c_of_probe_simple_cleanup_early()
> >   * * i2c_of_probe_simple_cleanup()
> >   */
> >
> > @@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, cons=
t struct i2c_of_probe_cfg *cf
> >   * struct i2c_of_probe_simple_opts - Options for simple I2C component =
prober callbacks
> >   * @res_node_compatible: Compatible string of device node to retrieve =
resources from.
> >   * @supply_name: Name of regulator supply.
> > + * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty strin=
g ("") if GPIO
> > + *          line is unnamed.
> >   * @post_power_on_delay_ms: Delay after regulators are powered on. Pas=
sed to msleep().
> > + * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed =
to msleep().
> > + * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set =
to logical high,
> > + *                      to enable the component.
> > + *
> > + * This describes power sequences common for the class of components s=
upported by the
> > + * simple component prober:
> > + * * @gpio_name is configured to the non-active setting according to @=
gpio_assert_to_enable.
> > + * * @supply_name regulator supply is enabled.
> > + * * Wait for @post_power_on_delay_ms to pass.
> > + * * @gpio_name is configured to the active setting according to @gpio=
_assert_to_enable.
> > + * * Wait for @post_gpio_config_delay_ms to pass.
> >   */
> >  struct i2c_of_probe_simple_opts {
> >       const char *res_node_compatible;
> >       const char *supply_name;
> > +     const char *gpio_name;
> >       unsigned int post_power_on_delay_ms;
> > +     unsigned int post_gpio_config_delay_ms;
> > +     bool gpio_assert_to_enable;
>
> This header is missing '#include <linux/types.h>' for bool
> type. Otherwise compilation may fail with following error:
>
> ```
> ./include/linux/i2c-of-prober.h:117:9: error: unknown type name =E2=80=98=
bool=E2=80=99
>   117 |         bool gpio_assert_to_enable;
>       |         ^~~~
> ./include/linux/i2c-of-prober.h:12:1: note: =E2=80=98bool=E2=80=99 is def=
ined in header =E2=80=98<stdbool.h>=E2=80=99; this is probably fixable by a=
dding =E2=80=98#include <stdbool.h>=E2=80=99
>    11 | #include <linux/kconfig.h>
>   +++ |+#include <stdbool.h>
>    12 |
> ```

Thanks for catching this.

I'll send an update.

> >  };
> >
> > +struct gpio_desc;
> >  struct regulator;
> >
> >  struct i2c_of_probe_simple_ctx {
> > @@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
> >       const struct i2c_of_probe_simple_opts *opts;
> >       /* private: internal fields for helpers. */
> >       struct regulator *supply;
> > +     struct gpio_desc *gpiod;
> >  };
> >
> >  int i2c_of_probe_simple_enable(struct device *dev, struct device_node =
*bus_node, void *data);
> > +void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data)=
;
> >  void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
> >
> >  extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
> > --
> > 2.47.0.163.g1226f6d8fa-goog
> >
>
> --
> Best regards,
> Andrey Skvortsov

