Return-Path: <linux-i2c+bounces-5611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1B959169
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 01:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1C92B210AB
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 23:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3411C8FD7;
	Tue, 20 Aug 2024 23:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvAh0iNd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91441C8FBE;
	Tue, 20 Aug 2024 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724198208; cv=none; b=kFeVdF90L1y66rOHS7ncVOjHVDgooi8CAEwOi2Mu5OJn+WMu75eo77VBf+dXJs2Bygw1CatvGi0Hz9Cs2I2OFcSsN7IVdwlsW8vCUeTLvcuuMZbou8BtI9RV3y3j52+R0DdpsvaSnHTStbO2HOAGWbc7mNerj0qnk1qTFo2R+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724198208; c=relaxed/simple;
	bh=xz4OC+9BQHEFLvYvlpWiMwlUUwfX25q4QeHkD63nSQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv8xATSRVEgdsEbdvl6OgXNxBpICheOj2ULao/nUHiop2PmwTpQTprcKy6t2dJmowpgNo0rJTlCARxPunhOyj8kXZ42OyxyPMqXXzLg1b0pFwMsG0zFFkzes6ZDoA+zaJQk46CWjUeixPc/25WxwSOg7YzhsaedWKUjcpso/C6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvAh0iNd; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3e2f07f41so25782411fa.3;
        Tue, 20 Aug 2024 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724198205; x=1724803005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xz4OC+9BQHEFLvYvlpWiMwlUUwfX25q4QeHkD63nSQ0=;
        b=mvAh0iNdX+d5R8jUZ3XyJzMA/EApM5Jcf6Y6AqOQ8nm3AD6u3gXDUktoT7Xiss3CgH
         QdYW9++1RSdswdbvoMf3ZC4mgKJNfSXzTbifhDsTSxsoEAkwOn81SBeGkdUelAplLrBv
         vvZz5dq/3OSkojASOk67lakn5pxgs3QapY23PA0VDAiKeURfHShxXXz0UP0pZX7bM/Kj
         t/F6l9HZi39trK0IAxh54Q11wd56j8amoLXaZVJh01Pluw2sRcvA65GmPrHvfwfGjnAM
         Y3xtBPrGoJ2tVIVFTjP5rXCM7YL7UksLWP1rYrsxZSr//yIqVtMbB4LSei+tU/b7XI8a
         0C0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724198205; x=1724803005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xz4OC+9BQHEFLvYvlpWiMwlUUwfX25q4QeHkD63nSQ0=;
        b=h/josJniU7AE9Tst76ZDlpKx+lzB6BZPqNJ6X2M65DtDw2+ZDYlBhOHsgT3hRCxQ1p
         vJz7k0JhDTTMh5ork9gtbWoANuHVwzhYXXZtGbtOb+SCkfMbpX2Gp5SyER2XH/n17E3+
         1/YECsvsWsjNnuhbt5gj50oYTa3QJIsHr+c0fRj0RhWnXQckzU41B1n9HqVlemH0864q
         frztBXVNtHwMorhctX1oS95ZCLbyvv8gXUfSqcsBvVsHVkr/PgTk+KSG5DOKPjIKCzeu
         rzNB0rcsst3W0MA4XS+mPALg3n1kPmDTvKugio4We1F/RAgGWGD15GR6HgNBTaq4L4TM
         +dLg==
X-Forwarded-Encrypted: i=1; AJvYcCV9XkhWcmiYjd+8Z+0NANm2Ax8NCImMCOGhsYpyl+lYqDLWvtBciDJyHbhbC+JhAn0G6h89frzLLKwm@vger.kernel.org, AJvYcCX4Nnl/GT8aC9jS09ZlSnvt5FPtloMrlac1CA0+N+TiR45WVrD8nfvzvM8FucTeGJ0vbhJjBRTc9vWT@vger.kernel.org
X-Gm-Message-State: AOJu0YwmyiKBDLOrg5kyUfsQ5E4/t6FewCg+dFpITwsNJmjz/DCgKXHZ
	YRbIa9WqvtBvl9qlpOGK68gTJsFK+gb5SejLWTQ2Gy4wAdKjQ2/HyjrnJwmb9cNcSWJTMkU5+Zt
	tKHh628e3syvkArVxDbN0LV2tnSvQyg==
X-Google-Smtp-Source: AGHT+IG0TkElo7se4gr+uSbTT3YfP5VNfjT6kygZN6wVGQaSiqMPf8kKqtvmXN/0qZMCQJUHf8oKkk8LFRt/ZIu+Ha0=
X-Received: by 2002:a2e:9515:0:b0:2f1:929b:aef6 with SMTP id
 38308e7fff4ca-2f3f8b3ccddmr2899941fa.36.1724198204654; Tue, 20 Aug 2024
 16:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <CAHp75Vd3uUge7QFb4eOZb_nGNDu-GFDTZMyS9aZSm-D4LkT97A@mail.gmail.com>
In-Reply-To: <CAHp75Vd3uUge7QFb4eOZb_nGNDu-GFDTZMyS9aZSm-D4LkT97A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 20:56:33 -0300
Message-ID: <CAOMZO5B2p8JCGON7C5CzyFzsed0Es0wFrq9XKY8mvSeHiVV7Gg@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, Aug 20, 2024 at 7:07=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> I bet on __i2c_smbus_xfer(). Which comes from
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/i2c/busses/i2c-=
imx.c#L549.

Yes, this is correct.

> Very easy to check is to add at the top of i2c-imx.c the following
>
> #undef EAGAIN
> #define EAGAIN __LINE__
>
> and search for the respective line in suspicious files.

That's an useful hint, thanks.

