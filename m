Return-Path: <linux-i2c+bounces-1477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7D83E400
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E16A1288569
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74C224B21;
	Fri, 26 Jan 2024 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DS39YCU1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADA924A05;
	Fri, 26 Jan 2024 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304766; cv=none; b=Z/q2vuXVRe9bT+Y9zX/WUteUXEIAvm3Pi6uTpDGSQ+ldqsLCfh+Co9KVASACk+ikhxxEFGYDjkFkfLPHzwNCWVnKeFx8AlSeLzfWpucxX6dmjjZmmZOqgxj73PxUedFoOjWZ2E/HnJpCqYmkPL1aXCF5J5DTbXGl+57qPOEKwxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304766; c=relaxed/simple;
	bh=MsQP+WZnx7+QyoL2HlI817M4IBaY5O/hAQGZBfHIGF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj1LUviM/UjKOBN6TQCySf61454mH1xhaaFdEeXZ844YP2KIBJeVcNQa/BaabK6KLqek+Zn4mib8870t8TsYrBUj0+aVdsZCIm7NoCxEtZ9nSqcQ8HiXEfbXWliJsQWqT4RHrtTqJot4xemSiieGfXNz3DSy7L+YrswJeUWyQsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DS39YCU1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so13348895e9.2;
        Fri, 26 Jan 2024 13:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706304763; x=1706909563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsQP+WZnx7+QyoL2HlI817M4IBaY5O/hAQGZBfHIGF0=;
        b=DS39YCU1L9XtsiF8InLb7y2X6xMBuw0uA7vx5E3V7i5DLJPljwHkHM/g1rxM+75DwK
         K0z3Pk55AwbYS2Y+cr0bnv1iMkawmNu3SEeLHkd1kfsvfWAmO0kKAYdf8nMZ2A1zg/Yk
         1QUYrgz5NGD0S3NqNCchkRw2PYJC8luyLCoc6dCoVPoDCvZTTGOw9Nip1ejNbsp0mvl4
         NJec13RbkkfXAQEQQFvGv18rfhvP3wI94oN0M+Z0ihBwePKL9QDpBMK3fcM8/N8JbZW9
         Xt+RoH/cvzrLmYwpF1CeXsWDTq8Hd1j0koz4bd7NVSuBNMZOOAjGqgALTCXHclvl4UhF
         QBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304763; x=1706909563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsQP+WZnx7+QyoL2HlI817M4IBaY5O/hAQGZBfHIGF0=;
        b=Y1vLGgAimms6e6taxj325RYwOzbf5n8UVzAZcP7N/vyxxoUpU7ssttPVxfrBzc+2Xi
         Sn+mQKx/sTwNeXdSN4y1eRFeajSWDufrnosyqN5Tda6ys3TmK89W47a3ZiJiLZG8KNtl
         dO2zJlgruD56l8LsLXkMnuuDGoHYe/C5sqwffnTY80Di741/uclZsjOXrb4Ll+AA0hg8
         D/hW4ClWC2YTRY5JsJxyUvKejA1IPmXtegSF/Ahi1oEqlnE30k1Zdjx17QhCq9aAaOqB
         RAn/ZdybyQIV9Z+v5ZyLwKYoYFLf5ak/JPhiCbbJ5swCHJUGeZEo+CVZzue2/++UWvD2
         wzQA==
X-Gm-Message-State: AOJu0YxYVwxcW9GdlPrR51boVlkbnVKnf/Ym6P/b70yMMIWKHXKVf3tn
	QLH0QNX+w4xDoSjslgoGc3zXVM3j6+JFvBQbYgD2FUnBtEF2ZNjtu5N3wrG8LMQ8oC9Ap8rGySV
	PqS55Zlu3ic37IXkXuy6E51WuSN8=
X-Google-Smtp-Source: AGHT+IEhK4RWNE50FEFxdXLVcvlADRgTldZ2oyE+BnJiORMhEeHp8AEtqMe/JJ7teNhEBaOnBztdp2COb9ytg4+kggQ=
X-Received: by 2002:a05:600c:16d4:b0:40e:aee6:e888 with SMTP id
 l20-20020a05600c16d400b0040eaee6e888mr279076wmn.119.1706304763242; Fri, 26
 Jan 2024 13:32:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-5-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-5-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:32:07 +0200
Message-ID: <CAHp75VdAmFc1Jz_Fw7ij_NTcxkm+o25ruj2rj8TJD51yz-ueTg@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] mux: mmio: add resume support
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
> From: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> No need to save something during the suspend stage, as the mux core has a=
n
> internal cache to store the state of muxes.
>
> This cache is used by mux_chip_resume to restore all muxes.

mux_chip_resume()

--=20
With Best Regards,
Andy Shevchenko

