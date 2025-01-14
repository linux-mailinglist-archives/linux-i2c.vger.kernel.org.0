Return-Path: <linux-i2c+bounces-9083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C09A10645
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 13:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E47016798B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 12:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94F4236EAC;
	Tue, 14 Jan 2025 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f68S+rd2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8222236EB8
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736856742; cv=none; b=ra15VlvTn5TqPqNoSJD5SwvB1O7FLvbgaxwJIHuqNXl9AqORMwoGM6u3cjQTycVw3aN50PeWYvfA66s6+hlu6ped5pu2F4mealvlkBuMnvfjM5T3bzSNHXOIhgCLyH9sp6Cu8ZYMUWit0hA/cWT6eUzk/IIlQJeeafJ+oiIuLnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736856742; c=relaxed/simple;
	bh=K6oz2DS94f8jy21SzXh52ZGsk7kmXvUL4fauuKsYHSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8m/AbsVH/PU9WkYVjC02NjZi6MqNuh1fx/NxUr+zRtgsXxspSRaAHM/Xa5vuYvcF8Qm1u0qRytiZAP+/cqh4iVO8ueUmNSnjpJgvt5RIWSfZXQ4fC9hoqEGmgsJWGJJfkbLArvpeYEBbkoL4W47CwqKKAKoYYeOlgOJGdxKpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f68S+rd2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b229so45750581fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 04:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736856739; x=1737461539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6oz2DS94f8jy21SzXh52ZGsk7kmXvUL4fauuKsYHSA=;
        b=f68S+rd2H2M+mTqpHL+RyKBn+6j9nrOVdFgEMefWySkKUAzP9y9mjuA6H0Ro66sBjM
         FCXYXkG4Lcg5tb8jEqGt4CbD58xensbZNXE5Pbmq2LtOZIbez4+69aj4vauoxAXkTgTy
         z6B1BSnHVTcPJ0q4kbHbJBN2xST9NIbHGqmkpCC8t6cBjS2olv3XycARQFl/Uo5WlRvV
         FOnoRwUGqxCx91jKhvi0O0oPFHQpTZZWyz5B0CLpORzWhxOfMr1B283BdubODqySHg2+
         tyzPDiJH777Ux4/Ar26YyhGNMjmIVyK5aJX69sAKH+0KRzFgg9irk2ishhA11kwkgKIR
         GidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736856739; x=1737461539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6oz2DS94f8jy21SzXh52ZGsk7kmXvUL4fauuKsYHSA=;
        b=utsZCSgCtSZ8yganE+kMiT/Nvq/SdrbnQEza5Zm30jVCwhm2mp/W51SM7/Esjufp15
         aLRlIrXjywuLSRRGhCXQ4sdNgQP9ooVoVZT3AowrdYR4a64JleeeXEsylnxj1MqFdB6G
         55Ebu6IGcQbhH91ZOUEMccUhn2YKsxrz01cX1cVWMsktFap0M9svx74Npnsu9/QJjepq
         QpbL/ZZ/CHkUNX6EI+6Fucf/iS0fCHWB0FAqrHE15CoACK1i/bR8vEo9X0KLoTTKjlhD
         5qaRI34LZZr8vKpANCZcsQREDHig0TbBC77zf2aOY0NCdPseGqg26tXUBgIFiIszyk0Q
         0OUA==
X-Forwarded-Encrypted: i=1; AJvYcCUDKQ9U78/7vkL8zKxuZyuZ1w7Gp43ww7IbPMDiXPXmPvQa4HIWTw/3HNN6ko0o9xeoY6AVv65RUQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4eQcdK35Pq6C9ZzK1U6+s8dVSdYrFfAVm3g4u7gb6hgK0EOr
	AR9/9vRi2GkkNEYdwjkGPu4CmUMPYur0d4VmxJU9Lu9Fo6zqq4m9YuLcDaaP3G26Dbi4S7XNnCS
	ywUUR650DZ8o6bxeBdwEIMXcaS8o/k44eVBLfjg==
X-Gm-Gg: ASbGncuH0/AfYk8AbOx/HJBwkyi6EWxJp66jwp5t4WLv6sRpISzeh8jNgu9A3SDLQPo
	PF5plQpEVIS5ZxFKz+1BP38HtMCpdujXoDlvow1Jvwmhug/8JYsaWNKfBAtqKn3Tqlz7syQ==
X-Google-Smtp-Source: AGHT+IENAzQOWIqeBcjNLCeAWZHXeOZ644Mso77ytYMGJJwc3A78vETSt+TEx++AZVkXjYF397/HELxPeWd4tKYdKto=
X-Received: by 2002:a2e:a587:0:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-305f459aaddmr69824011fa.2.1736856738634; Tue, 14 Jan 2025
 04:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com> <20250114033010.2445925-3-a0282524688@gmail.com>
In-Reply-To: <20250114033010.2445925-3-a0282524688@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 14 Jan 2025 13:12:07 +0100
X-Gm-Features: AbW1kvZqlT9ZQof5_cPsRoDpTSEUzbcfgE_gPvPzrdmIRQZ45w8iL14wP2FIYK8
Message-ID: <CAMRc=MeEye9i2Z=Y8bHt2ruCS6JJRxmGiLvAUt6E7BJ2K4wosg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 4:30=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wro=
te:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---

Please pick up review tags when resending.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

