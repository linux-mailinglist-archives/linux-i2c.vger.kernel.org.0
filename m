Return-Path: <linux-i2c+bounces-7370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1766B99DD76
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 07:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF7A1283846
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 05:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD31175D3E;
	Tue, 15 Oct 2024 05:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lewbo6iy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55527175D50
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 05:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728969750; cv=none; b=n5YL7EvuLy4RkRMzCMhXk13c9W5HL9bdEdYUXgHnZo6J9/6z7LAADYBWGsxavIoidOYLnqzCHH2UUlMVQMm0wk2KXL40bG3Lwub3/oOZrQV245c4spRXlNsQPuFxDBTLMmDxR2E2y8Z5SbTafK5sRoxRuBCvQ8556CHTC3yly7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728969750; c=relaxed/simple;
	bh=QroOQcxlNuix6nORrJFaZjYUpe/qnnT7RocqztaVH6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSKs7U/MzKK6WH09fkuEzq5ExSM+Is8MRhencDHnJo7hnfo9GGC9ixKzGts+ibc1bmZyXKN+kgtslw2LQ4xAJL+cUqfXefa7lXRiXzst40ipel3mow7IBSCR43+mdUi/MN2c7H+sfkXwDPIE1CzHjQtJMcUBtZnHRshQS8zTvQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lewbo6iy; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f53973fdso1402041e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 22:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728969745; x=1729574545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2amfIbZSfwwrInuc60WPLo9Bq9qEZCLpcMAyCEJ6kmU=;
        b=Lewbo6iyk4u7kTWaOVRnQzCOQ7wTbOt0UUNEGRHEgwFn2JIcj20DaQNjgK685JjrUc
         1NF3gAOSlzR5FzQEH3t0RMRDwQzfV+lk+Rn7Qu7HTvCEX+ObgwyYLk0vPRh96E7XPq73
         p1wcd0OI6qd28wQX3RD/Sc6lGtNKlqXqE5lDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728969745; x=1729574545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2amfIbZSfwwrInuc60WPLo9Bq9qEZCLpcMAyCEJ6kmU=;
        b=FGlQcRZ155F037L1qDNq9HbtG4zFzRR1vmOf5vw55ld9GQMr88Z227RTtfk9DSJ9yF
         Gds7zJ88Gtzvcxxd9UAcnnMLO5YUVuZ1gpmFU8KeL29dP+0UK0Hd3yQbaiAOG1bBUW2n
         TDp9bF2EDEx+4/TOdx3+yb4A6YJkFQgc2/ZmdOK4cmFHemdf1kol8L/lZiSmkCHYgjqs
         I3dln4tC2EoH31+4uEHs0FjX1O1wfMn2Mi2o0YhG6b3VcYfsDYnYAGGtwdLgUwDLdj+5
         TR9U8bPnj7d2jNHV+zBHI2OjJePtnI9qg5eZqXHFMvLT3dPD9UKC8Oq/5YNztmMSQ5s0
         FRCw==
X-Forwarded-Encrypted: i=1; AJvYcCUALs8g8fBlpeLIBjeYTIzDo/hmqTle3pEMVzM1zaZh/thtkb2+9hBFuI3It7YJryg1nopVST3j+VM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywih7WBHaXuZ/bCKfbEKUsJb0m1l3HQzc1j+vEctuBSCpiBvXy4
	VFthTJqW7Fl3QrdHNgYGZwkHPIUKTOSt/YDTArM+rNHmS/3Klswy20MuR5zT6/g2J2rq5FMf9uZ
	hV6IqfKzzEZm26/R5ehWVu9qKzKE7qrMA4c9U
X-Google-Smtp-Source: AGHT+IGnCYIKC4fxrTKf7KXrK4wtSw6kzD/gty96rpQnFBMMz91hHJcgXAFaBjG2JNXIFl/CWbfvb9I+Di9bhTdNMZc=
X-Received: by 2002:ac2:4f0a:0:b0:539:e263:331c with SMTP id
 2adb3069b0e04-539e26334a7mr4023423e87.17.1728969744956; Mon, 14 Oct 2024
 22:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <ZwfvuA2WhD_0P3gL@smile.fi.intel.com> <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
 <Zwz9djqb0Q6Ujmo_@smile.fi.intel.com>
In-Reply-To: <Zwz9djqb0Q6Ujmo_@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 13:22:13 +0800
Message-ID: <CAGXv+5EGq=OAymON-wj0OzQjK1VxRzdvgJgbHxaYPKP_pmTN2A@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 7:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 11:53:47AM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:16=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > Fresh reading of the commit message make me think why the firmware or
> > > bootloader on such a device can't form a dynamic OF (overlay?) to ful=
fill
> > > the need?
> >
> > The firmware / bootloader on existing devices are practically not upgra=
dable.
> > On the other hand, the kernel is very easy to upgrade or swap out.
> >
> > For said shipped devices, there is also nothing to key the detection
> > off of besides actually powering things up and doing I2C transfers,
> > which takes time that the firmware has little to spare. We (ChromeOS)
> > require that the bootloader jump into the kernel within 1 second of
> > power on. That includes DRAM calibration, whatever essential hardware
> > initialization, and loading and uncompressing the kernel. Anything
> > non-essential that can be done in the kernel is going to get deferred
> > to the kernel.
> >
> > Also, due to project timelines oftentimes the devices are shipped with =
a
> > downstream kernel with downstream device trees. We don't want to tie th=
e
> > firmware too tightly to the device tree in case the downstream stuff ge=
ts
> > reworked when upstreamed.
>
> Okay, I was always under impression that DT has at least one nice feature=
 in
> comparison with ACPI that it can be replaced / updated in much quicker /
> independent manner. What you are telling seems like the same issue that

That depends on which camp one is in. Some folks advocate for shipping the
DT with the firmware. In that case you are limited by how easy the firmware
is to upgrade. Or they would leave an option for the firmware to load a
newer DT from disk.

The other camp is shipping the DT with the kernel image, which ChromeOS and
some Linux distros do.  Then the DT is as easy to upgrade as the kernel.
Opponents would argue that the DT is a hardware description and should
be separate from the kernel. However as with all hardware bringup
development, one can't really describe something that hasn't been
developed and gone through review.

However here I am specifically talking about the firmware _code_ being tied
to the DT. To implement the probing feature in firmware, one needs to eithe=
r
add a lot more code about what devices the system might have, or implement
the equivalent of this series in firmware, or something in between. This
is a lot of code that depends on the structure of the DT it was developed
against, which most likely was downstream at that point.

Say someone screwed up some DT structure downstream at the time of release,
such as the node name or address prefix, and that was fixed upstream. The
new upstream DT no longer has the structure the firmware is expecting, and
the firmware might not be able to handle it anymore, resulting in some
peripheral no longer getting probed or enabled. And you don't have a way
to upgrade the firmware to fix this.

> ACPI-based platforms have. However, there they usually put all possible d=
evices
> into DSDT and firmware enables them via run-time (ACPI) variables. Are yo=
u
> trying to implement something similar here?

Yes, that sounds similar. However for us the DT is tied to the kernel, not
the firmware, i.e. not provided by the firmware. There's also no UEFI in
our case.

> ...
>
> > > Another question is that we have the autoprobing mechanism for I2C fo=
r ages,
> > > why that one can't be (re-)used / extended to cover these cases?
> >
> > I haven't looked into it very much, but a quick read of
> > Documentation/i2c/instantiating-devices.rst suggests that it's solving
> > a different problem?
> >
> > In our case, we know that it is just one of a handful of possible
> > devices that we already described in the device tree. We don't need
> > to probe the full address range nor the full range of drivers. We
> > already have a hacky workaround in place, but that mangles the
> > device tree in a way that doesn't really match the hardware.
> >
> > The components that we are handling don't seem to have any hardware
> > ID register, nor do their drivers implement the .detect() callback.
> > There's also power sequencing (regulator and GPIO lines) and interrupt
> > lines from the device tree that need to be handled, something that is
> > missing in the autoprobe path.
> >
> > Based on the above I don't think the existing autoprobe is a good fit.
> > Trying to shoehorn it in is likely going to be a mess.
> >
> > Doug's original cover letter describes the problem in more detail,
> > including why we think this should be done in the kernel, not the
> > firmware:
> > https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1=
b9fa1827df0928c5101@changeid/
>
> Perhaps it needs to be summarised to cover at least this question along w=
ith
> the above?

For the first question, it boils down to we think that the firmware should
be simple and do as little as possible. It also should not be tied to a
specific DT, so editing or fixing up the DT in firmware is something we
avoid. The firmware can do overlays if they are provided, however in this
particular case, the identifiers used by the bootloader don't cover the
variations of the I2C-based second source components.

For why autoprobing isn't a good fit, I believe my answer above covers it.

ChenYu

