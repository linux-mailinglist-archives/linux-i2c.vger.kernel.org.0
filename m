Return-Path: <linux-i2c+bounces-14675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB1CD5B49
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 12:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75616300CCCB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 11:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180B63191DF;
	Mon, 22 Dec 2025 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjRHVZd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2rmSqUz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A982295DB8
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401382; cv=none; b=T7TbSsA9Rv4XpxkUkFYVRAUHVrTexjdWaZofYumSfROKgbQR6Cz/BOu+eYzXYktYgWHV4hY1d0HqLx30UprnPAPVXP3AKp1/BhSPxyyL1VC0mrQHlLLoJh0ipP7lZB4ECpg5LWjffW7hMlssSEueB/+G28PLVQuAZY/574z9cWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401382; c=relaxed/simple;
	bh=V58aHeBvB4nTNxTrIGwrE3WLIbUB4XyGJoqOW2PqIao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncoXwjj0xvt4dwFCAne/YuZC90t/uYUm/a3Hv0Kk6CroCKQkO18IcYSrkXOGlxY5Jw+w9bsA0Jf8+ZlBWNjXmGgc5d6hGN/tfQwo8VvlkbymVrSDzAavL+JrrMaqsVq4VvtT9DawtJ472X9CCUDlvcjkm9wviWN4I8nkP0bzQH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjRHVZd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2rmSqUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5gNnJ2189854
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 11:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=; b=BjRHVZd/3nQ8hnOP
	NhIrhAjKw1Rchi4jS6RJYfv8P26N+OWl/TJesrk2oj4rP6MzGOMx347Xif+vDwgn
	dNZpcn7vpGEGGPSR9T58rFDm/1bYT1CnJ9M5u9CfJwGIBDZvhHrmztxrDZLBZu9m
	wQcwa0cWqlBZqC0kbCKxfyCiwSEYrj+UlZwpIAsCEl85fUz4ETuVSiyVuEQ4ZPsS
	Z1K0pdg1AffVMgjID1hIhv4NFTwDZsJxidqRPzgIFV6efH6bJEMopSFIglJWff50
	grzhbuL/q+3wOpKIn7cXKfMPGmXSaL29WJLKH7TfydIzU95CkEmqrCTHNQXdtwAA
	TC6rjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t8xfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 11:03:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fa6f808cso1098228885a.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 03:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766401380; x=1767006180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=;
        b=P2rmSqUzE0J6OnIPeBtU4HEl3kGo1txYNCRSogRUsHMDZhQDhnxFGvnBsX342tV266
         Tiv5Ogzz0H3t+aSzm7UfI5un+/YeV/GZvxJbjT7z32Vz1iUJZkUmucR3zExdoWrfjVvF
         IiVlwoe/Hd9OoGWgGfC23p1B8Idg+sP5TnWb8LLrCgylYVmS2YQdaWJvc1XK7Prnb/ag
         Og6VMjU0vHoD2r5uRlJcXhNhfWGGdVGPpNEzrmA5itdRzmBB3LHS15ZseQTzzddyYi6Z
         SIi7x68QGV+0aywZSFf3hQYiW42R7NgcE+sLz/+cLPqf8huftfKox2BDIyhytynKqpuC
         8Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401380; x=1767006180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=;
        b=CX2vO0pNnkN46+IIJJeXnKTWBfCFeBMC3sATfJL5vFFeYCT/HYezrbkZlMb9YviDfq
         pCmBPlbrsaWAziYCiyZ8pmDq5BstS1+pl46b+mEUMuZ/NfOmT7NacWQnNdOsjUM5Bypp
         iziEAUA2T0oeR5E2ypCfHl88Y3ZTPQME6EMmzEnghdou3U89cIwj7b6KHNrmD4FFLM1H
         OB0mCQS5W/dCcr3gROXXXrY/E5PKIdPWphUrKWG7x4YnNVZT3DomLQU9dC4KL2zMPpji
         Cm+ARTP9N4wnpdDWIGqrpBiukWRPrPTYoi/ZjeDxoGAaNwB3vLLtMuIG27eyY0I6RjKL
         Pyow==
X-Forwarded-Encrypted: i=1; AJvYcCVxinANURI1aBVHguAjdMOBppex6zC9j8VrPACP9BWGKMGT6jxYAqHOEFf5WIRywweDBqPb6QwN7To=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+8nrRVUsYQg9hQMWDNpxmnnucNVR+CwONpy6bPWVqi5S5Ywm4
	YvFg5gt66e+U9DJDHN6dwQvttXcowDnuj3xwE0V0zzUBLi37aukdNM2DIYt4uNK1in+QmSJQdkI
	u79gg+fLc6fIR4bcKJWj5EaL1WLR0aIpgreZWN5KWGWrEuS78mm8KrvRZWqCwqW8=
X-Gm-Gg: AY/fxX64UmpRsDggNzC0J4nJCgcNXqi5y4NF+nxs4mnW5eDRfY3HBIRc6tvsiKICJWn
	8nIbD2OvAnXiYKdFng7YeDPL8OS+Qiq+SEcl4XbYgA2DHQs8BugJUK2daORDlYRpB1AqPD5KpP/
	GYLZx9o79qHX7vK0Cppq9fVpQS5zxqpX3exkOcLNNtoDoe5wjkfrEEi2BUU7FUjkypJ/OpeTi8H
	FLTUSP+FPwxy8o0HTNPUywQtwLijEb2aLM663B/w5cJHWoFTQ0tvbvK9kPSpapZgz4v9iyZkHC2
	OgJzBmHMZFuJj6qRMvJQ/TrAW/q9ZtOARkHNyIO0AiI21cjBS7bH8x/+wr2ntMOA6KMv9TFKgVD
	KoPydMWcH0iszXAqJ3+jkrCSDd0Ti7TT9AfzkI7coO0cqfnyHf7MH0vxajOgagwujRBYjvz6l
X-Received: by 2002:a05:620a:2697:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c08fd32cebmr1637529185a.60.1766401379583;
        Mon, 22 Dec 2025 03:02:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFgc4/mbxP1v0Y6Y+66GXLM/In3vvQag3zr/Bzdv0DzMO4r//tvzBx5y45NhOvo3FD7nI95Q==
X-Received: by 2002:a05:620a:2697:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c08fd32cebmr1637522485a.60.1766401378889;
        Mon, 22 Dec 2025 03:02:58 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ef6a7sm777484085a.55.2025.12.22.03.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:02:58 -0800 (PST)
Message-ID: <a371b7d4-4a6e-4d9c-b86d-14b4cfe7a6eb@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 19:02:50 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
 <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
 <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
 <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=69492564 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jtnMdLYT_4TzbHYvX8gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OvDiv2eheMEMsiltJNCleUei6-8dDG1F
X-Proofpoint-GUID: OvDiv2eheMEMsiltJNCleUei6-8dDG1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMCBTYWx0ZWRfXxTkYqDthLH92
 tDd4apHDhC3eaX5pWaJ3SWlZdR+IiQ0KfbRmcnUAH1Sbb9pBkCx5dnMEpvDMPvMkSul+InED6Yq
 z6vmoEHCfPDlBFNv5JCoTy7MGHIEkRPsmSJ85YOPIUr2eFwk8FgmuRk8I2IDyeQ3WyY6+vBgRf/
 h8xF3ehX4hMaHFgks4lB9DrtSi/mt4eNEYavnacrrhjxxliHbVcP0BT18HpPnPz7E5H6bcjX+s5
 oXBRu47noVUmCH4qFRH83jr9AKbnF4SYy8IE52hr74Q74FEgYbUXvuQsZEm7xs2csRbXzDZPtFy
 S+SgTGfVmg49UtjqMghvSf/TF5wxluAtrgtYfsxHPrSlrOc15CpSKG/0Fqvj1hVusCUdVH1srkg
 JtnSpUFUsXgfssQbJFd5HKUi2PBzdS9tcj3C2BFO8pXZ0C9ed6XXTMhqnlvXtivc00MzUVSm+HF
 S0fIR+HN+T2LLEZ/utg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220100



On 12/22/2025 5:49 PM, Konrad Dybcio wrote:
> On 12/22/25 10:13 AM, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>>> Add the sm6150 CCI device string compatible.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -33,6 +33,7 @@ properties:
>>>>                  - qcom,sc8280xp-cci
>>>>                  - qcom,sdm670-cci
>>>>                  - qcom,sdm845-cci
>>>> +              - qcom,sm6150-cci
>>>>                  - qcom,sm6350-cci
>>>>                  - qcom,sm8250-cci
>>>>                  - qcom,sm8450-cci
>>>> @@ -263,6 +264,23 @@ allOf:
>>>>                - const: cpas_ahb
>>>>                - const: cci
>>>>    +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>>
>>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>>
>>
>> On this SOC, both soc_ahb and camnoc_axi exist.
>> Is it suggested that I use the existing ones below?
>>   - if:
>>        properties:
>>          compatible:
>>            contains:
>>              enum:
>>                - qcom,sdm670-cci
>>      then:
>>        properties:
>>          clocks:
>>            minItems: 4
>>            maxItems: 4
>>          clock-names:
>>            items:
>>              - const: camnoc_axi
>>              - const: soc_ahb
>>              - const: cpas_ahb
>>              - const: cci
> 
> Are both AXI and the two AHB clocks necessary for the CCI to operate?
> It wasn't the case on other similarly-aged platforms
> 
> Konrad

The test conclusion indicates that all three clocks are necessary.
all of them are necessary.

Thanks,
Wenmeng



