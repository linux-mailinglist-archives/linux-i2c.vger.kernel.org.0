Return-Path: <linux-i2c+bounces-8428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6414B9EB775
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 18:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D07CA282401
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 17:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3565B233150;
	Tue, 10 Dec 2024 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TWKZtLVm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8C2111
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850549; cv=none; b=Sn1TdWf7qRVXECupI2LoHtgwNsQBMJ0NE5ea5Ykpd+68ZnimH9fNm9lwdnujeBxgPAMmKcDSoYYnWl6GIWw8izZMGdTdY4Ohc2N10uPCYxHNUf1U5npxUe6qPIzc1ox47Y27N2MuNHeZB8Hokog609rFBkuG7l2amOUg9aiGDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850549; c=relaxed/simple;
	bh=kmpw+MU85Klv2VgMx3ZqVirEPF5gOEEsCLRROZYzfzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXtHmJrFGAyHmsATF8Xcd+UBBUVkvwwBI87vlD/sJl9iCaurbrTf++BL1Scq3w+d+Hm/G0d11eJbqtndnKZP+Rg3TCip0dJOwLuo8KCnmSYA8To4/ocxSQtGy5I2iUNiU5jAm5LytoblH34YfEbv476BiT6BwQtHt1tSGp1db1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TWKZtLVm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401e6efffcso2588264e87.3
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 09:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733850545; x=1734455345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuhRNegPQNd7+gF/yjuNpjthxXavGQO/1ZgSXezZky4=;
        b=TWKZtLVm4OaWDqZ/JZoCE2gV7M7kBSp1uJrR+PQvlGhgS0SE+ZDSZXLNS8h0LiCE8V
         OR9oReOZKGleiVtOwMW6e/6Hi/ioda+tIA29bfUag89bARe+HsROuG29nILvuHKG2/zl
         NWOZhnYkIf0XXYkbH0AOhZRuZbtwbTPkZju78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850545; x=1734455345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuhRNegPQNd7+gF/yjuNpjthxXavGQO/1ZgSXezZky4=;
        b=CnCg6gfS2TWYGD7+GzExB9j2iagPccBPbRwduFpfzr7fT/PMnPf3+GcYrA81az5eB5
         JNbB4B8A6X9uWImoTTYadCJOdPctbwQqniny4RJXO0KbKQoaLUeXf+9ZkyFb8b3FM4pg
         FHOlXnau+a0UaTrOxBkz3jL12CC/D6LmKMLoU18pkOzs1UameMmznN4zbFH/ARdM/94m
         lmzROYJStBpCwHbMD9x7JBWnrneMkoFA1W8AracOezGey2gbyJzybd7d6m2+Q0I7qrqA
         oFagdd/cXItCSP5TEcsM25/kpMokpdlggtpa0pBY9O8UnWvpdX+4EMgy9wqTTdvyxM3l
         eIig==
X-Forwarded-Encrypted: i=1; AJvYcCW6zpoYZpXuD51LzNr7xbZbmy9FP0MhBNP+jRKVq+MUIW6sKt0gC0S4O4JM96n6ycmg6U5Jr2NOcV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ68qHiUGHnOjoDioHbB8vZLFzRpEkxiv4v0lY0NehIUVilk3j
	LGLASxMFpnnnKQmsRTnX+B3pcQfvSwBZYX30Z72+ec1Nk0xyy9UFsUfcSMOYrTfDG61xs4WZXWu
	xJw==
X-Gm-Gg: ASbGncuvQhw7NdoRYnJsXH7nHKFCEE4HKYUlpriXxlYktrXazOFR2ffI5wDBPZ9VCl5
	dtdk5BzH6mc48vrjXMFH/r8C0mGbJupMRwUAERvDyxCnnOghGQh+IcCMYtY67wHCoq9IufMndDL
	39lHW9GOnFK/HhZpYXygbQupjfA76F22B3/hRYm7PCsZg3vbobwrsqyJC0EP6NyPx+39wO4gctV
	xVsCf7jYcVT9B3ppnacRppXRYrv2j4r4C3G+AOGWouP/FxNpZD0dbxP04QYdZGAKuRyHgq2xWsZ
	xTDvdK1JpU5q7NEvvQ==
X-Google-Smtp-Source: AGHT+IFSAE1eC6wiXX5ZDkhy5g1oUnd5KSV78hOAbWEAs8+yKCWIpSfaoUWshjimjHHHS5kmec768g==
X-Received: by 2002:a05:6512:104b:b0:53e:362e:ed6 with SMTP id 2adb3069b0e04-5402410d24emr2247655e87.50.1733850545208;
        Tue, 10 Dec 2024 09:09:05 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401fc930fcsm670035e87.19.2024.12.10.09.09.04
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:09:04 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df6322ea7so6749131e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 09:09:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp7d+28lbcHcpZg5Y1/xIs067zDsWYrp9szpfs1GLAew18z7buwLWSbP+5PU+wZpH8zFu8SuWH9k0=@vger.kernel.org
X-Received: by 2002:a05:6512:33d0:b0:53e:368c:ac43 with SMTP id
 2adb3069b0e04-540240aac8fmr2378233e87.5.1733850544359; Tue, 10 Dec 2024
 09:09:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
In-Reply-To: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 09:08:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
X-Gm-Features: AZHOrDkvV4hXVBzL5LdGwv2-ywEkfcu0N74i9maLRg8R7KrBlypjtg_v-QyKEuk
Message-ID: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Each bridge instance creates up to four auxiliary devices with different
> names.  However, their IDs are always zero, causing duplicate filename
> errors when a system has multiple bridges:
>
>     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn=
65dsi86.gpio.0'
>
> Fix this by using a unique instance ID per bridge instance.  The
> instance ID is derived from the I2C adapter number and the bridge's I2C
> address, to support multiple instances on the same bus.
>
> Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-t=
o-eDP bridge into sub-drivers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> On the White Hawk development board:
>
>     /sys/bus/auxiliary/devices/
>     |-- ti_sn65dsi86.aux.1068
>     |-- ti_sn65dsi86.aux.4140
>     |-- ti_sn65dsi86.bridge.1068
>     |-- ti_sn65dsi86.bridge.4140
>     |-- ti_sn65dsi86.gpio.1068
>     |-- ti_sn65dsi86.gpio.4140
>     |-- ti_sn65dsi86.pwm.1068
>     `-- ti_sn65dsi86.pwm.4140
>
> Discussion after v1:
>   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729=
180470.git.geert+renesas@glider.be
>
> Notes:
>   - While the bridge supports only two possible I2C addresses, I2C
>     translators may be present, increasing the address space.  Hence the
>     instance ID calculation assumes 10-bit addressing.  Perhaps it makes
>     sense to introduce a global I2C helper function for this?
>
>   - I think this is the simplest solution.  If/when the auxiliary bus
>     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
>     updated.
>
> v2:
>   - Use I2C adapter/address instead of ida_alloc().
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

While I agree with Laurent that having a more automatic solution would
be nice, this is small and fixes a real problem. I'd be of the opinion
that we should land it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If I personally end up being the person to land it, I'll likely wait
until January since I'll be on vacation soon for the holidays and I
don't want to check something that's slightly controversial in and
then disappear. If someone else feels it's ready to land before then I
have no objections.

-Doug

