Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA0361DB4E
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 16:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiKEPBx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 11:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKEPBw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 11:01:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DC310571;
        Sat,  5 Nov 2022 08:01:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBB2C60B55;
        Sat,  5 Nov 2022 15:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B64EC433D6;
        Sat,  5 Nov 2022 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667660510;
        bh=TBIj1mpwPyTGiXuI59G7PkFJo6KYSisNE21WUW4k6SM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GMqTorvHY8jV64G0TO+pDsym29r59kOL0wNee1FD9Ia3N0hJu85JsV3Lq4qK9rf3l
         2AQ33U/nb+Exfdc5Jcoe/zaNk193oQ4Zgl//U59DGxWdQqopYPT+JwQ9w8EXBAotN+
         tmMm9rwr6ho/ovP1Y+UcBmzUXaCd1MZacMadl3BtKAyci7DPz5TjxlnGa7sPr9UaXQ
         y+7/LEyt84MeJiFLS69L4X6/ya/YP1vUNj2bKzt1ZEPPOHep2Gf0Djd0GM1aHFJ5e2
         0olFd60MX5cZuUtFnnfOpz5NXdJi9HBpUP0JpZHsflWvmYfh65NcyiJxFa3HBXt+hw
         tt2HlZ5eoe8Iw==
Date:   Sat, 5 Nov 2022 20:31:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/11] phy: tegra: xusb: Add Tegra234 support
Message-ID: <Y2Z62Ua1DDWx9YwS@matsya>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-10-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-10-waynec@nvidia.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-10-22, 15:41, Wayne Chang wrote:
> From: Sing-Han Chen <singhanc@nvidia.com>
> 
> Add support for the XUSB pad controller found on Tegra234 SoCs. It is
> mostly similar to the same IP found on Tegra194, because most of
> the Tegra234 XUSB PADCTL registers definition and programming sequence
> are the same as Tegra194, Tegra234 XUSB PADCTL can share the same
> driver with Tegra186 and Tegra194 XUSB PADCTL.
> 
> Introduce a new feature, USB2 HW tracking, for Tegra234.
> The feature is to enable HW periodical PAD tracking which measure
> and capture the electric parameters of USB2.0 PAD.

why cant this patch be sent separately, are phy patches dependent on
rest..? If not consider splitting per subsystem and sending
independently..

> 
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Co-developed-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  drivers/phy/tegra/Makefile        |  1 +
>  drivers/phy/tegra/xusb-tegra186.c | 65 +++++++++++++++++++++++++++++--
>  drivers/phy/tegra/xusb.c          |  6 +++
>  drivers/phy/tegra/xusb.h          | 23 +++++++++++
>  4 files changed, 92 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index 89b84067cb4c..eeeea72de117 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -7,4 +7,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
>  obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index f121b4ffbbfd..cc02cea65a21 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -89,6 +89,11 @@
>  #define  USB2_TRK_START_TIMER(x)		(((x) & 0x7f) << 12)
>  #define  USB2_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 19)
>  #define  USB2_PD_TRK				BIT(26)
> +#define  USB2_TRK_COMPLETED			BIT(31)
> +
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL2		0x28c
> +#define  USB2_TRK_HW_MODE			BIT(0)
> +#define  CYA_TRK_CODE_UPDATE_ON_IDLE		BIT(31)
>  
>  #define XUSB_PADCTL_HSIC_PADX_CTL0(x)		(0x300 + (x) * 0x20)
>  #define  HSIC_PD_TX_DATA0			BIT(1)
> @@ -609,9 +614,32 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
>  	value &= ~USB2_PD_TRK;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>  
> -	udelay(100);
> +	if (padctl->soc->poll_trk_completed) {
> +		err = padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
> +					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
> +		if (err) {
> +			/* The failure with polling on trk complete will not
> +			 * cause the failure of powering on the bias pad.
> +			 */
> +			dev_warn(dev, "failed to poll USB2 trk completed: %d\n",
> +				err);

Single line.. should this be dev_err

> +		}
>  
> -	clk_disable_unprepare(priv->usb2_trk_clk);
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +		value |= USB2_TRK_COMPLETED;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +	} else {
> +		udelay(100);
> +	}
> +
> +	if (padctl->soc->trk_hw_mode) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		value |= USB2_TRK_HW_MODE;
> +		value &= ~CYA_TRK_CODE_UPDATE_ON_IDLE;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +	} else {
> +		clk_disable_unprepare(priv->usb2_trk_clk);
> +	}
>  
>  	mutex_unlock(&padctl->lock);
>  }
> @@ -637,6 +665,13 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
>  	value |= USB2_PD_TRK;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>  
> +	if (padctl->soc->trk_hw_mode) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		value &= ~USB2_TRK_HW_MODE;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		clk_disable_unprepare(priv->usb2_trk_clk);
> +	}
> +
>  	mutex_unlock(&padctl->lock);
>  }
>  
> @@ -1560,7 +1595,8 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
>  EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
>  #endif
>  
> -#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
>  static const char * const tegra194_xusb_padctl_supply_names[] = {
>  	"avdd-usb",
>  	"vclamp-usb",
> @@ -1616,8 +1652,31 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
>  	.supply_names = tegra194_xusb_padctl_supply_names,
>  	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
>  	.supports_gen2 = true,
> +	.poll_trk_completed = true,
>  };
>  EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
> +
> +const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
> +	.num_pads = ARRAY_SIZE(tegra194_pads),
> +	.pads = tegra194_pads,
> +	.ports = {
> +		.usb2 = {
> +			.ops = &tegra186_usb2_port_ops,
> +			.count = 4,
> +		},
> +		.usb3 = {
> +			.ops = &tegra186_usb3_port_ops,
> +			.count = 4,
> +		},
> +	},
> +	.ops = &tegra186_xusb_padctl_ops,
> +	.supply_names = tegra194_xusb_padctl_supply_names,
> +	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
> +	.supports_gen2 = true,
> +	.poll_trk_completed = true,
> +	.trk_hw_mode = true,
> +};
> +EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
>  #endif
>  
>  MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 95091876c422..23d179b1a5b5 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -71,6 +71,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
>  		.compatible = "nvidia,tegra194-xusb-padctl",
>  		.data = &tegra194_xusb_padctl_soc,
>  	},
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +	{
> +		.compatible = "nvidia,tegra234-xusb-padctl",
> +		.data = &tegra234_xusb_padctl_soc,
> +	},
>  #endif
>  	{ }
>  };
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 8cfbbdbd6e0c..ec0b5b023ad1 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -8,6 +8,7 @@
>  #define __PHY_TEGRA_XUSB_H
>  
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/mutex.h>
>  #include <linux/workqueue.h>
>  
> @@ -433,6 +434,8 @@ struct tegra_xusb_padctl_soc {
>  	unsigned int num_supplies;
>  	bool supports_gen2;
>  	bool need_fake_usb3_port;
> +	bool poll_trk_completed;
> +	bool trk_hw_mode;
>  };
>  
>  struct tegra_xusb_padctl {
> @@ -475,6 +478,23 @@ static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
>  	return value;
>  }
>  
> +static inline u32 padctl_readl_poll(struct tegra_xusb_padctl *padctl,
> +	unsigned long offset, u32 val, u32 mask, int us)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = readl_poll_timeout_atomic(padctl->regs + offset, regval,
> +					 (regval & mask) == val, 1, us);
> +	dev_dbg(padctl->dev, "%08lx poll > %08x\n", offset, regval);
> +	if (err) {
> +		dev_err(padctl->dev, "%08lx poll timeout > %08x\n", offset,
> +			regval);
> +	}
> +
> +	return err;
> +}
> +
>  struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *padctl,
>  					     const char *name,
>  					     unsigned int index);
> @@ -491,5 +511,8 @@ extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
>  #if defined(CONFIG_ARCH_TEGRA_194_SOC)
>  extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
> +#endif
>  
>  #endif /* __PHY_TEGRA_XUSB_H */
> -- 
> 2.25.1

-- 
~Vinod
