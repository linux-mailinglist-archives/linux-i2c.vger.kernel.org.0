Return-Path: <linux-i2c+bounces-8289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80E9DFF20
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F7E281F1F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083431FC7FA;
	Mon,  2 Dec 2024 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oBszyV/y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B451FC10B;
	Mon,  2 Dec 2024 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135948; cv=none; b=jW2cmEilyR9lAPa3papcWe/8/mtq9BY0+g3XsqGI6LEzSFiI7sMeWQPIlF2LqPK0kVz7LWZrIly7430R9v7TcVIbvz9L4CIdFgbrkie0ifiBIeLBm7gk6PYa/llTLfEtIXei0tK6kBNq3Scu6gzDA8omh12mA2ycYaq+z5MqdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135948; c=relaxed/simple;
	bh=+7ETQDg75FDaMN2tHLOFJJXpPrKr72sq+AlAwmom8eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IV0vWRwRD0S/qHqfDscX6uNiqkCvlcOvvty/xLktMKBnAKR0311FYAiKbEnVgXx8q1hneaxlBqW6k9Q0VU+fD9uuBdZPauQ/z50W+6FT16TcxrWYLLibScPQKd6UXuC5UQ3iiMdDAMa+YOfAqMsDixNkcaXAb6ibjnsRFA3/puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oBszyV/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28GJUK015491;
	Mon, 2 Dec 2024 10:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArYsUuvWFhKBEn+eNtXUtY8w1E0udYJZnwMLOWNYJ30=; b=oBszyV/yZ3lWSc2t
	IRYXnQDjq8tZyt/CDbljZlzWiFodWbQcWQM4/SpcY230yyZZf1FhDhR+sIHLzZbZ
	GRylVUI64ICyOKgB3nKBTXlMIu6Lep9jrJkTJPlx2gG13w5Az0Pmh1Vw+n02elVm
	tcFJWWhPfnSvsgGVWy65KjNBI9T7xUw4rVWQqWC/HVXl9m5qVn4PPiLeZ3ByfJ2g
	c1v1xbBz+7Y+4ZsPOIC1eXb6pwPjul0RXIxh7dMWQfQ+22Zu3FikU5xm/+qgf07T
	kqcq9YYagrYKfbiD+botCSX+eeXfhcqtFT6l5Dr4T2sl9N7tgVtkJAfGOiKwwnvK
	jLvyXQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36cgna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 10:38:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2AcwFI014811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 10:38:58 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 02:38:52 -0800
Message-ID: <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
Date: Mon, 2 Dec 2024 16:08:49 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
 <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
 <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O_3Mh964Wb-YTHdPZ2yEppkbXviRDQFh
X-Proofpoint-ORIG-GUID: O_3Mh964Wb-YTHdPZ2yEppkbXviRDQFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020094

Thanks Krzysztof for giving clarity on ask and reviewing this change.

On 12/2/2024 12:49 PM, Krzysztof Kozlowski wrote:
> On 02/12/2024 05:00, Mukesh Kumar Savaliya wrote:
>> Hi Krzysztof,
>>
>> On 11/29/2024 8:44 PM, Krzysztof Kozlowski wrote:
>>> On 29/11/2024 15:43, Mukesh Kumar Savaliya wrote:
>>>> Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
>>>> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
>>>>
>>>> SE(Serial Engine HW controller acting as protocol master controller) is an
>>>> I2C controller. Basically a programmable SERDES(serializer/deserializer)
>>>> coupled with data DMA entity, capable in handling a bus protocol, and data
>>>> moves to/from system memory.
>>>>
>>>> Two clients from different processors can share an I2C controller for same
>>>> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
>>>> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
>>>> can perform i2c transactions.
>>>>
>>>> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> index 9f66a3bb1f80..88682a333399 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>>>> @@ -60,6 +60,14 @@ properties:
>>>>      power-domains:
>>>>        maxItems: 1
>>>>    
>>>> +  qcom,shared-se:
>>>> +    description: True if I2C controller is shared between two or more system processors.
>>>> +        SE(Serial Engine HW controller working as protocol master controller) is an
>>>> +        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
>>>> +        coupled with data DMA entity, capable in handling a bus protocol, and data
>>>> +        moves to/from system memory.
>>> I replied why I NAK it. You did not really address my concerns, but
>>> replied with some generic statement. After that generic statement you
>>> gave me exactly 0 seconds to react and you sent v5.
>>>
>> Sorry for 0 seconds, i thought of addressing comment and uploading it
>> new patch as i wanted to explain SE. whatever i have added for SE
>> explanation is in qualcomm hardware programming guide document.
>>> Really 0 seconds to respond to your comment, while you give yourself
>>> days to respond to my comments.
>>>
>>> This is not how it works.
>>>
>> Sure, let me first conclude here what exactly should be done.
>>> NAK
>>>
>>> Implement previous feedback. Don't send any new versions before you
>>> understand what you have to do and get some agreement with reviewers.
>>>
>> Sure, this is definitely a good way. what did i do for previous comment ?
>> I have opened SE and expanded, explained.
>>
>> which statement or explanation should i rephrase ? Is it description
>> statement from this yaml file ? Could you please suggested better word
>> instead of shared-se if this flag name is not suitable ?
>>
>> I could not get this ask -
>> "There are few of such flags already and there are some patches adding
>> it in different flavors."
> 
> Come with one flag or enum, if needed, covering all your cases like this.
> 
Let me explain, this feature is one of the additional software case 
adding on base protocol support. if we dont have more than one usecase 
or repurposing this feature, why do we need to add enums ? I see one 
flag gpi_mode but it's internal to driver not exposed to user or expose 
any usecase/feature.

Below was our earlier context, just wanted to add for clarity.
--
 > Is sharing of IP blocks going to be also for other devices? If yes, then
 > this should be one property for all Qualcomm devices. If not, then be
 > sure that this is the case because I will bring it up if you come with
 > one more solution for something else.
 >
IP blocks like SE can be shared. Here we are talking about I2C sharing.
In future it can be SPI sharing. But design wise it fits better to add
flag per SE node. Same we shall be adding for SPI too in future.

Please let me know your further suggestions.
--

As we want to finalize agreement on this dt-bindings patch, will wait 
for agreement and confirmation before V6.

> Best regards,
> Krzysztof

