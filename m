Return-Path: <linux-i2c+bounces-1486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A6483E45A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B173F285F28
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB0B25558;
	Fri, 26 Jan 2024 21:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqFGMHFy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FE82554F;
	Fri, 26 Jan 2024 21:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706306143; cv=none; b=nNrmF7bRuPm8qNyNmxP3SWOiSP+Td1J+WJ/kgNAxPE0MbWt0cQyJ2wxyrWLjUsYmJZ1UbdDFmNNFcWNgC1VpLU/mK7gsvFwKBFtsVg2Oebxw+opc5MmZZQ+Wdw6iiy0WCJvhU/GIySfW18R5Dg74ql6xS9eXkNkE5pxxITZtDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706306143; c=relaxed/simple;
	bh=WhxgiR2rTnnQ+bwG5tvmMIB6amadVcuzuZ7pAt5Crcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLE1sgB8j5T2M62qIT85uYZMv7Td7XmsAJgQdY6/TjJaII3ODNkJhHtkRK+WYoJ9ZJ9mX4uFrkVMUP4KrYyHHbFVOs3iMuZDQFm1RtriKPQyQOkh2FQu21W8oI5fAX12opDf+NAYcbE2w9FMG4O7EGqeb8fiPKUDgosAZEo3GZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqFGMHFy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a271a28aeb4so77238966b.2;
        Fri, 26 Jan 2024 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706306140; x=1706910940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Eex8zgmPiS6cd/0RWckNbah/punqtBDfU6VumuTjFQ=;
        b=SqFGMHFygI5gTmwDbsFHGC7dvL0kz73tWiRzt8X3RQWYZ3itGM1m15e8qqyx/CIMbQ
         S5/is2J/Jzbko04aTAa86zC1qIMOAX3WPCAPVU/jpFi8ZchgNFrpC8QSgwY5Zcycunik
         /rflsT6gEYX41osiZjZtZyxnmMOIsbJqzdNffSIdtUSDGiOF+fUR5c4op9jpeUIRKkjm
         y9OOc5pPcwXvyKQnQcPEMRCYGI9Bm5rYeNaUwy9AHdggxvYEZMRI8jCpJxf/hoeDwJQ1
         LbbxbxVGJv6kvaHDaZvpI2cVCr5YiaOcYQBZVxtGKknmi3Z3HfWqiuRmGcUPW4R++hsT
         j2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306140; x=1706910940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Eex8zgmPiS6cd/0RWckNbah/punqtBDfU6VumuTjFQ=;
        b=XtzASeSVHc3cpZUOE3VLQ+nvtxD5imZ5Ce40krVQ+qa3m8o3yPI+cu3kERTh71Qlkc
         /FFAGPhFWv4z832QMjXatPizGdFeFwjnVwcxYSADVCpzewpaLsDFowvOEl270ux+v/uW
         nzYMeTBKkSixXNdDtaFJfR/ALZNg/953ppDn86FFOvrrFOlRsmBocJ0X4yvd2rqi3R0i
         sJsZDKWtkLzAkuXdC2x1cKUnX39NJ5eyKgPwRRfLgyfWTgJIOAwwBSLzK2+Y6j7XZvic
         HTGoC10bUAlR8JnsMXGwqRAJBUmCGo8aq2VgtdAdm6z3pZsnfgmarNdJTuXIa23i5NHc
         M2Fw==
X-Gm-Message-State: AOJu0YyIESfSoz4viGII38E8c9lYgox0WCTZLOEBW4rau7pOspO2015q
	OGJIDS715lSD+degtAwaLdaa7cXhCM5NsewhurAHjMeUcxm8az5QndlicBk86Q+7qIwhIfrj2Jv
	Vz0j/l6guifUKNc7ktEiPGH1v0mg=
X-Google-Smtp-Source: AGHT+IEBOcQl+eA0DkV9Z5QVSjTUy7lBkqFnE6O8BX8N2DGGcgPCadgeO4ln7Re5ueD6foFwcdrwD9BT1gB5PR9Nesc=
X-Received: by 2002:a17:906:9ac9:b0:a27:6615:15ed with SMTP id
 ah9-20020a1709069ac900b00a27661515edmr221845ejc.42.1706306139794; Fri, 26 Jan
 2024 13:55:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-15-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-15-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:55:03 +0200
Message-ID: <CAHp75Vfzvi-08DUvmBO8Lt1a-orozD+Z=YNOQJykJKWDZA5gGA@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] PCI: j721e: add suspend and resume support
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

On Fri, Jan 26, 2024 at 4:38=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> From: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Add suspend and resume support. Only the rc mode is supported.
>
> During the suspend stage PERST# is asserted, then deasserted during the
> resume stage.

...

> +static int j721e_pcie_suspend_noirq(struct device *dev)
> +{
> +       struct j721e_pcie *pcie =3D dev_get_drvdata(dev);
> +
> +       if (pcie->mode =3D=3D PCI_MODE_RC) {
> +               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +               clk_disable_unprepare(pcie->refclk);

Same Q as in a few mails before: Do you need unprepare? What will be
the benefit from a PM perspective?

> +       }
> +
> +       cdns_pcie_disable_phy(pcie->cdns_pcie);
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

