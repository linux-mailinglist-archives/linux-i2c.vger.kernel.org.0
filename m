Return-Path: <linux-i2c+bounces-1495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C683F0B3
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 23:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0151F22AD5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 22:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D80F1EB47;
	Sat, 27 Jan 2024 22:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHleKZ0J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F011E52B
	for <linux-i2c@vger.kernel.org>; Sat, 27 Jan 2024 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706394687; cv=none; b=mbAU+viJm0Sk8whrb/NHG039X2StwQNSAWB+9GF1x+R1DvSQy0rDqH4Hav+07cBTM+RCL9F0tT6rN3//PdIYCQBuEKNFszLduZhMpt0ENoZUwirR0IEQ8FrmG9HBnEEfsavmxoVgkKAtoWnKgH6KGGSquUU1WcIqNT18jiB3aak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706394687; c=relaxed/simple;
	bh=1dBUeUlto5pgjnZjs4MdTR5SQtmL2Ucvd23RmHx3BTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGtlxp0PF+Eodt4HAUd7wIyQfmqeBCrq1KWkSm26gCXDb01K+culOICr9RMhzCDu0NjxZIjtdez++tklBaID6L8TdLTjf56Lx8Xb8IV6KNXYswgM04VjvEjQUrT0GSWmJDfcs4rsJo/t/EuseQxUzOvE4V5yywtKZZFCXslGOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHleKZ0J; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ffcb478512so10965457b3.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Jan 2024 14:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706394683; x=1706999483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dBUeUlto5pgjnZjs4MdTR5SQtmL2Ucvd23RmHx3BTY=;
        b=cHleKZ0JcJEZlpoUaX9P+Lv8Q1pdXZQBACsRpogl1frJ+eJ+RVKcyfv96ZaVksV7J7
         Kv5vjXHtp+Pe9uj+QBopb3KOXNGx9E0Z0pm3ozUx7Ui2CslZrePd0ZiZUK57Mma6Nzvx
         eHrpLpN/2y+1hNnJL4LMmjkd3mjpgBt30lm72g48mcCcKSpx0MLCadNnMW+G+4Wi36bE
         FEoGgo4+uDR2nSuetbQmPIAiEocp3YFKrZ5zHv0lXbrYJa2Z/xKCCgc/f9YfNtwOJ/g0
         TLoRLqLL4+p3OtromgncIXxLahR7FdlR1IMOMYpHOEUdyG1bZYKP4NCOSjxS6QOlgQlE
         w1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706394683; x=1706999483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dBUeUlto5pgjnZjs4MdTR5SQtmL2Ucvd23RmHx3BTY=;
        b=pf1x5ZAe7Av7Bqt3ipnum4X6HgLcNbFcAsSc/3HqnSPj25XdTWZE4az6ZZrWzUWQFm
         qojY5+DBEU07onF4lZYLewOZ8RRMCNvGVnE2HeYKaEaSFDAYg3RJsVq9O+NCBCNM4MMG
         roPLkluWpeZ53q5XVH+OYwBKXecDWR30Dd9a3WQYB9UqTK8Rlh2/9eBnQiccZisha35b
         45lFCgljDP1JRq53C00KdzAATddh8FL89LElOaCYw2ja6yy3OQm02yEhNRkxZ9zd8qS/
         7Snb4oaSgFifTfYexDBAsmnz+EfmtyKY/Rj30klSCboojgcE5OKm5rW76SPUlg3WObIO
         vejA==
X-Gm-Message-State: AOJu0Yyf/wQSBrPj5JcPPIFF6M5gSf1NxcQZq0ri6VuS1ONzjpbSRqVX
	FiqhFPKRm+Fa9prbF229BPD+OhwPsczILTHe04IjtsPkAVzC99FID7quxEWLJbFbhn3w1TwvDk8
	F70968tkT8ZcN64jeV+8XRPqxy6sUstTEBXHuiw==
X-Google-Smtp-Source: AGHT+IHztRxFG/ccy+YnFlBSRiS8OsDLI+aB8k67iKO1nxm2sl8UZpFQH9rExIgVxfgB6WROcfzh5M2ZahRGH+kk4fo=
X-Received: by 2002:a05:690c:809:b0:5ff:cb36:2219 with SMTP id
 bx9-20020a05690c080900b005ffcb362219mr1863709ywb.35.1706394683112; Sat, 27
 Jan 2024 14:31:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 23:31:11 +0100
Message-ID: <CACRpkdYBnQ6xh2yNsnvquTOq5r7NeDhot6To9myfuNbonKcgzQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
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

On Fri, Jan 26, 2024 at 3:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> The goal is to extend the active period of pinctrl.
> Some devices may need active pinctrl after suspend() and/or before
> resume().
> So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
> have active pinctrl until suspend_noirq() (included), and from
> resume_noirq() (included).
>
> The deprecated API has been removed to use the new one (dev_pm_ops struct=
).
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Do you want to merge this as a series or is this something I
should just apply?

Yours,
Linus Walleij

