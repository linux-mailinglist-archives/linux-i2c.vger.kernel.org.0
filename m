Return-Path: <linux-i2c+bounces-9186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB65A1B94F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F2217A677C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F2B21C16D;
	Fri, 24 Jan 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LepAtf9M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2921B905;
	Fri, 24 Jan 2025 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737732288; cv=none; b=X2dPXJkMYScIDt13lTRcf6DzL0wTjQ7/IcFb0DMC23YOXadTXnyeQMaiNMmY+fDR+8flVTAjI6LLYZyExc2rUGJCHz3mIXM1RZUJyg7N+JALNSBSVtA7wvX3SnowhlhhiTMT0DCizX0EU3fE5RVyO9EgCzRrl7fP37g0DnJAWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737732288; c=relaxed/simple;
	bh=imFL5R+8tjW9nqG9MSwMdY0/9AKf8+BYg88n3+b4YE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jt67isfG9oJ1D+dipqbSwHGBlyQkmiRw4zSntDDRAFCiTeBkwJGnWGT58TAnKZdII4fbmSU96udHYWhfhHTCZFk1Ig8au4JoVk3iRTnvqTRXj6gbIfaLpPVzBwL0564tIb7q5yEQItWNyPTCkQxvN5j7wfUd9E4T83Qq5bjinxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LepAtf9M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAKRoI018282;
	Fri, 24 Jan 2025 15:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET8tXNLLKrCfhT/dhVNQHzs0wuHOfse/qmJ60kS6k2Q=; b=LepAtf9M97vIs+39
	YjLeR2hHHHDFGqi+lsJ7W1ibNvYl1Ni82/TEg3k5BgxVrdRQ3yLpj2SCOip4grqy
	0Fb/NYvqBNwqnsaSO3Bk0uO5Ds2dIIMfYPn9P6O+jJuD+kPZnD5aeNdBIRsbB4SX
	ZvbRlpV0ZCfAjaG6ff65rcMSq+Rrb01cdcF0MVSMoOjVSShH7smzOlFrgecXJ66j
	+LHz/DwKPDk3gPRSoI00taHmdcu5+fa0OyW05d/qrOBcF/QA3+sC1SZRlqcpWsGM
	m0TvsjAwczBtr4cZf7h5nXeJzlMeBrXKpp8uZw6jY+Ku7EVv3imvjoPYntBcKUCb
	fFnvzg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c91agsve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 15:24:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OFOdZ7008866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 15:24:39 GMT
Received: from [10.216.19.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 07:24:33 -0800
Message-ID: <08545d45-bfe6-45e4-b7be-503c318315af@quicinc.com>
Date: Fri, 24 Jan 2025 20:54:30 +0530
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
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <d3tydp3m7pehhiphupwybjlol5v2u3sabqotqximxmnswjlczb@jmdzpbrcrgou>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IifrpbkiE1laDfES6spHOtwly77cZwum
X-Proofpoint-GUID: IifrpbkiE1laDfES6spHOtwly77cZwum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108



On 1/24/2025 8:34 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 24, 2025 at 04:23:07PM +0530, Viken Dadhaniya wrote:
>> Add provision to load firmware of Serial engine for I2C protocol from
>> Linux Execution Environment on running on APPS processor.
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7bbd478171e0..9ad3b8c9a224 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -872,8 +872,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	}
>>   	proto = geni_se_read_proto(&gi2c->se);
>>   	if (proto != GENI_SE_I2C) {
>> -		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>> -		goto err_resources;
>> +		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> 
> Hmm, so if the SE has been configured to e.g. SPI by the TZ, can we
> switch it to the I2C?

No, in the current design, TZ will not load the SE firmware.

> 
>> +		if (ret) {
>> +			dev_err(gi2c->se.dev, "i2c firmware load failed ret: %d\n", ret);
>> +			goto err_resources;
>> +		}
>>   	}
>>   
>>   	if (desc && desc->no_dma_support)
>> -- 
>> 2.34.1
>>
> 

