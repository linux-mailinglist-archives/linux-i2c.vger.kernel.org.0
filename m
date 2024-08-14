Return-Path: <linux-i2c+bounces-5375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1589951868
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 12:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A81B1283A3F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 10:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307541AD9D4;
	Wed, 14 Aug 2024 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j/iEdSU3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3672A1AD9C7
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723630219; cv=none; b=Tv/LVf8Opn17syxgNweTctbic5zifsr+yjrO4Kqq5/lt2ufIOSDSb0t3lS0RHuWHhQCEU7Zc1cdrAT66ZbUO+u9V3/wbCaGV5wz0bBNxJGX8zbqsXSg+LFL+0F3DZxeAfnQehP7n3YufgXEGbNz5GWdonPQwR4Owfycp5iUcN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723630219; c=relaxed/simple;
	bh=HtmsSU5ENdUZpr+MPxoYuH51F28PtAovj20fVUAbRwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBErNn3hZFL1lyxqxeP+pNxxJkKLsv0m3C+DfFYa7/6TcjYD27DpjoGR4QB1Zs3DYLSa1mUGHRm8V038ZGq0r3y77o1/cGP7puvfG+kZ/l8jVzHfYfT0+zQgz499OUxe6W4rGu3w9YlA1jfvn2wR5jjQTKKFCF01rRk2Sgnlrio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j/iEdSU3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so70949381fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723630215; x=1724235015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=;
        b=j/iEdSU3Gv1uH9TUVPNvmrm/2QZpGumGlEgCXh1a8G+aqAIkvOXGrnRes9Lrj9FySQ
         xVoyqhzc2aBlr6hgPU7xeJsD0dEhX0355GPFPcKSMIk6rXUh8/jNNQ5yTbGj91V8XY1R
         cmGhzrXSkAi0yqSv6ol5zigy7mjAeL/f6iCoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723630215; x=1724235015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=;
        b=QjQqKASu/ETq/buYvmYJuNo0YOHnMum0GoB5uzbIQ50JXSQ1bHDiV1vSnpRmgudl6E
         1BxTzkeAJ2QQqEXNJ6zRehhOwwXvF+YczLV3mK7p6reMg0wiEKeMz5KNIxBmtFx4a9kZ
         FAB2fU/4Xf5dq1qgcqpTv2mwhMbdj2NF5P6klo549O+dEESCpJfYNNaZSKh2HTihh8kF
         voE1aIxeSZaPaMZtxmqUfPHPENFrxCnIrqyJXjv7a70HcLJQxmmT/M6q9+Mc+N2ka2pI
         zxhZR/gg2c3Fnr/YfLDJwD2A/R+P8ei+nxD//KOGKS6IzIjUdkBSHEadBWEud6QED03O
         ODKg==
X-Forwarded-Encrypted: i=1; AJvYcCXcHWJGKhkB7e0yZ89VRXFo6XMa/JRI/HJCUg0sBtx5UeNNkH2n/R281lU0bKLq3C++kX09KkUamTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqucUW8bXCtcqGOWhHM46J9a3q/hw/X+pTXFC4HpCWej6LZU/
	ZZjC8g+6Z++bKNEN3EeY71IG4b3eTQWDpcfwyra5R7kdT3Dl6gax/DeZ+wx+x69XaWfPLciqH+U
	7g8RUXVFzxAHZDoBgxWCon1jsyknPRp0/+Qae
X-Google-Smtp-Source: AGHT+IEe32jN8gUqbf1l9ngrSD5IPLARvV8fpV4Tje3WEqH7kkd+ZQY+1xW4UvomRXZlgVtw/pLaiYHStH4ShpBNc/E=
X-Received: by 2002:a2e:4a1a:0:b0:2f0:33e:d286 with SMTP id
 38308e7fff4ca-2f3aa1a5198mr14064661fa.20.1723630214840; Wed, 14 Aug 2024
 03:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-6-wenst@chromium.org>
 <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
In-Reply-To: <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Aug 2024 18:10:03 +0800
Message-ID: <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 7:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:
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
> > this change introduces a simple I2C component prober. For any given
> > class of devices on the same I2C bus, it will go through all of them,
> > doing a simple I2C read transfer and see which one of them responds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree.
> > The status for all the device nodes for the component options must be
> > set to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > + * Copyright (c) 2023 Google LLC
>
> At bare minimum we are in 2024 now.

Ack.

> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
> Why?

Might have been left over from previous work and squashed into the wrong
commit. Will remove.

> > +#include <linux/platform_device.h>
>
> ...
>
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > +             if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
> > +                     continue;
>
> > +             int ret;
>
> I didn't know we allow this kind of definition mix besides for-loop and
> __free()... Can you point me out where this style change was discussed?

Will move to the top of the for loop block.

> > +             ret =3D hw_prober_platforms[i].prober(&pdev->dev, hw_prob=
er_platforms[i].data);
> > +             /* Ignore unrecoverable errors and keep going through oth=
er probers */
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     return ret;
> > +     }
>
> ...
>
> > +static void chromeos_of_hw_prober_driver_exit(void)
> > +{
> > +     if (!chromeos_of_hw_prober_pdev)
> > +             return;
>
> First of all, this is dup for the next call, second, when may this condit=
ional
> be true?

When the module is loaded on a machine that doesn't match any entry,
neither the driver nor the device are registered. Hence the check.

Or maybe the proper way to handle it is to return -ENODEV or something?
I'll work towards that.

Thanks
ChenYu

> > +     platform_device_unregister(chromeos_of_hw_prober_pdev);
> > +     platform_driver_unregister(&chromeos_of_hw_prober_driver);
> > +}
> > +module_exit(chromeos_of_hw_prober_driver_exit);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

