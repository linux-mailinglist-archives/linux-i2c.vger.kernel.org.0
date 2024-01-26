Return-Path: <linux-i2c+bounces-1482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504A83E431
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 105B7B23234
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C48A24B33;
	Fri, 26 Jan 2024 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApkyqvK3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5381CD34;
	Fri, 26 Jan 2024 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305569; cv=none; b=SGt9wrdB0z+lMrMnjXk328MHB1te5XLgJxqKCIAV/Ja28SYu0kP9xJGlZ50GFRMjP6hYyNC7gS4HUNXFrMlQEv5r0c6Onkjpilp7KqIyVfECTapG+zL2CYVwAyhD5zK8slPWMFWj16Zoht//w+9g11EV2p2oyRmhgd9SV+8mrkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305569; c=relaxed/simple;
	bh=HQkL6ngwMWDmrq3Sj7a3dyToWvz/1Fxwyt+zP1pM9/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXMg7Y25a0lv+5uopMz7W4y4/p/+nFu3xyXggYco8bABRPWsNX5t93FpzcDkGCGcmzWoV5tFcM1utudERAaW3gUPQ/PkhW8QZq5u+zvh5K09MNgikLHVE9adNmv7DzLxov5sLkW1PhAMPFRfFvi/79QkiAalpg9FHadZ7i/PJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApkyqvK3; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so624902a12.2;
        Fri, 26 Jan 2024 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305566; x=1706910366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQkL6ngwMWDmrq3Sj7a3dyToWvz/1Fxwyt+zP1pM9/I=;
        b=ApkyqvK3ryDdu1TmhS4VHF8hP9dIpmwAmRSC4f83YPMq70xp4fK3xhPeKkuNDl/ai0
         nv+rKOz/0uL0fTD2Jcjf+P4ieCj64OdZWjPyLJuu6KG4Ec7QX0VlAjL5npvb+ImVAtHq
         W5V9lBnwU+vz84oezsYjxqW+J4JN+KsvAWHr8w5AZakOR+hQkp7ByJbLS8i9uG79RtlC
         PWeeOEWLqqgCKg5TySJHbMjil9o5QjWcyBnI4wiSGznL/7TZE+aMEOIc2JnaXur7Thf9
         HOO8thVLE9qeiYGvmImvwt4XJExW0V1K/kRkgRQAb64eFeX7VgK9wkYni0+jBDW98Dnr
         OlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305566; x=1706910366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQkL6ngwMWDmrq3Sj7a3dyToWvz/1Fxwyt+zP1pM9/I=;
        b=NCiKLgHz2TJS03Ni6xgNdEm9IruqWn7juVjpRnUcjFXUXAN0fvm/m4fZHH3omFv/Ck
         Q2oHE5js+4C4EIB27angS0kwxK9punjn/FAkpt+JailCa0VWhHfDfP475tClHog4Sxy7
         YPwwEq6SkqJCOK69pF+kvBm+b9rO4SBhRO4NtWF3CiviZln5tHwRHEqtV60CIlEjOTTm
         mIN1BgT/uBVTjupTNQp6UB/Wb6d68eIoqsEEhn2ijl9iwI+XQhCZqXVATcg5Y6kKnwvS
         jfu1YSuvsx9Bo7DqdlQUX1RvvAq+kKk3O9Uz33en+W46utzKAJJDEJJBAWdkZn01Y9zl
         F5kA==
X-Gm-Message-State: AOJu0YwX9ZDqV4aP+oDhEO6dNhvB23CD6qPXuoyFegUpQhg5DN53fdyD
	mhZhfeEFkyrtyra8Wdr/szVdW6COhqLK+a/CPfQqQL03F5O7AwCiKC3DfiT6EoBgGaG5+sYLNBl
	/hu+q29sAyYvy3Aly80+v3NgvxsE=
X-Google-Smtp-Source: AGHT+IFuaN66sH/Q1hNZyw9mZrIx0mYKhx0F1IQ/t/bx/vsOS7NFf3pBAuGabC39Y7mXEG7N/TyC/Sukm+qc+ZnwxjE=
X-Received: by 2002:a17:906:f858:b0:a30:a4d4:b4a9 with SMTP id
 ks24-20020a170906f85800b00a30a4d4b4a9mr206016ejb.44.1706305566044; Fri, 26
 Jan 2024 13:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-9-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-9-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:45:29 +0200
Message-ID: <CAHp75Ve440129bHZ3e7Sq1EsGtEzSwYaGfgAPfiN0LE7bw6oXQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] phy: cadence-torrent: register resets even if
 the phy is already configured
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

On Fri, Jan 26, 2024 at 4:39=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Resets are needed during suspend and resume stages.
> So they shall be registered during the probe even the phy is already
> initialized.
>
> The function cdns_torrent_reset is renamed cdns_torrent_of_get_reset to
> make it clear.

Functions are referred to as func().
It is also applicable to other commit messages in this series.

--=20
With Best Regards,
Andy Shevchenko

