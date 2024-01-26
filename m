Return-Path: <linux-i2c+bounces-1475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D799683E3EE
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344EE28767D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A76E24A08;
	Fri, 26 Jan 2024 21:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKPBkaIK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C224B20;
	Fri, 26 Jan 2024 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304653; cv=none; b=Dy6hN6iEmkomvCuq2UCOjI4NK+2/JT/FaNumwsEnRfTW0ict+XmY3KCNwepW+yWLvIheKhXkTJ1YROkP2B2u8N9QCS1QPvvBsR8+q4KWZ0+wD3C9E2rbX9iQxMenBnvaCCEkhrA+quJeDGKH1kZA/MO/ox7iwOuwbpJumoiWKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304653; c=relaxed/simple;
	bh=3c4RfkPo1L3QA1P4ElOrbRYO/UTzIjIsEIDjiCapDls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JE7pNJl1LnvfDEsgG6g/LmJ1BLfiBcXcA/IpwXxemk1kCXZXEeMQPFht5SjWvj523CnfYrcadbZWk0YC+mU68WZdbm6kO6yiEfKL6MLiCFLnGAFngAFzVwzg5o2xDG5cRAC+frWMlKvK/cZC8xk0msUHHg1bBbFqvNhsKabu3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKPBkaIK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2a17f3217aso122853166b.2;
        Fri, 26 Jan 2024 13:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706304650; x=1706909450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c4RfkPo1L3QA1P4ElOrbRYO/UTzIjIsEIDjiCapDls=;
        b=PKPBkaIKK4yHHlz36N6JX24rk5tDi9A0iLn1/v2a/KIlu7Wd7gg11jOEaH+T+XzdB+
         lx9RsJ/kHP+timG/PgMJ+IkIL2UpCmW4x+I81BfwqWWQu16aFoLXSH59u19hpROyKEw4
         30VaIiHT70D3TmsNNQkv4vpETJf9AVZL4T5Dx7Z2UHlaeUJV6mepASiku9IZtRMiys66
         M6eMM3Xw6eae/q5LN7kN8uohJjLuLqolAP5YrSweJqjv+0bOjbJjhWxp3hX0kC8zN9+D
         4VsB4CXRaHvfdRL+Ix8OM8fBYHagC9QyVgggZx8zTYUztE/vHytGth8l2fqlF3jw8GbH
         4eZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304650; x=1706909450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c4RfkPo1L3QA1P4ElOrbRYO/UTzIjIsEIDjiCapDls=;
        b=mzCD4HF0Dnzb4Xbqoc9XMRse8D6a0hEuAwpFMUcT5sz3T5sreusJ+RZgrwCTF2jU/S
         WLGAJyaea5r9z4fgGVoGWRewXGcjS/O0+hhPm5BRzmLMJHjl9wPcc66c4uNL0ZDkO5ec
         P/L1RP86DgyzF2ACDYnh3GP0T09ozdELOhAjw7zjOfcd9W04fFZoQm28LIillsN7ejRo
         wkipDeBJwh5+UUNaIT8LtawcO0UIYy26x3qbu9Q0tnpWTkerS8uxPbKQp0jgEqU/Vk8V
         4Ljagf5hZgyvt6cQJKOi+3P+x6NTMm7AbguL+u5QwEwGZPgWqpH2/ZIT/S5X82VcXC2M
         MvMQ==
X-Gm-Message-State: AOJu0Ywhl+HHaKWONB4381nzibfkUqiwoT6/BPnquj3CVYF1H041CjHO
	bKg6oDhYL5WlviihCRxUNhcvl2EZH1w6BBY24yKYQbY+Fn5wokrM/VpXQ+xYFw9FsW0FRzlN5rn
	GaI/6auTu/nVTG8JOyWf+FUrrQZ8=
X-Google-Smtp-Source: AGHT+IFXFbK6qcuDfOS1ym8J1LBZtrKmIwx9dYXrFclPmKidtMLcd1lCRKl3sq3dWNUUOi+z4dpkm6suzu+acbp7dNE=
X-Received: by 2002:a17:906:c40a:b0:a31:6942:eaae with SMTP id
 u10-20020a170906c40a00b00a316942eaaemr365751ejz.35.1706304650240; Fri, 26 Jan
 2024 13:30:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:30:14 +0200
Message-ID: <CAHp75Vc-Zxac1a202G5XSFxsu7_C8V5ODShrHA9k4es=fXjYWA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 4:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.

On the first glance the code is okay, but I haven't tested it on the
platforms I have that use this chip.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

