Return-Path: <linux-i2c+bounces-10825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C47AAC2BF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D618B3B8FC7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAF627A464;
	Tue,  6 May 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTvKmk9K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B4241CB0
	for <linux-i2c@vger.kernel.org>; Tue,  6 May 2025 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531157; cv=none; b=ONjiZbUB21MZTPkBmiKUnFbiwIpDCRACTk+g0qR7zebo7MG+D112X+T1YpOkznSVyzVBSR9JroCLgJbiXub0vhPp69FYvS3BuEWE3b0pebz9oJZqdvUbnmvMDOO5u6qnlqqpBoWZA1xzfxpHYzoaGJNDbJdxcKtm5G0C6YbqKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531157; c=relaxed/simple;
	bh=wgdAEoTSiOxWP+EKRKfL5Lx5Umr33FPeJxeC6izneu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMb5CS44Ot/DPf0XzzEFWR++kYtrkOis3PRsyfzWsUyYppiq+eGtGK+Dwsa/IlI/Cskqxo9wECeIpl2JpxJZb3S5h0kk8f52E1T6kTs7RKiCbYA+koeCUv21EavkQIycCNMMIYZqM3MD9vbd6oT6cQ4+RoMnCL/M0eGANE12bJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTvKmk9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468b3PC026989
	for <linux-i2c@vger.kernel.org>; Tue, 6 May 2025 11:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fwl7sL+33/f+eH9L4tdGLHOE
	I3/YzHIvUjaSA4mATTQ=; b=KTvKmk9K+OE0l3LiE+I2xJI5LLXAXDQORpHxQXel
	CDhBIsjrUo7truGbI7eoVJ9L5pKyt/BsNcA5ye6UKiUe5vfdT0ybVmrjQE/9rYrg
	7+PMrAJ5Ar/zsZGyNAmkkDiU9eJnuuPleQ+PTMcRvI+F8VWBkDLdkGp879GxVJzg
	Bf0/ChKVzesdbW+zHFjKL8Kx2cT3JVfCRpre2aGhDNN1U0BZZYBBCIlJcBBChpx3
	D4MQ5dN6D5UJViMSwg2PMa44dBNc9UoDQRyJydVJ8ouLc4IuO5QvkiJzWIC7z3Tl
	c1cWLYeW019GLMkF7fugxOLzFAy/bnn9ROWNO9Xb9L6lyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv23dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 May 2025 11:32:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so947421085a.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 May 2025 04:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531152; x=1747135952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwl7sL+33/f+eH9L4tdGLHOEI3/YzHIvUjaSA4mATTQ=;
        b=rl7IAmPofoYBvd/20WirqQvI5rEVaw2/I0hCDoNGTIITSifZ2R087X12K8r5wSQwSF
         8MPNoA/52RTN0Yo0n5zYmeO3BI2cBarMm36IkT/Q8D8NcJq6mY5AjrGNZJNGc/M9A3RG
         V2IuBGKq/+nurj9EeILjC319GHHZ5wpdJRzItGD6V65jK5/WCFf9xuC0Q2Iao16M7l8k
         G52rtRKemPLIoAzIi/Nhsvsga4fYAz6IH0wjusW17W91cnRr8MUpsoPlzDqL9LgPLsMf
         hRbVFGC4N3IT1dxqT/YAF6WU/5OSFLx65lY+MOUB9lGMAjAuH+DY9fNNf/SjnpWfpQFC
         cesQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoXPyJM8Fjx/hQPRUj46Zdopei2uDQjobSQiCtWAORXcZWtpj2jDxA29sFGiHzWofDd8HJUbuZjhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI6+GQeFsqBzbjRX0DAASdDmim/UURKlPPWMcadtRkFBeKigFk
	os5G75uRcGWYLAf8R+kP8IS3vOlrI9VhzxWxa0+pnB0U5crk8JC98IZdtdKtloSWDBe0xjAFu8D
	SIwXOqvQOKBshgS64K16txKMc7h2EyKhim4HGGz8YwKQxokve2I0vZWvdxlg=
X-Gm-Gg: ASbGnctVl6ld7cVE1L0zEuys1IEKeVnIWSEwcbJha/oS/+P2ic5CacyFRzryxdSAum0
	DtbOB9Lcz3JEPnl3zPKjG99vnuaw0G0znQnq4JhUS2GNTW3KQNmYiN4yFREDdsEdba/pnzVdZHD
	dzKTM5CmTBiSkL9T1CO4oaVM/8L3TYMM3Skdw/xbTzqn7d5tNXrSJYCj5EWTvh2ttNqgh0b5ci4
	3pOaD5nnfy8vwGcKm//KeoQY2IYSfzzcq9ySc2r41/4WY18/pOmU15cE3rH2iySDs+TN46ihbkd
	pJ3/foB0y9t547npJtdMxfpZCioqxHHx0+xWTNHO1VYhwhfirVFGZrNelOkXq+bfm1ei1tM8Eto
	=
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id af79cd13be357-7cae3b0ca45mr1565852485a.50.1746531152620;
        Tue, 06 May 2025 04:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh5sYkZSzYvTbugryEFcZleW6v/iZDEThUuz+Ah7LtSsuWl3cmvTZ0zKAiaQcydSJfq0ywvQ==
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id af79cd13be357-7cae3b0ca45mr1565849285a.50.1746531152291;
        Tue, 06 May 2025 04:32:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c0897sm2039490e87.83.2025.05.06.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:32:31 -0700 (PDT)
Date: Tue, 6 May 2025 14:32:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506111844.1726-2-quic_jseerapu@quicinc.com>
X-Proofpoint-GUID: FGSwYBHY4r6LG-6EMggqpDTfzfnopv2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMCBTYWx0ZWRfX+S2IOzCuE/N1
 CNG4SfhHtl/dtWigMSsrPrhTW7Lj13ZG3+MSuvejuk2zw6xuXGt15+4tfs8tMLBwtkHZocZvY2i
 RNdiJdF3mf+r7PcSaHz2pymNV35QRR1uQhlNS9T9f1Czztf3v6KmUHHYhE2j18VZnWubt6Uybpt
 oDHlkT6M131kv7Pfz5pZYwJ7vtGHcTXVwo2AjWA/MGgLkqVkyfDcDYl/0dWqwjQtaeVAeQA0QE5
 u8YuyhBAan3tvh21tlH1I/9OPvzHwEq65X2PnGe5OTyobGW9mLQiEAHv68gbp0lzoJy8/2N3fwL
 QakP1/SbNgoR/Lv7f81dKynPjLKbQzGUAYcs+kwvfcB4ndYu0fXsgllcYglRFwEO8GNHEokHrFE
 EkhrSjer6F77p+/YeA3JX0jEiAWJ1Ts+v+oHYG3yaVIXxyz4wBaDwg/Pk1sRk2hlHgpyw9eD
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=6819f351 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QOsQMPsNCkuRs1RMv08A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FGSwYBHY4r6LG-6EMggqpDTfzfnopv2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060110

On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> v5 ->v6:
>   - For updating the block event interrupt bit, instead of relying on
>     bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
>  
> v4 -> v5:
>   - BEI flag naming changed from flags to bei_flag.
>   - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
>     file, and Block event interrupt support is checked with bei_flag.
> 
> v3 -> v4:
>   - API's added for Block event interrupt with multi descriptor support for
>     I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>   - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>     I2C driver.
> 
> v2-> v3:
>    - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>    - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>    - Added documentation for newly added changes in "qcom-gpi-dma.h" file
>    - Updated commit description.
> 
> v1 -> v2:
>    - Changed dma_addr type from array of pointers to array.
>    - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>      updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
> 
>  drivers/dma/qcom/gpi.c           | 3 +++
>  include/linux/dma/qcom-gpi-dma.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index b1f0001cc99c..7e511f54166a 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..ebac0d3edff2 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -65,6 +65,7 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @dma_flags: Flags indicating DMA capabilities
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	unsigned int dma_flags;

Why do you need extra field instead of using
dma_async_tx_descriptor.flags?

>  };
>  
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

