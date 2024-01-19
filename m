Return-Path: <linux-i2c+bounces-1389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A715832CF0
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 17:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F6B61C20ECA
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 16:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE0E54F90;
	Fri, 19 Jan 2024 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OT8ysod0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DD54BF9;
	Fri, 19 Jan 2024 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705680752; cv=none; b=pMMaR6a0ynIQbYQ+nsQYgzHUpZsWKfE8y9vNQOnv0yarjaCrwnmL3cF8SYPa8LerUdtus6Vn6gjNOaCYdpxCCO1NPp7q5kamyC9iHuTd2fl//tYC82ft9AYj9szgQVrv4coE1tSSlZiPV6+h3btZuGr4S06YYpoFmzN6P4L25nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705680752; c=relaxed/simple;
	bh=IlCQw0cFCI/hgUc6CbQkhlHsg6WkadWZweJOVU481c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKvULNF02HOzlT5Ig4qRIcPv1r3CMyumACQxHwOJom9iRrmcC5gQ71ecNBhZZuSD/Ygmh0zKi/0Isrce4S2e8Fv7kg90uVOqiuGel2imvWQKiYnUyoq5c4Q2B+BLWArvOOFdIrkfdnK0N0yRSc250KAOhEpjWGi9nOWq1JbWtHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OT8ysod0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a277339dcf4so107097366b.2;
        Fri, 19 Jan 2024 08:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705680749; x=1706285549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqF7PI/YjS/vDZuctmZtQFkwh0hBWwr/s91VYXoNcbE=;
        b=OT8ysod0PDewf+RRKMMYjgZLsBFVYkiH+QjbyY6uQrbHSx6ROS1i82KhB5GkdAgRGt
         CTkN6WAJ4EH3rK4Uh6K6OffGFhvXMTnBTnWMIki8Ltr0HW7/Y6Pw5QNmzZfi8rWBUoEf
         /V5u2OsZIZb460j+GIvEhF3cmiyBQQb2S5b7evHH1J/jRa/fOCUEs2tEWH8Xx3ccOfir
         G0PCefXlWe4zpkf6571MrtQJgLuX6SFkNsB1IqBQnLtRcgTanC5xiNu2wO+4RET1DsoZ
         icmjrm1zv1QaRtzI6YtP5gHMwfDpI7gJ5e97+kAgsQTljs+878YaywK74RP3vzHeK3fh
         v/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705680749; x=1706285549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqF7PI/YjS/vDZuctmZtQFkwh0hBWwr/s91VYXoNcbE=;
        b=PfoEnAfGMs1bEfRxjwE6PMsrSui5ms4UyEXMePL6qqVSq2R//VTvkXk6YJF1aWh0Ux
         UtrSRXMLljdlcE9G6rVtGvUmK9nn36oHQGSfUfposgFmceRs2w75fmavqdavtRRRUrEQ
         iGmiRmymED6RZ52JCa9SllUpW3zp//mKyZ8fPNYC90O6YIObETk2DqkAh7IYPTSFo3QQ
         9A72qRY02yNwMMLZabPvR9kw5wRWZjGkH0D5QarQgq169BQk57Ui9eTwUkrSC8ihqITa
         kTU0WbbqoUQimjFdsyXcJdKXDO6o6TNEyJmgFVb8xh/nv6rbR6vT+nvxGVkBIALKH18Q
         no5Q==
X-Gm-Message-State: AOJu0Yw4J4+EJgFHzTpwzvqQ6XuW0KYRwEN1auuSiN0ZJFevQf4LXQlP
	1/C2TM1DGp2xWMIQ82luKTK/nsmPrQUlpZexd8wSa8xZcSbX8h7ySPBCz8wvr8KmWddrc6kptEV
	kz0WfMC+W853L9riZk+m86gtc+DE=
X-Google-Smtp-Source: AGHT+IEIhJ6nKz0DyJGRZxVKLi7Lvz3d5f2txRgjyzPbRrmmLxr+88CiGRKkkQVfdAmhWdjnmQAFZgM+tZkBsjOggVk=
X-Received: by 2002:a17:907:54d:b0:a2d:5394:18fb with SMTP id
 wk13-20020a170907054d00b00a2d539418fbmr5006ejb.109.1705680749223; Fri, 19 Jan
 2024 08:12:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-2-84e55da52400@bootlin.com> <CAHp75Verff06LE0QFaDRoun=ANpGfVU1tHknvvQZd_KyzLVP5Q@mail.gmail.com>
 <223422cc-2a1c-417b-8fa1-20d3b3eb41ef@bootlin.com>
In-Reply-To: <223422cc-2a1c-417b-8fa1-20d3b3eb41ef@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Jan 2024 18:11:53 +0200
Message-ID: <CAHp75VcaABafPh7o1TjrHW2txXRRSxjT443XJe33gfS1YD4bhA@mail.gmail.com>
Subject: Re: [PATCH 02/14] pinctrl: pinctrl-single: move suspend/resume to suspend_noirq/resume_noirq
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

On Fri, Jan 19, 2024 at 6:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 1/15/24 21:02, Andy Shevchenko wrote:
> > On Mon, Jan 15, 2024 at 6:16=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:

...

> >> +static const struct dev_pm_ops pinctrl_single_pm_ops =3D {
> >> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pinctrl_single_suspend_noirq,
> >> +                                     pinctrl_single_resume_noirq)
> >> +};
> >
> > Use proper / modern macro.
>
> fixed, use DEFINE_NOIRQ_DEV_PM_OPS now

...

> >>  #endif
> >
> > Why ifdeferry is needed (esp. taking into account pm_ptr() use below)?
>
> We may have an "unused variable" warning for pinctrl_single_pm_ops if
> CONFIG_PM is undefined (due to pm_ptr).

This is coupled with the above. Fixing above will automatically make
the right thing.

--=20
With Best Regards,
Andy Shevchenko

