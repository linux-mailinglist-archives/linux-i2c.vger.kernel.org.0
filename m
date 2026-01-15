Return-Path: <linux-i2c+bounces-15175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37989D23943
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 10:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A493A306ECC8
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 09:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F15B35EDCE;
	Thu, 15 Jan 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/DRmCLc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6235A954
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469253; cv=none; b=ndPMvpDXYV6pk8kEAk93MCpwA8YO2CMfawQLEtWoaFzaUVcrZ5LoWFP39ctTCyYnd/VF4CeFAYfBHTPZHOtWLfHWIAOGG+lJuiHR2Jx6QFiuvs88tIx4J0bLjD9z5lNUjvtVZmeiWlHNSIg90p2ILO8111sT9bx1bYR46FX0x/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469253; c=relaxed/simple;
	bh=IHOMnj/BJN95A/4L9YqNfuIpnb+bAMt2NrBpXun8idA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIQ2bKNFcCDgGRYWf8yyrnQ7JTpYjksJQSgbGa7P1t8j9k3U1BuwY6YqeYQB3Gx6Ntz8OWW639sMScXjjJ1ndlJypgy0naeGnYKOYQ5At5w2/K3JzMYh2acVOe7V62EMp/ycm5nMWiZFEV3vzimYfR3j+sVXYUa0D/bEKQyqUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/DRmCLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F43C2BC9E
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469252;
	bh=IHOMnj/BJN95A/4L9YqNfuIpnb+bAMt2NrBpXun8idA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r/DRmCLcWBcGmsGBpCfKZ81eYL6mEmOJhUwUBjLAGTiXqLzKf5MOiWyC+unPiAMar
	 AnZaY6pDQeiiYkIiN6SqeL0E9Ysaq/H4dgykcNr+06ETWvL+xyFoWE9FnpVIgHCeY5
	 8OrtnbK6erAwgimfNgdCzmdzHevvFULdVolpVjgCLsOONOxFP8zcUd0unJsN3rFac6
	 RanFHKwwwCYzZalbJyn2ctBVQeGEbu12U25gWwtPuE2qfLzAN8827+qMAQXEctJg7F
	 rNn2LlZeyS66cqRGWIODCMwzcduXpzV91hQ+SRpZAHop9VygH9k3qgNecUrXy/NnGG
	 Dyt2V3xpLmvBw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64476c85854so531785d50.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 01:27:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+kUkzYCIk1ArTWiP0NjU8VBDfKmk7OvidRF6ioeLGvkXlAUQKrVnWLtPtt3rERDVx40GeuYTRdcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39q+Essz3c+X2q33LqWYVV9yq6N2mK43RB8IFstNVNdXa4vpj
	Fjw66hGm+5UlyZBznZX6idoyUasnt9P92Q58wzX9+MyvZ3nRpmNJGQLR6ANFwYq4jWiD8V0bIRK
	riWFJt0X5Ue9ue+B3SRuYdJkSTkWa1Oc=
X-Received: by 2002:a05:690c:45c6:b0:786:5afa:375c with SMTP id
 00721157ae682-793a1dc2311mr98450177b3.67.1768469252018; Thu, 15 Jan 2026
 01:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114141352.103425-1-jie.i.li@nokia.com>
In-Reply-To: <20260114141352.103425-1-jie.i.li@nokia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 15 Jan 2026 10:27:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
X-Gm-Features: AZwV_QgP9FTs53wCT-dFujSFa3UD-wgIUQGUY8O48v_mJXwT8i6vdX8Cb_ApmNg
Message-ID: <CAD++jLkyTMXAE_M2JFF5jzzLZ2Z-CV89uEGh4xHopWrGoYncbA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] i2c: add support for forced SDA recovery
To: Jie Li <lj29312931@gmail.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jie,

thanks for your patch!

On Wed, Jan 14, 2026 at 3:13=E2=80=AFPM Jie Li <lj29312931@gmail.com> wrote=
:

> This series addresses a limitation in the I2C bus recovery mechanism when
> dealing with certain open-drain GPIO configurations where the direction
> cannot be automatically detected.

I'm sorry but I don't understand the premise. How can we even get here?

So the mechanism is about I2C that is using a regular I2C block, and
the pins get re-muxed to GPIO to drive recovery using the I2C
core GPIO-mode recovery mechanism with bridge->sda_gpiod
which is retrieved in the core from "sda" which in DT is
sda-gpios =3D <....>; (calong with similarly named SCL) for
GPIO-mode recovery.

So if that is set in an input mode, such as during devm_gpiod_get()
reading the initial direction of the line,
so gpiod_get_direction(bri->sda_gpiod) =3D=3D 1.
this patch set will go and write output values to the line
*anyway* because "it works".

This is how I understand the patch set.

In which scenario do you have a device tree where you can add
"force-set-sda" to a DT node, but you *can't* just fix up the
SCL/SDA flags like this:

#include <dt-bindings/gpio/gpio.h>

sda-gpios =3D <&gpio0 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
scl-gpios =3D <&gpio0 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

?

We should possibly also enforce it from the I2C recovery core,
for SDA we are currently doing:

gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);

what happens if you patch i2c-core-base.c to simply do:

gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);

(Based on SDA resting polarity being high.)
I'm more uncertain about that one because I don't know exactly
how hardware behaves in response to this, but can you test this
first if you have to hack around in the core?

Yours,
Linus Walleij

