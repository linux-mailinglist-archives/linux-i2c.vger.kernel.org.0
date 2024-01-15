Return-Path: <linux-i2c+bounces-1323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EB82E148
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 21:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE23E282B05
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 20:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB1A1946F;
	Mon, 15 Jan 2024 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heHjV5H1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A031A18E3A;
	Mon, 15 Jan 2024 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28ab7ae504so868856466b.3;
        Mon, 15 Jan 2024 12:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705349363; x=1705954163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTSsmF9bay5eiASBLzGyhlZe0LQNn59Lj5uJ3Vfhg1s=;
        b=heHjV5H1+l/x0SMXp2JLdQ7NrEDSyNzT7Elipm7NMRIM6UBR8h7hAfDAz5L2o8wFIV
         byXARA72cDQQPGKXdW0iIFRxlWIPHFcccH/f4DCxk4wU2c/Hns2pBcOm3QIbJScU5rHd
         CrvvBsJL7xOYSLlf44Z3t+Drv85XrhPpZck3OaSaL0FZkPW/0Tguqm0T3CGJD69EVg0f
         xoqzsEusxgCr5nQGx6KV37nWyOUu3MzvELN9AteUs0nBgcPs2TWFJngHKUuG0aayjM/l
         UbeVnYKQc3dGr1ZmuafkvcmhZbRbF3r7FVVh2cXFX5rCthDwX4tjGeejOWA+B8Sj+EpH
         qKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705349363; x=1705954163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTSsmF9bay5eiASBLzGyhlZe0LQNn59Lj5uJ3Vfhg1s=;
        b=bmkp6oxlVeGcWUMzOmpd6/UBrZNks/evvDXDNUpt08+R8P6j3+IgjOKPFs0UxkzGmG
         k81S0o1ZtdH/30dukzrBWwuTLGpOHZmsGTJq6CIJteR45U6uHY9flO04Kiy/SalxSBJW
         edFL09+OHit80GD3lOOSzhMzflaAg8/+P/JGVrFaaabGMH9evK2fjwuRtppf1GSnnCSh
         lPy9bVDfyG4QMHEp19lIaTDpwwfo9LrIOK4nt9o1iYeHqRiv86eWbpCIw0vu0MB57rV9
         TpS271f4cflDe4XqNeAPYENZ6byx5s0a0Jxk0RNdQyG9YnuVjKGelV1lYjR19R3faOh6
         j3rA==
X-Gm-Message-State: AOJu0YxD24MVkeVanUjiwFGfGJivA1hK6ps/brgdlXS1Oftdih9GLpjL
	8It0JpN2MzlAckAMCdprI7J7h0XzDpNGT9iv/oM=
X-Google-Smtp-Source: AGHT+IH4K/0MSQ2AdSJavyYxu02KhPdDIrkcZQ+IgMJl9YgR7xGb5Z6QZpkBkLn2Jd6lpzIzNOMcDN2koWupF26hQB8=
X-Received: by 2002:a17:906:fc10:b0:a2e:51bb:6e97 with SMTP id
 ov16-20020a170906fc1000b00a2e51bb6e97mr121762ejb.67.1705349362821; Mon, 15
 Jan 2024 12:09:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com> <20240102-j7200-pcie-s2r-v1-13-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-13-84e55da52400@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jan 2024 22:08:45 +0200
Message-ID: <CAHp75VcZXyGNY1jVNch1X6J5BqtbL6Hbh2o6yAd8Hp7-n4xAag@mail.gmail.com>
Subject: Re: [PATCH 13/14] PCI: j721e: move reset GPIO to device struct
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
> From: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Move reset GPIO to device struct, so it can be used at suspend and
> resume stages.

...

> -       struct gpio_desc *gpiod;

You can leave this and make the patch much lighter.

...

>                         if (ret !=3D -EPROBE_DEFER)
>                                 dev_err(dev, "Failed to get reset GPIO\n"=
);

Side note (not related to this change): perhaps dev_err_probe()?

--=20
With Best Regards,
Andy Shevchenko

