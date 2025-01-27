Return-Path: <linux-i2c+bounces-9210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5643A1D0B5
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 06:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495D416527E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 05:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A2A1FC0E5;
	Mon, 27 Jan 2025 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V86gR8Sn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6725A638;
	Mon, 27 Jan 2025 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737956445; cv=none; b=OjxHaBNSoiEwqQD6rMD+IEO8+MIqqbluGl/5Zx9m0xk3Ljrm9wC87AmtSPeWudY6dnCBRKIXqFugxsva7gcL9JjIcE84mltRwGP+n3vZYfl9L0f20hco6qpGtMqZtdm8aibgWbiYK/B8XhznsJHf428Fl+8e5ahZw+zRob0Lfbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737956445; c=relaxed/simple;
	bh=UVoxVBRRkEf6al2Feuha/ctYDq9a+/ugd5XVwlqeGww=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HyJitnAjMcykAq7e6yVvqeDhFJpEGuZsHlZm7KZYEM9wQzw193adbiGzM5bpw46cgX7SvJEqp2iqXcFN/DeN3UNDLIUT16Rgt+028aP1jsLIRnMecTuHouD9AAGAW0s8z9DnBrZGkJYZPxw7Pl4El8mqcnKDljqFEweFQfvvT/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V86gR8Sn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R174C9025528;
	Mon, 27 Jan 2025 05:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tru79ZpQyPOHviE3ZFZeMsHTNfXYnnaWdfLU3a0/vs=; b=V86gR8SnOmRA5RcF
	PZ0rjwcL2E2OKVvLWW1OelR1nOsyMV/hbN6gju0+Wpzx/oDiB0ELQthJPrzrl3wB
	xR7A7UZ0zrFrK4T7q+Es3AHqkl5WIVLxsrBMxSHR16v2/02bMuG8FT1APV75Vemb
	yEjk+vE3mDH2q8iWlUD+wRTshq6l95kVGHA5+1Wkl0ydvXZfSJxb3v/i3v+KByax
	2TATzQQoB8T2/ncnUarht589RWA3WZKP4VwazSDRhaCbw0AFnrHdPjiW/n4I0UJJ
	Ux0ccihpUnPniew5blnMJJEItiPcVZ5w50yOgj76JXmSFpZJfny/W4xe2zz0xunT
	Sdsp4Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs1ptv28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 05:40:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R5eYYS029607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 05:40:34 GMT
Received: from [10.216.31.13] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 26 Jan
 2025 21:40:28 -0800
Message-ID: <d3447c17-e035-4021-a199-9ff2f4715e1e@quicinc.com>
Date: Mon, 27 Jan 2025 11:10:24 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] i2c: qcom-geni: Load i2c qup Firmware from linux
 side
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <dianders@chromium.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-7-quic_vdadhani@quicinc.com>
 <d3tydp3m7pehhiphupwybjlol5v2u3sabqotqximxmnswjlczb@jmdzpbrcrgou>
 <08545d45-bfe6-45e4-b7be-503c318315af@quicinc.com>
 <CAA8EJprSZx9Bx7EXA_RpwZdhieOLtrTARqXSuo-gO9sVMdK5Qg@mail.gmail.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <CAA8EJprSZx9Bx7EXA_RpwZdhieOLtrTARqXSuo-gO9sVMdK5Qg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g7Y7vdvRJbv63W2SHWkQQcIEBj_piKfb
X-Proofpoint-ORIG-GUID: g7Y7vdvRJbv63W2SHWkQQcIEBj_piKfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501270043



On 1/24/2025 9:25 PM, Dmitry Baryshkov wrote:
> On Fri, 24 Jan 2025 at 17:24, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>
>>
>>
>> On 1/24/2025 8:34 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 24, 2025 at 04:23:07PM +0530, Viken Dadhaniya wrote:
>>>> Add provision to load firmware of Serial engine for I2C protocol from
>>>> Linux Execution Environment on running on APPS processor.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>>    drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> index 7bbd478171e0..9ad3b8c9a224 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -872,8 +872,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>>       }
>>>>       proto = geni_se_read_proto(&gi2c->se);
>>>>       if (proto != GENI_SE_I2C) {
>>>> -            ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>>>> -            goto err_resources;
>>>> +            ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
>>>
>>> Hmm, so if the SE has been configured to e.g. SPI by the TZ, can we
>>> switch it to the I2C?
>>
>> No, in the current design, TZ will not load the SE firmware.
> 
> But that's what your patch is doing: if the protocol is not I2C, try
> switching to I2C.
> 
> Instead it should be 'if unconfigured, try loading I2C'.

Sure, I will update it in the next patch.

> 
>>
>>>
>>>> +            if (ret) {
>>>> +                    dev_err(gi2c->se.dev, "i2c firmware load failed ret: %d\n", ret);
>>>> +                    goto err_resources;
>>>> +            }
>>>>       }
>>>>
>>>>       if (desc && desc->no_dma_support)
>>>> --
>>>> 2.34.1
>>>>
>>>
> 
> 
> 

