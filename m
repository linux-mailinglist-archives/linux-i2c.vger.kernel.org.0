Return-Path: <linux-i2c+bounces-11605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC60AE9BBC
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 12:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44C407BC15E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 10:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008B20E031;
	Thu, 26 Jun 2025 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CXa2JDHB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4481FF7C8;
	Thu, 26 Jun 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934158; cv=none; b=Xv9XlZUjUVywIPqHlyLJAwFeZKMS/dbuzGNmi1FL6VxngFo3yrzuv3h2Sa6+oCWwduvYZ0lx+Znftd7kX5p3iWY732gBV4RkF2/bS8aRzpZTWJS6fU0n1DpLHgHbm5zP26kjlc/eKkvqLDfv/YlSmsBTz893dDOkOWTVebi9d7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934158; c=relaxed/simple;
	bh=wctAJxLB4oheSszXnRLwa7JcjgrvlkawrXhZWDSFB98=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYsiyIBu1P1RSBf3+vXb9U0ji0++XVRbN0vnbPQfUpy49FT4RhaH+oyvP+bB/CrsUg/3WN2EE2f4uWKUHtGaqUoLVFWMbBlzxIeCGfTWGOtAJW5RdiFiEnKCeaU8MIU8TETl/22AfCq7fUckNv712JmxJ6y6hG4mYXL+Nr6mx/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CXa2JDHB; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA9QY8025602;
	Thu, 26 Jun 2025 12:35:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NV4+KoQwrrIsbeLEb3se8T07/pyaJ/I/7ykprHiqctM=; b=CXa2JDHB4uTNEMai
	2f9NWHp3xztyJ3Y6ituNRm8BfaNOHQDmcwn1mnLUaoppY3rpexlzw5toG7Yzc9Ci
	JKp9PsrWevNASEoRdbIBLdiOMsFJDxfmn0VOZOelEX57qfqL/YTOVrrSQo7TqpOp
	XFQULhMnRqcIJxyRqxAagjgJLDICpsnsdxnqBKpzhekKrxCHVoqgelkfI7OSfqh4
	U9rIhzGVL75BA+IScVOGJS3qirFCX0VVC2gBnnmLwS0h0j54WJv8vIX3I1OKfBmj
	CHPz1w0S+YKt+JKt67MkWXnKCu3uI7YwBnWLZ/dDXhh5JKuFkXjjgNYRjh+mHfVN
	u8Prkw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbx1rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 12:35:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B0064002D;
	Thu, 26 Jun 2025 12:33:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8967DB63201;
	Thu, 26 Jun 2025 12:33:03 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 12:33:02 +0200
Date: Thu, 26 Jun 2025 12:32:57 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>,
        M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
Message-ID: <20250626103257.GA349896@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-3-42d3d5374e65@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-3-42d3d5374e65@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01

Hi Clément,

thanks for the patch.

On Mon, Jun 16, 2025 at 10:53:56AM +0200, Clément Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index a05cac5ee9db..5be14c8a2af4 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -742,9 +742,12 @@ static void stm32f7_i2c_dma_callback(void *arg)
>  	struct stm32f7_i2c_dev *i2c_dev = (struct stm32f7_i2c_dev *)arg;
>  	struct stm32_i2c_dma *dma = i2c_dev->dma;
>  	struct device *dev = dma->chan_using->device->dev;
> +	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
>  
>  	stm32f7_i2c_disable_dma_req(i2c_dev);
>  	dma_unmap_single(dev, dma->dma_buf, dma->dma_len, dma->dma_data_dir);
> +	if (!f7_msg->smbus)
> +		i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, true);
>  	complete(&dma->dma_complete);
>  }
>  
> @@ -880,6 +883,7 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  {
>  	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
>  	void __iomem *base = i2c_dev->base;
> +	u8 *dma_buf;
>  	u32 cr1, cr2;
>  	int ret;
>  
> @@ -929,17 +933,23 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  
>  	/* Configure DMA or enable RX/TX interrupt */
>  	i2c_dev->use_dma = false;
> -	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN
> -	    && !i2c_dev->atomic) {
> -		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> -					      msg->flags & I2C_M_RD,
> -					      f7_msg->count, f7_msg->buf,
> -					      stm32f7_i2c_dma_callback,
> -					      i2c_dev);
> -		if (!ret)
> -			i2c_dev->use_dma = true;
> -		else
> -			dev_warn(i2c_dev->dev, "can't use DMA\n");
> +	if (i2c_dev->dma && !i2c_dev->atomic) {
> +		dma_buf = i2c_get_dma_safe_msg_buf(msg, STM32F7_I2C_DMA_LEN_MIN);
> +		if (dma_buf) {
> +			f7_msg->buf = dma_buf;
> +			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> +						      msg->flags & I2C_M_RD,
> +						      f7_msg->count, f7_msg->buf,
> +						      stm32f7_i2c_dma_callback,
> +						      i2c_dev);
> +			if (ret) {
> +				dev_warn(i2c_dev->dev, "can't use DMA\n");
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, msg, false);
> +				f7_msg->buf = msg->buf;
> +			} else {
> +				i2c_dev->use_dma = true;
> +			}
> +		}
>  	}
>  
>  	if (!i2c_dev->use_dma) {
> @@ -1624,6 +1634,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  			dmaengine_terminate_async(dma->chan_using);
>  			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  					 dma->dma_data_dir);
> +			if (!f7_msg->smbus)
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1646,6 +1658,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dmaengine_terminate_async(dma->chan_using);
>  				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  						 dma->dma_data_dir);
> +				if (!f7_msg->smbus)
> +					i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 

Looks good to me.

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.43.0
> 

