Return-Path: <linux-i2c+bounces-1319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08382E10A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 20:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11581C220E6
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 19:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CA218E37;
	Mon, 15 Jan 2024 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1+TXjzr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA361798F;
	Mon, 15 Jan 2024 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so68259225e9.2;
        Mon, 15 Jan 2024 11:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705348605; x=1705953405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VpU6+YHkvn08adzjTfnX/FYJd9oIMlOMtpUIvBTFqE=;
        b=l1+TXjzrwEaAtVkA9xpaTv4TV4xPhRinXvJ0Ja5eg/nbIKHRilBrTs8T96Cc2nehH9
         nXvxaLS4bB0x3cXRa2EpDEhUjPuV4FRdARv9iEHYaaKPD1FZJKrLY8IUA/3IdmKcu0JX
         PFgj46MxGB2VBVm+YVHhPV8z7evrmGL6G/9xJe0F/xVUdrSXwM6OI9nxyD1bIVi1Uz29
         GzXYpgj/xJG0Yw/7XIlmfN01Lc20l5GmsX+iPDk8S+i+/xTp3OJ0YKhornWVBNXyZkJy
         XK2VV58zNHgHyumkSKsyHRKjIGgxXhS2KMQesOG6tYoaL3XkEMiTXsVTLFll4y+8IdAZ
         ovSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705348605; x=1705953405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VpU6+YHkvn08adzjTfnX/FYJd9oIMlOMtpUIvBTFqE=;
        b=sjVPwcUHtFcRj07mJZz+TBrW7gjQuaTwckhkVd8yQo6aNpK+hA/Lh71msTszf0TxiP
         1j3SQJlIM/XnIdInhEKzWoe2S/K88DofxHC54OhG83ERi4s/Z+otYm4brJEnfJFDHGsV
         DhGRN5T5u0OCRK0kdl1I6zbtoDHCXjJrrKc6LA5boFv/+Lw5ucMGttdKrYTfoGfzOIiA
         ceR0mj7RT6AEQ2Y2OcT9lRE4LiqvoJvwHZjvq1sW8i81Jh9JwukuZtn/kwl1Jdntuai2
         F0euL8kMWGBDeCTfcdTo1mPXu/biREN7MD8MWno3uYau/WKZjGvZJk16YuP3HomqvnQw
         g9hQ==
X-Gm-Message-State: AOJu0YxHgGh8KNNXgVTol+mEd21L1uQNWe+FdCSXNcWGtGXymkTGGBlN
	Lc076mQu3w+A6kSx7vJvqtYV1/W8AS/bOdQTL9U=
X-Google-Smtp-Source: AGHT+IG2g/dlkMceaiIBkgJJPIAHDRblBc7tqNn4N7kSwdW5ytNtvwVcSmdmsn+PEXzA0l4KSS3qI1/vQowfZ0sqVlU=
X-Received: by 2002:a05:600c:1d95:b0:40e:6dfb:7b3f with SMTP id
 p21-20020a05600c1d9500b0040e6dfb7b3fmr2194829wms.95.1705348605229; Mon, 15
 Jan 2024 11:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com> <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jan 2024 21:56:09 +0200
Message-ID: <CAHp75VezeBp3Umg4prvdS83WrHViyTs-hBV0SejVD2BBnGYEvg@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to suspend_noirq/resume_noirq
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

On Mon, Jan 15, 2024 at 6:16=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Some IOs can be needed during suspend_noirq/resume_noirq.

->suspend_noirq() / ->resume_noirq()

> So move suspend/resume callbacks to noirq.

...

> -static DEFINE_SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x=
_resume);
> +static const struct dev_pm_ops pca953x_pm_ops =3D {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pca953x_suspend_noirq, pca953x_resu=
me_noirq)
> +};

Please, use correct / modern macro.

--=20
With Best Regards,
Andy Shevchenko

