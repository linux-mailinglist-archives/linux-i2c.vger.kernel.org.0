Return-Path: <linux-i2c+bounces-10444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE8A9136F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F30C44416D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 06:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B1B1E8348;
	Thu, 17 Apr 2025 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IetuOzlP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F61DE4F6;
	Thu, 17 Apr 2025 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744869714; cv=none; b=bbHPY0TIjeAjZ0tp7qYLNbnhxekc2xWS7M7IUB542MNwvTD6VDej+MQOOyafIw7Q25fkA8H+583TXvlEA2J8dj/xlfJk5ktQiDum4ckexNTVF+2Qz8ee/ddSJxQPKj1F0OpCE0qZpUuZ3WdEw0wnISeZeBbEbKVpD9K4ij2LX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744869714; c=relaxed/simple;
	bh=KpV+jFENVgflhlgCLLNEqk737rf20tIu6cxYp9KlZII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYYNRkmSB3MwXH+YBeD1ZGFCEp6a/Iv3V3BJlr9C7vqmW1i6uWXn6Idr54U6NSo/gn3J1IxWk+uA5EKg9F86rtQCzi+Drkm/MSjaGeR3Z9XDha+smlFWWBegIHnEmsdaV0Rzuy/Ya3HsxyATohTJh/AOowNLXLiPKJLaBUe3N9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IetuOzlP; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4769aef457bso4775121cf.2;
        Wed, 16 Apr 2025 23:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744869712; x=1745474512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZZ0OiCh3i8QphKEZyGH0TyGWbIM9TA+BFLKz7OvmdY=;
        b=IetuOzlPyoGfl2KluHxAmlji4J0yKcLsOuVSIfgdctOtL6PVZoyOS2Sw8iSGlMLcIq
         jYYsC0CM5u7u4g1RialybjDkr56pIkMkKkArKXr2XnsNl+AfbXOFOtclWJO/OCdX8DJ6
         utrlnbCnt+CU1wNXrFNlP4dFBLxanj7I/r6Gtb7iQKE+icXC5rLq9cTLao9YTtRmR6a/
         WQynC6KsrMCKnp6MiJMH6v4g+ZdLEweVah8FUsVmbI7A+sZl5HOJJTT+oS56ZWWGSht1
         LsTV9STI9I+QCETXnBLqa0C3Q3IG3Bh06t/4efpwYjonPPdGgUaH2993URM0rMR3J9in
         Z3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744869712; x=1745474512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZZ0OiCh3i8QphKEZyGH0TyGWbIM9TA+BFLKz7OvmdY=;
        b=rvHQPRwp9gbIESLzl/U5LuEHAr83CyChJijFNJkX+3Esr+c/by0NISksMBhNuq5CCV
         5L3nUjce4yWjwtOjaqCdl+grE0lU48jQCsgZOO1oa2AyhJWOF3sW4ie8RKYSwfiPRt64
         zNan6u2aEFcBDYsyPM7RcCGN40An9BD3jkivyA4B98zP0QOVaqZjkklj6uMfJfXV1nhY
         9Kws2d7BPpOqNlEt/9kN9o7WjWh+sDKcWnCVHYurrb1KeW2m5sER6Q2FPhs2WtU/c8Yf
         aHH+t145oLcxihH7N3YDJQysQrRFgVs4YjW8+v03uQgiD2K1w/tnuicHv7AUWhOP+gBP
         qG/g==
X-Forwarded-Encrypted: i=1; AJvYcCUxNLMa2FYNRsBmhk/GLuVpyz42hi9cPYKyNxuDx+avlE/P0dGsVWfpPom4AdVcngRJgXIxuIv/m44+Mncl@vger.kernel.org, AJvYcCWDwy78k7IrPcMadHtwY+9zO4fkgh1H4XvbFLl0t7/ZzaCwsJdNNnaSrTUUsO2kyPs/m2vfHV3ntVmT@vger.kernel.org, AJvYcCWP6ndmCwalMyhoEBWcAs5yZNquG3nZjjxwyj8A0mv4KxsntuV/mBX4WcLGLRz/0eKL989D+Po9XSpA@vger.kernel.org, AJvYcCX/4re0EbXBedcCH5/zKkO1siKCYQwOg8zueDLchJCIakWsXdfn1GIC8lV0v9LB6xGULf8Q0Cp2QPOn@vger.kernel.org, AJvYcCXUBDOzXuiVK67A3ALMgG/JIFZTVDDtDKiYfwKxiva6H0xHu6q9/IZgBkplfFK0ihEW/V3u7WDT@vger.kernel.org, AJvYcCXtlcExQXLqMJUqNJb5X/rS7oAgcdp+y+vQbYZg5FO6bUy7Y5R0IJOg72SnKufOYYST/eD5GNm+nuPz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7hX8IPJ2LzcMhRJd2byMj5jLyxQ7yru3idTVRY17Wj6J12Pin
	H0xAI2olWWk3AI1do++m8MmQbcoBkn7dkEXzgB7JIPekurV/rFc0Ui/TtUzTGiZVG5r/13/b+GU
	HT7EssjMmhX5KTW58Oi+I/DQSx7M=
X-Gm-Gg: ASbGncuV26qEgRcrPHEdxRLESpyY4ftcQ3cC4ACiUbr8CwhtO980H5DYp/4ca2I3TIp
	1ZQ+MDCzW01S1MgJ0hQHgQkBxydrP7THXu6K5sAOd4JtuVgtD8S+ecMj/csETk58uHVR5gC19Qq
	hBG7fcUixhDfrWtfjliFT708KoIyZE03y1gU5AErYKLXZ5ZZjrYh4KK5g=
X-Google-Smtp-Source: AGHT+IF8tMblL4zzcQke4qYiQBnX4U0VMVjKusdYcCfocK8IStZ6GIbCT+kwGjMmzlxIaiYYv7SzQwcpgCKgqbWryyE=
X-Received: by 2002:ac8:7d8f:0:b0:476:98d6:141d with SMTP id
 d75a77b69052e-47ad811527fmr75350031cf.32.1744869711825; Wed, 16 Apr 2025
 23:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-12-f9af689cdfc2@gmail.com> <8feea1ba-2d4a-4898-9882-cf3ec8b03852@kernel.org>
In-Reply-To: <8feea1ba-2d4a-4898-9882-cf3ec8b03852@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:01:47 +0400
X-Gm-Features: ATxdqUHbb-NLlWiY3v98GpI67Jq817VdD6NkjDUJu2KmL6qXEllQohh5zOadrGI
Message-ID: <CABjd4YzkUYE3B7sPCm97NFcv7=nkwQTNFjSiomjCHzTFRDCLZg@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: dts: vt8500: Add VIA APC Rock/Paper board
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

On Thu, Apr 17, 2025 at 9:36=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/04/2025 10:21, Alexey Charkov wrote:
> > diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt85=
00/Makefile
> > index 255f4403af91c1d6a22416ab694b8eab44bf98a2..c5a2e57d53af4babe40fe2d=
79b2f8d9c1ae1b8db 100644
> > --- a/arch/arm/boot/dts/vt8500/Makefile
> > +++ b/arch/arm/boot/dts/vt8500/Makefile
> > @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) +=3D \
> >       wm8505-ref.dtb \
> >       wm8650-mid.dtb \
> >       wm8750-apc8750.dtb \
> > -     wm8850-w70v2.dtb
> > +     wm8850-w70v2.dtb \
> > +     wm8950a-apc-rock.dtb
> > diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/bo=
ot/dts/vt8500/wm8950-apc-rock.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..58b3c8deb4f20ae072bf138=
1f1dfa5e5adeb414a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
>
>
> Odd license, we don't do GPL v4 in the kernel. We do however dual
> license for bindings and DTS. Why choosing such license? Did you take
> the code from somewhere?

I picked the license identifier of the wm8850.dtsi include, which
defines most of the functionality for this board. No preference from
my side, and happy to use whichever license is common practice for
DTS, but I'm simply not sure how differently licensed files and
includes combine together - thus the conservative choice to stick to
what's already there. The original .dtsi was written by Tony Prisk,
not me.

Best regards,
Alexey

