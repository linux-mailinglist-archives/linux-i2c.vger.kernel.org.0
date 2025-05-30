Return-Path: <linux-i2c+bounces-11173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD1AC92BE
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 17:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0CF8189FEA1
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 15:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010022356B4;
	Fri, 30 May 2025 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzBgQQMJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7422F169
	for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620406; cv=none; b=YDqAAHiRIO4qjV4Lj/OXL1KWZnKze4ovwiTYgbV6v1r0RdVlkcrB2CDQ6dPu/GvPKHhFXGFbftYEadAdmE21t47SE1rKmdJbxlXcq5uWDLrSY86p+Vb4GTQ4a3nLbEuwRbiUJPgk044f9o5JWxQEVyq/030MUjJHg63gDM7UR/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620406; c=relaxed/simple;
	bh=LrxK0cAiXOd6k3y7xsFLNaG3CkgMGLXiV0FageijA/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjT5goZBqFO4VI0B5FP/G0d9sef0oi9De/palepO0etA4vGVVR8mMzQK0yWQDlaVUIucEmTIE71JILhrS1Q+LhSkfUJzicIL65jLPQMu/t8IV1xLuIc0B9UEvGpuih8Ul1Zq1fiOA0J2qoWrROkpCRAVqAlrQwAiRmrzNHW7riI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzBgQQMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBm1Qn024010
	for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 15:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocOy+iZ89dtnyBaWmC5MMBRHZ5mWFLMjUsmdth3Z8GQ=; b=dzBgQQMJcDYDo0LK
	6yPAzdvLQ2Nq+0MD/gsuqA9Uss3k+D3+NaFHTO1C3/ZXvC7/MXzq/otbMXCyXOxi
	L922xEIey+YB5mukNZhJYq4dZxe2i7bbzOz5oAJoS2nGV6iwd0MYaQEZpFO/xJCl
	1CLky+oH5RGBrOc9xUAg6TWPnn+sQ0CoYYXRBnPTIpjyo4lJvCIP+RUq/E0OAUIG
	dELuuU1Or3wdqr6jhEr4jIUm1NXl39tsa82UibKB2uoZaK/wmDc1/6MnByMJhLyi
	K26kcC0TzFaB5NXIw9Fxkf2hMVYOSGeseonnY0SUvujMSlB/cN/lm/+aESk28UNs
	joql/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7ea16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 15:53:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c3e576201so2780559a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 08:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748620401; x=1749225201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocOy+iZ89dtnyBaWmC5MMBRHZ5mWFLMjUsmdth3Z8GQ=;
        b=iAroBTOLem7xEnF8gQq6UG36I7vmq2x7pnnzIrDXh6BsL62FCmrvl/RC642zsZsenJ
         Vl3unQJGwoizwGuORKRN3L/6nLq/UwJ5QGCy5zDp//uUCcw2uvdKti9stFGfNVJXdpbM
         CAZMgkU7tZxYqAF2oCV+Fvnu/rd1gjO/uN/LGgmQYClLBvII59zWq+2F4viHJtoMjUrQ
         xdVwk1wvXcqiqNVwkd/vze7kdQ8zbiTZmjXJkNxh1jlKIIQiKazF/weDEgylIaFgQLG+
         3MFPNnrhjpviNW4hwNyrmv8GVTBZwZ/IwStbIKgeTopX9DWCLATY4dTxtwgqCtlaydc8
         p4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqLu2A1AxiX2fSRlxfZnZdt151JCXbOlCeeWhK836wch1MVQEnJtiH8TMfFNEtBggP1jzbaLdG8U4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7BrRGuJq/VB5eTJXXO23Pr4nzW69CFh5uP/Zom6we39M0Mxjs
	IIOoDHFobX3TfkaMHHTWrkS0hYn2n1bc+eDEauhQLhwUqF8Ni4u6kBoZHB1TCr7OvO6yy2bFcID
	lMJQH1YIjeVqZEvbly4y60YgUF/axjAM/0P8yVQzwl3+mZMYMefY8lv/CQ2NhXTyqz4x3+SFYVS
	wcCbPob8HbPohjFo/Kk0Hg8VnyXx+eD0YRtG18gg==
X-Gm-Gg: ASbGnctLzLyH9s+Akt6fzIxGMG4wOy21HNyfkx2OazMQQgIA+CyqP9TJ+80ZhruxhPv
	ya40++SEcG4oa8AQ1Bns0vLrThSfuIq/wlBU4MluLXi8hKPGcaFKOfSyfmZKcztbGy4IDEGJg1A
	A8MlvRU538/9cZCAJ2nyq4+Xz7mw==
X-Received: by 2002:a17:90b:2f03:b0:30a:9feb:1e15 with SMTP id 98e67ed59e1d1-31214e2efabmr13566574a91.8.1748620401277;
        Fri, 30 May 2025 08:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI8DQTJOy6Ygl/JjuDr7iVO/pS/KdYmD4s/dC0D+LEaOkPASzhJTKviMamfZXKSwSf5rgo3UuFLaa45v1W+Tk=
X-Received: by 2002:a17:90b:2f03:b0:30a:9feb:1e15 with SMTP id
 98e67ed59e1d1-31214e2efabmr13566509a91.8.1748620400596; Fri, 30 May 2025
 08:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-2-quic_jseerapu@quicinc.com> <ze5y6llgo2qx4nvilaqcmkam5ywqa76d6uetn34iblz4nefpeu@ozbgzwbyd54u>
 <4456d0e2-3451-4749-acda-3b75ae99e89b@quicinc.com> <de00809a-2775-4417-b987-5f557962ec31@quicinc.com>
In-Reply-To: <de00809a-2775-4417-b987-5f557962ec31@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 18:53:09 +0300
X-Gm-Features: AX0GCFsEgcxsXpdIFfOsAqXa1UzndXO-yjeJj8vejz0KsNKmM_D-7yinEUW3MbU
Message-ID: <CAO9ioeUW9-7N2Ptu_p=XKzeb02RsXx8V3CzarPOD4EWy4QrnsA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4UzT4LKu_-CbQdvRRj61yhs0tXV1VKak
X-Proofpoint-ORIG-GUID: 4UzT4LKu_-CbQdvRRj61yhs0tXV1VKak
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6839d472 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=COk6AnOGAAAA:8 a=mdKvkispvZj9PeQf9s4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEzOSBTYWx0ZWRfX84EXVj+83s1c
 HPtA6nd+MeChksAtks1SFA0Uz+c+bv2jo1nPB4QZpu1MKqC4dnzJjbw6ykhbBh7NFUntOLzAbmZ
 8Kd/NfXzStQMEVNOQFwh+F7VtMiV7HAeri1u8VLSZmoV9wGWTPSCuQ0/L6YG6R5DBeTOBU/h+/9
 KVViJjlhIQF5mRRFpvdoCq3OJqJlD915AKNp8xIKN5lrT14ZMYd8SIwx0gLYXCDMAlXjc8k24bE
 Vtz+zw3JQulZ/IxkOkLwSWqodxn4ssg6j7aZXFcyFOIAz5GVjQi+NrEQwwYIDPRRILsBXtN3T47
 yclBRUCmozZk6lFZHcKHVLuseYmvAJLh4BLhz0WkJcpP5FbVsRgTqCrcihAyn1KUnpuGhANXdTH
 Fg6TOju6ybDFkLwYDrn7eIuKGm8DLoUVVS5F/DScQh0DfUY2fn6OI07g7SG8SkQPtqUkngNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300139

On Fri, 30 May 2025 at 17:05, Jyothi Kumar Seerapu
<quic_jseerapu@quicinc.com> wrote:
>
>
>
> On 5/9/2025 11:48 AM, Jyothi Kumar Seerapu wrote:
> >
> >
> > On 5/6/2025 5:02 PM, Dmitry Baryshkov wrote:
> >> On Tue, May 06, 2025 at 04:48:43PM +0530, Jyothi Kumar Seerapu wrote:
> >>> GSI hardware generates an interrupt for each transfer completion.
> >>> For multiple messages within a single transfer, this results in
> >>> N interrupts for N messages, leading to significant software
> >>> interrupt latency.
> >>>
> >>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechani=
sm.
> >>> Enabling BEI instructs the GSI hardware to prevent interrupt generati=
on
> >>> and BEI is disabled when an interrupt is necessary.
> >>>
> >>> When using BEI, consider splitting a single multi-message transfer in=
to
> >>> chunks of 8 messages internally and so interrupts are not expected fo=
r
> >>> the first 7 message completions, only the last message triggers
> >>> an interrupt, indicating the completion of 8 messages.
> >>>
> >>> This BEI mechanism enhances overall transfer efficiency.
> >>>
> >>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> >>> ---
> >>> v5 ->v6:
> >>>    - For updating the block event interrupt bit, instead of relying o=
n
> >>>      bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
> >>> v4 -> v5:
> >>>    - BEI flag naming changed from flags to bei_flag.
> >>>    - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
> >>>      file, and Block event interrupt support is checked with bei_flag=
.
> >>>
> >>> v3 -> v4:
> >>>    - API's added for Block event interrupt with multi descriptor
> >>> support for
> >>>      I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver fi=
le.
> >>>    - gpi_multi_xfer_timeout_handler function is moved from GPI driver=
 to
> >>>      I2C driver.
> >>>
> >>> v2-> v3:
> >>>     - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handle=
r
> >>>     - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
> >>>     - Added documentation for newly added changes in "qcom-gpi-dma.h"
> >>> file
> >>>     - Updated commit description.
> >>>
> >>> v1 -> v2:
> >>>     - Changed dma_addr type from array of pointers to array.
> >>>     - To support BEI functionality with the TRE size of 64 defined in
> >>> GPI driver,
> >>>       updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
> >>>
> >>>   drivers/dma/qcom/gpi.c           | 3 +++
> >>>   include/linux/dma/qcom-gpi-dma.h | 2 ++
> >>>   2 files changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> >>> index b1f0001cc99c..7e511f54166a 100644
> >>> --- a/drivers/dma/qcom/gpi.c
> >>> +++ b/drivers/dma/qcom/gpi.c
> >>> @@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan
> >>> *chan, struct gpi_desc *desc,
> >>>           tre->dword[3] =3D u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_T=
YPE);
> >>>           tre->dword[3] |=3D u32_encode_bits(1, TRE_FLAGS_IEOT);
> >>> +
> >>> +        if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
> >>> +            tre->dword[3] |=3D u32_encode_bits(1, TRE_FLAGS_BEI);
> >>>       }
> >>>       for (i =3D 0; i < tre_idx; i++)
> >>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/
> >>> qcom-gpi-dma.h
> >>> index 6680dd1a43c6..ebac0d3edff2 100644
> >>> --- a/include/linux/dma/qcom-gpi-dma.h
> >>> +++ b/include/linux/dma/qcom-gpi-dma.h
> >>> @@ -65,6 +65,7 @@ enum i2c_op {
> >>>    * @rx_len: receive length for buffer
> >>>    * @op: i2c cmd
> >>>    * @muli-msg: is part of multi i2c r-w msgs
> >>> + * @dma_flags: Flags indicating DMA capabilities
> >>>    */
> >>>   struct gpi_i2c_config {
> >>>       u8 set_config;
> >>> @@ -78,6 +79,7 @@ struct gpi_i2c_config {
> >>>       u32 rx_len;
> >>>       enum i2c_op op;
> >>>       bool multi_msg;
> >>> +    unsigned int dma_flags;
> >>
> >> Why do you need extra field instead of using
> >> dma_async_tx_descriptor.flags?
> >
> > In the original I2C QCOM GENI driver, using the local variable (unsigne=
d
> > in flags) and updating the "DMA_PREP_INTERRUPT" flag.
> >
> > Sure, i will review if "dma_async_tx_descriptor.flags" can be retrieved
> > in GPI driver for DMA_PREP_INTERRUPT flag status.
>
> Hi Dmitry,
>
> In the I2C Geni driver, the dma flags are primarily used in the
> dmaengine_prep_slave_single() function, which expects the argument type
> to be unsigned int. Therefore, the flags should be defined either as
> enum dma_ctrl_flags, or unsigned int.
>
> In the GPI driver, specifically within the gpi_prep_slave_sg() function,
> the flags are correctly received from the I2C driver. However, these
> flags are not currently passed to the gpi_create_i2c_tre() function.
>
> If we pass the existing flags variable to the gpi_create_i2c_tre()
> function, we can retrieve the DMA flags information without introducing
> any additional or external variables.
>
> Please confirm if this approach=E2=80=94reusing the existing flags argume=
nt in
> the GPI driver=E2=80=94is acceptable and good to proceed with.

Could you please check how other drivers use the DMA_PREP_INTERRUPT
flag? That will answer your question.

>
> >>
> >>>   };
> >>>   #endif /* QCOM_GPI_DMA_H */
> >>> --
> >>> 2.17.1
> >>>
> >>
> >
> >
>


--=20
With best wishes
Dmitry

