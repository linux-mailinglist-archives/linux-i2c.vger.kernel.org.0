Return-Path: <linux-i2c+bounces-526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E507FD08C
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 09:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 918941C20A4B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 08:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE8811CA8;
	Wed, 29 Nov 2023 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fHBgrL2r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F021735
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 00:20:21 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bbef0e5d5so1879887e87.1
        for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 00:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701246020; x=1701850820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGQdzNcCy7JJPTMsdtSjV4HF9Py88/78L/fuExW3uc0=;
        b=fHBgrL2riGo55WbAksoZkVDiTWuj64ymcaDVZEYbKimH7b75b+TcrCLAUZVc8P6Tur
         XzTDsgbVXTw+v2DIIKtL9MhTQJyBHpzEPAjKujGhexmmne3GkaUWZCyFMQzLJv5w+K36
         /ivVlPj5EUedeP/VaCWaJaStr7m/TeG8rfs3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701246020; x=1701850820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGQdzNcCy7JJPTMsdtSjV4HF9Py88/78L/fuExW3uc0=;
        b=Oq35G/SeGqJ91C8YDIAuPFSreLGXqpZUjN05U02sK3ebvna8l5xbUmoWgVhvAZIE8H
         SvlpZFbtv1JT6GdsXcdw0PMF8doVt4T323ILheCfWqtGbiT9jvFLXYn+ttXNq1hUbmsq
         3N1gCkDD4ckATKHYOrW7vVBiNpywwYQwggkndoxHMpnPT6ZxYQFEtRWrxIjpPA+w4BMb
         hTI9ulZw9KYgMzRyHkQovyMdKSNQdzIIYu2JEHyKkIhCJKUpG44AXtDkAYEOtZAFo0sX
         hHPa+JP6ZSKUcS3J9SOIrNk5EKzwG6o1NiZCKL1umG8HOtv7KCjshJF0jRr1FvWKIIdm
         YKcA==
X-Gm-Message-State: AOJu0YxV6S/gg8CQS9YU4VhAfenP+imC1nBPf1ZY/4jQ34Qg/TdmG6UG
	ReGlql4acSx52OjzWOSRscu2MeHhrDlGgt6rafsDJA==
X-Google-Smtp-Source: AGHT+IEh1TZm31uTy9yl8JaoDy75uNislLbWP0HEQgS4BWTnpP4KSfrLHeULqt0bxB2I0d2oNC/cmwQl0Wsw43+9ohk=
X-Received: by 2002:a05:6512:10d6:b0:50b:c501:72d with SMTP id
 k22-20020a05651210d600b0050bc501072dmr923175lfg.61.1701246019908; Wed, 29 Nov
 2023 00:20:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-3-wenst@chromium.org>
 <ZWYTzGGToEmSu-Yh@smile.fi.intel.com>
In-Reply-To: <ZWYTzGGToEmSu-Yh@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Nov 2023 16:20:08 +0800
Message-ID: <CAGXv+5EBBtbpDA8scVBFysYrk6s8JUd_-JcqbX3oubO60Uc_ZA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, 
	broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	james.clark@arm.com, james@equiv.tech, keescook@chromium.org, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 12:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 28, 2023 at 04:42:31PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component probe. function For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +/**
> > + * i2c_of_probe_component() - probe for devices of "type" on the same =
i2c bus
> > + * @dev: &struct device of the caller, only used for dev_* printk mess=
ages
> > + * @type: a string to match the device node name prefix to probe for
> > + *
> > + * Probe for possible I2C components of the same "type" on the same I2=
C bus
> > + * that have their status marked as "fail".
>
> Definitely you haven't run kernel-doc validation.

Right. Will add missing parts.

> > + */
>
> ...
>
> > +             return dev_err_probe(dev, -ENODEV, "Could not find %s dev=
ice node\n", type);
>
> I haven't noticed clear statement in the description that this API is onl=
y for
> the ->probe() stages.

Will add that to the Context part of the kernel-doc.

> ...
>
> > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_S=
MBUS_BYTE, &data) < 0)
> > +                     continue;
>
> This will require the device to be powered on. Are you sure it will be al=
ways
> the case?

This is left as TODO. The devices I have tie the component power supplies
to an always on power rail. I guess I could get a trace of the function
calls to see if things are running as they should. Not sure if that is
enough?

ChenYu

