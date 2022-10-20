Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C876063F5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Oct 2022 17:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJTPOi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 11:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiJTPOg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 11:14:36 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 590C91B9FB;
        Thu, 20 Oct 2022 08:14:27 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B79AD6E;
        Thu, 20 Oct 2022 08:14:33 -0700 (PDT)
Received: from [10.57.5.187] (unknown [10.57.5.187])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C437B3F67D;
        Thu, 20 Oct 2022 08:14:25 -0700 (PDT)
Message-ID: <b258387c-365e-e18d-7b7c-e38105786193@arm.com>
Date:   Thu, 20 Oct 2022 16:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] i2c: tegra: Allocate DMA memory for DMA engine
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20221020143933.1951609-1-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221020143933.1951609-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-10-20 15:39, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> When the I2C controllers are running in DMA mode, it is the DMA engine
> that performs the memory accesses rather than the I2C controller. Pass
> the DMA engine's struct device pointer to the DMA API to make sure the
> correct DMA operations are used.
> 
> This fixes an issue where the DMA engine's SMMU stream ID needs to be
> misleadingly set for the I2C controllers in device tree.
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 954022c04cc4..3869c258a529 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -284,6 +284,7 @@ struct tegra_i2c_dev {
>   	struct dma_chan *tx_dma_chan;
>   	struct dma_chan *rx_dma_chan;
>   	unsigned int dma_buf_size;
> +	struct device *dma_dev;
>   	dma_addr_t dma_phys;
>   	void *dma_buf;
>   
> @@ -420,7 +421,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
>   static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
>   {
>   	if (i2c_dev->dma_buf) {
> -		dma_free_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
> +		dma_free_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
>   				  i2c_dev->dma_buf, i2c_dev->dma_phys);
>   		i2c_dev->dma_buf = NULL;
>   	}
> @@ -472,10 +473,13 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   
>   	i2c_dev->tx_dma_chan = chan;
>   
> +	WARN_ON(i2c_dev->tx_dma_chan->device != i2c_dev->rx_dma_chan->device);
> +	i2c_dev->dma_dev = chan->device->dev;
> +
>   	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
>   				I2C_PACKET_HEADER_SIZE;
>   
> -	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
> +	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
>   				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
>   	if (!dma_buf) {
>   		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");

That much is definitely better, but as mentioned previously all the 
syncs below look completely bogus either way, so should really be 
removed rather than "fixed". If it's necessary to ensure ordering of CPU 
accesses to the buffer relative to the DMA transfer itself, where that 
isn't already implicit in some readl()/writel() involved in starting and 
stopping the DMA channel, then dma_wmb()/dma_rmb() are the tools for 
that job.

Thanks,
Robin.

> @@ -1272,7 +1276,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   
>   	if (i2c_dev->dma_mode) {
>   		if (i2c_dev->msg_read) {
> -			dma_sync_single_for_device(i2c_dev->dev,
> +			dma_sync_single_for_device(i2c_dev->dma_dev,
>   						   i2c_dev->dma_phys,
>   						   xfer_size, DMA_FROM_DEVICE);
>   
> @@ -1280,7 +1284,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   			if (err)
>   				return err;
>   		} else {
> -			dma_sync_single_for_cpu(i2c_dev->dev,
> +			dma_sync_single_for_cpu(i2c_dev->dma_dev,
>   						i2c_dev->dma_phys,
>   						xfer_size, DMA_TO_DEVICE);
>   		}
> @@ -1293,7 +1297,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
>   			       msg->buf, msg->len);
>   
> -			dma_sync_single_for_device(i2c_dev->dev,
> +			dma_sync_single_for_device(i2c_dev->dma_dev,
>   						   i2c_dev->dma_phys,
>   						   xfer_size, DMA_TO_DEVICE);
>   
> @@ -1344,7 +1348,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   		}
>   
>   		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
> -			dma_sync_single_for_cpu(i2c_dev->dev,
> +			dma_sync_single_for_cpu(i2c_dev->dma_dev,
>   						i2c_dev->dma_phys,
>   						xfer_size, DMA_FROM_DEVICE);
>   
