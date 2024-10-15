Return-Path: <linux-i2c+bounces-7404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE399F497
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 19:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31EB41F23795
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 17:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05ED1FC7D0;
	Tue, 15 Oct 2024 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lsGhlmrV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00971FAF04
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015168; cv=none; b=p1DhPr+LC0Jj3q5PDojpQPGMNvTD1hRWQqdbsyhl6xNFVFI7kjKvEBBdmm4FWSYRhSFr5UWn8YmHjZoNjDvpaxoZOEvHeqFWAf6GZEkSfh1qOi48UBJqcf0ObVPBPKrLdAAan3NZYpil+Y9P4qryhBjdCrr9LLOp108yvje4Cg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015168; c=relaxed/simple;
	bh=Nw8AYXxLQYRASA0EqVaeq4osc1EcBSEe7S6yFgCszeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWRBJ9GS0afFpfjX3jy5JGC7BApdQw4c3fdjGsHohoHmIIvzzaT7A6Edlw/gZTUZ//fPC1x0YXoqYi3RY0UcIzaCer53FalqnkXWiY27xx90p/Oc/XSBkKys4xdb1p7RCVR3mQJ2TZFTFAnTeAMNpChjnfgVwPWmf7cnTgnw314=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lsGhlmrV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso52573671fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015162; x=1729619962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=;
        b=lsGhlmrVAwxvBtp0Ur3wGSBmej+y6J2VAAV+Ffx4PordEZjqvFArv8/wwV69G/5cN9
         ntck4+O3eX6A6HcHp5J1TSaeMu8Dq2jbyjWlQ9q+tCxHG0ldF5TGpvr0qUaJZ1hvyHyi
         7I+P9BcdRLovaDVCeo0d2NN5JzgFhBM8je53c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015162; x=1729619962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=;
        b=Z6aQmzldw2MMhpIgTL+cnTkjU97JRGeNvIH2m1SzpMg4UPC/z/WwzthEADZn/CkCBN
         Ev8MfqQsQCA/olwKhlW3leYsn5++Qj4Zu5duh8sbrI6qv7PJEIyt8YKn34FcDhHndBSn
         7QCo1uDJpyaHchCPFx+0VxSxCSzpbDmMYmrTetBklF2/k5I2N0U2Dq0QtHZX1X0ZxjyL
         u7E8OBM8z05cAOsgst8kihOdme1Qg0pY7AuHvCg8TE8OnHhumzT1TOuCp6paWRCDPqdf
         BRd8wgXYZ0MJ/yq7PgU3ENImXBMHfVO1l4wSZpr6xj9y/KFsIp3cZK8OGrtktlrGeAj/
         MjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTigEK6ayL9pX9Iaq5MTKXZiGDYYteY4Bate+TY/MXi15+nb+FoWCF0vYSsAYS1Cah/67y3FADPq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4pfRDOUw4t2N/kyt6e0xpqs6ZIE0n01wkeFD/0X7aWgk9KgpZ
	+mjebp8YuQlV8yb2KTvotcYP3cKOskWSljhLSmYpdZYCLEo3PFvFu25VnUz1xwxq7TtDjCofiiQ
	WD0FL
X-Google-Smtp-Source: AGHT+IGMK1+I5A5O3cAW3sCNm5g7x91aSIvsC8n6COW7Kr0vkmtTMApjrUnoB1cp31jIUjozT5Hg2Q==
X-Received: by 2002:a05:651c:2223:b0:2fa:e52f:4470 with SMTP id 38308e7fff4ca-2fb326fe966mr69886081fa.9.1729015161701;
        Tue, 15 Oct 2024 10:59:21 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d0fb697sm2151581fa.22.2024.10.15.10.59.20
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:59:21 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53a007743e7so1189020e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 10:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJTAsRocmGDycl/GgDS8/xrJtbnzlhxaIAEo0xoFi/kYMU9mLpti0yhHitY9JOlErS+IxU364WuOo=@vger.kernel.org
X-Received: by 2002:a05:6512:3046:b0:539:d9e2:9d15 with SMTP id
 2adb3069b0e04-539da4e12eamr7412619e87.29.1729015159647; Tue, 15 Oct 2024
 10:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:59:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-00zCEGhp=Buqg2OFikX2TYDK81gXuD7S_+btqKp9JQ@mail.gmail.com>
Message-ID: <CAD=FV=V-00zCEGhp=Buqg2OFikX2TYDK81gXuD7S_+btqKp9JQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component prober. For any given
> class of devices on the same I2C bus, it will go through all of them,
> doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
>
> This requires some minor modifications in the existing device tree.
> The status for all the device nodes for the component options must be
> set to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Maintainer expects this to be merged through I2C tree.
>
> Changes since v7:
> - Corrected Makefile item order
> - Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
> - Added include of "linux/of.h" for of_machine_is_compatible()
> - Switched to simple probe helpers for trackpads on Hana
>
> Changes since v6:
> - Adapted to new I2C OF prober interface
> - Collected Acked-by
>
> Changes since v5:
> - Adapt to new i2c_of_probe_component() parameters
>
> Changes since v4:
> - Fix Kconfig dependency
> - Update copyright year
> - Drop "linux/of.h" header
> - Include "linux/errno.h"
> - Move |int ret| declaration to top of block
> - Return -ENODEV on no match instead of 0
> - Unregister platform driver and device unconditionally after previous
>   change
>
> Changes since v3:
> - Include linux/init.h
> - Rewrite for loop in driver probe function as suggested by Andy
> - Make prober driver buildable as module
> - Ignore prober errors other than probe deferral
>
> Changes since v2:
> - Addressed Rob's comments
>   - Move remaining driver code to drivers/platform/chrome/
>   - Depend on rather than select CONFIG_I2C
>   - Copy machine check to driver init function
> - Addressed Andy's comments
>   - Explicitly mention "device tree" or OF in driver name, description
>     and Kconfig symbol
>   - Drop filename from inside the file
>   - Switch to passing "struct device *" to shorten lines
>   - Move "ret =3D 0" to just before for_each_child_of_node(i2c_node, node=
)
>   - Make loop variable size_t (instead of unsigned int as Andy asked)
>   - Use PLATFORM_DEVID_NONE instead of raw -1
>   - Use standard goto error path pattern in hw_prober_driver_init()
>
> - Changes since v1:
>   - New patch
> ---
>  drivers/platform/chrome/Kconfig               |  11 ++
>  drivers/platform/chrome/Makefile              |   1 +
>  .../platform/chrome/chromeos_of_hw_prober.c   | 140 ++++++++++++++++++
>  3 files changed, 152 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

