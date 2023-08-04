Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F448770B39
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 23:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjHDVtH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 17:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjHDVtG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 17:49:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3EDF0;
        Fri,  4 Aug 2023 14:49:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BAE76211F;
        Fri,  4 Aug 2023 21:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEE7C433C7;
        Fri,  4 Aug 2023 21:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691185744;
        bh=7Ye/SbHrxDpA9uXHZVGsTiOMsdA14G4Teu/aMlZnOzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iAwaw6w9DwZ1xTqbKjMgLB7ojedKD4fZWvAhQtfjZ9V/quSiVWe55anQ+jngEUGpd
         xZBBkiO1dJiwRcd3Mq/oMEe8KDf1TnM7iFzOHMid18HJF56HnIiAdA7toxtWeQbrIk
         CFeQoG8yxqO8UrltOKAkD+ROR68oub1T/RHiUjLfoGMDFCJrZkyaV+trk3mguQx55c
         CZp79rdpIaSIpAPMF6UAf989jhPx18xnSwOytkWjVgD68d+OC6JXaE9JzZBwqPAC8N
         7hjUrJHPfxJtf8k6poeikRu+Sarwh8wII3QuEiT7vBtUP3hCf4IipJ7u1eA5yJbrTz
         5atMzxQLQkhIQ==
Date:   Fri, 4 Aug 2023 23:49:02 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Parker Newman <pnewman@connecttech.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Message-ID: <20230804214902.entkn6xkklz5lh3h@intel.intel>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laxman and/or Dmitry,

On Thu, Aug 03, 2023 at 05:10:02PM +0000, Parker Newman wrote:
> 
> This patch fixes the Tegra DMA config option processing in the
> i2c-tegra driver.
> 
> Tegra processors prior to Tegra186 used APB DMA for I2C requiring
> CONFIG_TEGRA20_APB_DMA=y while Tegra186 and later use GPC DMA requiring
> CONFIG_TEGRA186_GPC_DMA=y.
> 
> The check for if the processor uses APB DMA is inverted and so the wrong
> DMA config options are checked.
> 
> This means if CONFIG_TEGRA20_APB_DMA=y but CONFIG_TEGRA186_GPC_DMA=n
> with a Tegra186 or later processor the driver will incorrectly think DMA is
> enabled and attempt to request DMA channels that will never be availible,
> leaving the driver in a perpetual EPROBE_DEFER state.
> 
> Signed-off-by: Parker Newman <pnewman@connecttech.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bcbbf23aa530..dc6ed3a8d69e 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -442,7 +442,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>     if (IS_VI(i2c_dev))
>         return 0;
> 
> -   if (!i2c_dev->hw->has_apb_dma) {
> +   if (i2c_dev->hw->has_apb_dma) {
>         if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>             dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
>             return 0;

Can I have your opinion here, please?

Andi
