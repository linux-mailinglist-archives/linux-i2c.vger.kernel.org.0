Return-Path: <linux-i2c+bounces-1484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019983E446
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C46341F22219
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE40224B30;
	Fri, 26 Jan 2024 21:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7gDM1+q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC8D25543;
	Fri, 26 Jan 2024 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305878; cv=none; b=WlLIxGH9TPixzt3t4ZB6BhZA6vJkyvZfWcIhD1sjwl+E8DwFZkPFYVGCWFG5NGg7k5X3CTfd95JYnUOTvUcvpMV3mOufSiFmCGzFkAZEG8JRPFB6cpw83la7ETw7hi8a2QIQUZAnkijbXLuqykU9iQVqcifjxTW+VkgE1FbQmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305878; c=relaxed/simple;
	bh=nU5tZ1CIDmmbmzI91JFYK+ueqcuUhEsjxhiirrJ792Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qai7OzQny3PLkWh2uTw7vDAsykYsqITEqz4WVw8fOgCPbMpQ16V2jmLz7dU/q/YQ63gZBw6VbyzciQpRMho3pkHjKAiGzQHylgsESMz87y67IgY4fO0o1Hqs41blu+2nVOOj3Ddd9d5TjwFR83wbnQFkyoGn0jx77TT5I1TcWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7gDM1+q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3528746f57so19447866b.0;
        Fri, 26 Jan 2024 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305875; x=1706910675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPXH5dNeVfIUenTMK/gwVMJ0/0KNORIs3DkEAIv1Sig=;
        b=E7gDM1+q3bk7vt2g27YbU6H/IangsmZzroCPX97acsN1kTbtJ1jgsTtXNqOcOZw4U8
         GngdWNpXnr1DbE5D5NL39PwjUc0gp+UX9SwX5adUHc3BqCcDtyejoP8XzrcWZq2dGCAk
         z98iTyR/9lsMa1ErAYlIoCddzi0n85ikiTUO5wiGUzixuUd3qk3r7L8SoyVg6J5wtSvr
         Mmmfo6iOaO8xzS+ULcdZ3Gfm74kb6kMCi4kEzdEwVtVFZJxLA6TOIFMWRasktgI3mDNb
         9zNMkUkClnL2r0wVViBQpDMiYecSfreJj/keqpf9EvpkK6zT6fFTNa2y3/wQQ1bu2KPz
         zYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305875; x=1706910675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPXH5dNeVfIUenTMK/gwVMJ0/0KNORIs3DkEAIv1Sig=;
        b=KvwsCBsMWwwrPok55xhEpP5x4NbRqcLj73//JGPpWxkW6Ax/9BhwUfVb49hcbZ4exX
         fqKCMtHCBLO7UwgDmWrGz7nXV0rUUphNmecR+S4EZL5Os792S7vqp/oxvYGXkApNrT9N
         3m4RnnRUMkdgyl9wE75m5CfZ9faz8aDaoytaLStVxW60jhLee+6mmw9caW5/xFDYZiJU
         nGIXba0ckjEGvGUorCqigKLrdR5uGCJ38j2XwC1igx5orLCLVWmmFCeREFSM7R+4ZCG2
         KTXn1GQosTolVtRml1qsgabwyFV2jLGFY+Ncxwij1Q/0A07yE8szJb9J4ho+QejD0UbH
         2mgw==
X-Gm-Message-State: AOJu0Yyth0De59I6pRqHLIs0NvsTyHDjfPDEjWe3BaLTC/R2i9vqVH7I
	yOzca5JU+r/p82/8LfTk0miM06hNPh3nVCnw8wV7vq1tyOQb78y0oTQdm6GZrjxXclD+y+hr1fY
	cSJ/wf2jwnKtgj9WlL93gHx6bCSE=
X-Google-Smtp-Source: AGHT+IFI7f8zRnUFHL//+7Q91/XGXBBaPplGw9xgtWCKwMk1l/Cp5jaXJJoZ2ImepjESxtuomso0X+FvryVl+x8j934=
X-Received: by 2002:a17:906:190f:b0:a31:24ba:1f73 with SMTP id
 a15-20020a170906190f00b00a3124ba1f73mr191929eje.45.1706305875256; Fri, 26 Jan
 2024 13:51:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-13-8e4f7d228ec2@bootlin.com> <20240126214336.GA453589@bhelgaas>
In-Reply-To: <20240126214336.GA453589@bhelgaas>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:50:39 +0200
Message-ID: <CAHp75VcR_K-QYrkd1j_pW8_F3wjJx6s8a1DAT5gNci1P7_pkPA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] PCI: cadence: add resume support to cdns_pcie_host_setup()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
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

On Fri, Jan 26, 2024 at 11:43=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> On Fri, Jan 26, 2024 at 03:36:55PM +0100, Thomas Richard wrote:

...

> It'd be super nice to have them the same.  Passing in a "probe" flag
> works but seems a little harder to read in cdns_pcie_host_setup() and
> you have to keep track of what it means in the callers.

FWIW, in another patch with a similar approach I found it (the
approach) a bit ugly and unmaintainable. I would suggest properly
refactoring to create 2+ functions and use as needed.

--=20
With Best Regards,
Andy Shevchenko

