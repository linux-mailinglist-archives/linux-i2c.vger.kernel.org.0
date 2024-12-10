Return-Path: <linux-i2c+bounces-8421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8179EB495
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 16:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF69188CE18
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319681BC9E2;
	Tue, 10 Dec 2024 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dUQOl3sW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E8C1BBBFE;
	Tue, 10 Dec 2024 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843888; cv=none; b=DzphXfDVSXWFjuLgUQ5cc27i14fRMp5Ds7mpIXAhPWcm3RX+uFCX1HJwEhsa38PF6PezVZsiH259veW3IgvONLY1qR/va/y/VdwRvOGlHLdhF67vuUm+5b0I7fZ3S6sQXwHvoYYAfbTVTnu6JKxPJ6qAWiWBnM7WTVIP6mMrwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843888; c=relaxed/simple;
	bh=tOy1G/JZrmzRfuXZ0Q0Hh02cgUP2YcOj7buPQNBL8zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RCrzCYLDipXcWQtuLIDS5p5aBVRYUNE2LDSz/63Xnrxbk43fqTNbFdommuQOGbd8cRUE/mURpc8m8nYo0rultCFKDbnnElAl+sV5EMLmCTTSFaq2zikafJnAiPVck0C04aYUFS+blwmhcfWNTfumnrqLKH+ZBOuR0j/QevxjwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dUQOl3sW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6uEBA029735;
	Tue, 10 Dec 2024 15:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtJ7fOVPeoJwLZ+A564HttuAjBY4FNWU+He/2xg5Hqw=; b=dUQOl3sWlDUmu4WH
	p8WdE/DJiVZ+m3b/GSpqpL0G2ap81Eb6BL/b6O13I0obLzzn7k3o+iIt2Mrj9XbG
	ZqsC5WRGFH2ZKcVua/uF+Sy2DJC4Nbpgxl1un68ueJMEQvAfAlHhduNQjNmryk9D
	KW/ZboLzHwXEV3dyZga5FNCl8A4ElZDG4DdMsI/kKVbVHd8L0WWp3kNcQ3JcuoAs
	+0Rx6NEE6+24sMhHXLwQpNoyH0CCO4pCkZP0qLvprAnwiLjr8wjkrH0+5lzE59x9
	uSBeVUYRwfD9fKagiwnEJGajy5IzDpn3SuqLNMw0Ye9sGmxNWGOpM0L0IeMEYfti
	k7x9gw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceets0ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAFHvd2022953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:57 GMT
Received: from [10.50.34.16] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 07:17:50 -0800
Message-ID: <aad3c217-a6f6-4415-8e08-8fc113504756@quicinc.com>
Date: Tue, 10 Dec 2024 20:47:46 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Konrad Dybcio <konradybcio@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <vkoul@kernel.org>,
        <linux@treblig.org>, <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <db428697-a9dc-46e1-abbe-73341306403f@kernel.org>
 <a8b1ccd2-c37b-4a6f-b592-caf1a53be02c@quicinc.com>
 <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
 <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
 <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
 <da2ba3df-eb47-4b55-a0c9-e038a3b9da30@quicinc.com>
 <a7186553-d8f6-46d4-88da-d042a4a340e2@oss.qualcomm.com>
 <e9fb294b-b6b8-4034-84c9-a25b83321399@kernel.org>
 <835ac8c6-3fbb-4a0d-aa07-716d1c8aad7c@gmail.com>
 <f1fa2bde-95ce-45e9-ad2d-f1d82ec6303c@kernel.org>
 <8b33f935-04a9-48df-8ea1-f6b98efecb9d@kernel.org>
 <422e6a1e-e76a-4ebc-a0a5-64c47ea57823@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <422e6a1e-e76a-4ebc-a0a5-64c47ea57823@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FgDd4Kn40aXhYot_ppiyyClpWm46Vym4
X-Proofpoint-ORIG-GUID: FgDd4Kn40aXhYot_ppiyyClpWm46Vym4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100114

Thanks Konrad !

On 12/10/2024 6:08 PM, Konrad Dybcio wrote:
> 
> 
> On 12/10/24 13:05, Krzysztof Kozlowski wrote:
>> On 10/12/2024 12:53, Krzysztof Kozlowski wrote:
>>>>>> I'm not sure a single property name+description can fit all possible
>>>>>> cases here. The hardware being "shared" can mean a number of 
>>>>>> different
>>>>>
>>>>> Existing property does not explain anything more, either. To recap -
>>>>> this block is SE and property is named "se-shared", so basically it is
>>>>> equal to just "shared". "shared" is indeed quite vague, so I was
>>>>> expecting some wider work here.
>>>>>
>>>>>
>>>>>> things, with some blocks having hardware provisions for that, while
>>>>>> others may have totally none and rely on external mechanisms (e.g.
>>>>>> a shared memory buffer) to indicate whether an external entity
>>>>>> manages power to them.
>>>>>
>>>>> We have properties for that too. Qualcomm SoCs need once per year for
>>>>> such shared properties. BAM has two or three. IPA has two. There are
>>>>> probably even more blocks which I don't remember now.
>>>>
>>>> So, the problem is "driver must not toggle GPIO states", because
>>>> "the bus controller must not be muxed away from the endpoint".
>>>> You can come up with a number of similar problems by swapping out
>>>> the quoted text.
>>>>
>>>> We can either describe what the driver must do (A), or what the
>>>> reason for it is (B).
>>>>
>>>>
>>>> If we go with A, we could have a property like:
>>>>
>>>> &i2c1 {
>>>>     externally-handled-resources = <(EHR_PINCTRL_STATE | 
>>>> EHR_CLOCK_RATE)>
>>>> };
>>>>
>>>> which would be a generic list of things that the OS would have to
>>>> tiptoe around, fitting Linux's framework split quite well
>>>>
>>>>
>>>>
>>>> or if we go with B, we could add a property like:
>>>>
>>>> &i2c1 {
>>>>     qcom,shared-controller;
>>>> };
>>>>
>>>> which would hide the implementation details into the driver
>>>>
>>>> I could see both approaches having their place, but in this specific
>>>> instance I think A would be more fitting, as the problem is quite
>>>> simple.
>>>
>>>
>>> The second is fine with me, maybe missing information about "whom" do
>>> you share it with. Or maybe we get to the point that all this is
>>> specific to SoC, thus implied by compatible and we do not need
>>> downstream approach (another discussion in USB pushed by Qcom: I want
>>> one compatible and 1000 properties).
>>>
>>> I really wished Qualcomm start reworking their bindings before they are
>>> being sent upstream to match standard DT guidelines, not downstream
>>> approach. Somehow these hundreds reviews we give could result in new
>>> patches doing things better, not just repeating the same issues.
>>
>> This is BTW v5, with all the same concerns from v1 and still no answers
>> in commit msg about these concerns. Nothing explained in commit msg
>> which hardware needs it or why the same SoC have it once shared, once
>> not (exclusive). Basically there is nothing here corresponding to any
>> real product, so since five versions all this for me is just copy-paste
>> from downstream approach.
> 
> So since this is a software contract and not a hardware
> feature, this is not bound to any specific SoC or "firmware",
> but rather to what runs on other cores (e.g. DSPs, MCUs spread
> across the SoC or in a different software world, like TZ).
> 
> Specifying the specific intended use would be helpful though,
> indeed.
> 
> Let's see if we can somehow make this saner.
> 
> 
> Mukesh, do we have any spare registers that we could use to
> indicate that a given SE is shared? Preferably within the
> SE's register space itself. The bootloader or another entity
> (DSP or what have you) would then set that bit before Linux
> runs and we could skip the bindings story altogether.
> 
There would be spare register but i think it should be in sync with 
hardware team. let me check with them and update back if any bit can be 
repurposed for this feature. I agree, if any register is available, it 
can programmed prior to kernel.
> It would need to be reserved on all SoCs though (future and
> past), to make sure the contract is always held up, but I
> think finding a persistent bit that has never been used
> shouldn't be impossible.
> 
Yes, let me check it with hardware and firmware team and update back. 
Does this mean, there can't be a such software sharing mechanism (purely 
software decision) based on DTSI flag ?
> Konrad


