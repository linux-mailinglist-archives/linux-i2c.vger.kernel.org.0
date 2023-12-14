Return-Path: <linux-i2c+bounces-815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972C813C26
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 21:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5891C21BD7
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 20:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F026A001;
	Thu, 14 Dec 2023 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ciwv4FcI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B73A6A35D
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbc72b692adso5149613276.2
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 12:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702587426; x=1703192226; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TmJ2EkA5b2Ie92om73Fjs7VxNUILpDnlthZoiY7r/uk=;
        b=ciwv4FcIi6VElud4i9m1U2zfN9XilX3Bjj1eL9DUmN5aNUINZgWlcK2551PyEctTj8
         XH+jyJBy/6HDp1Gq+sYtgfX5MvB6pYZ5dJHDEemlKf0XG9FW2dto3dZtXrXLLLX/1cjY
         8dmWzUzmjQ78UyNI4GSDxVqnFI0X76eylJ3fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702587426; x=1703192226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmJ2EkA5b2Ie92om73Fjs7VxNUILpDnlthZoiY7r/uk=;
        b=J5thN8oc76N9ly06KHOAVqxft93q2+iPVsf5/w0UJh4hcs1/4jcwAnv5r5eUFaQ5fL
         8Dqyd2+AIEhB72NHJ7rfTlvEZg1asg66OwlDAlx/D4IVLCqGc3dErqbEdzlXwX4ft3qs
         9nw80ryeOcNOEZog9AzA/Z5UOcJeZtvqtg7bcw4h3jlq3qR7aNvZ0ltmpOJWk4cCX8y8
         Cyfg2s1lCvX4f/cdS+JYE+WN9tx7jMSDzLJMdyJMQ45JGMgo0inEiEjt+KnVea1JrQIY
         8+VPRvSI8qI8+YlbskG/z+C0wsAAocL9w2Fr6NX9M71s2al72w+w5E8BPh9XyvKRsSJy
         T2fA==
X-Gm-Message-State: AOJu0Yx91QB9/sanVN6X3G0/0f9H60CMtqnXHupaC6CtGHtEbC8Bl3cL
	5YU9rOYnKZ8+08XwdIwSIRi4PfbgHmmoW9X6ufCXdg==
X-Google-Smtp-Source: AGHT+IFKPiofPKyJq4evcKGhUZXmOHPCzsYS9WeMsD/j7wDylDwhkNTj8Q+0CSvKieikxCEL/IE81iNVZx2vVFRhhk4=
X-Received: by 2002:a25:cb4e:0:b0:dbc:d37f:4434 with SMTP id
 b75-20020a25cb4e000000b00dbcd37f4434mr2198318ybg.7.1702587426332; Thu, 14 Dec
 2023 12:57:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
 <ZXoHXwmwzczAqlLv@smile.fi.intel.com>
In-Reply-To: <ZXoHXwmwzczAqlLv@smile.fi.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Thu, 14 Dec 2023 13:56:55 -0700
Message-ID: <CANg-bXBdQP4OMzkpm_cgeiJOj176j=FdekvvyomZDVUGwe4M4A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by to
 use resource
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +                     *r = (struct resource)DEFINE_RES_IRQ(irq);
>
> Why do you need "(struct resource)" annotation?

I don't. I originally started working on this patch on a kernel
version that didn't have 52c4d11f1dce ("resource: Convert
DEFINE_RES_NAMED() to be compound literal").

> > +     struct resource irqres;
> >       struct i2c_acpi_irq_context irq_ctx = {
> >               .irq = -ENOENT,
> >       };
>
> Hmm... I'm wondering if we can reuse irqres as a context to the respective
> lookup calls.

I'll see if I can safely remove it.

