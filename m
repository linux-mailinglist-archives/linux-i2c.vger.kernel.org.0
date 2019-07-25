Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAD275047
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 15:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404080AbfGYNyd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 09:54:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38985 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfGYNyc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jul 2019 09:54:32 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so50852287wrt.6
        for <linux-i2c@vger.kernel.org>; Thu, 25 Jul 2019 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kiGD59LaW0LszoAZzmVLJ1Hft59fIaEtybxXjg0U4OU=;
        b=sQQDJiby1lR9rJnYwpFayBJL1RCmEUHrXJL5ktfkxstXcB1e72/IJ+7W0b7G/ZBDE7
         l2/Oe7WGAKBlaplOUnR9eKLvijJm+yqgNtv1e2Xt94tpqVPUHg4DEcD9UGsRs0szMquI
         gd0SnX7mYKDLhjJOaB+OD74kiTzZcmfgGeIajBjxHk8HORwabuVH5qYZ14shV48okQcq
         oV1q3+hmkLuRmabQQ4N1s3WbE9w1LtffyarQQhGJ98ItiO4babxYtOZPj/d8HElgIXh3
         +7ifv5dKadFG/B1N65t8KG2r29CwpiyOZg/YA0MfSDcC9TY3HZioK4MipWty6YP9bw5P
         6xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kiGD59LaW0LszoAZzmVLJ1Hft59fIaEtybxXjg0U4OU=;
        b=kV9MRQJOlIdfAdbzD5yCzVgazLTqFftm/NlzNgzJTW0Liho/xw3er1Iub9R6X21RrA
         3ulhAYy/ca44V6sUFgBqJApE8kwzz0eePTjoPfNcOkcAbIITNohM1qgYOkTsBpT/Ik2w
         IBNbrXm5PxTk7DXTwijqsGngH762DxDrWorPdLF0VxklrY6NDkzKUVmK1Vk6VqBzixJX
         LT92bhcoekJkh1Dwp1Iq6p6eJdlmfIFxW7RT3R7oJsMrP4z7/roDMS1GZzVk2Ft+Ky0j
         gc4RNMswQtpc+USgMYM6maxf0zQvEy5QcbHdlXFOG+sg9TVue1yiEXzl8wCDMy2O/4EQ
         Hf7A==
X-Gm-Message-State: APjAAAVNK5UXPKUSAbxS41iiwceTl3RdAzSAvJn3mTkdqLmCh8ZBR2yI
        RZO+cyhNVwNVPbq3/L3+ihmUlg==
X-Google-Smtp-Source: APXvYqyi+7SaHwgU0aK/nQJij+0evagD7L54rP/lc55M34rnwnlBR+KX1Ln1iOdMtsPd3Xr0XJt2kw==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr64650717wrp.38.1564062869954;
        Thu, 25 Jul 2019 06:54:29 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id c9sm40786310wml.41.2019.07.25.06.54.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 06:54:29 -0700 (PDT)
Date:   Thu, 25 Jul 2019 14:54:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-spi@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, Alan Tull <atull@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, linux-fpga@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Mark Brown <broonie@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH v3 2/7] drivers: Introduce device lookup variants by
 of_node
Message-ID: <20190725135402.GL23883@dell>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190723221838.12024-3-suzuki.poulose@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 23 Jul 2019, Suzuki K Poulose wrote:

> Introduce wrappers for {bus/driver/class}_find_device() to
> locate devices by its of_node.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: devicetree@vger.kernel.org
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Alan Tull <atull@kernel.org>
> Cc: Moritz Fischer <mdf@kernel.org>
> Cc: linux-fpga@vger.kernel.org
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Thor Thayer <thor.thayer@linux.intel.com>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  - Dropped the reviewed-by tags from Thor, Mark, Andrew and Peter as the
>    patches are mereged, though there are no functional changes.
> ---
>  drivers/amba/tegra-ahb.c              | 11 +-------
>  drivers/fpga/fpga-bridge.c            |  8 +-----
>  drivers/fpga/fpga-mgr.c               |  8 +-----
>  drivers/gpu/drm/drm_mipi_dsi.c        |  7 +----
>  drivers/i2c/i2c-core-of.c             |  7 +----
>  drivers/mfd/altera-sysmgr.c           | 14 ++--------

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

What's the merge plan for this patch?

Is anyone prepared to create an immutable branch for us to pull from?
I'm happy to do it if no one else steps up.

>  drivers/mux/core.c                    |  7 +----
>  drivers/net/phy/mdio_bus.c            |  9 +------
>  drivers/nvmem/core.c                  |  7 +----
>  drivers/of/of_mdio.c                  |  8 +-----
>  drivers/of/platform.c                 |  7 +----
>  drivers/regulator/of_regulator.c      |  7 +----
>  drivers/spi/spi.c                     | 20 +++------------
>  include/linux/device.h                | 37 +++++++++++++++++++++++++++
>  sound/soc/rockchip/rk3399_gru_sound.c |  9 ++-----
>  15 files changed, 56 insertions(+), 110 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
