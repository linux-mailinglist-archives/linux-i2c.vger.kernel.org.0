Return-Path: <linux-i2c+bounces-13924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E26C23FBC
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 10:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E9A564A29
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFFC328611;
	Fri, 31 Oct 2025 08:58:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5403128BC
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901090; cv=none; b=oaNwPVUnL1V4EQs7sqvYXAVVyIPP4AAdJs0wgHmkS0t7iYRo0Ajbbzexy/v6pmGQTr/qINZw9hUTDi+dDxiEll2V6zIH504OpOKETOjehnfIXplenv/+9/Ws49oOF61/gk0v3Bq1xHjrNo8b5lv27i3HPyKyFjohvkThoM6ASZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901090; c=relaxed/simple;
	bh=NYbl8HJcgb3R5SVJ9GXGI/Jq2+mOIag8w0HzHBPHPoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIpIdZueNVDWQQmelUp9iqacVlqVjyRJnkVktkRtEa6vTuTseqsm7H5h5Luc1GEBGakoj0xGSuTbzWRvdysKOJ9VQoSGs04yd8lDt0LW0s4oZJfyanlJ4T4eU+FR1CLi3a/eLQEmDJNTyT4pXav7NdMe8XNFBy1D8dnzPIh/oBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-880255e7e4aso13973606d6.0
        for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 01:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901087; x=1762505887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQVVX5c2GB+a2QgL3UYe6DKU+bmVaydohzEFkpxq/1c=;
        b=DAe3JfWnDPzEZ+2B6pVXkVFNwdKQ+VHh1/SoZBEiWj6N/R43t4PKtj/gRfmIg0IabZ
         hGzNTZKDV9ii5eGlk4dIG5trroHSZfd6BmQmaTdQgGuhUemSJjbrudFRcA0gsG6zQ/8p
         w78Vr8nM3suvFKs6S7wyAw2cuIus/SLidGMwc2/P1EHOpyar4MJ2QMtfg68iJA0n86Oa
         7Yra2UxEzq80tFCFUkETTv6N5Ct/U+F7vk1Iddc61JWuM4zrU7zbrQi7pkA4j/4rms2c
         Jn/S+VYJhq8OVVg0uGotRzTIx3gL0LvUw8CWfIwEbBkETHKTh5OiqbNDsfKHEPi4lw5Z
         ccvg==
X-Forwarded-Encrypted: i=1; AJvYcCXqP8AozU/ZKVRPCmIqoitSxE1mAD8RG1iBzddS81CQLlGDyG9qmUO0tMzgPOVbWBxG3A0iWR2Y8FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOm1TyKFdHOpuQ4S5QKCGgp5hlOLWZV0QLhRH1W85eGDjr1SXT
	lRMEhRrgn51b3sbHfV2JS9YsGq4A5v3g+sGx6ub9CmpbKC04URElYzAJ1+MCVuRr
X-Gm-Gg: ASbGncsQcA4WPJV0FacdiPROv6yzzLf05Oze5zIW2FoEuGM/E9XEEFIMVxH/a3Z+QBX
	4q/lEMg+ZSoNE9hAo3XkpKelAfxsDPIf+YadIA5JGo3n1BC0hwVnCjZr/8XzkdJpUUSK9+Qg6/c
	AYBZE8bohpauZb/FToZHVcHlteAVxcC49EknOq7xZOs2WqIIxYg0KtO4z4gQjl7DWo0r2Kco1jT
	ELEi/yGFz+74uNCrpDeM75mievORNBFChakF6h13WPWpLJuL1EYAf1bFHxGp5u64tpDfmnampte
	mwoG0N8nK7dMhr/IGCtDX8FTYotqlYbvmHZtD3Qu8Ix04fjQMjDaSSQxpqXIrcE54DP8SEYJNQn
	evC++Y2S2wSWMRRj74P9Fxnw63b4Mg6t5ErSPzc+REGLRLNmQSnk7Y1l9BE/xbp6oZl6Fhx61Q1
	cgsRioWVCcVty1W4xtMXVTtirZY8NMxTI7JxWdrg==
X-Google-Smtp-Source: AGHT+IEDhrWeUr6OYce5XU3z50/V6B6rSQ+do77EjYavfGF4vPuoe+jUbHM8SpbQqBOSXQngc2HYFQ==
X-Received: by 2002:ad4:5dcc:0:b0:7dd:b2b5:9fc5 with SMTP id 6a1803df08f44-8802f2d6b40mr28841596d6.16.1761901086681;
        Fri, 31 Oct 2025 01:58:06 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880362d276esm8048896d6.28.2025.10.31.01.58.06
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:58:06 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-880255e7e4aso13973506d6.0
        for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 01:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+AI3j2DQ6OqzpVHALvRxvr9s3IZ6A3cVXHiRamkVQ6SMWXX0Qy4LtckKqn58YOrvdY+APUUPLe3Q=@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5d5:f6ae:38c6 with SMTP id
 ada2fe7eead31-5dbb136ecc7mr717064137.37.1761900747573; Fri, 31 Oct 2025
 01:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-6-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
X-Gm-Features: AWmQ_bm5vGlc5XXZic8RvnXrZNNcCRnf0-7M9Km7uh4sqx0Aign1FjKoX2MZmow
Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote=
:
> A Simple Platform Bus is a transparent bus that doesn't need a specific
> driver to perform operations at bus level.
>
> Similar to simple-bus, a Simple Platform Bus allows to automatically
> instantiate devices connected to this bus.
>
> Those devices are instantiated only by the Simple Platform Bus probe
> function itself.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Platform Bus
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  A Simple Platform Bus is a transparent bus that doesn't need a specifi=
c
> +  driver to perform operations at bus level.
> +
> +  Similar to simple-bus, a Simple Platform Bus allows to automatically
> +  instantiate devices connected to this bus. Those devices are instantia=
ted
> +  only by the Simple Platform Bus probe function itself.

So what are the differences with simple-bus? That its children are
instantiated "only by the Simple Platform Bus probe function itself"?
If that is the case, in which other places are simple-bus children
instantiated?

Do we need properties related to power-management (clocks, power-domains),
or will we need a "simple-pm-platform-bus" later? ;-)

FTR, I still think we wouldn't have needed the distinction between
"simple-bus" and "simple-pm-bus"...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

