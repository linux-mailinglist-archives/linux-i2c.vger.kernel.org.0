Return-Path: <linux-i2c+bounces-1476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C083E3F5
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145532876D8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FA724A1F;
	Fri, 26 Jan 2024 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBDIhN2w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EFF250E8;
	Fri, 26 Jan 2024 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304703; cv=none; b=KkBVs9oBKdFjalbcElZXEC5uTWACmc7BAjU7bsS+is6oFINlpTG37Stj16mdcZUafDiUG6txLbZxWzOJJPzle+c7KHf4AhzwGSJsqWnOSckcnZFvIjFIgby1xfPqSPprdvFgEGGeTmLfGmM7Qk6jXJGC2slhDWzV0OR8PZQtnxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304703; c=relaxed/simple;
	bh=mDXTx8QMtKyNvkViX2Wj8fex4yMcm0KlVYHSHcciIfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVCtS50f5X9+aZQbxJB9qLITjBlYcEpaQwTx4v8nJHmdnBzwuTQgpMiBobNeVUjumsxsV5OGpau4fmmgzr83uSsKd/tG8EtrZzQLoB97KpW6mNTJaxyVJBC8V7LwFGxnDI4S5hH88TRB7tFbSHJevDHhhXMh98jrW++KJUkLfag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBDIhN2w; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3536102785so2393666b.1;
        Fri, 26 Jan 2024 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706304700; x=1706909500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDXTx8QMtKyNvkViX2Wj8fex4yMcm0KlVYHSHcciIfA=;
        b=ZBDIhN2wfcR39bmZ5v+SEUyfEwGbFS5exxMBz+ZZZLkl8gHPnDSkHUNKGzHvWMjnT4
         2BDZDdpK4hTs/FlXCH6prZHhh7c/cPVZl7r0OvVJPD9J7domzwhlI+uxV+9jJF1rRy22
         gmS52le3eNfOZ+VphjwhiMYgb1/1COxd025HqtodYEB5Y99uLW/IDqQ9nkCkzw1c34R1
         9gGmXCjlhGwaXvvG99bAIFrmqXXS0uVuop8BLhfGjrFhaX7auZVa+Kl9iYLwML1HsTOx
         B3yOxkqSgEjHmyB0+IgkMrp6XdmYtYI6nvPMXRt8Kzq1lR9HlnWubpDsdRr2CzK9AmER
         I+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304700; x=1706909500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDXTx8QMtKyNvkViX2Wj8fex4yMcm0KlVYHSHcciIfA=;
        b=g4vwJNJZlVbAPpg/6rQugtPGT8slD4Nk3gn9dem4JAR1Dat0fvmLnQZmerMxGGGk9+
         0UykwpzFuavkKP+NRDemr6v8k3Y1LhliJScZ4UiVYHSDDzSwX10FLCOcRX5++eaULH4H
         +7cEwc8xvHn0316C3b/3MzhJz0Mg9+3YRvsylkOYCXfBrjw//cA1nqGC+vH+vYY3CgBo
         20/xlt2JXwVrRjYJAonwHsqpespwNHTB4IRCY03Dxg7bsD1odr/ILia0heePtJQ0gyhH
         LDSxLo5voql8AxXxaZq0jGussvbaLg+ieOKUYzeEQcvOCDwV27COYTlETgI2YsCofEv/
         prew==
X-Gm-Message-State: AOJu0Yy8VJjj4DEyuPF18SJ9gjfbgHOss+fCGwNKXAVjTmd+is55BgHr
	Y0YX8619i0NB0nnkbTjI5YH180rXic+IJewLGpdKD5A/5wTjQhO2dBA5WDQTgktSslxW2Ch0j+X
	v887N1TtH3QZuUn+uEO+jXAWb/HQ=
X-Google-Smtp-Source: AGHT+IFkBmkflnDzL19x18zHK/B4dtxxNwR7dmtumO843L79ltYLDN+VfdaWu2B7SEAMrvkcEJHGHI9PkQzSXKasw4w=
X-Received: by 2002:a17:906:298d:b0:a28:32ff:8709 with SMTP id
 x13-20020a170906298d00b00a2832ff8709mr165310eje.15.1706304700273; Fri, 26 Jan
 2024 13:31:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:31:03 +0200
Message-ID: <CAHp75VcJA=gg8GLF_YK_tUbjdozaRoJd1gk+a8UCiFWGkk=5CQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
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
> The goal is to extend the active period of pinctrl.
> Some devices may need active pinctrl after suspend() and/or before
> resume().
> So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
> have active pinctrl until suspend_noirq() (included), and from
> resume_noirq() (included).
>
> The deprecated API has been removed to use the new one (dev_pm_ops struct=
).

LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


--=20
With Best Regards,
Andy Shevchenko

