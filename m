Return-Path: <linux-i2c+bounces-10751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607AAA8067
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 13:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18F96982EE4
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 11:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AC51EDA35;
	Sat,  3 May 2025 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E0YsHYtE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ED62566;
	Sat,  3 May 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271090; cv=none; b=rNcmkl653iGHeKfwN07X0VsWrUWqLHUN5dnJJRMvHG85y60Y76sG5U1oaoQCs5kzE+Xqemwj4aBTE4HcHQ9NrfJn1pwSbf0srO2FUSUTyu8VP4rpQp5W0Mij6o6F8jt+Auml07cAZ+MMv2ZsRzQIrH9FV/7yT+qlvH0w8hMxcHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271090; c=relaxed/simple;
	bh=IwmPfB0nMw4wQO4Q8gQVoJPDj+jJkZ0bDWNCHeQiVSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E39fLkjvM/33VFROTfmW2XU8Hlb8Ldvx2ek63bCqgoUFNij5lFXjgoYK9+iMvLbC03AJChUoMyqYyDpr92npUyNOEV5wgfbuO+fFft7B/o3MhDcyV2zozBvtYkPIIie/TfefH5Fie5+nGX61BXJ1BKzvXwV0DHZJPFkk0DgVQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E0YsHYtE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5439KQxE030808;
	Sat, 3 May 2025 11:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+rj8A+/RL/LR4wulUWWObJ9WjVatqY2VuYSjNkuI4I=; b=E0YsHYtEb1in8NKk
	VmmDzHzCHz5uyhT0izrDeVtSyzTU0QAEXKwv6Y5jlIX7zlzxUwYuyUBtsRecHG4W
	ESzd2h1zRczlx6rgqyhBVYUNXJ0QJapK7fTAaNjwKYD9F+mZHJxI779Jjy1Gi4ce
	JDELRv4SzKwMgiLISAa57Vz/sGcmpDf6cvL8yH6mBFSKptckdHoAV+ZzKilNN+MM
	YKNv2Ic86cJKNKVdPay3FoY8lGygknk1Mb7j0RAHzlJui6jOc9xcvX3gFLW/Eo4n
	iyTr7Qp1vkjy93eYLzEEU75tqhobUA90drjw9oy8zgRnWkfUpWKJeWEjcSh977g8
	LOx4/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n0ccx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:18:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 543BI25E007376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 May 2025 11:18:02 GMT
Received: from [10.216.15.108] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 04:17:56 -0700
Message-ID: <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
Date: Sat, 3 May 2025 16:47:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDEwMSBTYWx0ZWRfX8wUtxIrglT2s
 gp8w2QTWyAP0ZoufNpOeNNGWgFP9Bc/4XkzYQktzUDmHtR8bN/YLQlsIGAGu9Z5iel1Gy06rQYu
 RczJnXaNAhuNsIQnt0yjCK5BUaZz0CNhzSdhqxEcPsng5rmSVFtYMKE3I95QONxkvwrwu9IfvyF
 kRI4kzA+7fUaEyp7jKR9zk/A54qBKN3tyxJYi3vRoJ9Hgxv8BjiPMA9Gepce6/WDTAyrFWHQMlm
 yQn7sOtDpUwH6s5urs+d5m4HofFTBKegNDFKiIQd1ZElX9ql7DEZV1ilXDa2oLL+HmDdlz7KJZq
 ykyer+y57CNyz/SENzJ+ZToOdHO08C465xyMJ/YFgOLjEHaMHg/W61n7dQBXKGHqYzI8U2c1Cd/
 zBAo4TJLjx10+vRchDssVIR3cApl3xDaI27Gms2VgtM8gSVwKLtyRNwLEw8/Lp5ja3IQVXY5
X-Proofpoint-GUID: 2LjAd4IIF8oey1n9p2R5HfZXhswjM3Cy
X-Proofpoint-ORIG-GUID: 2LjAd4IIF8oey1n9p2R5HfZXhswjM3Cy
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6815fb6b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Avv4mH6Nrv_2uyHhmYkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030101



On 3/8/2025 11:36 PM, Konrad Dybcio wrote:
> On 3.03.2025 1:43 PM, Viken Dadhaniya wrote:
>> Load the firmware to QUP SE based on the 'firmware-name' property specified
>> in devicetree. Populate Serial engine and base address details in the probe
>> function of the protocol driver and pass to firmware load routine.
>>
>> Skip the firmware loading if the firmware is already loaded in Serial
>> Engine's firmware memory area.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
> 
> [...]
> 
>> +static bool elf_phdr_valid(const struct elf32_phdr *phdr)
>> +{
>> +	if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
>> +		return false;
>> +
>> +	if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) == MI_PBT_NON_PAGED_SEGMENT &&
>> +	    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) != MI_PBT_HASH_SEGMENT &&
>> +	    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_NOTUSED_SEGMENT &&
>> +	    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_SHARED_SEGMENT)
>> +		return true;
>> +
>> +	return false;
> 
> return (contents of the if condition)
> 
>> +}
>> +
>> +/**
>> + * valid_seg_size() - Validate the segment size.
>> + * @pelfseg: Pointer to the ELF header.
>> + * @p_filesz: Pointer to the file size.
>> + *
>> + * Validate the ELF segment size by comparing the file size.
>> + *
>> + * Return: true if the segment is valid, false if the segment is invalid.
>> + */
>> +static bool valid_seg_size(struct elf_se_hdr *pelfseg, Elf32_Word p_filesz)
>> +{
>> +	if (p_filesz >= pelfseg->fw_offset + pelfseg->fw_size_in_items * sizeof(u32) &&
>> +	    p_filesz >= pelfseg->cfg_idx_offset + pelfseg->cfg_size_in_items * sizeof(u8) &&
>> +	    p_filesz >= pelfseg->cfg_val_offset + pelfseg->cfg_size_in_items * sizeof(u32))
>> +		return true;
>> +	return false;
>> +}
> 
> same here
> 
> [...]
> 
>> +static int geni_configure_xfer_mode(struct qup_se_rsc *rsc)
>> +{
>> +	/* Configure SE FIFO, DMA or GSI mode. */
>> +	switch (rsc->mode) {
>> +	case GENI_GPI_DMA:
>> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
>> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
>> +		writel_relaxed(0x0, rsc->se->base + SE_IRQ_EN);
>> +		writel_relaxed(SE_GSI_EVENT_EN_BMSK, rsc->se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	case GENI_SE_FIFO:
>> +		clrbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
>> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
>> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
>> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
>> +		break;
>> +
>> +	case GENI_SE_DMA:
>> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
>> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
> 
> This write is common across all 3 modes

In FIFO mode, the operation is to clear the bit, while in DMA mode, the 
operation is to set the bit.

> 
>> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
>> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
> 
> These two writes are common across !GPI_DMA

We have different operations in all three modes, so it's not possible to 
combine any of them.

> 
>> +		break;
>> +
>> +	default:
>> +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
>> +		return -EINVAL;
> 
> I wouldn't expect this to ever fail..

Yes, that's correct. But including a default case helps handle 
unexpected or invalid input gracefully.

Please let me know if you would like me to remove it.

> 
>> +	}
>> +	return 0;
>> +}
>> +
>> +/**
>> + * geni_enable_interrupts() Enable interrupts.
>> + * @rsc: Pointer to a structure representing SE-related resources.
>> + *
>> + * Enable the required interrupts during the firmware load process.
>> + *
>> + * Return: None.
>> + */
>> +static void geni_enable_interrupts(struct qup_se_rsc *rsc)
>> +{
>> +	u32 reg_value;
>> +
>> +	/* Enable required interrupts. */
>> +	writel_relaxed(M_COMMON_GENI_M_IRQ_EN, rsc->se->base + GENI_M_IRQ_ENABLE);
>> +
>> +	reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
>> +				S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
>> +				S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
>> +				S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
>> +				S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
> 
> The S-es should be aligned, similarly for other additions in this patch

Sure, updated in v4.

> 
> [...]
> 
>> +	/* Flash firmware revision register. */
>> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
>> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
> 
> Use FIELD_PREP and GENMASK to denote bitfields

Sure, updated in v4.

> 
>> +	writel_relaxed(reg_value, rsc->se->base + SE_GENI_FW_REVISION);
>> +
>> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
>> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
>> +
>> +	writel_relaxed(reg_value, rsc->se->base + SE_S_FW_REVISION);
>> +}
> 
> Konrad

