Return-Path: <linux-i2c+bounces-14630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78807CC8122
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 15:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5885D30811E9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 14:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306F134F25C;
	Wed, 17 Dec 2025 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3Rlr0+T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04434F480
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978983; cv=none; b=a1yD/+w6xuLk5XGLXZX8KIN/Z2MW6rnnNRhx4+c/Xdbame37mYZw6e/GAIqFdkq3PxrSXd03JcVk9xnGmiJkEjilM13wCIo4o+4eVH+UPtZ6v4o69HyCXREDkzGfWKMlK4bPRnBwEVGdLsXNSXezUlN9uhLB+Kt/5RGBFvHwztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978983; c=relaxed/simple;
	bh=nre4+f/1qweJxFoeeHsRIflrATunEW5LWrhj6Pv/YRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ki9zisAFByHynU1EgFSbBT5NJ8fyhW3loLWzPsenL8oQkzP3CKWokdMfDg4HJ4Xzte750IY1VEL4MLjw1TpHiTilrerkoal9F8TH1qlI3p6a0dFhGYRNWTtlSsylDBMKWhXBLBhXcON9Ft+syCLPs9ytEUihuNNJb+XJIgtVwCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3Rlr0+T; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so5118995e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 05:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765978979; x=1766583779; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i+2rCMNUHkZI89lP4N4BumifdRKTsaBf6MC8t3850FA=;
        b=p3Rlr0+T95LKZQayrzXYTvbUvv6N3iakcHQxpWx65eUd8+lUCwS9f/6Vq8MUTJdvlz
         7HBLv9cPHp0cj23HbmJUS2Dh4U+l0qYdvF3aaPSH5JhrZ7YwOrobUVipOLHpwW7ccrIf
         zJ+8xK/8D5t6y3s2jCWDJHgv/e+jJdAWR8rd3sUGUxoNuroOChb1flv7wxO4rM6o3+YN
         9bffZEShBR52yarjv9mW5IuaDnM93Nl2nAyIZVXA1W7zJbGNr+KOAczd0O2ufav4PF0J
         Zz8oMvmmVmyPwHwvBQtuaBJquDvPpGmglAzCfZ8Kc7HPVa437NOe0NjK+mIGVYzE6vk0
         B10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978979; x=1766583779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+2rCMNUHkZI89lP4N4BumifdRKTsaBf6MC8t3850FA=;
        b=wTetQQ74LOUDU/8old6bmLZgQQChjWS3VBAn5qRYB48ZYB1k3XelD23nB4fiUJla1m
         1Qzb7SxhTabIOPG1C8cJb3SMK/u/uKGpqXFijUdhfP7dkL2rtn4xzFZ4HvsPtuG1uFTS
         rY312XomgZkbybyOZziPkAvg/utTeL6cYTRnEYVr/9ZUNgStrIqnlAy875QkaYThv4Ca
         RkBOe4nxoiHav6mBdeYqn3tAgys8pK4UEuY2slzMZ1ZiPlyQKA/Ed08Bc17T+EOcJ82F
         RSLB/7KfvegArj1fWESMGaopGVCyuWO72zVwqRnkRZbktha+HcHxjuxcVlsolh2gAamR
         gYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSe58SPEQHto0rCUTZU8zpTKDSP8Psund2rRga3vchaAdBiN7idiDYQClX+i5d9daaW3fV3+0PzeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXND+RijmWnyhXF+WlKhCHADrFUfZ6MnBZ7htZvIgek2X93Q5R
	llkhrK0bcRt28wsKv47VPX4ZkApaVcElpo/E1PoJo3Lna52KDKhcqOhvYZEZwulWgCnFbSrWIol
	a6Ws//AOh2adqdf09LOd0A4EtmbxQltRL9lzHvLAxmA==
X-Gm-Gg: AY/fxX4wxHF61+ftcDakBSD1nY0rD/28ku6mK2ptm5xFTSz9aAs7DT2FRX9rbMOWWDe
	e19uWV6Mwv5irbuoEnY/dvD8oPvzOrCqOn5Nttu6eziWwQZ+B+5HC/ApLl58sf80KspIaZX+OB/
	meag6uU2gAMMvDHWLZ+mYgb1glmdH+8lhQg5Zjy6VpnJSMoE6Y1kLygEfcb7jMCl3PTmYTFEtTo
	nrb0KskS34vO+TKH7xuTYLW4h/ckjuRqG02DBPC7Q8uKl0NdviPbuaYSAgnmPQh2UhujZI=
X-Google-Smtp-Source: AGHT+IFQ7RFU2XYjhNpz4zPlGBfxB8IQy25jb9NHzoC5kJ0seGo5jh0pCCbvJquopiBKgSSVm6gg0z6EMwvFTEugGus=
X-Received: by 2002:a05:6512:3a89:b0:598:f262:15c7 with SMTP id
 2adb3069b0e04-598faa4d4c4mr4998838e87.25.1765978978821; Wed, 17 Dec 2025
 05:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Dec 2025 14:42:21 +0100
X-Gm-Features: AQt7F2rn4fUAIJmNzeBvaDU3HopJ0wrtd_f0H7TRKpgHGGrU8bW-ugZfTBQ1TVc
Message-ID: <CAPDyKFr7DCRs_E4VfrY9-NY8-bStT9oAZaYhUZDg_y3KEW9DWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
>
> Some Renesas SoC based boards mux SD and eMMC on a single sdio
> controller, exposing user control by dip switch and software control by
> gpio.
>
> Purpose is to simplify development and provisioning by selecting boot
> media at power-on, and again before starting linux.
>
> Add binding and driver support for linking a (gpio) mux to renesas sdio
> controller.
>
> Introduce generic helper functions for getting managed and selected
> mux-state objects, and switch i2c-omap and phy-can-transceiver drivers.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v3:
> - updated omap-i2c and phy-can-transceiver to use new helpers.
> - created generic helper functions for getting managed optional mux-state.
>   (Reported-by: Rob Herring <robh@kernel.org>)
> - picked up binding ack by Rob Herring.
> - replaced use of "SDIO" with "SD/SDIO/eMMC" in binding document and
>   commit descriptions.
>   (Reported-by: Ulf Hansson <ulf.hansson@linaro.org>)
> - Link to v2: https://lore.kernel.org/r/20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com
>
> Changes in v2:
> - dropped mux-controller node from dt binding example
>   (Reported-by: Conor Dooley <conor@kernel.org>
>    Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - Link to v1: https://lore.kernel.org/r/20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com
>
> ---
> Josua Mayer (6):
>       phy: can-transceiver: rename temporary helper function to avoid conflict
>       mux: Add helper functions for getting optional and selected mux-state
>       phy: can-transceiver: drop temporary helper getting optional mux-state
>       i2c: omap: switch to new generic helper for getting selected mux-state
>       dt-bindings: mmc: renesas,sdhi: Add mux-states property
>       mmc: host: renesas_sdhi_core: support selecting an optional mux
>
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml      |  6 ++
>  drivers/i2c/busses/i2c-omap.c                      | 19 ++----
>  drivers/mmc/host/Kconfig                           |  1 +
>  drivers/mmc/host/renesas_sdhi.h                    |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c               | 16 +++++-
>  drivers/mux/core.c                                 | 67 +++++++++++++++++++---
>  drivers/phy/phy-can-transceiver.c                  | 10 ----
>  include/linux/mux/consumer.h                       |  4 ++
>  8 files changed, 89 insertions(+), 35 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251128-rz-sdio-mux-acc5137f1618
>
> Best regards,
> --
> Josua Mayer <josua@solid-run.com>

Looks like this needs to go together or if someone can host the common
parts via an immutable branch.

Anyway, I am expecting some discussion or update for patch2 first.

Kind regards
Uffe

