Return-Path: <linux-i2c+bounces-8011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1389D04E5
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2024 18:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6D6281EBF
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2024 17:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD85C1DA631;
	Sun, 17 Nov 2024 17:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GrcmPlGp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CE17591;
	Sun, 17 Nov 2024 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731865577; cv=none; b=BSqJLqWEZXxb6zeFWRjjyFdp+LhREA6Tw4ngMWg/dSWc/442bgvuzZhp9BUEZ7pO8ohdtIBgE6U8bEbP433znugaY6EdYiGaAgdpdTK7AD9i3LZ9dsW1x18qj9fRF5xj3VirpQ7DjkTEPWryQnCijB/FNBjNOnFgrxTs8f+KMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731865577; c=relaxed/simple;
	bh=d4PA4dekFrbPidu64a4HKq8oTBnE6bajLq9aru2A85E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UKsGMrphv/YTC0Jbx3qXTqfE3bS5/KCZH9itq/y/XMPtH2y7S66zgaYjfBQ8FjTsDEGkmAe8FtNveZAeJCMPmdIYymxVR2r6gvrAnkFy1m8kVRW5UE4RrbJNs7OIVQ2SY1Ql/HExfNA6XItpxgunZW5d6ACJ8Y58qtB0yVY61MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GrcmPlGp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AHGMi5T029188;
	Sun, 17 Nov 2024 17:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AfYabs+tjtdSrn/b9JlV7O8Zk+qQd/9P8eF6s33xDM4=; b=GrcmPlGpthJZGBjt
	JrwzVJQbVc5lcBKq5uiAiaR/3U74r4epvC1eAq6kZyk9VT+8K2/B9Qxbj2Vfe2cu
	bqVwWlPvaxTgN7cJNCBhNGhpCT6F/32ULQFnS83q0BbZlEC+GlY/qM7wrUtgkGlx
	jo+Ax8a/JjGcqlUr6jx0SsS5HFaayP2YDYy1ye6wzgIa+b7UUvvL3Vl1FmpRrm81
	3M3TDAR/7DZnXA9tpkDpMWdc9bc5rkSbRVlUzfMLgyQmyzdJ076A9B8ZbHKoKy4l
	sVIK9yvHW2orB2R/axMa/R71W4cpY9HBoqtEb70pLmSSqOfDlI56JHMsCm+ZDEoT
	0jqjwA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkrm2hvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 17:46:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AHHk2h9007072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 17:46:02 GMT
Received: from [10.216.44.33] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 09:45:55 -0800
Message-ID: <ff20d185-4db4-482b-b6dd-06e46124b8ab@quicinc.com>
Date: Sun, 17 Nov 2024 23:15:51 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Rob Herring <robh@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <vkoul@kernel.org>,
        <linux@treblig.org>, <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-2-quic_msavaliy@quicinc.com>
 <20241115173156.GA3432253-robh@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20241115173156.GA3432253-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TrqZK6ySCZyw15zvzb8M31VMCLnuwXst
X-Proofpoint-ORIG-GUID: TrqZK6ySCZyw15zvzb8M31VMCLnuwXst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411170160

Thanks Rob for your review and comments !

On 11/15/2024 11:01 PM, Rob Herring wrote:
> On Wed, Nov 13, 2024 at 09:44:10PM +0530, Mukesh Kumar Savaliya wrote:
>> Adds qcom,is-shared flag usage. Use this flag when I2C serial controller
> 
> Doesn't match the property name.
Sure, i need to change the name here as qcom,shared-se, will upload a 
new patch.
> 
>> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
>>
>> Two clients from different processors can share an I2C controller for same
>> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
>> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
>> can perform i2c transactions.
>>
>> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..fe36938712f7 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  qcom,shared-se:
> 
> What is 'se'? Is that defined somewhere?
> 
SE is Serial Engine acting as I2C controller. Let me add second line for 
SE here also.

It's mentioned in source code in Patch 3 where it's used.
 >>> True if serial engine is shared between multiprocessors OR 
Execution Environment.

>> +    description: True if I2C controller is shared between two or more system processors.
>> +    type: boolean
>> +
>>     reg:
>>       maxItems: 1
>>   
>> -- 
>> 2.25.1
>>

