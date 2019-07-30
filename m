Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1B7E7A66B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 13:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbfG3LDu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 07:03:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:46556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbfG3LDu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jul 2019 07:03:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C5A4206E0;
        Tue, 30 Jul 2019 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564484629;
        bh=m7dX//3pP3+FR/k30u2LZ08eMNQLWPNMDC/X3b/BoIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KMur5BSVhiHRRxRO7wuNTmwbmOspluKLLcMqQiSBI6R7I/hFrZiXflMDNkswhbTtv
         EtfxkIXJJq6sth6CVf9ItRiCuP0D4xoZNWRDgBMa+C9ci6Q/RzCOpg0pkrmiDgRQ+R
         3Gg+K/+v70+FPzWyiJ5B9GhEpGfyM7rsXoIoSgX0=
Date:   Tue, 30 Jul 2019 13:03:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-kernel@vger.kernel.org, rafael@kernel.org,
        linux-arm-kernel@lists.infradead.org,
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
Message-ID: <20190730110315.GA31631@kroah.com>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
 <20190725135402.GL23883@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725135402.GL23883@dell>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 25, 2019 at 02:54:02PM +0100, Lee Jones wrote:
> On Tue, 23 Jul 2019, Suzuki K Poulose wrote:
> 
> > Introduce wrappers for {bus/driver/class}_find_device() to
> > locate devices by its of_node.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: devicetree@vger.kernel.org
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: linux-i2c@vger.kernel.org
> > Cc: linux-rockchip@lists.infradead.org
> > Cc: linux-spi@vger.kernel.org
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: Wolfram Sang <wsa@the-dreams.de>
> > Cc: Alan Tull <atull@kernel.org>
> > Cc: Moritz Fischer <mdf@kernel.org>
> > Cc: linux-fpga@vger.kernel.org
> > Cc: Peter Rosin <peda@axentia.se>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: Heiner Kallweit <hkallweit1@gmail.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Thor Thayer <thor.thayer@linux.intel.com>
> > Cc: Jiri Slaby <jslaby@suse.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Peter Rosin <peda@axentia.se>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >  - Dropped the reviewed-by tags from Thor, Mark, Andrew and Peter as the
> >    patches are mereged, though there are no functional changes.
> > ---
> >  drivers/amba/tegra-ahb.c              | 11 +-------
> >  drivers/fpga/fpga-bridge.c            |  8 +-----
> >  drivers/fpga/fpga-mgr.c               |  8 +-----
> >  drivers/gpu/drm/drm_mipi_dsi.c        |  7 +----
> >  drivers/i2c/i2c-core-of.c             |  7 +----
> >  drivers/mfd/altera-sysmgr.c           | 14 ++--------
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> What's the merge plan for this patch?
> 
> Is anyone prepared to create an immutable branch for us to pull from?
> I'm happy to do it if no one else steps up.

I'll take it, and create a branch for everyone to pull from.

thanks,

greg k-h
