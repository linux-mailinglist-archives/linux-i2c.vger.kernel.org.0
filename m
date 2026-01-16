Return-Path: <linux-i2c+bounces-15241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263AD324BD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 15:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 612AE306929D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1980B28B7EA;
	Fri, 16 Jan 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeENGOUj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197F283CA3
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768572008; cv=none; b=dQa8WEDe70ualtUo7/IW41H1lZH4CfUnjDt6dXlma88cxL6tac66NEEitN+dyqQHml/s9oFSY7FLfxYXAJovS4fvloWTmUWDzaMMxkL4s+2ExxY/HVrAIcJt4/mwPUuNdGBLmstvOnR498TcfQyRFVKmBPkZv6dpIjDaJsz2Mfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768572008; c=relaxed/simple;
	bh=7bJWEVQ2MAfypxWKE2dScRRpRKUpqJ0WIWhC3xalUu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEaqHbm6fDSGw4d9oTYJmd4YRUdWnIltcUGOajw/LUwOOWVtDLTIre0788wpmzQgnOtf+k7tTJQRPoGzY5LvxoCZYEAdKrcqe+w+WJMYdqVBx0zXX9qIorMHNSUiZgls+WJ1gqHPolpyOdw48bJedhXHyN+stZThImXkPEd8HvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeENGOUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B750FC2BCAF
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768572008;
	bh=7bJWEVQ2MAfypxWKE2dScRRpRKUpqJ0WIWhC3xalUu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WeENGOUjHHDQcddSX7OBrHH9e4TdqCWq1P9UFK+ESf+qOYrbJ3Lz57FW1NtZcbkD7
	 0fvy59W2U51B3ga8gjez+dX64vdCJyROa0ih2uNiS6mtHDQSkHXWskwkxxMbAZe8vn
	 4XSiyRNZi6Ag8jRwBETOO2f0OjsNfQe+c//Qxt7Rp56zmmk4OVi/a6QYz7yddxlBgX
	 DixLkn2fVgmdwAqyECCNthVtcQKxV9ej5QdCvrWzL1LngSvYIV3eLKEj/2qtptODfS
	 jFEQuDiiCgR5ZQg+LzCcrnteH6F5ZtWouPFgtonuy6AukAOXdX0WsTQOzAnZqnwadC
	 b2CzzWnnUfhTg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6446c2bbfe3so1651015d50.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 06:00:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYfQ77QNVhgpLyJgJ9WFf5FLcWomzTyLsfmCzBPXpCOYCGyBm9wO09lPDc7Ufve9j1XFj6nMyt4mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmoHAKu8uO0q5YOTbqPBOIIPA1xGsT/nh7JH3KkIqGkwFGOJG/
	3ldsylIRNHC785tsdRyuGab6Nr0EnxnecQkf3RhcwhnZJU5fCiazKtyqJf1vRrg1fonORMGTWFG
	zU720hwkqwBdcKDmUryMod2zBGPl4HB0=
X-Received: by 2002:a05:690e:4191:b0:646:5127:ad97 with SMTP id
 956f58d0204a3-6491648f766mr2620228d50.28.1768572007984; Fri, 16 Jan 2026
 06:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114141352.103425-1-jie.i.li@nokia.com> <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
 <CAO3NRJgNi88uhtN0RfbUUKPz_SSoceQyBTbScS-LV=9oYkDJqw@mail.gmail.com>
In-Reply-To: <CAO3NRJgNi88uhtN0RfbUUKPz_SSoceQyBTbScS-LV=9oYkDJqw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Jan 2026 14:59:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
X-Gm-Features: AZwV_QiUpV0ivqUg5M5deIVO1VpbgT7LlJ9eZW0zRn8C-PiMRUszJpWQSiHpkvM
Message-ID: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] i2c: add support for forced SDA recovery
To: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jie,

On Thu, Jan 15, 2026 at 2:13=E2=80=AFPM =E6=9D=8E=E6=9D=B0 <lj29312931@gmai=
l.com> wrote:

> Even if FLAG_OPEN_DRAIN is set, the function falls back to
> gc->get_direction() if the FLAG_IS_OUT bit hasn't been established
> yet. Crucially, some ASICs do not even implement a readable direction
> bit in hardware.
>
> In many true open-drain hardware implementations, a line driven "high"
> (high-impedance) is physically reported as an Input by the hardware
> register.

If this is the actual problem, then this is a Linux problem and not somethi=
ng
that should be solved by adding new flags to the OS-neutral device tree.
So we can immediately stop trying to add stuff to device tree for this.

What you would have to do is to augment the driver framework and
code in Linux to deal with open drain modes better.

> The function returns 1 because the line is currently high/floating or
> the hardware lacks direction reporting.
>
> The I2C core then assumes the pin is "Input-only" and skips the
> assignment of bri->set_sda.
>
> Bus recovery becomes impossible even though the hardware is fully
> capable of driving the line low.

So you need to think about what the framework needs to provide
for the I2C recovery code to realize this line is open drain and
can actually be driven high and low.

You can't just rely on gpiod_get_direction() to be the only thing
that will ever be provided just because it looks like that today.

For example: if <linux/gpio/consumer.h> would provide
gpiod_is_single_ended() (meaning it is open drain or open source)
I think you could use this instead of special "force" flags.

So implement something like that in the gpiolib code and
headers instead. This avoid hacks like random DT flags.

If the right open drain or open source flags are set on the line
in the device tree then the gpiolib knows this and then you know
you can also actively drive these lines and all you need is
a way to query it.

Yours,
Linus Walleij

