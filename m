Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A9861DB45
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 15:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiKEO6n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKEO6l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 10:58:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CD01055A;
        Sat,  5 Nov 2022 07:58:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2DEA60B4A;
        Sat,  5 Nov 2022 14:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5442AC433D6;
        Sat,  5 Nov 2022 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667660320;
        bh=BKBJM4WxLxtpoTSh2/CeSWgsWM5iS+n0pm4kX6li5xs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=elUfWsElUulpUKUL2DFAnh8XIQtmpACPFi98LDNDtUS3qvfk3HP3gNOhENCVb25ji
         DecJyr5DRYej95eI6qS7FvlkN+bXXEFJmcXO8PTcPpCo0kjuPfKaTqdYkVoKJGjBd+
         b3xHnt3iAUrxp/rnyJWyqNVl+jbLXyldbUdXdNBX1wNMwlJpIY9/D49ou7UhLa7P0V
         HMhjj76kESl8sni5uY4h/yI+TrpWDh1Dp4B1gb0ijvK3oSVIESIdVzRpuMrV0jhUNx
         QVmaY5LGwCZ06HZUoUXhP4sM35kTxDdhCHzLtFq/sbwONaf3rBa4GgtVHCzlIJEMsm
         nQref6lhf06/Q==
Date:   Sat, 5 Nov 2022 20:28:35 +0530
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
Subject: Re: [PATCH 08/11] phy: tegra: xusb: Disable trk clk when not using
Message-ID: <Y2Z6Gzd3RmmxMaXO@matsya>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-9-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-9-waynec@nvidia.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-10-22, 15:41, Wayne Chang wrote:

Consider revision of title to: "Disable trk clk when not in use"

> The change fixes an issue that the pad tracking is a one-time calibration
> for Tegra186 and Tegra194. We should disable the clk when it is done.
> The 100us delay is for HW recording the calibration value.

Consider:

"pad tracking is a one-time calibration for Tegra186 and Tegra194. clk
should be disabled after calibration.

Disable clk after claibration.

While at it add 100us delay  HW recording the calibration

> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index 0996ede63387..f121b4ffbbfd 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -609,6 +609,10 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
>  	value &= ~USB2_PD_TRK;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>  
> +	udelay(100);
> +
> +	clk_disable_unprepare(priv->usb2_trk_clk);
> +
>  	mutex_unlock(&padctl->lock);
>  }
>  
> @@ -633,8 +637,6 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
>  	value |= USB2_PD_TRK;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>  
> -	clk_disable_unprepare(priv->usb2_trk_clk);
> -
>  	mutex_unlock(&padctl->lock);
>  }
>  
> -- 
> 2.25.1

-- 
~Vinod
