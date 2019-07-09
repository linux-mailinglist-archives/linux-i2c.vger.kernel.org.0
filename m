Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEDCE6392F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 18:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfGIQTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 12:19:25 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40023 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfGIQTY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 12:19:24 -0400
Received: by mail-io1-f66.google.com with SMTP id h6so36179877iom.7;
        Tue, 09 Jul 2019 09:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7tAfXbTGjm8fRgQr1s7o3SHyobzROVcWesepsvUVeJ0=;
        b=ruanipF8ui2ugcexuiwtCQgXb2kw9c0aikK7uxCD126M1XxoKqOOi4Rwul1BaQqawZ
         bfKWEIpOnDryBjbcQkA7epjzHmhZuatuWjdEuIA/Eb4qGZipcfk92OD1kUOO0H+z4Txm
         bbwdw6Zhj/GnbIzZD6Bf8MSb/YZCu7lIvBI7BH4TYTWBxoNhK4ucwZSpvzjvbyJF2wFt
         6mKz/9SCZ88DfGi5+VtdUZNZC47WZjzPnoMYf4XqKU+9mhXjc2bVTP1aDNVLWuvFeDWP
         jtsSSu4tWhIoSY4g9y4URrPCV8Lfryyf9aPl/4YbRlvIcBYh+a8TpZYgLBmhjm5UesQJ
         PI1w==
X-Gm-Message-State: APjAAAU3y1fTxN5rKRmpF+hiDLdWeZj15P5GBYUxeSjzdGcZqQhoXD+Y
        kRDoXVp2WWBmAb82vOvOdw==
X-Google-Smtp-Source: APXvYqytUb4e1tTFkilBAmDnbfpUegwR/3+McS2ESVbZuIF2pcM4ypCPA270vJObgxVGw3SsHisGJg==
X-Received: by 2002:a05:6638:191:: with SMTP id a17mr24115446jaq.101.1562689163723;
        Tue, 09 Jul 2019 09:19:23 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r5sm18036660iom.42.2019.07.09.09.19.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:19:22 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:19:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, suzuki.poulose@arm.com,
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
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 17/28] drivers: Introduce bus_find_device_by_of_node()
 helper
Message-ID: <20190709161922.GA1609@bogus>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jun 2019 18:54:12 +0100, Suzuki K Poulose wrote:
> Add a wrapper to bus_find_device() to search for a device
> by the of_node pointer, reusing the generic match function.
> Also convert the existing users to make use of the new helper.
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
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c             |  7 +------
>  drivers/hwtracing/coresight/of_coresight.c | 11 ++---------
>  drivers/i2c/i2c-core-of.c                  |  7 +------
>  drivers/nvmem/core.c                       |  7 +------
>  drivers/of/of_mdio.c                       |  8 +-------
>  drivers/of/platform.c                      |  7 +------
>  drivers/spi/spi.c                          |  9 ++-------
>  include/linux/device.h                     | 12 ++++++++++++
>  sound/soc/rockchip/rk3399_gru_sound.c      |  9 ++-------
>  9 files changed, 23 insertions(+), 54 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
