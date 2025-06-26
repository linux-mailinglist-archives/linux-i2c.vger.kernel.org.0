Return-Path: <linux-i2c+bounces-11602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD4AE98AF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 10:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A55BF1C40831
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 08:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F42295534;
	Thu, 26 Jun 2025 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yAcNns/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93727EFE9;
	Thu, 26 Jun 2025 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927261; cv=none; b=ptwkpzzOrWEdR/85pFJWOBEb5pceUZacWi3/OzzIY+EKXFnkrUm27QWgq14XfHgGpcMNuUYUol8oNe6uFgO1tP9WCP6H0NYdjoc0YQqb7uJxfW9fHfiOQbaPZ93MD5dzeAuA+TPJ0BpHJ00lFyDeGzRKXEe1VNt4Jx3qu57F/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927261; c=relaxed/simple;
	bh=X7liYNZKtZ/SRtsmqGvcVDdn/3KBB20klOip54vWi7o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooL2ovO7ROg587eoC2+ixR5PuWm9rOWmg1oFvoJGdl6m5ri1ifo4+7DEkcxF1Gzr5jXXAL83GuKV9sdC90K7Y+IoA96FgGMhvqPyRyvSb853qHZoXwpmbG3ZuXZtg2w+xxOPmTASQofg5XneS+CCvb0B78E/+7bsqYBivuVrHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=yAcNns/e; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q8PD5s026846;
	Thu, 26 Jun 2025 10:40:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5xLXEiPmIkFsOWq2iScRt7BhDQ5CLO6wEMeeYC9tPQw=; b=yAcNns/eKTBEPfvF
	brtge3KBWhvYe/uSk9spqaox79wdlAKfckfm1jprWhwvaHBI4BvhcuI2HlePQNDJ
	MeoSMRdIO4uGXT1H04TjELdVKe6z6lpj9irdpw6upp7KzjGEC7pE6O9J8KhUty+R
	VDPvYz/mRhaSOpyH4RJFCS3qLhPYvWusBwhhp03g92LtBsFkdLahsO25v9bnduVm
	CDPbcT9Rvmrqj4R4DDu0ic4LkIRYqimc2G+M6gEGCstRZMM3+e0Uc1CQSA32di49
	oADO1A0KfMQa2MMwO+jL1+SEHSY8ZSgI8ExKTt9rOqwj3CklBCDmGVq/xpNp5Y6x
	5ERS9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbwe8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 10:40:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 24FE640047;
	Thu, 26 Jun 2025 10:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EADBB22D16;
	Thu, 26 Jun 2025 10:37:51 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:37:50 +0200
Date: Thu, 26 Jun 2025 10:37:44 +0200
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
Subject: Re: [PATCH 1/3] i2c: stm32: fix the device used for the DMA map
Message-ID: <20250626083744.GA348766@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01

Hi Clément,

On Mon, Jun 16, 2025 at 10:53:54AM +0200, Clément Le Goffic wrote:
> If the DMA mapping failed, it produced an error log with the wrong
> device name:
> "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
> Fix this issue by replacing the dev with the I2C dev.

Indeed, nice catch ! Thanks a lot !

> 
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 157c64e27d0b..5e0b31aed774 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
>  		dev_err(dev, "DMA mapping failed\n");
> 
> -- 
> 2.43.0
>

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

