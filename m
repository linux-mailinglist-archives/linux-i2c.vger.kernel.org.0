Return-Path: <linux-i2c+bounces-15185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED590D24B25
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4154E30B2B9E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DAF39E6F3;
	Thu, 15 Jan 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdC/tP9V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B1399A5B
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482793; cv=none; b=eF334VZAZPek6vo43ank4gvrz6NXYw2Alo7cdoal3lYTsh+acrums5dP8WiwX0LUjtErLxiajEEoYOsaqOKIus4Ww3qbZ1fym3woIwSvohXcwrkMzDQUFb4rrGebmd/TnRisja0T0pH0/FuWpjj/epWEDyyBdveVfwIKgOexXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482793; c=relaxed/simple;
	bh=/7C1vhRdASPTMDMfdQtrm3XwzYwj0bOEBGu+5yC3C+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAsWEzENnT8JaKBJwK9rTDDjQHG2eLm+4iYdtP5xPWWYLKrTGxwnHE7rE2S4Wc0aMq2hkfIL4XZuKHlrJNvWGV0R93bD+EzmlE8t6xlr/SyyDlgk8lzyu0Yl5mIYQADFUduIBH39OHUZpNGSbZ5vGa34xGFX0tA3fB7CmyTD0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdC/tP9V; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8718187eb6so129185966b.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 05:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768482790; x=1769087590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7C1vhRdASPTMDMfdQtrm3XwzYwj0bOEBGu+5yC3C+4=;
        b=cdC/tP9VG6Fu6XchNGG6s1URIXhHftXqubwKYyvmj76o+B5OM6gXGd4/zGZdXuDy4m
         k/zqv1BEH2Mu//rMxXXhLyrTXAxI437UEtbqJmmQ6+dX1BcYTYfgkuaO2IRrxW/lmCYg
         M0hvTYgN97VGgj6eh/lARSrO/il6921c7mUNGsLIWOz69c2305yXbw+9gBZpiU2gRVrC
         D4DGc+2c4QYf/nYPvQJbs9MjyBa/3fQ65++yg19F/Y3ajNmyl2xoxjuIiPyN3VjG+0Hq
         grc0lJZomNbBiWSjXSSO8vMBVyxSN6McFKNu4OD8xPmvTQ1DCoAAlWIl58mwdyz8Tk5s
         YnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482790; x=1769087590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7C1vhRdASPTMDMfdQtrm3XwzYwj0bOEBGu+5yC3C+4=;
        b=ajNCwbrzsioN8DSyKbazODJMpLSozkr5qontqn8g8nPkOpRejBprCazP7clCvMK66g
         U/R2eiSSaPfb8Su9mzBJhkebvEjaP55B4ccAr9rTLdKvmVIQ+hdbzRAlmL8PwcGxNcMv
         R0MGzu0JdkTXDCyC9+QXSpcTy2UJuWo/A6dW4oDDI7dRsmDIksw+go3D65851JojBqqW
         jkxEt4YHbWO5XhOpMqWzlQtl4q6GPVm8r2TALsz0BifGk7yGtRMdRjbU7jF5YWPfpFkh
         Fb1RVYMlV8FL2/wr/YAEvE/Xc6AG9paVeVZvw1xkutOo4W708Qz8r4AMANtwk9Db65Sk
         Svng==
X-Forwarded-Encrypted: i=1; AJvYcCWSZx/T0e6swD6nXlTlfWq8B/SX4wcSnmSvZCq0ryhmA31wrBzEnnrwcewz6lzwQaXIkjS+Uffr9fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQPIuEbphkShWlxMnsc4UVS7povEhLqURRCgyJGv2VSF2hqTD
	tkDfo3tkpdfHGzdBTmLGQI0dCEehPBf12szwiKjpI4B9RaJaaqcWl+0I+/FNA6voK/QbvnSeSwm
	Q/48DXB6cv8drqJW3vEqXoaUL53c7LPo=
X-Gm-Gg: AY/fxX63IeYzsLwyTgBp5NctuZOSeMpiey45LzBGloelN0qX1KpBUVy7cFzWvJ+fmmx
	D5OK1I1l5p8D0Ur2gmOKUbVIQzVfypfEvnpxBu0fy6uSSExycNeemn3Bbm9xD/T7MzD/Z3xjHF0
	CJjHgZeJgMqWdAYbxL3kpT6+YV96fyxcJ48VYUqmot3YPqWTRiTwWS0M/+PuIkqpoA4cJBrUvDO
	ObkcIg8yV3YDOY9bQSKrz599mq1Zeiq1bKZRPOEWvj5bigp3L2Yp3eZpZmwaO2TV3HE0a+7h9ar
	dz027RbSUCo=
X-Received: by 2002:a17:906:6a01:b0:b86:f81d:66b1 with SMTP id
 a640c23a62f3a-b8760fdf7dcmr483161766b.2.1768482789913; Thu, 15 Jan 2026
 05:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114141352.103425-1-jie.i.li@nokia.com> <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
In-Reply-To: <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
From: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>
Date: Thu, 15 Jan 2026 14:12:54 +0100
X-Gm-Features: AZwV_QjKsJ_TH_EzWpJMMMax33gEHVuvQEPtXjiun3u76fWkZ3qK7mZFa73MhiE
Message-ID: <CAO3NRJgNi88uhtN0RfbUUKPz_SSoceQyBTbScS-LV=9oYkDJqw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] i2c: add support for forced SDA recovery
To: Linus Walleij <linusw@kernel.org>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linus,

Thank you for your feedback and the insightful suggestion regarding
GPIO_OPEN_DRAIN.

I have analyzed the current implementation of gpiod_get_direction() in
the kernel, and I believe that relying solely on standard GPIO flags
cannot resolve the "deadlock" on this specific hardware.

The issue lies in how gpiod_get_direction() interacts with certain
open-drain controllers. As seen in the source code:

Even if FLAG_OPEN_DRAIN is set, the function falls back to
gc->get_direction() if the FLAG_IS_OUT bit hasn't been established
yet. Crucially, some ASICs do not even implement a readable direction
bit in hardware.

In many true open-drain hardware implementations, a line driven "high"
(high-impedance) is physically reported as an Input by the hardware
register.

Consequently, gc->get_direction() returns 1 (Input), and the following
assign_bit(FLAG_IS_OUT, &desc->flags, !ret) explicitly clears the
output flag in the kernel's descriptor.

This creates a logic loop in i2c_init_recovery():

The I2C core queries the direction via gpiod_get_direction().

The function returns 1 because the line is currently high/floating or
the hardware lacks direction reporting.

The I2C core then assumes the pin is "Input-only" and skips the
assignment of bri->set_sda.

Bus recovery becomes impossible even though the hardware is fully
capable of driving the line low.

Regarding the suggestion to use GPIOD_OUT_HIGH_OPEN_DRAIN in the I2C
core: I am concerned that forcing the line to "Output" globally in the
core might be too aggressive for all platforms. My proposed
force-set-sda property provides a safe, explicit way for a specific
board to say: "I know this pin reports as Input, but it is safe to
treat it as an Output for recovery."

I believe this explicit opt-in mechanism is more robust than relying
on an automatic detection that is fundamentally tied to the
instantaneous state of a high-impedance line.

What do you think about this perspective?

Best regards,
Jie Li


On Thu, Jan 15, 2026 at 10:27=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Jie,
>
> thanks for your patch!
>
> On Wed, Jan 14, 2026 at 3:13=E2=80=AFPM Jie Li <lj29312931@gmail.com> wro=
te:
>
> > This series addresses a limitation in the I2C bus recovery mechanism wh=
en
> > dealing with certain open-drain GPIO configurations where the direction
> > cannot be automatically detected.
>
> I'm sorry but I don't understand the premise. How can we even get here?
>
> So the mechanism is about I2C that is using a regular I2C block, and
> the pins get re-muxed to GPIO to drive recovery using the I2C
> core GPIO-mode recovery mechanism with bridge->sda_gpiod
> which is retrieved in the core from "sda" which in DT is
> sda-gpios =3D <....>; (calong with similarly named SCL) for
> GPIO-mode recovery.
>
> So if that is set in an input mode, such as during devm_gpiod_get()
> reading the initial direction of the line,
> so gpiod_get_direction(bri->sda_gpiod) =3D=3D 1.
> this patch set will go and write output values to the line
> *anyway* because "it works".
>
> This is how I understand the patch set.
>
> In which scenario do you have a device tree where you can add
> "force-set-sda" to a DT node, but you *can't* just fix up the
> SCL/SDA flags like this:
>
> #include <dt-bindings/gpio/gpio.h>
>
> sda-gpios =3D <&gpio0 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> scl-gpios =3D <&gpio0 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>
> ?
>
> We should possibly also enforce it from the I2C recovery core,
> for SDA we are currently doing:
>
> gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);
>
> what happens if you patch i2c-core-base.c to simply do:
>
> gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
>
> (Based on SDA resting polarity being high.)
> I'm more uncertain about that one because I don't know exactly
> how hardware behaves in response to this, but can you test this
> first if you have to hack around in the core?
>
> Yours,
> Linus Walleij

