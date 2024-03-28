Return-Path: <linux-i2c+bounces-2652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A446E890C38
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 22:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 286C0B234B2
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 21:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF82613AA3A;
	Thu, 28 Mar 2024 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEyYmbUE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2299013AD3B
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711660052; cv=none; b=jTKhsQUdTraRMKMaczJH9xxPL/L4DtBGqBFbkmH2NWuJpqJNGaTCXDPEcxSWIjELGhVi2ZdV2dlvGOyBVkPfCjvHAily1K250dh1RuT8uHtY3w5eere0ZgPC9L8oDd5g84xGdVIQjXDRe6n27cGQphWwuVINoX/vUQzwuc3Uses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711660052; c=relaxed/simple;
	bh=x20Z9wO4XWd6/hqsTvUJ9C5xuiCT/PGoUlQnMNRKhnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmmqAkNITSNYhLcFQiEWqPVlHML+71D3ojcS8Uoc2IBuveabSAl8HMmZyZD+VWlUGeU7RSLHGbHe4YQFbL6LUCn8OiqwVU7mHV+Zj68fPC5rk7jnCkz/+o0TOoco+UN7M6YzgRsuSyEVu0MEMW809UD9J5A2PamfwSbEAM8t60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEyYmbUE; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc71031680so1399963276.2
        for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 14:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711660049; x=1712264849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x20Z9wO4XWd6/hqsTvUJ9C5xuiCT/PGoUlQnMNRKhnA=;
        b=iEyYmbUEKVoEMLSfm+1dgqqjW6ZSjsrKhnwEgQhuqVelEQdeGl+DinyIFq09FvZxsc
         icO69KX7mM0OQMgX+nUaflyBQNaEhqo4tIgCtqWh9nf0Z6M/a2GEuOOgtKDonzgxoDIt
         mK04J3Y/5BcUoV9owDicNq5Ty8wxETWzZNsz4USadunTA7W4uhginvNOklE9YF34bX/v
         HS3wUdPaMudoWNlzBrOv5AgAI//49/9nGrfOroUnKzEajzVfO4OeiXgLh7vb9zIvBAC8
         B6LunEHMRIMgVXBENEfOEncCnEIYXkkfpYu5fnNsLhCF/n8XwOthAQ/VUuCNIEU3pa86
         9mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711660049; x=1712264849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x20Z9wO4XWd6/hqsTvUJ9C5xuiCT/PGoUlQnMNRKhnA=;
        b=W3Vl6OEEi3CX/SCMEwjv+4hxP3Fuo5+SO92ReLj1fx8iVrY6ToQ9ZNmZaG0LuFoHbN
         bjvSUjfX2kFYc9Lwhvbu6a33oQQIif1Kl+AUTTOqDe6UA3f+22uNVcPXpGdHRrmr0RAH
         OPT4+ZWkhv3Ly7TglAJmgtQD3rcIHrNmkkq9vI3Pu9cOOsQZUwtKBrBNGWyzocgi4nf8
         BNtqMjGm6JJ0kjapgYVO66LfuUpSEHodwFwXfqJI0mOHBniAubYUpGAZiA7Dm3V5Xu3v
         apTlaoOmDNzp7XEGlufll53UYnTRkICHD8Q8ekuIs3LtTzdL7uxnlamp8RMwqd6SZioZ
         S4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmseRjeYmIXEcBeoHDt1pt7k5XA6ciF7KLPlAw3DJC7t7wuHWNrrIxLlh6HqONiI2ByO3bvU/XsGxnsb2lrsssU/Ed9ycgQft3
X-Gm-Message-State: AOJu0YwMuxi/87iUceZKEZWp9JIu/z/4fdISpZOaxmYJUSgmVSQM1lcz
	oM9/zKFgD56ujhCMx+2GQrapgp/JE+rNKP/QluPA0kWK7+Lj8HqYacKybSHkEOK5kYPF3IiI9Wi
	NgClMdNDE5tDWUxtMP75qn+YaNsr6fgMDOYnRXw==
X-Google-Smtp-Source: AGHT+IEZ00FIAL54100s1/gTVa8Y+4TfoCNoj6CJTr4a+YUNR3bthOuQhK7OnCvzxoRuhI+9C1J8CAiCPfUv2a7d2bw=
X-Received: by 2002:a25:9e83:0:b0:dc6:bbbd:d4f4 with SMTP id
 p3-20020a259e83000000b00dc6bbbdd4f4mr470298ybq.33.1711660049195; Thu, 28 Mar
 2024 14:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com> <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 22:07:18 +0100
Message-ID: <CACRpkdYemzkVW4fjBtHtFPaa-Uy969j5Ti2zmRgjFiZK+jGS7g@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 4:36=E2=80=AFPM Thomas Richard
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
> No need to check the pointer returned by dev_get_drvdata(), as
> platform_set_drvdata() is called during the probe.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Since this patch looks independent from the rest I ripped it out of the
patch series and applied it to the pinctrl tree for kernel v6.10.

Yours,
Linus Walleij

