Return-Path: <linux-i2c+bounces-6742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A070A978BFC
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 01:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7D6283397
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 23:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361E217CA19;
	Fri, 13 Sep 2024 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TCUl1th4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC526289
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 23:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271444; cv=none; b=CaDrZXOY78bMuuoTegAubYx4UJIX2ZSaBTdLKL3vqd7LvvB1NSLTOz+FXuQA2Hqs14cPNcdDt/eZhVG4yrPIQIxPNq04QTTLreNWeg4dfkIEC1A7J8ZBWfXcqnFh6PC6P1lLQuKtly6Al9OPwGPy4Cp+sAzD4mk0GePmHPLl99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271444; c=relaxed/simple;
	bh=iShfGa2K9v84syG+aLK78YPAr6h3bqgDt5AT1QZtHo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxjvwOZZkbgBEmOacp8YiOJ4bVdkdQX+MqzPL5UBg0CrH1zcszd10YMZiPKnZQcQ+RKcNosefnKefTgGJoLT6i8qpumkmiNa7xexRbamx7j2QxbDQatFTaPhT18/RC48Pb5E+2nnkRKX6VgajJNX37BW6kx9eYwcknjrWAvFH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TCUl1th4; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c354091616so20735116d6.0
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271441; x=1726876241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=;
        b=TCUl1th4N2AcuMhj/yjAzmcQ+yEmXsExdtGRwKPLrCYaqPfMWR9nKHvNWwDiLJHV6Q
         KirJ6EqP10Ofh7ZdiLtkSUU/WIJ/ykoRtWydcDb2aXHcmhLQwzebM6ko+K1W/rv+3nyp
         Suq1UQmhZrm0VVr4BqPWtMynm88WuX5zJ/4Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271441; x=1726876241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=;
        b=SOI0G7lkPZ5HnjGyOpCBQ6BdXn5jy0Mh0AVdfWGq8CM9C7E/mbKZZ/SeZo8ZdyWwku
         Bw+DUcUJ+tgzkAw2kwSsgTbyEGn7ebSnDf0+tj2Q9BLaWjxiWGfVVwgek1uCNwynJGmN
         mDnf4dtOsIwLiQ6qH0KBymPMGryFSY8YRhtoQQnJtsX+EzaEpztcUqT3XyoEYiZtq3cU
         XqworpLcuxDO9hw6B72xJ7CNr8VcjkTmtzFMaSyiAqLDtIdzlkAIHvVbo78gC+BTVr1j
         g77kkqXzs0XX7jjvWM/p2lgfk2cTo+OgAUCKtyJzvtpZKi7u3Mzeu61prPhS0NTT8r0Z
         FWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBxogOgt9aa9cuYXIUedFd0pYpyvb6p/ff29hilCjokD4FUqSXZO3Zb4/d6R/UzL5nTIe4u5TXzwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1ySKn/T2kd672KfsD6F6oGiUhFJw59FjlfZHrb0mqeltfLMv
	VQWvY5FptO+j1yko0UQQAF1F7wOzxFG8GNDyHunMvYrNXySKMSny2NgfoF+qIom/6lHXcD+zayA
	=
X-Google-Smtp-Source: AGHT+IHf5OVzdK+DsXGfTYO5p9KwLOiwOTs2PX2ydatSz9rKp2FAws1rr9EqYblMtPhwEkaNb4BhOg==
X-Received: by 2002:a05:6214:4991:b0:6bf:6dc2:e002 with SMTP id 6a1803df08f44-6c57351719bmr133939676d6.12.1726271441023;
        Fri, 13 Sep 2024 16:50:41 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c6354c8sm1415516d6.46.2024.09.13.16.50.40
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:50:40 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a99d23e036so258355785a.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:50:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7wKD1zfzBuw8mIxMXrS1/tv9LRq6TiN3ncwFjJM3h7Yo4uNFvFyaEbU5GcSeD2pOCOEWj5UPcpGM=@vger.kernel.org
X-Received: by 2002:a05:6214:448c:b0:6c3:5599:93a0 with SMTP id
 6a1803df08f44-6c57347d602mr144060086d6.0.1726271006617; Fri, 13 Sep 2024
 16:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
Message-ID: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_o=
f_probe_simple_ctx *ctx)
> +{
> +       int ret;
> +
> +       if (!ctx->gpiod)
> +               return 0;
> +
> +       dev_dbg(dev, "Setting GPIO\n");
> +
> +       ret =3D gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_hi=
gh_to_enable ? 1 : 0);
> +       if (ret)
> +               return ret;
> +
> +       msleep(ctx->opts->post_reset_deassert_delay_ms);

Like in the previous patch, you need an "if
(ctx->opts->post_reset_deassert_delay_ms)" before the msleep().


> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct =
i2c_of_probe_simple_ctx *ctx)
> +{
> +       if (!ctx->gpiod)
> +               return;
> +
> +       dev_dbg(dev, "Setting GPIO to input\n");
> +
> +       gpiod_direction_input(ctx->gpiod);

This is weird. Why set it to input?


> @@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev, v=
oid *data)
>  {
>         struct i2c_of_probe_simple_ctx *ctx =3D data;
>
> +       i2c_of_probe_simple_disable_gpio(dev, ctx);

Maybe add a comment before the GPIO call that it's a noop if we found
something and i2c_of_probe_simple_free_res_early() was already called?
Otherwise you need to read into the function to understand why this
doesn't crash if the early call was made. To me, that makes the
abstraction add confusion instead of simplifying things.


> @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const =
struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component pr=
ober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve re=
sources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO.

Talk about the fact that gpio_name can be NULL or an empty string and
that they mean different things.


>   * @post_power_on_delay_ms: Delay in ms after regulators are powered on.=
 Passed to msleep().
> + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passe=
d to msleep().
> + * @gpio_high_to_enable: %true if GPIO should be set to electrical high =
to enable component.

Now that you've added the GPIOs and more delays, the description of
this structure needs to list exactly what the power sequence your
simple functions assume.

I would also say: given that you're providing a parameter anyway and
you're giving the GPIO name, can you please move away from the "raw"
values and move to "logical" values?

