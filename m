Return-Path: <linux-i2c+bounces-6740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F11F978BEE
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 01:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86EB9B26153
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 23:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F018191F8F;
	Fri, 13 Sep 2024 23:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PdRZeuZU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E875E192586
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 23:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271012; cv=none; b=h68h14IdJwvCbpKsloZu6nt26SOpLU4bQidFsPI4Z7aLlUByzg2xg54tiy/ETG5PLN7+H5Llksk/fcoiSJG6u2fFtOxf4CBUamqT3hFbu4J4b7c67jDjfjp2ZfMsFxZLJb62mOdj/MPRNGkJEF9Lbqybi0uWEP2yCzB/BVVQd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271012; c=relaxed/simple;
	bh=0ahzFG2oNxj4NQXzKVIJir1WD7KoViMiBM80pX771gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p67kVUTR0Qb+7Bg11yXGeaq5WuOFep5aZqQFeWZqQhm5fDd8rI4zy9MxFH8+y+Xu9Cm47Lty1ybJRnp4PhiP71h+WsrIlzn399qPZTy8JkHfnLIUWcwfgbwNIg1TrTGulxasKiAialxhzXhKpd+eNW5RNVZ/GWkk5BK0t4u0Prk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PdRZeuZU; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c51d1df755so20575616d6.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271008; x=1726875808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=;
        b=PdRZeuZUaXb8/JLT5AzdOU/8azdjKYvmxqr20oMQio9Tfrgq9V1Hg9jmnT5OMzcpqp
         pNpxrr7JXqu3blVdPlbVmqusweFgRFFKT7b4g8cI1L3WDNzEUBgiXCIR32kzEHMt4A53
         zGbzyrk9wCS4i88iHCklokHUIcT8EO/XpCrfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271008; x=1726875808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=;
        b=olGvlYcdttNCofuxSzuj/19FWQRMu3lRsnFvZhb2WFol6QvSNZ2me+rHmW6/2tsKRl
         1kR2l682/9Um8mEmmLHYJFOAQVNWYUMf8D1+jDu9pPdLHswoh9lsykDINuT0k5vLEA2w
         2P7YmNrvxcwTzrwd2lxRCY8ye7pPHfUOLkQ6A803iA3PVoFNqWjz4QIqxxSvQ0J/IUI1
         zmCBg7SxZg2iYo6OfgesruHJJ/N1XFwheyxqJ7d1bU26lxiZCFMr+57XVNOQxWCXvczM
         jRXIRtM6s/+WirzSfCP1i75MSx+gwQ666t9a6mDGASdyUUX+6pVbI7xjtl2BA0VCDYK1
         nKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWvv+ogg0k//06CBZd/sFYXTZz1LWoeEZeDgLKhIeSRH9kCEnb5ABjRMWL1QOn3MAgu/Cfuzk4+6Vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbR1LYdsaqAPe6QPiZaef6Uk1sOT2ss44KdknYhQVcJzOqNeg4
	zQXqYFqvlnWGMOc+9SbwoGsg6TS6AOXUJnerw3MnaoT/csgpY4B0aJp2lbIVkI5jkNyixuFfPSw
	=
X-Google-Smtp-Source: AGHT+IHbY/+/odRCcMzALOwy4BxhCL039Us/IQllo+1zKv0A+MJKtFi2pAwiFELEVj5b4ZwNiJvhnA==
X-Received: by 2002:a05:6214:4519:b0:6b0:75bd:7fb with SMTP id 6a1803df08f44-6c573570bedmr138769366d6.40.1726271008557;
        Fri, 13 Sep 2024 16:43:28 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c6422casm1347246d6.60.2024.09.13.16.43.23
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:43:24 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c51d1df755so20574806d6.1
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 16:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXA3pUCnQ4vKTwX+GUAj4qcS1xVVywN3CgO7N+q9UMld/1Lek89tpUeK9KI7pS5wkY/dfER/talNN4=@vger.kernel.org
X-Received: by 2002:a05:6214:390a:b0:6bf:7d3c:a64d with SMTP id
 6a1803df08f44-6c573570b31mr113649466d6.32.1726271002581; Fri, 13 Sep 2024
 16:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-8-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VL3nA8hwC8Ejy9T0ZWdYKxMjts8fgF7Y3CO507njOKkg@mail.gmail.com>
Message-ID: <CAD=FV=VL3nA8hwC8Ejy9T0ZWdYKxMjts8fgF7Y3CO507njOKkg@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for regulator support
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

On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> +static int i2c_of_probe_simple_enable_regulator(struct device *dev, stru=
ct i2c_of_probe_simple_ctx *ctx)
> +{
> +       int ret;
> +
> +       if (!ctx->supply)
> +               return 0;
> +
> +       dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->sup=
ply_name);
> +
> +       ret =3D regulator_enable(ctx->supply);
> +       if (ret)
> +               return ret;
> +
> +       msleep(ctx->opts->post_power_on_delay_ms);

Presumably you want an "if (ctx->opts->post_power_on_delay_ms)" before
the call to msleep() since it doesn't check that for you.


> +/**
> + * i2c_of_probe_simple_enable - Enable resources for I2C OF prober simpl=
e helpers
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages
> + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> + *
> + * If a regulator supply was found, enable that regulator.
> + *
> + * Return: %0 on success or no-op, or a negative error number on failure=
.
> + */
> +int i2c_of_probe_simple_enable(struct device *dev, void *data)
> +{
> +       struct i2c_of_probe_simple_ctx *ctx =3D data;
> +       int ret;
> +
> +       ret =3D i2c_of_probe_simple_enable_regulator(dev, ctx);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Instead of the above, just:

return i2c_of_probe_simple_enable_regulator(dev, ctx);

I guess maybe you'd have to undo it in the next patch, but it does
make this patch stand by itself better..

Although I'd also say that if it were me I might just get rid of the
helpers and inline the stuff. The helpers don't _really_ add too much.
3 of the 4 callers are just simple wrappers of the helper and I don't
think it would be terrible to inline the last one. I guess with the
next patch when you add GPIOs it maybe makes more sense, but even then
it feels like a stretch to me. Anyway, feel free to ignore if you
want.

> +/**
> + * DOC: I2C OF component prober simple helpers
> + *
> + * Components such as trackpads are commonly connected to a devices base=
board
> + * with a 6-pin ribbon cable. That gives at most one voltage supply and =
one
> + * GPIO besides the I2C bus, interrupt pin, and common ground. Touchscre=
ens,

Maybe speculate here that the GPIO is often an enable or reset line?
Otherwise you leave the reader wondering what this mysterious GPIO is
for.

