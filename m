Return-Path: <linux-i2c+bounces-1322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14482E142
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 21:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692282838A1
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 20:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1BE19471;
	Mon, 15 Jan 2024 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4NHu6N7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46518E2A;
	Mon, 15 Jan 2024 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55969c01168so1388652a12.1;
        Mon, 15 Jan 2024 12:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705349188; x=1705953988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87z/U/eZmGA0TAuJWEdp0n7QdUhBeveGTh40YHaQDwQ=;
        b=D4NHu6N7CpjfCfWhuL4FAv97HkJvhuR++KXjQqvRchEjgm4it5w07ETx6kIibNpSoh
         k1IYEhVen57wNaqlcdaGcPrqEqVgLrWsA7qbUayk9LmWUAMWFBk2TUfpiZuPgK6VMf9P
         Z+UVfGyF5o/bomXrtPJ8+1m3rfRAXVLkZmpImtf6bGj0O79gqtM0ZYFVZlCcUV5y9i7H
         p1TJjLqJlVj+HOFBS6w69XscaYQEUpq20EkIK+tTwl0soYPyDumEyrReu576ABF97Yv/
         Xv9QPtNNqBKICnErO1j+TirzygBVTswYHPLdZ/A2dyneX7b8ZBrd5mLbjGs7bqhvL6Vz
         msug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705349188; x=1705953988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87z/U/eZmGA0TAuJWEdp0n7QdUhBeveGTh40YHaQDwQ=;
        b=OiuEc0kKIVnTo8lzucNDyfidTHW7lq7mWG2KBMavhhPtzjxn7BYKQlR47VAdXPO/mZ
         0SWoftjlhfxQeOf6zAl3LnjrrgJ0fpPiiojphTZ0LduRFBBD26VwckZEP1YkmY4/nNJZ
         T/F9I7Dmp4R39Cx4pZWeME8VKywKOki2ggYYISFkQfMbsUo3awy2L1KXnjgpq2I5KIy9
         4CJdaY28ELccP+pOtdkpORzOhzpE7HmDW5vYL0DiybC+tCrT9x7dXOanBxriXMbhbGd7
         mrl+Jf3Br71bBT8HwBKef/rOdX9oPCndoZj4SX1cUQkPma3ixxuVEV2ZYIAbFacVlFoQ
         jnOg==
X-Gm-Message-State: AOJu0YxCFZ9oXxJULJpvh0XPv+kf0+NG6+OHp1A6PIN7mFyLZ+WvOmB4
	tvy2W29+IDWSAKQ4gSMQXdpa618PVpBoqdn8AXo=
X-Google-Smtp-Source: AGHT+IHsGuZhFMr80G5DfnYOLEnb6oIGs7BJiiLJfQW8ZbTBFNvUcUSdt4iuoqGylqjyWRGa+ORIiKkxjeS8hFu9nm0=
X-Received: by 2002:a17:907:3dac:b0:a23:690e:48bf with SMTP id
 he44-20020a1709073dac00b00a23690e48bfmr7583783ejc.12.1705349188168; Mon, 15
 Jan 2024 12:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com> <20240102-j7200-pcie-s2r-v1-4-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-4-84e55da52400@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jan 2024 22:05:52 +0200
Message-ID: <CAHp75VdtL+RncgLWghTy0qneobM+UUFr6Wnc78maOmeLZEpQOA@mail.gmail.com>
Subject: Re: [PATCH 04/14] mux: mmio: Add resume support
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
> Implement resume support

Why?

...

> +#ifdef CONFIG_PM

No ifdeffery, use proper macros.

...

> +                       dev_err(dev, "control %u: error restoring mux: %d=
\n", i, ret);

Won't anything go wrong and spam the log buffer?

--=20
With Best Regards,
Andy Shevchenko

