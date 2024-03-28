Return-Path: <linux-i2c+bounces-2640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA688F894
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 08:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B571229648E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 07:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973F44F5F2;
	Thu, 28 Mar 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJNXs/uR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4DF620;
	Thu, 28 Mar 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711610679; cv=none; b=aiiSzX1JGmY8akLfdT3U8UrXTY+eJ0OrLlsmkXt7w8nQI5pP8vki4LFo32TqbwCZTLAOXV33Scn/L3JShcKDwRJ9Fu0kx7err9eIn6V/Knob5r+q2ncQfEaiiAAFbo8AOtTlAgIg8ojKgwU98VSEQlN0unqtF3Q1sIZhWzwCgtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711610679; c=relaxed/simple;
	bh=gnHLTcZyGu47BuGpi6Hr8DRFguNh5pivM7KDJ0PlfTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g04fj0ojsSkgdOWOMEHddlV4CSL3BEuAjSbCnO287St08hSZbq89J9dzRHI+JRyupgSsQ2lZkWObppk14MQ58NIUEb0rNkau5u9wWDhVtakbSTimi25xCUi/CI605Y/5V4OQ0+az6VG9n6no1qqZO+ePX6YjK3NUT3ltpc4eXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJNXs/uR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBABC43390;
	Thu, 28 Mar 2024 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711610678;
	bh=gnHLTcZyGu47BuGpi6Hr8DRFguNh5pivM7KDJ0PlfTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJNXs/uR532qWhk3TEdVirrp508KXJSCjgy9wWIoKvODm5nUQQkKlxClPg1S7mglH
	 vI3ooiUEo+CFGOFN25M5d1dYxjEp8rPko7297zN6eMsjkpbXsLP33Odnb4n0pW2/uG
	 7x1krs3A8YwWHPTZXAzTENWo3hHC8vyX76tOnIYS69GgG9QABnf/pT/rJbnWgT593Q
	 FOXDl3wBB+qYF+M+RdsCteCYFlBunb98Cg60lJWRIDNErX9OfzQCw2/HcS41QsJiB+
	 MFTwx3mekRQ7luZbn/9+qVqtLedGwNGsxvMgIxqk5SMK2EOvzZePRYmPPXs1WbnDHT
	 lGz7PFMedqVoA==
Date: Thu, 28 Mar 2024 12:54:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	wsa@kernel.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <ZgUbMjTh0izF5Nj3@matsya>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>

On 13-03-24, 10:56, Mukesh Kumar Savaliya wrote:
> I2C driver currently reports "DMA txn failed" error even though it's
> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> on the bus instead of generic transfer failure which doesn't give any
> specific clue.
> 
> Make Changes inside i2c driver callback handler function
> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> stores the error status during error interrupt.
> 
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> v3 -> v4:
> - Included bitfield.h to fix compilation issue for x86 arch.
> - Removed Fixes tag as this is not fixing any crash.
> - Added Reviewed-by tag.
> 
> v2 -> v3:
> - Modifed commit log reflecting an imperative mood.
> 
> v1 -> v2:
> - Commit log changed we->We.
> - Explained the problem that we are not detecing NACK error.
> - Removed Heap based memory allocation and hence memory leakage issue.
> - Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
> - Changed commit log to reflect the code changes done.
> - Removed adding anything into struct gpi_i2c_config and created new structure
>   for error status as suggested by Bjorn.
> ---
>  drivers/dma/qcom/gpi.c             | 12 +++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 20 ++++++++++++++++----
>  include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
>  3 files changed, 37 insertions(+), 5 deletions(-)

Urgh, why do we have i2c and dma changes in single patch? I dont think
they would be dependent

> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 1c93864e0e4d..e3508d51fdc9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>  	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>  
>  	dma_cookie_complete(&vd->tx);
> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	if (gchan->protocol == QCOM_GPI_I2C) {
> +		struct dmaengine_desc_callback cb;
> +		struct gpi_i2c_result *i2c;
> +
> +		dmaengine_desc_get_callback(&vd->tx, &cb);
> +		i2c = cb.callback_param;
> +		i2c->status = compl_event->status;
> +		dmaengine_desc_callback_invoke(&cb, &result);

This is generic, why should this be i2c specific... we should set
generic status value


> +	} else {
> +		dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	}
>  
>  gpi_free_desc:
>  	spin_lock_irqsave(&gchan->vc.lock, flags);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..11dcfcf13d8b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>  
>  #include <linux/acpi.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
> @@ -66,6 +67,7 @@ enum geni_i2c_err_code {
>  	GENI_TIMEOUT,
>  };
>  
> +#define I2C_DMA_TX_IRQ_MASK	GENMASK(12, 5)
>  #define DM_I2C_CB_ERR		((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
>  									<< 5)
>  
> @@ -99,6 +101,7 @@ struct geni_i2c_dev {
>  	struct dma_chan *rx_c;
>  	bool gpi_mode;
>  	bool abort_done;
> +	struct gpi_i2c_result i2c_result;
>  };
>  
>  struct geni_i2c_desc {
> @@ -484,9 +487,18 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  
>  static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  {
> -	struct geni_i2c_dev *gi2c = cb;
> -
> -	if (result->result != DMA_TRANS_NOERROR) {
> +	struct gpi_i2c_result *i2c_res = cb;
> +	struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
> +	u32 status;
> +
> +	status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
> +	if (status == BIT(NACK)) {
> +		geni_i2c_err(gi2c, NACK);
> +	} else if (status == BIT(BUS_PROTO)) {
> +		geni_i2c_err(gi2c, BUS_PROTO);
> +	} else if (status == BIT(ARB_LOST)) {
> +		geni_i2c_err(gi2c, ARB_LOST);
> +	} else if (result->result != DMA_TRANS_NOERROR) {
>  		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>  		gi2c->err = -EIO;
>  	} else if (result->residue) {
> @@ -568,7 +580,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	}
>  
>  	desc->callback_result = i2c_gpi_cb_result;
> -	desc->callback_param = gi2c;
> +	desc->callback_param = &gi2c->i2c_result;
>  
>  	dmaengine_submit(desc);
>  	*buf = dma_buf;
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..f585c6a35e51 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -80,4 +80,14 @@ struct gpi_i2c_config {
>  	bool multi_msg;
>  };
>  
> +/**
> + * struct gpi_i2c_result - i2c transfer status result in GSI mode
> + *
> + * @status: store txfer status value as part of callback
> + *
> + */
> +struct gpi_i2c_result {
> +	u32 status;
> +};
> +
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod

