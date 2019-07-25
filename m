Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCADA7593E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 23:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfGYVBH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 17:01:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44563 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfGYVBH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jul 2019 17:01:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so23625436pgl.11
        for <linux-i2c@vger.kernel.org>; Thu, 25 Jul 2019 14:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AQ/YQOdzO/lt/Njypr7ENnIFm0KRkDQyJzzOHu8DVAQ=;
        b=spcgJ4xWy3MKQsCLoHVdRrwmAJJ1Vt3oAABvMjaF1dNtBNWR+rmxmeU3jyalg9/Su3
         IC8Ka9A0xF6FvrHIHMXoOppFL/3WrxPZKPhcEIIoa3NEytaIdMBZVU5YYJ/k79o9CJkD
         c1E7DB4kCpg3FkNaIYg4Sw29WnTV1S3f2+blUgmv4POY4MxvZszZ9wvXIBmxDtCwV9sl
         o91oNaYcWvvK8/pXQ04zlehCAE3e9d6bzAH/ERmaUZcTR8VhB4N9nWZb7qV3U8QB2Tem
         YnUj8H1AHo5dh0qNZ4arcPWsqeY9twX1WM939GNmQzDxUT6JIyvEpK5ENuOMfrnliE+J
         UaEQ==
X-Gm-Message-State: APjAAAUlttffQ7dJJhtktW3YU2CySa+gUxn1dW0+RPAonmmOPqGEbyMy
        uDAl/rapYwLdBCnDdCXF4fRSmQ==
X-Google-Smtp-Source: APXvYqyouNzxd1+i/SZvdm1a0d0UOQNWrzAZu6N6//DUCc5guqV4mLT3BRoTH7oWsKBlRiwdkwFPrg==
X-Received: by 2002:a63:f750:: with SMTP id f16mr58278099pgk.317.1564088466127;
        Thu, 25 Jul 2019 14:01:06 -0700 (PDT)
Received: from localhost ([2601:647:5b80:29f7:1bdd:d748:9a4e:8083])
        by smtp.gmail.com with ESMTPSA id bo20sm37810913pjb.23.2019.07.25.14.01.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 14:01:05 -0700 (PDT)
Date:   Thu, 25 Jul 2019 14:01:04 -0700
From:   Moritz Fischer <mdf@kernel.org>
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
        Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee.jones@linaro.org>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH v3 2/7] drivers: Introduce device lookup variants by
 of_node
Message-ID: <20190725210104.GB13647@archbox>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723221838.12024-3-suzuki.poulose@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 23, 2019 at 11:18:33PM +0100, Suzuki K Poulose wrote:
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

Acked-by: Moritz Fischer <mdf@kernel.org> # For FPGA part

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
> 
> diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
> index aa64eece77a6..57d3b2e2d007 100644
> --- a/drivers/amba/tegra-ahb.c
> +++ b/drivers/amba/tegra-ahb.c
> @@ -134,22 +134,13 @@ static inline void gizmo_writel(struct tegra_ahb *ahb, u32 value, u32 offset)
>  }
>  
>  #ifdef CONFIG_TEGRA_IOMMU_SMMU
> -static int tegra_ahb_match_by_smmu(struct device *dev, const void *data)
> -{
> -	struct tegra_ahb *ahb = dev_get_drvdata(dev);
> -	const struct device_node *dn = data;
> -
> -	return (ahb->dev->of_node == dn) ? 1 : 0;
> -}
> -
>  int tegra_ahb_enable_smmu(struct device_node *dn)
>  {
>  	struct device *dev;
>  	u32 val;
>  	struct tegra_ahb *ahb;
>  
> -	dev = driver_find_device(&tegra_ahb_driver.driver, NULL, dn,
> -				 tegra_ahb_match_by_smmu);
> +	dev = driver_find_device_by_of_node(&tegra_ahb_driver.driver, dn);
>  	if (!dev)
>  		return -EPROBE_DEFER;
>  	ahb = dev_get_drvdata(dev);
> diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
> index 80bd8f1b2aa6..4bab9028940a 100644
> --- a/drivers/fpga/fpga-bridge.c
> +++ b/drivers/fpga/fpga-bridge.c
> @@ -19,11 +19,6 @@ static struct class *fpga_bridge_class;
>  /* Lock for adding/removing bridges to linked lists*/
>  static spinlock_t bridge_list_lock;
>  
> -static int fpga_bridge_of_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /**
>   * fpga_bridge_enable - Enable transactions on the bridge
>   *
> @@ -104,8 +99,7 @@ struct fpga_bridge *of_fpga_bridge_get(struct device_node *np,
>  {
>  	struct device *dev;
>  
> -	dev = class_find_device(fpga_bridge_class, NULL, np,
> -				fpga_bridge_of_node_match);
> +	dev = class_find_device_by_of_node(fpga_bridge_class, np);
>  	if (!dev)
>  		return ERR_PTR(-ENODEV);
>  
> diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
> index c3866816456a..e05104f5e40c 100644
> --- a/drivers/fpga/fpga-mgr.c
> +++ b/drivers/fpga/fpga-mgr.c
> @@ -482,11 +482,6 @@ struct fpga_manager *fpga_mgr_get(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(fpga_mgr_get);
>  
> -static int fpga_mgr_of_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /**
>   * of_fpga_mgr_get - Given a device node, get a reference to a fpga mgr.
>   *
> @@ -498,8 +493,7 @@ struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
>  {
>  	struct device *dev;
>  
> -	dev = class_find_device(fpga_mgr_class, NULL, node,
> -				fpga_mgr_of_node_match);
> +	dev = class_find_device_by_of_node(fpga_mgr_class, node);
>  	if (!dev)
>  		return ERR_PTR(-ENODEV);
>  
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index ad19df0686c9..bd2498bbd74a 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -93,11 +93,6 @@ static struct bus_type mipi_dsi_bus_type = {
>  	.pm = &mipi_dsi_device_pm_ops,
>  };
>  
> -static int of_device_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /**
>   * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
>   *    device tree node
> @@ -110,7 +105,7 @@ struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np)
>  {
>  	struct device *dev;
>  
> -	dev = bus_find_device(&mipi_dsi_bus_type, NULL, np, of_device_match);
> +	dev = bus_find_device_by_of_node(&mipi_dsi_bus_type, np);
>  
>  	return dev ? to_mipi_dsi_device(dev) : NULL;
>  }
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index d1c48dec7118..6f632d543fcc 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -113,11 +113,6 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>  	of_node_put(bus);
>  }
>  
> -static int of_dev_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int of_dev_or_parent_node_match(struct device *dev, const void *data)
>  {
>  	if (dev->of_node == data)
> @@ -135,7 +130,7 @@ struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
>  	struct device *dev;
>  	struct i2c_client *client;
>  
> -	dev = bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
> +	dev = bus_find_device_by_of_node(&i2c_bus_type, node);
>  	if (!dev)
>  		return NULL;
>  
> diff --git a/drivers/mfd/altera-sysmgr.c b/drivers/mfd/altera-sysmgr.c
> index 2ee14d8a6d31..d2a13a547a3c 100644
> --- a/drivers/mfd/altera-sysmgr.c
> +++ b/drivers/mfd/altera-sysmgr.c
> @@ -87,16 +87,6 @@ static struct regmap_config altr_sysmgr_regmap_cfg = {
>  	.use_single_write = true,
>  };
>  
> -/**
> - * sysmgr_match_phandle
> - * Matching function used by driver_find_device().
> - * Return: True if match is found, otherwise false.
> - */
> -static int sysmgr_match_phandle(struct device *dev, const void *data)
> -{
> -	return dev->of_node == (const struct device_node *)data;
> -}
> -
>  /**
>   * altr_sysmgr_regmap_lookup_by_phandle
>   * Find the sysmgr previous configured in probe() and return regmap property.
> @@ -117,8 +107,8 @@ struct regmap *altr_sysmgr_regmap_lookup_by_phandle(struct device_node *np,
>  	if (!sysmgr_np)
>  		return ERR_PTR(-ENODEV);
>  
> -	dev = driver_find_device(&altr_sysmgr_driver.driver, NULL,
> -				 (void *)sysmgr_np, sysmgr_match_phandle);
> +	dev = driver_find_device_by_of_node(&altr_sysmgr_driver.driver,
> +					    (void *)sysmgr_np);
>  	of_node_put(sysmgr_np);
>  	if (!dev)
>  		return ERR_PTR(-EPROBE_DEFER);
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index d1271c1ee23c..1fb22388e7e0 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -405,17 +405,12 @@ int mux_control_deselect(struct mux_control *mux)
>  }
>  EXPORT_SYMBOL_GPL(mux_control_deselect);
>  
> -static int of_dev_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /* Note this function returns a reference to the mux_chip dev. */
>  static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>  {
>  	struct device *dev;
>  
> -	dev = class_find_device(&mux_class, NULL, np, of_dev_node_match);
> +	dev = class_find_device_by_of_node(&mux_class, np);
>  
>  	return dev ? to_mux_chip(dev) : NULL;
>  }
> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
> index bd04fe762056..ce940871331e 100644
> --- a/drivers/net/phy/mdio_bus.c
> +++ b/drivers/net/phy/mdio_bus.c
> @@ -262,11 +262,6 @@ static struct class mdio_bus_class = {
>  };
>  
>  #if IS_ENABLED(CONFIG_OF_MDIO)
> -/* Helper function for of_mdio_find_bus */
> -static int of_mdio_bus_match(struct device *dev, const void *mdio_bus_np)
> -{
> -	return dev->of_node == mdio_bus_np;
> -}
>  /**
>   * of_mdio_find_bus - Given an mii_bus node, find the mii_bus.
>   * @mdio_bus_np: Pointer to the mii_bus.
> @@ -287,9 +282,7 @@ struct mii_bus *of_mdio_find_bus(struct device_node *mdio_bus_np)
>  	if (!mdio_bus_np)
>  		return NULL;
>  
> -	d = class_find_device(&mdio_bus_class, NULL,  mdio_bus_np,
> -			      of_mdio_bus_match);
> -
> +	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
>  	return d ? to_mii_bus(d) : NULL;
>  }
>  EXPORT_SYMBOL(of_mdio_find_bus);
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index ac5d945be88a..057d1ff87d5d 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -76,11 +76,6 @@ static struct bus_type nvmem_bus_type = {
>  	.name		= "nvmem",
>  };
>  
> -static int of_nvmem_match(struct device *dev, const void *nvmem_np)
> -{
> -	return dev->of_node == nvmem_np;
> -}
> -
>  static struct nvmem_device *of_nvmem_find(struct device_node *nvmem_np)
>  {
>  	struct device *d;
> @@ -88,7 +83,7 @@ static struct nvmem_device *of_nvmem_find(struct device_node *nvmem_np)
>  	if (!nvmem_np)
>  		return NULL;
>  
> -	d = bus_find_device(&nvmem_bus_type, NULL, nvmem_np, of_nvmem_match);
> +	d = bus_find_device_by_of_node(&nvmem_bus_type, nvmem_np);
>  
>  	if (!d)
>  		return NULL;
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index 44f53496cab1..000b95787df1 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -280,12 +280,6 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
>  }
>  EXPORT_SYMBOL(of_mdiobus_register);
>  
> -/* Helper function for of_phy_find_device */
> -static int of_phy_match(struct device *dev, const void *phy_np)
> -{
> -	return dev->of_node == phy_np;
> -}
> -
>  /**
>   * of_phy_find_device - Give a PHY node, find the phy_device
>   * @phy_np: Pointer to the phy's device tree node
> @@ -301,7 +295,7 @@ struct phy_device *of_phy_find_device(struct device_node *phy_np)
>  	if (!phy_np)
>  		return NULL;
>  
> -	d = bus_find_device(&mdio_bus_type, NULL, phy_np, of_phy_match);
> +	d = bus_find_device_by_of_node(&mdio_bus_type, phy_np);
>  	if (d) {
>  		mdiodev = to_mdio_device(d);
>  		if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY)
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 7801e25e6895..b47a2292fe8e 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -37,11 +37,6 @@ static const struct of_device_id of_skipped_node_table[] = {
>  	{} /* Empty terminated list */
>  };
>  
> -static int of_dev_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /**
>   * of_find_device_by_node - Find the platform_device associated with a node
>   * @np: Pointer to device tree node
> @@ -55,7 +50,7 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
>  {
>  	struct device *dev;
>  
> -	dev = bus_find_device(&platform_bus_type, NULL, np, of_dev_node_match);
> +	dev = bus_find_device_by_of_node(&platform_bus_type, np);
>  	return dev ? to_platform_device(dev) : NULL;
>  }
>  EXPORT_SYMBOL(of_find_device_by_node);
> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
> index 397918ebba55..20dcc9c03adc 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c
> @@ -460,16 +460,11 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
>  	return NULL;
>  }
>  
> -static int of_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
>  {
>  	struct device *dev;
>  
> -	dev = class_find_device(&regulator_class, NULL, np, of_node_match);
> +	dev = class_find_device_by_of_node(&regulator_class, np);
>  
>  	return dev ? dev_to_rdev(dev) : NULL;
>  }
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 75ac046cae52..a591da87981a 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -3652,37 +3652,25 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
>  /*-------------------------------------------------------------------------*/
>  
>  #if IS_ENABLED(CONFIG_OF)
> -static int __spi_of_device_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /* must call put_device() when done with returned spi_device device */
>  struct spi_device *of_find_spi_device_by_node(struct device_node *node)
>  {
> -	struct device *dev = bus_find_device(&spi_bus_type, NULL, node,
> -						__spi_of_device_match);
> +	struct device *dev = bus_find_device_by_of_node(&spi_bus_type, node);
> +
>  	return dev ? to_spi_device(dev) : NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_find_spi_device_by_node);
>  #endif /* IS_ENABLED(CONFIG_OF) */
>  
>  #if IS_ENABLED(CONFIG_OF_DYNAMIC)
> -static int __spi_of_controller_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  /* the spi controllers are not using spi_bus, so we find it with another way */
>  static struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
>  {
>  	struct device *dev;
>  
> -	dev = class_find_device(&spi_master_class, NULL, node,
> -				__spi_of_controller_match);
> +	dev = class_find_device_by_of_node(&spi_master_class, node);
>  	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
> -		dev = class_find_device(&spi_slave_class, NULL, node,
> -					__spi_of_controller_match);
> +		dev = class_find_device_by_of_node(&spi_slave_class, node);
>  	if (!dev)
>  		return NULL;
>  
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 3ba376b8b456..29d8d7ad41e6 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -186,6 +186,18 @@ static inline struct device *bus_find_device_by_name(struct bus_type *bus,
>  	return bus_find_device(bus, start, name, device_match_name);
>  }
>  
> +/**
> + * bus_find_device_by_of_node : device iterator for locating a particular device
> + * matching the of_node.
> + * @bus: bus type
> + * @np: of_node of the device to match.
> + */
> +static inline struct device *
> +bus_find_device_by_of_node(struct bus_type *bus, const struct device_node *np)
> +{
> +	return bus_find_device(bus, NULL, np, device_match_of_node);
> +}
> +
>  struct device *subsys_find_device_by_id(struct bus_type *bus, unsigned int id,
>  					struct device *hint);
>  int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
> @@ -366,6 +378,19 @@ static inline struct device *driver_find_device_by_name(struct device_driver *dr
>  	return driver_find_device(drv, NULL, name, device_match_name);
>  }
>  
> +/**
> + * driver_find_device_by_of_node- device iterator for locating a particular device
> + * by of_node pointer.
> + * @driver: the driver we're iterating
> + * @np: of_node pointer to match.
> + */
> +static inline struct device *
> +driver_find_device_by_of_node(struct device_driver *drv,
> +			      const struct device_node *np)
> +{
> +	return driver_find_device(drv, NULL, np, device_match_of_node);
> +}
> +
>  void driver_deferred_probe_add(struct device *dev);
>  int driver_deferred_probe_check_state(struct device *dev);
>  int driver_deferred_probe_check_state_continue(struct device *dev);
> @@ -507,6 +532,18 @@ static inline struct device *class_find_device_by_name(struct class *class,
>  	return class_find_device(class, NULL, name, device_match_name);
>  }
>  
> +/**
> + * class_find_device_by_of_node : device iterator for locating a particular device
> + * matching the of_node.
> + * @class: class type
> + * @np: of_node of the device to match.
> + */
> +static inline struct device *
> +class_find_device_by_of_node(struct class *class, const struct device_node *np)
> +{
> +	return class_find_device(class, NULL, np, device_match_of_node);
> +}
> +
>  struct class_attribute {
>  	struct attribute attr;
>  	ssize_t (*show)(struct class *class, struct class_attribute *attr,
> diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> index c16b0ffe8cfc..d951100bf770 100644
> --- a/sound/soc/rockchip/rk3399_gru_sound.c
> +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> @@ -422,11 +422,6 @@ static const struct dailink_match_data dailink_match[] = {
>  	},
>  };
>  
> -static int of_dev_node_match(struct device *dev, const void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int rockchip_sound_codec_node_match(struct device_node *np_codec)
>  {
>  	struct device *dev;
> @@ -438,8 +433,8 @@ static int rockchip_sound_codec_node_match(struct device_node *np_codec)
>  			continue;
>  
>  		if (dailink_match[i].bus_type) {
> -			dev = bus_find_device(dailink_match[i].bus_type, NULL,
> -					      np_codec, of_dev_node_match);
> +			dev = bus_find_device_by_of_node(dailink_match[i].bus_type,
> +							 np_codec);
>  			if (!dev)
>  				continue;
>  			put_device(dev);
> -- 
> 2.21.0
> 

Thanks,
Moritz
