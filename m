Return-Path: <linux-i2c+bounces-10443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E4A91357
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 07:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30F9C1785A5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 05:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103841F584E;
	Thu, 17 Apr 2025 05:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9bxmsxs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C521DE4C8;
	Thu, 17 Apr 2025 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744869262; cv=none; b=YXOqOiSqQO/yjyS9LOEXTz6dxjNgo4DpGJiuCosqCdPqxChESILnjHTaIJUN36GMkM1rRbep5+4I1FECbBGqbMt3HH4T4iFFMIchIOhMHVxO2+kZqLFUikjIJpcol8HdISJDXZD/AHknUiA0TQb4buy9RI6h8AzYYruJmQ0T2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744869262; c=relaxed/simple;
	bh=kprK0lvULNRRtrBb0B3NMMimLQuxvy9ogMHPfRsi3y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPVv+lGK9VsVqb4JMQgndQsIf5UJzerACCaBufoBhhqJ2ngXwWoNNTenF9ke5/fyjr+6w4oAEYoR7h1Bqv8O9GxgeTw7r6dsXtXQ9WWN/VxfbwZkhVl0DCJkOkvyY+2oLYtna9mC8jh6fSGNDZbCnrnPxLZbgR4Dc9wzVG4RLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9bxmsxs; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5a88b34a6so39458385a.3;
        Wed, 16 Apr 2025 22:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744869260; x=1745474060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kprK0lvULNRRtrBb0B3NMMimLQuxvy9ogMHPfRsi3y0=;
        b=f9bxmsxsThM6TvmfkRApZVKRnZMFDOGYuESGdx9uc7CxD1KNDcfJ2C1fuePQ3C72vI
         T4kvZUwiiHax7z+0D/x5LCxsLt/ekvER65hHgJDLe6gMtXNzYo5kIMHiBSbt4LgKmPoT
         A025L0p9b4XSWD9Vd87NoJkJx/KkKigxm30bYszbNW8HujfNSkQEjpgTv/219MSghhLm
         /Cenxx9/E76arX0NyXjGLHJec5iiNcrNIg4NJe2djVbL2v5DchjE502x37tPGPnrqSsL
         y3ivXGBlUldbUIbMTqs/37QF3lIiYh74MD9Uva0UKZnvIthgeOw8E3HdflmFAn4TWEsF
         LKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744869260; x=1745474060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kprK0lvULNRRtrBb0B3NMMimLQuxvy9ogMHPfRsi3y0=;
        b=Qt/yPPHCRDmFLi15j7cW5OyFHdA2qppHmAa9dRRtQPcXOyZ/H4ZUOzwBtlwmg3sCfN
         SJ2hEkANtiAZdYyfRwbRjVySPK/x9xVeJvynJa1wFrfzDGTe0bGGOJSfhwrqBKzeYV/z
         m2ES1KBJKnb5DlfoEwRrkYx3G9hUKgNsjoJvTDZkGQIR7FU2QiBmeyI0TFe6u3+aklay
         lDhgN/68eXe+EnYp5RDeUtsrAEEf4YUT7mJGAG/zgeNQ9pGPYy6pydqpeVAxgI9HB7D8
         qGaMKottlN7cgPozxL6H1KUKMlFci46jPHUDlxEV+UBS2MQX2TPAiH1trynVtZ3R1dP7
         MdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNUvjZxdlYoKYmluBkR4b/OZ4QdavcyR0AUMA0N0LTbvEifJcDWAudCAWxAhLiPXgd6EL7WZPVSJ3e@vger.kernel.org, AJvYcCUiUb7I1I8B5/ZhKIYJ2KZWilctMHYTwIaX/vSWEL+ropkDR+HgSTaXLgItBGRZYx01zRxPyVxzXSz8@vger.kernel.org, AJvYcCVEWm6NhqTitRYnRK5GRt6V3HJK+L4P8NWF/i0hihKbBH83MCkBLBFrfNDFoMKwXvQ5KGloWHD2@vger.kernel.org, AJvYcCVG+LfXczlKF2dhcHoHGFMTQTIFyPYCqNUIzaFkXbzXboYW+io4zB/1JoUqfRrqPCQHHPnNiWjXVTAz@vger.kernel.org, AJvYcCVhn6VQTVrLjz+jIoX9zUnX0X/7Khr8/C89J4hq+05Vw/s1D3EgUnguxLu9+HfLhNUMpKbb9VOnC2ytqi6x@vger.kernel.org, AJvYcCX6JRzEfjGEBPKe5Qyir5jXKA4/LVJey5uBVWH838szmmytm6lu8h5xhRhy+bU/q4qHaGN3ytjPkNRE@vger.kernel.org
X-Gm-Message-State: AOJu0YxMeoxUYR0qnugIRa346zXxaeXNCeAHIK8WYAN9sT4htVPmadTg
	wy9cJpxJ6+ir+iKbcev4pvmuRR8BQZAtSHPT0r92OVNE8BLmWXGeZv4g5zVGewYIbO2VHUv59Gh
	reRa2axWwQ96uJn0dc/nZX0trUV8=
X-Gm-Gg: ASbGnctawqsezLUoikXh7DS0ssC/W657B9C4mRXN1B/tW8vL5S9raDv1I4EH7PMhK9J
	MPhKuYPM9jetNaCNxTck/RJZwAQtkmJWOaq4TMy3aQzVU0QFavR4gTqwwrRKyXfoVdr9US++ZEz
	GOx4S2WgnNI/6n6o8i551NQ+MURhNtdwv/ZtIVcgkQanfpxopJ9P31VSY=
X-Google-Smtp-Source: AGHT+IEnx6E+7Cu6lljiUQFeBdgwuD5UZtC9iurhJ50vZO4BYyoWmDW8Pd/wlyU1Nx7Pubvo+CQRG+bGBvTyZ549gPE=
X-Received: by 2002:a05:620a:2894:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7c919083ed8mr715313285a.56.1744869260062; Wed, 16 Apr 2025
 22:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-10-f9af689cdfc2@gmail.com> <209070b3-4758-416e-a408-480b2a8e4fbc@kernel.org>
In-Reply-To: <209070b3-4758-416e-a408-480b2a8e4fbc@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 09:54:15 +0400
X-Gm-Features: ATxdqUFzP7BBKqFL0s0OmGzLfog0caQx_klZzGoU6YsUX4cKgbYRNzTdifkZ0Bo
Message-ID: <CABjd4YxrqxAx9RpMcEtxoJm17BHMNUjD90EA9oHdGF8OoYTHiw@mail.gmail.com>
Subject: Re: [PATCH 10/13] ARM: dts: vt8500: Use generic compatibles for EHCI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/04/2025 10:21, Alexey Charkov wrote:
> > VIA/WonderMedia SoCs don't have anything special about their EHCI
> > controllers: in fact, vendor provided kernels just use the
>
> It does not have to do anything special - dedicated compatible properly
> describes the hardware.

My thinking was along the lines of "if the IP block is generic without
vendor-specific changes, then I'd rather describe it using the generic
compatible". But point taken, will drop this patch and extend the EHCI
binding instead.

> > generic PCI driver by emulating a virtual PCI bus with fixed MMIO
>
> PCI? But this is USB.

Yes, it is a pure platform USB EHCI controller. But the way the vendor
approached its enablement in their kernels was to code up a virtual
PCI bus with statically defined BARs which the common kernel code then
picked up and enumerated this platform EHCI controller as a PCI device
using the generic PCI EHCI controller driver. That was before the
mainline EHCI driver got support for platform devices, so apparently
they thought it's easier to do the virtual-PCI hack instead of
properly binding a platform device.

My point was that the hardware block has only ever been enabled with
generic EHCI code, so it must be indeed generic. There are no docs
available on this part, so various vendor code dumps and manual poking
are the only sources of information about the hardware.

> > mappings just to bind the existing driver as-is. So switch to the
> > generic compatible to save further additions to bindings.
> >
> > Note that these devices have only ever supported appended-DTB boot,
> > so changing the compatible should not affect any existing users.
>
> And other users of the DTS?
>
> I don't see benefits in this patch.

No problem, I will drop it and update the binding schema to include
the vendor-specific compatible instead.

Best regards,
Alexey

