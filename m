Return-Path: <linux-i2c+bounces-581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DF801938
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 01:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174D11F2114C
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Dec 2023 00:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F20915DA;
	Sat,  2 Dec 2023 00:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H+v/A6DF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE27B6
	for <linux-i2c@vger.kernel.org>; Fri,  1 Dec 2023 16:58:57 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso359735a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 16:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478733; x=1702083533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=;
        b=H+v/A6DFm2l2aPBE227oSQxDGVmPpxKmmyGt9Bs9JwL+2eUBI2TYJtsUo3+AXHilfk
         AEB6ot+iXL+n0/vVkDTZzV8pFQj+Vf5109WXvZiMQvF+mUWSXGwpSWETJCMN3OEsxul1
         vcdTu1tCcipWaQ9Y1NDt6U3nO/lSD5WIa7MqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478733; x=1702083533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=;
        b=cxGEOpYxumTpJOMaOagBFx2wQ2wQ+HG2DE8xXOf06MboqH2mdmPSOsOYDptirUuauZ
         wQOXH7P0wjm86jBRPkE3ZAIOOifXv8MGI0nX2RtqPL+ELW4/ywMJeKJXZfMdSDWgLUaF
         juOA+8R0Vyen6eXEaPc2uEUG0LCYCK7HbwbQZNoezyduv6WesAYhLONoatBOwdtZQAS3
         M5nJFYA7AIf0QcPxawXVkw0rObs5y/LzRoS+kDoiZAAZJGKUIY6WEpavROaJ9xST7IHg
         c0tf9WiDBDUx1B1gVSnysol0tcjkue8qCABU/BKDRNBVEs6yzBJ08lGCCFAfMVHksVlz
         mOLA==
X-Gm-Message-State: AOJu0YxWFMZuOUTSvG6huCNWGyrg5aAtThz32LFQs5s+gCJRwJC+ZX8F
	YkFuJDult8OXpV7DoQeJeC+N3Kz+gPBTzHGELmT4FXrg
X-Google-Smtp-Source: AGHT+IFrfd5EFGWr41/5Svll/xPXPsq0MJT+x1Bh1DA5k6bv9JnKivQiUY116HwBa1L1MlYBBX3ISA==
X-Received: by 2002:a50:d48a:0:b0:54c:4837:7582 with SMTP id s10-20020a50d48a000000b0054c48377582mr1348624edi.46.1701478733396;
        Fri, 01 Dec 2023 16:58:53 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id h24-20020a50cdd8000000b0054c7dfc63b4sm169051edj.43.2023.12.01.16.58.53
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:58:53 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so12765e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 01 Dec 2023 16:58:53 -0800 (PST)
X-Received: by 2002:a7b:cb59:0:b0:40b:4221:4085 with SMTP id
 v25-20020a7bcb59000000b0040b42214085mr244275wmj.1.1701478712415; Fri, 01 Dec
 2023 16:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
Message-ID: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
>           To compile this driver as a module, choose M here: the
>           module will be called chromeos_tbmc.
>
> +config CHROMEOS_OF_HW_PROBER
> +       bool "ChromeOS Device Tree Hardware Prober"

Any reason that it can't be a module?


> +       depends on OF
> +       depends on I2C
> +       select OF_DYNAMIC
> +       default OF

You probably don't want "default OF". This means that everyone will
automatically get this new driver enabled which is unlikely to be
right.


> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +               if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> +                       int ret;
> +
> +                       ret =3D hw_prober_platforms[i].prober(&pdev->dev,
> +                                                           hw_prober_pla=
tforms[i].data);
> +                       if (ret)

Should it only check for -EPROBE_DEFER here? ...and then maybe warn
for other cases and go through the loop? If there's some error
enabling the touchscreen I'd still want the trackpad to probe...


> +                               return ret;
> +               }
> +
> +       return 0;

Random thought: once we get here, the driver is useless / just wasting
memory. Any way to have it freed? ;-)

