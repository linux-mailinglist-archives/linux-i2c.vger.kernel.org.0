Return-Path: <linux-i2c+bounces-2705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E606894C02
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 09:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17931F22E6B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 07:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078C032C60;
	Tue,  2 Apr 2024 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POEDJmkO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7B22096;
	Tue,  2 Apr 2024 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712041224; cv=none; b=iOKLLJKCuAsw3sGMdzi0/pFeCrNCf8Lb9rLT67eOQHWgtSkvkLgezNDHF6Wn49a7FNf2SToiHxWcyIG1VuH3WR4idKPKOcRwrXxVqc13xCVaHFFPqV7zh+VsXXZupzlHEpnkHGaYO64L9xwfZD2MAuFxWvmF2I5RnT4yoI9L9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712041224; c=relaxed/simple;
	bh=kDejbx6odL5madmspNyzhJLcpmp1s+o2lpMSBn0dQyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfRujcfYKVxxIr+Ju3rQJeQIpDgFW8VSBi1LbSx5gsaxYEOowf8RAvtR9JhPHji1o9r0GWNJTd2OjSeu7NVz79lJiVLqZNUmEiQzj9TGxtM+8eL2DvKGOg34ovSBW5ve8vsTS2bu6vLxRybaMrOvJ2L4ZPgW3j+paW/B2Hmh4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POEDJmkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690B6C433F1;
	Tue,  2 Apr 2024 07:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712041224;
	bh=kDejbx6odL5madmspNyzhJLcpmp1s+o2lpMSBn0dQyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POEDJmkOkmXDHMdVu6qI+clLjAHGjZoXlEjcGa3WFU+a7YEL1IJBH9c/LIReWT2Te
	 Inayl8xriub2ytTmDFwXHZP0ONze6Y30eOc3yLPQNsZoIKmvBwHZ6eeUNLob5ThtiV
	 cbUu/8Omkx03yHP8pLHYcM8mSzlJUGFA7OFWkvMaaWoIEaosQJOh4xMjHSxICBitTl
	 uLvQN5AdF99WiDInLlH33icMuQar7ZgCclcCgLnnedCbSmX6hheIFRuKE6aDAYpp0R
	 XmJV7NIUJ+lvqzudHVj/BLe2z0NZz+Z4rbUeBIyXZudLY7fOGPZQ8hIRAbo9nJtIgp
	 KeB0aaUbXJ00Q==
Date: Tue, 2 Apr 2024 12:30:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org,
	quic_vdadhani@quicinc.com
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
Message-ID: <Zgus_bFm7Ls7ApTx@matsya>
References: <20240402062131.9836-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402062131.9836-1-quic_msavaliy@quicinc.com>

On 02-04-24, 11:51, Mukesh Kumar Savaliya wrote:
> Add feature to share an I2C serial engine between two subsystems(SS) so
> that individual clients from different subsystems can access the same bus.
> For example single i2c slave device can be accessed by Client driver from
> APPS OR modem subsystem image. Same way we can have slave being accessed
> between APPS and TZ subsystems.
> 
> This is possible in GSI mode where driver queues the TREs with required
> descriptors and ensures to execute TREs in an mutually exclusive way.
> Issue a "Lock TRE" command at the start of the transfer and an "Unlock TRE"
> command at the end of the transfer. This prevents other subsystems from
> concurrently performing DMA transfers and avoids disturbance to data path.
> Change MAX_TRE macro to 5 from 3 because of these two additional TREs.
> 
> Since the GPIOs are also shared for the i2c bus, do not touch GPIO
> configuration while going to runtime suspend and only turn off the
> clocks. This will allow other SS to continue to transfer the data.
> 
> This feature needs to be controlled by DTSI flag to make it flexible
> based on the usecase, hence during probe check the same from i2c driver.
> 
> Export function geni_se_clks_off() to call explicitly instead of
> geni_se_resources_off() to not modify TLMM configuration as other SS might
> perform the transfer while APPS SS can go to sleep.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> v1 -> v2:
> - Addressed review comments.
> - Removed unwanted comments from the gpi_create_i2c_tre().
> - Enhanced logic by removing ternary assignment in i2c-qcom-geni.c.
> - Confirmed dt-bindings change is required too in separate patch.
> - Formed LOCK_TRE and UNLOCK_TRE by using BIT fields similar to other TREs.
> ---
>  drivers/dma/qcom/gpi.c             | 37 +++++++++++++++++++++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++-----
>  drivers/soc/qcom/qcom-geni-se.c    |  4 +++-
>  include/linux/dma/qcom-gpi-dma.h   |  6 +++++
>  include/linux/soc/qcom/geni-se.h   |  3 +++
>  5 files changed, 66 insertions(+), 8 deletions(-)

why are all changes mashed into one commit, pls use separate one for
dmaengine patches!

> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 1c93864e0e4d..0997210df6b1 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2020, Linaro Limited
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -65,6 +66,14 @@
>  /* DMA TRE */
>  #define TRE_DMA_LEN		GENMASK(23, 0)
>  
> +/* Lock TRE */
> +#define TRE_I2C_LOCK		BIT(0)
> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)
> +
> +/* Unlock TRE */
> +#define TRE_I2C_UNLOCK		BIT(8)
> +
>  /* Register offsets from gpi-top */
>  #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>  #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
> @@ -522,7 +531,7 @@ struct gpii {
>  	bool ieob_set;
>  };
>  
> -#define MAX_TRE 3
> +#define MAX_TRE 5
>  
>  struct gpi_desc {
>  	struct virt_dma_desc vd;
> @@ -1644,6 +1653,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  	struct gpi_tre *tre;
>  	unsigned int i;
>  
> +	/* create lock tre for first tranfser */
> +	if (i2c->shared_se && i2c->first_msg) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
> +		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);

This is not optimal, you are always going to do this. Pls define
LOCK_TRE as lock and minor/major bits and then assign it here

> +	}
> +
>  	/* first create config tre if applicable */
>  	if (i2c->set_config) {
>  		tre = &desc->tre[tre_idx];
> @@ -1702,6 +1724,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>  	}
>  
> +	/* Unlock tre for last transfer */
> +	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
> +		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);

Here as well

> +	}
> +
>  	for (i = 0; i < tre_idx; i++)
>  		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>  			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..fbfcd375c06f 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>  	struct dma_chan *rx_c;
>  	bool gpi_mode;
>  	bool abort_done;
> +	bool is_shared;
>  };
>  
>  struct geni_i2c_desc {
> @@ -601,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	peripheral.clk_div = itr->clk_div;
>  	peripheral.set_config = 1;
>  	peripheral.multi_msg = false;
> +	peripheral.shared_se = gi2c->is_shared;
>  
>  	for (i = 0; i < num; i++) {
>  		gi2c->cur = &msgs[i];
> @@ -611,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  		if (i < num - 1)
>  			peripheral.stretch = 1;
>  
> +		peripheral.first_msg = (i == 0);
> +		peripheral.last_msg = (i == num - 1);
>  		peripheral.addr = msgs[i].addr;
>  
>  		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> @@ -802,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		gi2c->clk_freq_out = KHZ(100);
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {

what is the actual use case of this, when would this be shared...?

> +		gi2c->is_shared = true;
> +		dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");
> +	}
> +
>  	if (has_acpi_companion(dev))
>  		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>  
> @@ -964,14 +974,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> -	if (ret) {
> -		enable_irq(gi2c->irq);
> -		return ret;
> -
> +	if (gi2c->is_shared) {
> +		geni_se_clks_off(&gi2c->se);
>  	} else {
> -		gi2c->suspended = 1;
> +		ret = geni_se_resources_off(&gi2c->se);
> +		if (ret) {
> +			enable_irq(gi2c->irq);
> +			return ret;
> +		}
>  	}
> +	gi2c->suspended = 1;
>  
>  	clk_disable_unprepare(gi2c->core_clk);
>  
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 2e8f24d5da80..20166c8fc919 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>  
>  /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>  #define __DISABLE_TRACE_MMIO__
> @@ -482,13 +483,14 @@ void geni_se_config_packing(struct geni_se *se, int bpw, int pack_words,
>  }
>  EXPORT_SYMBOL_GPL(geni_se_config_packing);
>  
> -static void geni_se_clks_off(struct geni_se *se)
> +void geni_se_clks_off(struct geni_se *se)
>  {
>  	struct geni_wrapper *wrapper = se->wrapper;
>  
>  	clk_disable_unprepare(se->clk);
>  	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>  }
> +EXPORT_SYMBOL_GPL(geni_se_clks_off);
>  
>  /**
>   * geni_se_resources_off() - Turn off resources associated with the serial
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..8589c711afae 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -65,6 +65,9 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @shared_se: bus is shared between subsystems
> + * @bool first_msg: use it for tracking multimessage xfer
> + * @bool last_msg: use it for tracking multimessage xfer
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	bool shared_se;
> +	bool first_msg;
> +	bool last_msg;
>  };
>  
>  #endif /* QCOM_GPI_DMA_H */
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index 0f038a1a0330..caf2c0c4505b 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _LINUX_QCOM_GENI_SE
> @@ -494,6 +495,8 @@ int geni_se_resources_off(struct geni_se *se);
>  
>  int geni_se_resources_on(struct geni_se *se);
>  
> +void geni_se_clks_off(struct geni_se *se);
> +
>  int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl);
>  
>  int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
> -- 
> 2.25.1

-- 
~Vinod

