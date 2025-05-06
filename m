Return-Path: <linux-i2c+bounces-10826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB66AAC304
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9F793BA51E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133DE279905;
	Tue,  6 May 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROg1zKja"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2AB665
	for <linux-i2c@vger.kernel.org>; Tue,  6 May 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531986; cv=none; b=Z4pt5+femv7Ju70nq3LyywFjYLbnIlZRGP3H3E+tDD1DRcvSpCRsjGTPT4ZPPPTenMR30MK9NjvauJqznpV5tIT26B7jV3Mq3od/rFPDCVxpSDgJwUS6dXczdzfg3/Wv6BFPXDlIL6UZzghMFKhshmpChQRO72kSqXZj+CX2JW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531986; c=relaxed/simple;
	bh=Y6n76SaDftnNr33anMDn92o7ShKiS2mDhlxiLIsyJuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7coS1vBMzV0dctG15cpqV7pw0l3emVcSjs7NkRyBFBfva5QK47V0UIHukq9LmRAo7YL/YoK4ga3WY1Z7qOMWNxfskqRRq2SvkVKMpq3R7gNALNxjraDWPCBtY33XjhV9vbZLfOONbNc5k+LLjvgdlFqtEFkpA8/wKpXQ4jcm0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROg1zKja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AdQUP015737
	for <linux-i2c@vger.kernel.org>; Tue, 6 May 2025 11:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pM/k7VZ0DPmfvoZBwKH+duw5
	ejJ6t4FYOhQrJPC39U8=; b=ROg1zKjavNmDzxmYXBNBQ5TPpVgV1ioEXhhMl5h2
	Ihs+EfXMVUhDSpGNwAc8ZsqSejoIugw1hCB1v1xhCMsYMrQseAhVDxSw//mx8U2D
	rf0EwRp5haHPbwVaNaOu7zXoeAVVyk1Kl2aiAi0kAe3Mvtj9kxvpdBWxRTX6Hol0
	Q8zoW5s0QoxQ5aZpE/0Iwo/YufKitNuYw6yCjtoOtRHPhamUtlpMnJz/6+ekT/IN
	1XiV9tLKid6duJUIiBDy8LrYHE92lhHMt46OH+tW/lRDxiUjxGiKBOhFBuqyBMJ0
	yVjZgo1s+90kAxEoC2x9ZNn7u7wP4l5YZ5UUh5Rh+uyXGw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguug5y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 May 2025 11:46:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ead629f6c6so101422036d6.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 May 2025 04:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531982; x=1747136782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM/k7VZ0DPmfvoZBwKH+duw5ejJ6t4FYOhQrJPC39U8=;
        b=o5jJgmxKuz85BIwYZDo99WrRzfygDeWO+AfPUb1bBmS+tL5EST7NHFCH1Gw5xjCwav
         6ZC1a40Ogfs/sq2Mq59h1ivOQXoNil70VriTb6yR6eAJFFz1q2pRmPQZU2U4FME4J60i
         vpmAa06MuzzMmmuLqnKJRd36Bzu18krnXUs63YYoTlFUbxqGez+q7hg5W4DnKmdrx+iV
         6gtQXmagQSxiuNDNNxR/PXxGZ0L6i4Bwwka8jXaqHrOOutKUAEgcLNTMssuHcXb1Cp3U
         FJfaftXDBUT2LVirATV1gLuegvSCQ8IggyPxiLjQVWuzygJz1aOD1b4szUlwy/lfpLC2
         /ocg==
X-Forwarded-Encrypted: i=1; AJvYcCV3v8GJwI3I89A7DCpTa6SZANF9g5tYn9ePxG3yHjQiKYQBrmunN7dqKcBFiZYKsgZhyWNoM02AufQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQl2osoBmbXCGGY1gMr6I5k8k0K/22TbZtwDg5u8K92Dvethb0
	vujh/6PWt+Xj4HdK6I+/81GNmkPmSBu4aopFlvAbvyF3uQjult9SJNwtXgSuUvIdFno586a4o/u
	Hqbr3fA+m8rEe5Jq8YEnNcttXcqYp8xnrn9aWPrbBXLhwFYb5g7guPK1XFn0=
X-Gm-Gg: ASbGncug2YaB6DDJ7cLpevkFig9WWCKxx6zIZcwdJ66z797rlqxil0l2g4F+ZIHU6g+
	zR5baPZH7AfkfKHeSOFC+IOe7Z17Gzp6a33rsX/Um02t8Cq5sV9rkbo6Oqid+hJeLYoqpd/oeim
	OeAWXrSvjfN6w91z1GmumnyGUdz/MJNrxE5iEMsSoxMVBkxGrejvE1EnsZUS8HVtM0fa/mf6ATm
	oHIWJDEPd5t8t/EVM4OrHkPtKOqcQB/8XjWhT+mcnYK+pxe9iR/sVZfIdET2/DrDYLxT7S5Z7ty
	hhwe8Nu1VtpWN3ji+TsFHaKlKrfG6N8VnFSBydUfHiH5NrHz84o450gFXTuRy7g7YRVDGkFq7cA
	=
X-Received: by 2002:a05:6214:5185:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f528c78260mr198564606d6.23.1746531982180;
        Tue, 06 May 2025 04:46:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo+jwcJ8B4vTiAbFf+LKzKPh9yaNuoDVGPZUsl4foyk5srXhNVyQcj9XIQhoKxGHCXdQhZtw==
X-Received: by 2002:a05:6214:5185:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f528c78260mr198564006d6.23.1746531981560;
        Tue, 06 May 2025 04:46:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-320290176c0sm20464171fa.42.2025.05.06.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:46:20 -0700 (PDT)
Date: Tue, 6 May 2025 14:46:19 +0300
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
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506111844.1726-3-quic_jseerapu@quicinc.com>
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=6819f68f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_K02diu8yncocTwFoz8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qwlEUS8l9NQnhPveOp_ISMlF1md1tOL8
X-Proofpoint-GUID: qwlEUS8l9NQnhPveOp_ISMlF1md1tOL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMiBTYWx0ZWRfXxV2JjLUPz+Tc
 jbNbRcGIcaROnVH4eOgD0V+r0A1onJwRaBWGqtok0JGaCtqroca4GdhEBlyoz+hKbKqZTaxGvo2
 p2FnEuNGNaVjYgqlJRQRW6QCmaayLjD0nENYd4WIlfaIXN9ABAPKLnxZDcciMNENdrIbec0/NYv
 7k30ZRJmO3zK8hdKhLXDhZEKbrJTLOcl3nhhkltN0NVyqLO12EJjYG95wl81cEPAH5cdHP98BbV
 yce8WyfAcfAURDY7VkohHQL9c6oniQlfnX08hxBZYZ4g7nyg5/b3KeREmxiNU/cJsCLPnJo+fn4
 6sK25Qudr5nxziT0S53QARKUzsdvOlekzh3gbn8n8QU8tsMvUlOTxBBuZuuBOFyc1gOOEMFt9iF
 BBsEaNxd6M2uMs1XHnTv5JAej9E0bcYRaxcZITxhf2m3OnRdIxzO4STbg0BN7fnE+n0kqfoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060112

On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of 8 messages internally.
> Interrupts are not expected for the first 7 message completions, only
> the last message triggers an interrupt, indicating the completion of
> 8 messages. This BEI mechanism enhances overall transfer efficiency.

Why do you need this complexity? Is it possible to set the
DMA_PREP_INTERRUPT flag on the last message in the transfer?

> 
> This optimization reduces transfer time from 168 ms to 48 ms for a
> series of 200 I2C write messages in a single transfer, with a
> clock frequency support of 100 kHz.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> v5 -> v6:
>   - Instead of using bei_flag, moved the logic to use with DMA
>     supported flags like DMA_PREP_INTERRUPT.
>   - Additional parameter comments removed from geni_i2c_gpi_multi_desc_unmap
>     function documentation.
>    
> v4 -> v5:
>   - Block event interrupt flag naming changed from flags to bei_flag.
>   - Documentation added for "struct geni_i2c_dev".
> 
> v3 -> v4:
>   - API's added for Block event interrupt with multi descriptor support for
>     I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>   - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>     I2C driver.
>   - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
>     struct geni_i2c_dev.
> 
> v2 -> v3:
>    - In i2c_gpi_cb_result function, moved the logic of
>     "!is_tx_multi_xfer" to else.
>    - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>    - Updated commit description
> 
> v1 -> v2:
>    - Moved gi2c_gpi_xfer->msg_idx_cnt to separate local variable.
>    - Updated goto labels for error scenarios in geni_i2c_gpi function
>    - memset tx_multi_xfer to 0.
>    - Removed passing current msg index to geni_i2c_gpi
>    - Fixed kernel test robot reported compilation issues.
> 
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 307 ++++++++++++++++++++++++++---
>  1 file changed, 280 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 515a784c951c..e390cf5b4ddc 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -78,6 +78,62 @@ enum geni_i2c_err_code {
>  #define XFER_TIMEOUT		HZ
>  #define RST_TIMEOUT		HZ
>  
> +#define QCOM_I2C_GPI_MAX_NUM_MSGS		16
> +#define QCOM_I2C_GPI_NUM_MSGS_PER_IRQ		8
> +#define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
> +
> +/**
> + * struct geni_i2c_gpi_multi_desc_xfer - Used for multi transfer support
> + *
> + * @msg_idx_cnt: message index for the transfer
> + * @buf_idx: dma buffer index
> + * @unmap_msg_cnt: unmapped transfer index
> + * @freed_msg_cnt: freed transfer index
> + * @irq_cnt: received interrupt count
> + * @irq_msg_cnt: transfer message count for the received irqs
> + * @dma_buf: virtual addresses of the buffers
> + * @dma_addr: dma addresses of the buffers
> + */
> +struct geni_i2c_gpi_multi_desc_xfer {
> +	u32 msg_idx_cnt;
> +	u32 buf_idx;
> +	u32 unmap_msg_cnt;
> +	u32 freed_msg_cnt;
> +	u32 irq_cnt;
> +	u32 irq_msg_cnt;
> +	void *dma_buf[QCOM_I2C_GPI_MAX_NUM_MSGS];
> +	dma_addr_t dma_addr[QCOM_I2C_GPI_MAX_NUM_MSGS];
> +};
> +
> +/**
> + * struct geni_i2c_dev - I2C Geni device specific structure
> + *
> + * @se: geni serial engine
> + * @tx_wm: Tx watermark level
> + * @irq: i2c serial engine interrupt
> + * @err: specifies error codes in i2c transfer failures
> + * @adap: i2c geni adapter
> + * @done: completion variable
> + * @cur: pointer to the i2c_msg mentioning current i2c message in use
> + * @cur_wr: variable used for i2c write opertions
> + * @cur_rd: variable used for i2c read operations
> + * @lock: spinlock variable used for synchronization
> + * @core_clk: pointer to clk
> + * @clk_freq_out: contains the i2c clock frequency
> + * @clk_fld: pointer to geni_i2c_clk_fld
> + * @suspended: flag used for system supend status
> + * @dma_buf: virtual address of the buffer
> + * @xfer_len: holds length for the dma operation
> + * @dma_addr: dma address of the buffer
> + * @tx_c: Tx dma channel
> + * @rx_c: Rx dma channel
> + * @gpi_mode: GPI DMA mode of operation
> + * @abort_done: true for marking i2c abort transfer
> + * @is_tx_multi_desc_xfer: true for i2c multi transfer support
> + * @num_msgs: number of i2c messages in a transfer
> + * @tx_irq_cnt: flag used for tx irq count in i2c multi transfer
> + * @i2c_multi_desc_config: used for multi transfer support
> + */

Unrelated. Documentation should go to a separate patch.

>  struct geni_i2c_dev {
>  	struct geni_se se;
>  	u32 tx_wm;
> @@ -100,6 +156,10 @@ struct geni_i2c_dev {
>  	struct dma_chan *rx_c;
>  	bool gpi_mode;
>  	bool abort_done;
> +	bool is_tx_multi_desc_xfer;
> +	u32 num_msgs;
> +	u32 tx_irq_cnt;
> +	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>  };
>  
>  struct geni_i2c_desc {
> @@ -500,6 +560,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  {
>  	struct geni_i2c_dev *gi2c = cb;
> +	struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer;

Define it in the corresponding chunk.

>  
>  	if (result->result != DMA_TRANS_NOERROR) {
>  		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
> @@ -508,7 +569,22 @@ static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>  		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
>  	}
>  
> -	complete(&gi2c->done);
> +	if (!gi2c->is_tx_multi_desc_xfer) {
> +		complete(&gi2c->done);
> +	} else {
> +		tx_multi_xfer = &gi2c->i2c_multi_desc_config;
> +
> +		/*
> +		 * Send Completion for last message or multiple of
> +		 * QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> +		 */
> +		if ((tx_multi_xfer->irq_msg_cnt == gi2c->num_msgs - 1) ||
> +		    (!((tx_multi_xfer->irq_msg_cnt + 1) % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ))) {
> +			tx_multi_xfer->irq_cnt++;
> +			complete(&gi2c->done);
> +		}
> +		tx_multi_xfer->irq_msg_cnt++;
> +	}
>  }
>  
>  static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> @@ -526,38 +602,140 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	}
>  }
>  
> -static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> +/**
> + * geni_i2c_gpi_multi_desc_unmap() - unmaps the buffers post multi message TX transfers
> + * @gi2c: i2c dev handle
> + * @msgs: i2c messages array
> + * @peripheral: pointer to gpi_i2c_config
> + */
> +static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
> +					  struct gpi_i2c_config *peripheral)
> +{
> +	u32 msg_xfer_cnt, wr_idx = 0;
> +	struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer = &gi2c->i2c_multi_desc_config;
> +
> +	/*
> +	 * In error case, need to unmap all messages based on the msg_idx_cnt.
> +	 * Non-error case unmap all the processed messages.
> +	 */
> +	if (gi2c->err)
> +		msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
> +	else
> +		msg_xfer_cnt = tx_multi_xfer->irq_cnt * QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
> +
> +	/* Unmap the processed DMA buffers based on the received interrupt count */
> +	for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
> +		if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
> +			break;
> +		wr_idx = tx_multi_xfer->unmap_msg_cnt % QCOM_I2C_GPI_MAX_NUM_MSGS;
> +		geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
> +				   tx_multi_xfer->dma_buf[wr_idx],
> +				   tx_multi_xfer->dma_addr[wr_idx],
> +				   NULL, (dma_addr_t)NULL);
> +		tx_multi_xfer->freed_msg_cnt++;
> +	}
> +}
> +
> +/**
> + * geni_i2c_gpi_multi_xfer_timeout_handler() - Handle multi message transfer timeout
> + * @dev: pointer to the corresponding dev node
> + * @multi_xfer: pointer to the geni_i2c_gpi_multi_desc_xfer
> + * @num_xfers: total number of transfers
> + * @transfer_timeout_msecs: transfer timeout value
> + * @transfer_comp: completion object of the transfer
> + *
> + * This function is used to wait for the processed transfers based on
> + * the interrupts generated upon transfer completion.
> + * Return: On success returns 0, otherwise return error code (-ETIMEDOUT)
> + */
> +static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
> +						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
> +						   u32 num_xfers, u32 transfer_timeout_msecs,
> +						   struct completion *transfer_comp)
> +{
> +	int i;
> +	u32 max_irq_cnt, time_left;
> +
> +	max_irq_cnt = num_xfers / QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
> +	if (num_xfers % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ)
> +		max_irq_cnt++;
> +
> +	/*
> +	 * Wait for the interrupts of the processed transfers in multiple
> +	 * of 8 and for the last transfer. If the hardware is fast and
> +	 * already processed all the transfers then no need to wait.
> +	 */
> +	for (i = 0; i < max_irq_cnt; i++) {
> +		reinit_completion(transfer_comp);
> +		if (max_irq_cnt != multi_xfer->irq_cnt) {
> +			time_left = wait_for_completion_timeout(transfer_comp,
> +								transfer_timeout_msecs);
> +			if (!time_left) {
> +				dev_err(dev, "%s: Transfer timeout\n", __func__);
> +				return -ETIMEDOUT;
> +			}
> +		}
> +		if (num_xfers > multi_xfer->msg_idx_cnt)
> +			return 0;
> +	}
> +	return 0;
> +}
> +
> +static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>  			struct dma_slave_config *config, dma_addr_t *dma_addr_p,
>  			void **buf, unsigned int op, struct dma_chan *dma_chan)
>  {
>  	struct gpi_i2c_config *peripheral;
> -	unsigned int flags;
>  	void *dma_buf;
>  	dma_addr_t addr;
>  	enum dma_data_direction map_dirn;
>  	enum dma_transfer_direction dma_dirn;
>  	struct dma_async_tx_descriptor *desc;
>  	int ret;
> +	struct geni_i2c_gpi_multi_desc_xfer *gi2c_gpi_xfer;
> +	dma_cookie_t cookie;
> +	u32 msg_idx;
>  
>  	peripheral = config->peripheral_config;
> -
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> -	if (!dma_buf)
> -		return -ENOMEM;
> +	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
> +	dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
> +	addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
> +	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
> +
> +	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
> +	if (!dma_buf) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
>  
>  	if (op == I2C_WRITE)
>  		map_dirn = DMA_TO_DEVICE;
>  	else
>  		map_dirn = DMA_FROM_DEVICE;
>  
> -	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
> +	addr = dma_map_single(gi2c->se.dev->parent, dma_buf,
> +			      msgs[msg_idx].len, map_dirn);
>  	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> -		return -ENOMEM;
> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	if (gi2c->is_tx_multi_desc_xfer) {
> +		if (((msg_idx + 1) % QCOM_I2C_GPI_NUM_MSGS_PER_IRQ))
> +			peripheral->dma_flags = DMA_CTRL_ACK;
> +		else
> +			peripheral->dma_flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
> +
> +		/* BEI bit to be cleared for last TRE */
> +		if (msg_idx == gi2c->num_msgs - 1)
> +			peripheral->dma_flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
> +	} else {
> +		peripheral->dma_flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;

No-no-no. There is no need to set peripheral->dma_flags.

>  	}
>  
>  	/* set the length as message for rx txn */
> -	peripheral->rx_len = msg->len;
> +	peripheral->rx_len = msgs[msg_idx].len;
>  	peripheral->op = op;
>  
>  	ret = dmaengine_slave_config(dma_chan, config);
> @@ -568,14 +746,14 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  
>  	peripheral->set_config = 0;
>  	peripheral->multi_msg = true;
> -	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>  
>  	if (op == I2C_WRITE)
>  		dma_dirn = DMA_MEM_TO_DEV;
>  	else
>  		dma_dirn = DMA_DEV_TO_MEM;
>  
> -	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
> +	desc = dmaengine_prep_slave_single(dma_chan, addr, msgs[msg_idx].len,
> +					   dma_dirn, peripheral->dma_flags);
>  	if (!desc) {
>  		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>  		ret = -EIO;
> @@ -585,15 +763,48 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	desc->callback_result = i2c_gpi_cb_result;
>  	desc->callback_param = gi2c;
>  
> -	dmaengine_submit(desc);
> -	*buf = dma_buf;
> -	*dma_addr_p = addr;
> +	if (!((msgs[msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
> +		gi2c_gpi_xfer->msg_idx_cnt++;
> +		gi2c_gpi_xfer->buf_idx = (msg_idx + 1) % QCOM_I2C_GPI_MAX_NUM_MSGS;
> +	}
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie)) {
> +		dev_err(gi2c->se.dev,
> +			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
> +		ret = -EINVAL;
> +		goto err_config;
> +	}
>  
> +	if (gi2c->is_tx_multi_desc_xfer) {
> +		dma_async_issue_pending(gi2c->tx_c);
> +		if ((msg_idx == (gi2c->num_msgs - 1)) ||
> +		    (gi2c_gpi_xfer->msg_idx_cnt >=
> +		     QCOM_I2C_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
> +			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
> +								      gi2c->num_msgs, XFER_TIMEOUT,
> +								      &gi2c->done);
> +			if (ret) {
> +				dev_err(gi2c->se.dev,
> +					"I2C multi write msg transfer timeout: %d\n",
> +					ret);
> +				gi2c->err = ret;
> +				goto err_config;
> +			}
> +		}
> +	} else {
> +		/* Non multi descriptor message transfer */
> +		*buf = dma_buf;
> +		*dma_addr_p = addr;
> +	}
>  	return 0;
>  
>  err_config:
> -	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
> -	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
> +	dma_unmap_single(gi2c->se.dev->parent, addr,
> +			 msgs[msg_idx].len, map_dirn);
> +	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
> +
> +out:
> +	gi2c->err = ret;
>  	return ret;
>  }
>  
> @@ -605,6 +816,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	unsigned long time_left;
>  	dma_addr_t tx_addr, rx_addr;
>  	void *tx_buf = NULL, *rx_buf = NULL;
> +	struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer;
>  	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>  
>  	config.peripheral_config = &peripheral;
> @@ -618,6 +830,33 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	peripheral.set_config = 1;
>  	peripheral.multi_msg = false;
>  
> +	gi2c->num_msgs = num;
> +	gi2c->is_tx_multi_desc_xfer = false;
> +	gi2c->tx_irq_cnt = 0;
> +
> +	tx_multi_xfer = &gi2c->i2c_multi_desc_config;
> +	memset(tx_multi_xfer, 0, sizeof(struct geni_i2c_gpi_multi_desc_xfer));
> +
> +	/*
> +	 * If number of write messages are two and higher then
> +	 * configure hardware for multi descriptor transfers with BEI.
> +	 */
> +	if (num >= QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC) {
> +		gi2c->is_tx_multi_desc_xfer = true;
> +		for (i = 0; i < num; i++) {
> +			if (msgs[i].flags & I2C_M_RD) {
> +				/*
> +				 * Multi descriptor transfer with BEI
> +				 * support is enabled for write transfers.
> +				 * TODO: Add BEI optimization support for
> +				 * read transfers later.
> +				 */
> +				gi2c->is_tx_multi_desc_xfer = false;
> +				break;
> +			}
> +		}
> +	}
> +
>  	for (i = 0; i < num; i++) {
>  		gi2c->cur = &msgs[i];
>  		gi2c->err = 0;
> @@ -628,14 +867,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			peripheral.stretch = 1;
>  
>  		peripheral.addr = msgs[i].addr;
> +		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
> +			peripheral.multi_msg = false;
>  
> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +		ret =  geni_i2c_gpi(gi2c, msgs, &config,
>  				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);

Can't you just pass the flag to set DMA_PREP_INTERRUPT for the last
message here and on the next geni_i2c_gpi() call?

>  		if (ret)
>  			goto err;
>  
>  		if (msgs[i].flags & I2C_M_RD) {
> -			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +			ret =  geni_i2c_gpi(gi2c, msgs, &config,
>  					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>  			if (ret)
>  				goto err;
> @@ -643,18 +884,26 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			dma_async_issue_pending(gi2c->rx_c);
>  		}
>  
> -		dma_async_issue_pending(gi2c->tx_c);
> -
> -		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!time_left)
> -			gi2c->err = -ETIMEDOUT;
> +		if (!gi2c->is_tx_multi_desc_xfer) {
> +			dma_async_issue_pending(gi2c->tx_c);
> +			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +			if (!time_left) {
> +				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
> +				gi2c->err = -ETIMEDOUT;
> +			}
> +		}
>  
>  		if (gi2c->err) {
>  			ret = gi2c->err;
>  			goto err;
>  		}
>  
> -		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +		if (!gi2c->is_tx_multi_desc_xfer) {
> +			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +		} else if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
> +			gi2c->tx_irq_cnt = tx_multi_xfer->irq_cnt;
> +			geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
> +		}
>  	}
>  
>  	return num;
> @@ -663,7 +912,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
>  	dmaengine_terminate_sync(gi2c->rx_c);
>  	dmaengine_terminate_sync(gi2c->tx_c);
> -	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +	if (gi2c->is_tx_multi_desc_xfer)
> +		geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
> +	else
> +		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
> +
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

