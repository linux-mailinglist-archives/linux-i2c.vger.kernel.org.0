Return-Path: <linux-i2c+bounces-13215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27846BA557E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 00:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518711B250A1
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 22:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDDE283FD9;
	Fri, 26 Sep 2025 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa4ImZYn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5F4C9D
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758926161; cv=none; b=mwXgmgO5QdPMzYcqR2h82Yc+H8+4tWtodeafBKgN3Ix9TymT6qfDNXFkZ4ZXWu0XlbWRZxNY/D4FtYNVEDzm1Hp9tFSrU5FYxubVAGkV6fVybZfOnuEGKiImc9qdxdrxMC+Gwtaljto8RbFqgnpYk2OcbhNAUgd+9wmLeZglYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758926161; c=relaxed/simple;
	bh=9purHNX1lS082Hyqiy1U7KvnoSCetzFJVKiqA+89V8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYU1NQ9O44jHK+pjC/7HHLlJLe/IIXv/J4VZl8jWR44weT0kIUbF/uQ+CVnr1YcWjuO7PMtEOq37EiscLMduPbkkuCQRGB97ddpifIxraFpX3Kr6kUDyXlWyl4Jd+kVSfkDzimrSVANbRb42EmsanVygjrkWnALFyLeXn23rYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa4ImZYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWviX030339
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 22:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SoeY4l6ebsrYr5pagnV48aNI
	rgnvCjkETPIfrORiaFw=; b=oa4ImZYnM2V3WAMBIsyzs7kAnuckDrb/EzjN8BlA
	CodXqF6dZFTwu74QKBC4wl0XM0onTUVfpBpcmHpfiODxqL12Hjh56fs5QlqY+u9j
	/3K2UIQKxdmAd4SrLs6VpaB+iAJ9Zp6baHDpFL1oXt/5GfxIAgne46tyz5RKaSXa
	CFaA3AWi6O3OUtSL6Q3K4wlCZBwLQC0VwnEsdUCfFy8NE48Ma7K0NimyL/TYQQG0
	3U6zVHpvRD92zoVlV5B532RFk8DbbqpjOwZoHKig2EWoLnscWqarSEE7BAankOPD
	OC3mMibYKu5Bu6IFP5pN6vQXV+a+O4e3oO1LNU/zN8BgOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34mb4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 22:35:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de35879e7dso19670111cf.0
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 15:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758926158; x=1759530958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoeY4l6ebsrYr5pagnV48aNIrgnvCjkETPIfrORiaFw=;
        b=YgIyZHX4VvVuiSn6yzzEti82Wvkmc2guxYL8iMYSoWbuyVsAqIh0qaMKzavdtvHSV0
         /WInesVjviqH3LeqNA26W4Hv8EOZ7vbwBIr3gLYoXrzPgN7z3fwwDfRGyVOpVbOmeZAq
         RaXpVeV9WlZwbkJH5dFxduPw9vhetWDAq2BCi/SCuEgxsZsov0JEFWBZ3B2Crc4OsJwi
         rfsJ/rAlVk5NWsxRMvc13ldMk2ljGgd1xrrXZB4K5DS5gUcJ5me5wy50jIE/25mAbolp
         FOJ01UobWvyJQ0fufT2pqpUbptpnm9LR1eoI+szwSAGXUNxLnMFWdN2I3BDXgQFk1rK3
         Y/aA==
X-Forwarded-Encrypted: i=1; AJvYcCUWIRC2kvA0VD6f3rQfOQksDoTgfAVMLJvF8B6XeEiOFtcRuQaAMX2bIYdO5gpBiJZpdO+WmUJU5fY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVq6jPPiI9LIT9dYQmI4mFBp/dHrhC3fKZEeOo1IluQYWgzCQV
	0M+tZssLSLF/WHgY0Vy54FEHbnIGmqfF5IGOAmEyphcgT0ofvobgmguzVXBZF7pkXowoHofeTdN
	lSCXkqygbYUc3zZZYiGIApwlF/QdwmT578hYW0/Etu572VP+rigRmwPenP+Z2//0=
X-Gm-Gg: ASbGncvMkhRq4UathVsF+oRyTowHumSxw/n/ZwMT1ebS/3BPw0oPoS7jk5YyNJYNfPk
	wBMtKdEuwIXrTj4mOMht3Ka6BwGZcfKRUDI0RkTxypn/sRfQl8awndNMBCz2YaXq3jrT+jD/8RE
	l2LOaa+zoZm70gtDqpI645uvRspxNiDY6TuWD4Ol0geVrbpq1TE25Ri7rPXeSIwqJCJgSIwn84i
	nB9lxh/rFi1b04oEamnyVORrH/oj9GuNfCy8elkZvK0PKNQIzMVFSuFY9ULXHQjeXke/dz099GI
	3DzlO0WyqE48r4Xi7mfdZKr3+2X4lP5IV/3UzOZ25W0Q05zBuPmYFG7iUWQwmg/aOf9a2a67PDE
	V3SBar9wpDCbuL8BmuYueFzwHD4/fKg/v+6yqiyANGuVuUfTrTm5e
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4da47a1a220mr115923221cf.3.1758926157815;
        Fri, 26 Sep 2025 15:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/mVxWB3lmLAFeQC9Fvkdijqlfs9w38uYfGjjdvBN7+TJwGSvqr+pkIUIo3hPrxbde64DYZg==
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4da47a1a220mr115922721cf.3.1758926157253;
        Fri, 26 Sep 2025 15:35:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430a7dsm2147362e87.22.2025.09.26.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:35:55 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:35:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
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
Subject: Re: [PATCH v8 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <vdd33houteml2inilry6vkqdpdm7vykcqb5vf66sdhq5knlfhr@mzlrb5babocx>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXxxFZ1csdiX+B
 UeTHMCdCn+jM+VIpdhlBA2tK2vZLXme0aI4lpeo55bNiAFWA3Njr2NX2E58cxt3SZNtGU4gmvUf
 NxSEtz4kHsGwsP0vEM310gHDqkwLF8CdW8i4m9qku0qvn07VDcUfGn7vzkugHukZFOAe0FzI5K1
 t4SITiz9DFEcK/6Veam74wDKrgsEnZKpDp8Yh3TBXeBhqprDK3x+/+oTaONfK8IPl6BaXfi1V4Y
 U9ltvpavIAsnq9jhwBxyIe0GgkCjxXlCvfHVjh6nzHkKOiHNaUXZKa24WXZg2FZ/zoUjrtQ5zZS
 bWCLiMI/aWonIT9e4LNJywK/tW0DSqxdBR7anFE2a7ub39MKbxsLmBktaLNv8BdpfRlzZoMPw3m
 RfAcJagsAmh+o6TtYyHAzfq6Z3HvfA==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d7154e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UZ83mHg5h350vH40qggA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IjGQ1cjYT_GzwFOF54KMiojUXGpKw7qO
X-Proofpoint-GUID: IjGQ1cjYT_GzwFOF54KMiojUXGpKw7qO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On Thu, Sep 25, 2025 at 05:30:34PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v7 -> v8:
>    - Removed duplicate sentence in commit description
> 
> v6 -> v7:
>    - The design has been modified to configure BEI for interrupt
>      generation either:
>      After the last I2C message, if sufficient TREs are available, or
>      After a specific I2C message, when no further TREs are available.
>    - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function
>      and so avoided using external variables for DMA_PREP_INTERRUPT status.
> 
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
>  drivers/dma/qcom/gpi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

