Return-Path: <linux-i2c+bounces-8288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA09DFF1B
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 11:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01676162A1F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 10:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78701FC7E1;
	Mon,  2 Dec 2024 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bB237hTh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041921FA167;
	Mon,  2 Dec 2024 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135931; cv=none; b=YwuQ6mwTncdK+fkxNEbeWbyxjfF7FzXR3uqL1r3+kDrH7oaNhS5XR9xskYAtu1jvMf36K2Ygog4pN6Ja8vnrfnVN8JySiagL+Hun6gUnSet58n/7SrxINR0/+Deu3Rv/GWsKFnW77xU6Ury0Rm3WkIwo7YqJ1PoAwWSVicUONqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135931; c=relaxed/simple;
	bh=xq4/zibJqs9u59J47321rNAIXakwQHU8aJr2KNWhmH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M/20exlHZaBkE8u0gr5F8MaDXClZH1RpzVKc8Ol8y6zT+DjagKTej/hUkI2cijfvTQNlsrEWkuuJbS+f/QTuiA4MejPt0fansg1Qc+9vRMpGslE0081QDh924+PowH8M4TaaF266COjUt4zC4Ea9wV+E4N+m9cld6etx+1sSg38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bB237hTh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28FTmd010150;
	Mon, 2 Dec 2024 10:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QokvOmAeXS2pzu+o2hv8yJRAkcehKPf6CYuyamVQhNA=; b=bB237hThHk51n9Vl
	zOq+2Hv8tPCaFHOlCyCy8g9Hwae+za73d+rJqygIhQ02Ds5Bca7dw26UvU05H1uw
	0j8RFJ4PihCh1JxsUx+Pjnm1JuYov50bp4oCgvQwcajWiGFi2ZW+1z9qUcJT61oe
	YJoUxaU33PIQidEOG9uREX+ch/8egRBZ7UOOg1gd+apC+yV+yTblLbBtBlEiQid+
	w/KfKKJh7XBWM8anpoSZgzSjo/dMriykxTKYgHLte7PKNVnbBHTgCwskop3XV7CS
	vJe6fgru9+uluP+8Or3bGjzuaPF9hA5Ahx7oDsHbw0i59ecA+Vt6YimckAxZcRRI
	ri1dNA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gcjfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 10:38:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2AceJo021925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 10:38:40 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 02:38:35 -0800
Message-ID: <c870f63a-3beb-4364-a993-880736d4bbe0@quicinc.com>
Date: Mon, 2 Dec 2024 16:08:32 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <5gy5gldcybby53irzyu6lejbwb6wcorb2k4qpd4j7yrijemehu@wmj3tgvxvhdy>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <5gy5gldcybby53irzyu6lejbwb6wcorb2k4qpd4j7yrijemehu@wmj3tgvxvhdy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Iqwo8wXRqHerd0zJUI5oTPAC4Fk09XcW
X-Proofpoint-ORIG-GUID: Iqwo8wXRqHerd0zJUI5oTPAC4Fk09XcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020094

Hi Bjorn, Thanks for the review !

On 11/30/2024 10:15 AM, Bjorn Andersson wrote:
> On Fri, Nov 29, 2024 at 08:13:54PM +0530, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
>> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
>>
> 
> Per https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> your commit message should start with a description of your problem.
> "Add" isn't the right word to start a problem description with.
Problem statement i have explained in cover letter, let me add here too 
in V6. I thought same story gets repeated here. Will not start with Add, 
but problem statement and need of this flag.
>> SE(Serial Engine HW controller acting as protocol master controller) is an
>> I2C controller. Basically a programmable SERDES(serializer/deserializer)
> 
> "Basically"?
will remove this.
> 
>> coupled with data DMA entity, capable in handling a bus protocol, and data
>> moves to/from system memory.
>>
>> Two clients from different processors can share an I2C controller for same
>> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
>> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
>> can perform i2c transactions.
>>
> 
> The DeviceTree binding describes properties used to describe the
> hardware; your commit message describes what a SE is and that it can
> exist can exist in a configuration with multiple client etc etc.
> 
I have explained the use of flag, and background surrounding to the 
feature. See the V4 and V5 and earlier, where i was required to explain 
and open up about "what is SE" ?
Because of the SE word in flag name, i had to expand with explanation.
>> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
>>
> 
> This isn't what this patch implements. It defines a property which when
> specified means to the OS that any DMA transfers should be performed
> using TRE lock/unlock operations.
I agree, it adds onto understanding about the flag feature. I can remove 
this statement in V6. Let me get complete agreement.
> 
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..88682a333399 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,14 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  qcom,shared-se:
>> +    description: True if I2C controller is shared between two or more system processors.
> 
> This attempts to describe the property.
I agree, thats why i limited but there was an ask to understand what is 
SE ? hence i added below.
> 
>> +        SE(Serial Engine HW controller working as protocol master controller) is an
>> +        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
>> +        coupled with data DMA entity, capable in handling a bus protocol, and data
>> +        moves to/from system memory.
> 
> But this is basically just 4 lines of text expanding the acronym "se",
> but while it might give some insight into what this binding (the whole
> binding) is about, I'm afraid it doesn't add value to the understanding
> of the property...
> 
""se" is also not explained in the binding - please open it and look for
such explanation."

It was required to explain based on comment on V4, V5 hence i did. 
Please let me know if one line is enough to explain flag usage OR we 
need exact description from the hardware programming guide ?

I will need to get agreement on this patch first and then upload V6.

> Regards,
> Bjorn
> 
>> +    type: boolean
>> +
>>     reg:
>>       maxItems: 1
>>   
>> -- 
>> 2.25.1
>>

