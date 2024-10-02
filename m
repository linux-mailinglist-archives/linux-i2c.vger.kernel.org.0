Return-Path: <linux-i2c+bounces-7186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC26F98D7DC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 15:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E4A1F21AA5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 13:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC751D079F;
	Wed,  2 Oct 2024 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEKqrHZk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E61D043E
	for <linux-i2c@vger.kernel.org>; Wed,  2 Oct 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877231; cv=none; b=fiTfqQqKNLqhZ0gvxwpCgOU2cvl4x3A1up5xGCLHvi0r1Up/KNs+yuSPLKCDIHwHiHxXi6YlRfD2H4p+18ouml01dOMpsbKCdTZ/XLfyz39n44XsE+2Uvfvmjlg1wxknHVngwW/ORtqq3rjJVZKm68IR9BHzwy8bNSfjwy+A3XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877231; c=relaxed/simple;
	bh=j6xi0yErQ1R9JnzgLN0C+zTW2E96PBAw77wYIYi2zGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HypFgq2Y8RsPmXP4kvh5WCnrF42ssIvkNL4rmuHbuL+mqcsAgr2/JQlpKqg+fHqCIIfZoARJCO1Ssz0lQdTe2xcaLDhaRhSNFj/mzhTMbZbUZsCehEMSbRTP/GVGMXsGxhKGT0Ht4GFG3s39fwvgFBK5mg0e6o1KlHfZS/2jyVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEKqrHZk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398f3be400so4536908e87.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Oct 2024 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727877228; x=1728482028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6xi0yErQ1R9JnzgLN0C+zTW2E96PBAw77wYIYi2zGY=;
        b=XEKqrHZknefWA6d3N2kVwvX256DlJKf930Ah7NCrJDk20YfcxhYg3m6HznUt8iFKQ6
         4fFFUqHqW5fLOLzWHVF79/9y69eewoFZsEd0DnJumM/WX/VIxbP7qt0XSG70/HJ05FCi
         o2O4nnaAXF3kVuAqI0N8XsFOH74gTDLElAGQHqkMzsKtB5WyAxwh6UgcESq3AnvvK6D+
         6KLM8Z9kTlNw3EjKTpF89RIt2V8krPr/5BpvPjxvPxF1soDFXz2rVjWnTxrD/qdSMKYZ
         iKRJIj15e82Jk+SOJFqg4uTmtFSPFda8V4ba88a/uFw0pGNKTPzUChyk4Vi8I4vH1L0x
         TWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727877228; x=1728482028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6xi0yErQ1R9JnzgLN0C+zTW2E96PBAw77wYIYi2zGY=;
        b=HtP6wVpTg+K0sP6+1qu9+Epr9BJ70zxuwmRm21QDjx2DisfyL1Wnp7yLCusFaAPk5N
         quwsReaj89h7RtxEB04LkI3x5SIzuv0Cz+jIOlt291hyofhS/ka5jZ4nkkrOTSFfpKZ+
         hDJKuOvUwsoa0/Lj1a8ssAr+j92uHIpLHsHyCbJWPH7F5vvnx6Wm0a1EbFppUxvyi9fM
         AJwLh5eWMvJZQlQKmuiZ/D7GKgkbwJjax4GRrQ2yA7ZbGw4OI3gYRMbhEBAYd1DaI6rN
         EI9YsM7FlcsluCnCQQLfgjpr1aA+5RuGqvDrCB8SthX2rHvGj0sFmBjwAUpmS8J3S889
         LokA==
X-Forwarded-Encrypted: i=1; AJvYcCXdknj6xi1heMVFcuN4+i0Dv+ckqteiDAjOSWHm7izzNKMIh0F0AAMQ3GgBQYM6KV/f8/qsdUFoywI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBn+TwRmgWF/DyzaVZ3JLS2RRUx9DQt6K9Q+ZzeS8NnVDXg3YB
	xpp+BEU5GkfiR2z6Wa5/EauAZtz8aWPGPovUUt+/gY4k1CH13j3fAku8XdWcSA/rqhr6EmuHThp
	uHyFt6cEwqibOv6lvv65S4CWq0YPWKK09LQDmJA==
X-Google-Smtp-Source: AGHT+IH6J/1hIBQYUuOO6E4cFW0dSWZmODFCQ9NK7J4/38LglqeQ+e19d7bbsLpye8LH/IrpVT7SzxHTLiNIBgM3MX8=
X-Received: by 2002:a05:6512:31cd:b0:533:4676:c21c with SMTP id
 2adb3069b0e04-539a079f587mr2037762e87.44.1727877228234; Wed, 02 Oct 2024
 06:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912-test-v1-0-458fa57c8ccf@analog.com> <20240912-test-v1-9-458fa57c8ccf@analog.com>
 <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com> <CAAjXUapu1DBqnk24ng0izU7opn67YxiwpGpFtqrBmqNgyCxRVA@mail.gmail.com>
In-Reply-To: <CAAjXUapu1DBqnk24ng0izU7opn67YxiwpGpFtqrBmqNgyCxRVA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:53:36 +0200
Message-ID: <CACRpkdY7jJXOsKwyfbZWGq90jhnufwDeeF3=Dy0Rfps0rxmBGQ@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
To: Greg Malysa <greg.malysa@timesys.com>
Cc: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Utsav Agarwal <Utsav.Agarwal@analog.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, adsp-linux@analog.com, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 11:58=E2=80=AFPM Greg Malysa <greg.malysa@timesys.co=
m> wrote:

> > Interrupt enable in the direction function? No thanks, poke the
> > interrupt registers in your irqchip if you make one (you currently
> > do not) in this case I'd say just disable all interrupts in probe()
> > using something like writew(base + ADSP_PORT_REG_INEN_SET, 0xffff)
> > and be done with it.
> >
>
> This will come up next time too so I wanted to mention that INEN here
> means "input enable." The PORT design has two registers for
> controlling pin direction, one to enable/disable output drivers (DIR)
> and one to enable input drivers (INEN) to be able to read the pin
> state from the gpio data register. If I recall the bare metal
> reference code toggled both but we can review if setting INEN for all
> pins and leaving it is acceptable as well to simplify things.

Aha so that's what it means!

Yeah play around with it and see what you can come up with.

Perhaps you need to override the input/output enable
callbacks with local versions rather than the gpio-mmio
ones to set all bits. (This is possible to do after
bgpio_init() but before adding the gpio_chip if necessary.)

Yours,
Linus Walleij

