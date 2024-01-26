Return-Path: <linux-i2c+bounces-1481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4D83E42C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A635D1F22C2A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4C624B30;
	Fri, 26 Jan 2024 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0LpjUWf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5DF25545;
	Fri, 26 Jan 2024 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305496; cv=none; b=K3IdpSlTWdUJi68pkz1YjeTs7vabxxTjvLy9Q1VT/hq7Aiflfwe0tL0zqsMrNRS9vXK11mnSYAxspDBq1XMG0a7f8XY3UxlRhkt9MUJj3sU1TZamRRNUsOeTOLFmch5AWweiin/xQCGec7d/cdb4lcnhXX2/LBzCaHsCG0fqb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305496; c=relaxed/simple;
	bh=RhbeD1Xxr/wpT5U9hvDzAgq+te6qw2fPHn5v6yeDkdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cv5F2H7pyrpT5+CyC8mMYAf+nLKAiNSd8/JW+JZyM/+bJROmwOBwztEoIfcnmylw3z0aYUhPgBWa3GdI0Uq1vPV0rrYOEf/zBMyBs9KUavuFGJ/OswIhofSR+GpE+0MErMBc5HZ1xwQn2HMX9p9dD1WIflHvuzl1qHr2Hzk/SFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0LpjUWf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28a6cef709so80906266b.1;
        Fri, 26 Jan 2024 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305493; x=1706910293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZbGUMmKtRc78Vd0IFN0doHJAOFPz59sSFpDCt1ZMOA=;
        b=J0LpjUWfkyEQu7K5UgY39yV4XG0yVEQLo0KLcSKlllfTGvR62+esWdUGYAI8EJNNyO
         Ndpupuxviul+8v9ypXMYHewsH3SA+LnIJD57L2q5qh2B8MmmAQE8Jqoc0+IHPM1ET7Yg
         MbbXbkzKfSYWJ+8pV+HFa0qn1QcxOE9oGuzMsDa8tklKeJ1z8mIFfWNVgYAmT+na8AoV
         Ipdy6gLJJWkcWmvacmJ3JTGMzTs8ebfxB33zCTMir5bUmKlBPZCENBWodKKNvGb30q0P
         2+A4Tb7/NDKuDH3E5R8U+yznRAQ5IfNgZ1w432vxz1DlPw6/l551z8hb6mZzZ9RW0+d5
         jyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305493; x=1706910293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZbGUMmKtRc78Vd0IFN0doHJAOFPz59sSFpDCt1ZMOA=;
        b=k2TjDkrMu5iWldU1lSmUzJqpWn8uD0ZjJ/82i7kUbvYbo0MB835OSx4WV6jjjcps2W
         gV4B9Ru2mHHsIaU7E9dIwkPUBgYt/nk+a2rZdT5+q+U2vgHq3gu0XoOxrya6+MAQnFfu
         cANofsLQUdOMGgeSB61tatxTpWd4Cs2SjOqS8mG0Fx/U3uW2qCvrGXA3/WHMh9krGItu
         Q2xSu2DIjg5Wq9jkc0OK5LcIQUb6UTXBxRSLWeT1A7iNeqR5N2odN3v8AW5cQ/5HuTpq
         gxTqTnuySy19NopfkAznmtfIQ4SVg8II5wnnJO6qQrzTMPZj7fs3p1K3Cml8ZePtnLi6
         qwMQ==
X-Gm-Message-State: AOJu0YzvvAlrVF9WroRKXmATJ1Df/+mDSKuiPsJxmERR4m1ZzMQ8ztGn
	wFH33Wz75oG6osgoI1fjH8Zv2R0uvYqY/iWAmz7JMO3Z/jjRiDUIdje0vfR3hQQkwrTOETP0psC
	PoDCZAT6He4m5RgTpCAq/sb3C7kU=
X-Google-Smtp-Source: AGHT+IEVMVE1cmDyN4zaRyBnLDzB7920s27ax/GY3ERq+4K8hxg3bppm3gfHC1JNrG8Vsr8Xu76G+2g0Gd/k/gs2hPE=
X-Received: by 2002:a17:906:a042:b0:a31:58fc:bd83 with SMTP id
 bg2-20020a170906a04200b00a3158fcbd83mr240807ejb.10.1706305493198; Fri, 26 Jan
 2024 13:44:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-8-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-8-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:44:16 +0200
Message-ID: <CAHp75VdkWNqyy1Xe1oPDegjoO9X+zFh+zU62o3QomKmFo+LQWg@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] phy: cadence-torrent: extract calls to clk_get
 from cdns_torrent_clk
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
> Extract calls to clk_get from cdns_torrent_clk into a separate function.
> It needs to call cdns_torrent_clk at resume without looking up the clock.
>
> Based on the work of Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

(Just a side question: Have you used --histogram diff algo when
preparing the series? Please use, if not)

...


> -       cdns_phy->clk =3D devm_clk_get(dev, "refclk");
> +       cdns_phy->clk =3D devm_clk_get(cdns_phy->dev, "refclk");
>         if (IS_ERR(cdns_phy->clk)) {
> -               dev_err(dev, "phy ref clock not found\n");
> +               dev_err(cdns_phy->dev, "phy ref clock not found\n");
>                 return PTR_ERR(cdns_phy->clk);
>         }

Same issue as I noted in a previous email.

--=20
With Best Regards,
Andy Shevchenko

