Return-Path: <linux-i2c+bounces-13684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8400BF2C80
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 19:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B24B74FAEAE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 17:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D5C3321D0;
	Mon, 20 Oct 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHyLNtPh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60EB278779
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982137; cv=none; b=joc8W18bXJRTq0Cnf0blnTGPidmCGabEcq8tVaHgqsjkK8bypwczYnmZxdKq9qKXDdQHGPNicinfeJPcHK7kpkpUtZo5Zi3Khr4PT40tvguSwUzYlFUyrZ6y8Bu9go/Jy2SHjpE4beyNQNjgJIqffCztRwGda7F7IK8WJFY7W10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982137; c=relaxed/simple;
	bh=9qA6BuFeIx5fHAIGIw0nel7ZY5DQlvVmFai+iklLtRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+9k5WfqNMOjDiRXYXd/QZrdwzyBzkfL3i/Njh1otR+uUP9CcwJK9lb7SgsjB1h7XOxI/fZUXuSrvgfOsIW/IOqznsX3P4igRdXcACawFdjdhwS33EjDhiRKzGyjzwhjZT9cIIDgXnYRAeTE3fDQCtwZI9K/B1WnZTl/iL0MyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHyLNtPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KADf6t002432
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 17:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuH6NKm3t0y7yTW2TM5liGhGfdwbrDlainmDiWhRs0g=; b=WHyLNtPhuwLKPt2f
	l46aPJiAmy9GaLuPuLg5rUH09NC/JYrKTf3gQsiHkIlVhN55/kld2WCIKBYKHNpm
	Rs9K4+PfLVVqWabGUAtVhwz6kjve4f1/FLjAe3+OVS8HEJYuWGXPJ/5rKELh2/hI
	yY25V/ZuSq0YqmFF9z92HgAgxufq+Y5wHofNqdIrcsae9rbrRHuu8OFcbEQGnWLq
	pOnVrr2qltSfiVIf+B8sL16AOd0QX2hsJtYedIafB6EQLsxcx7DJdF7y4RwJrXeF
	JmVl/2zpMFPrCcwKpXfY3HbTSTgF70yZrQqzL17Usu842Ma7+0YPgNVx2Z4OdjmP
	7s/XRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343wkb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 17:42:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27eca7298d9so111995075ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 10:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982134; x=1761586934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuH6NKm3t0y7yTW2TM5liGhGfdwbrDlainmDiWhRs0g=;
        b=kuxE0/4PSTCAeYe3fhBZ4SxKu3coqQUxMoOf+nVKn8RzpA77+PJxBYt5KtK9eG7/ah
         1Njo6HSK3gG6P6bM0vwB8l1IBr3qsl51I068Fx7hVxcMHy+ZtdOu+iSZEueyai7nKIfb
         rrfFM+m4z1mYdGPvqeCWTh8OeBcNG6+LNg2RIZkEH191RUzGPhGj/ySCEItSlNbxx2qU
         mVZ0FL2Ip0dcHYVIJSPMaDqGPY/FwE90oh41ywQyubaohvZCSBagJusgBPbsrAOqlclV
         uG2Cx5gJ7j45phplNjnbAsz4eBNyDwHLVQFKkDszww15AsJxArPgBf6prsFr7YHd3ZTj
         XCyA==
X-Forwarded-Encrypted: i=1; AJvYcCW9G1bXmc4sqD6NBF0FNlbQiAGmfkPu8IdGXReN3jg/8ysZ3t41307A/S8dLIPlXYo97yjUAwlCnFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUPoIE8PHU2CqfwWoSS78ZBKCoJ3EimX/kesAa2GFtOl865Le
	p9vNOfq8AlMTqi44fGGG3+FAbEJL1PLXCwnyMeVQDHrd2POb9rRwgBWHpWgPlhwjJdpsWjK7DM1
	E+WMgOWc6e95j89omTIDWjWbr+jGqAYYSu1gxq9TcfKyR/iQnUYEJ/17AQa+SbbI=
X-Gm-Gg: ASbGncvkMpTYI7Z7rocXtzxwwhWGDO9P/+X5M0nWX/jG+mz/ARII1Oc8HbUuoxp7cJj
	3H+RtMhw3Y/pdwp5jWjlnoJ6l7Cwy4MK0A6FMh6euJUvP0yBSS429/9aPmhnqsNXEtqDSQapk03
	UN4ceulVFCrbZ4Yw38i5hLx1JFMURmYmxsWal8vxaOEoNLudS9iHfcYxLfPSPsz8MZjQ9vOy9V3
	IKd0F1M5ZNdFlPjiOiiHk1q6tVAUCpmq0LDKsrBsZbi5oCR9s/J++GsB8Kb4ROg4y5I01p4fX9c
	UI5hwU/o07j86EonyZ59chzFG5fohKfJ9hrUayKDFxwhs2a0lBZL+f6V9gmJl2o/pJJYnvSWMmx
	bLxQZmgVufbvTGE0g0HvuHw9klK6i9xmq5wg/0ptcdCWd1RCX6+KL6Q==
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id d9443c01a7336-290c9d1b4d0mr172936085ad.13.1760982133862;
        Mon, 20 Oct 2025 10:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmgh6tUXTbf1pGfo1ASimL2b+7pT6kMnii6yInuvVAI5pWnTr0w6G4M9GWEUp4lc/J1jtUyQ==
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id d9443c01a7336-290c9d1b4d0mr172935595ad.13.1760982133165;
        Mon, 20 Oct 2025 10:42:13 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf67sm85874235ad.15.2025.10.20.10.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 10:42:12 -0700 (PDT)
Message-ID: <63d9252c-77d5-4405-a395-d7664c35ea12@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 10:42:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
 <a7be3a42-bd4f-46dc-b6de-2b0c0320cb0d@oss.qualcomm.com>
 <d8dfe11f-c55a-4eb2-930a-bfa31670bef0@kernel.org>
 <CAFEp6-1zpobZNLHt1192Ahtn2O7bV+As0P1YvVHrkRsORyH_Aw@mail.gmail.com>
 <ac96922e-d2a3-4a99-8f34-a822c3dd2d02@kernel.org>
 <7140b8a8-1380-4859-84a3-681b3f1ce505@kernel.org>
 <f5a1076f-f06c-404d-88d4-fef4f7694c82@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <f5a1076f-f06c-404d-88d4-fef4f7694c82@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LIpC3aUJIGU3YP6UELj8ksdOwL356ri2
X-Proofpoint-ORIG-GUID: LIpC3aUJIGU3YP6UELj8ksdOwL356ri2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9ztPNi4ekGbA
 jIoXqPYBXEqUiH6RuxjXJ8OTPpRj0T3Suu56HxonqpumP5uxtDlC01HjtiWA/p8XHK98QZPfRYN
 RsXIaM8+x2z4EnyZ7lq9WRp02A9vrdyT1YaW2cAieQfroPDQLrDp/V0yfEknrX/pwHwS0uauLD0
 JZUxWNAIxd2q2WQxJSGmklHbIAFcs/7GPvlR27JkHL7/fcEwXUHDH6TAmAB/CGaHSVH3hZWddDD
 +xn7pXhhaeFDWYi4hNdXUL1KXIOm+53TMw+M7B3VQ7upmdNyiRPM0LhL856Jz/TcXnan1QMAaw7
 V8zmfugqEGG/Zke+a11bM67ox6O5ESprDxdbunTdJotgtVgutfSAEUqgbY7Xme7hTagNkqIz1Xu
 CrjXGVtnc7Xw8LZcLdFw8jdJ6kmn/Q==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f67477 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=_kPCHQoBruyNaNDuvIAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023


On 10/20/2025 3:56 AM, Bryan O'Donoghue wrote:
> On 20/10/2025 11:16, Krzysztof Kozlowski wrote:
>> On 16/10/2025 12:43, Krzysztof Kozlowski wrote:
>>> On 16/10/2025 10:47, Loic Poulain wrote:
>>>> On Thu, Oct 16, 2025 at 7:52 AM Krzysztof Kozlowski 
>>>> <krzk@kernel.org> wrote:
>>>>>
>>>>> On 15/10/2025 05:21, Hangxiang Ma wrote:
>>>>>>>> +      - const: csiphy4
>>>>>>>> +      - const: csiphy5
>>>>>>>> +      - const: vfe0
>>>>>>>> +      - const: vfe1
>>>>>>>> +      - const: vfe2
>>>>>>>> +      - const: vfe_lite0
>>>>>>>> +      - const: vfe_lite1
>>>>>>> Wouldn't it make sense to simplify this and have different camss 
>>>>>>> nodes
>>>>>>> for the 'main' and 'lite' paths?
>>>>>>>
>>>>>>> [...]
>>>>>> No such plan till now. Other series may take this into 
>>>>>> consideration.
>>>>>
>>>>> We don't care much about your plan. You are expected to send correct
>>>>> hardware description.
>>>>
>>>> To be fair, other platforms like sc8280xp-camss already have the
>>>> all-in big camss node.
>>>> Point is that if Lite and Main blocks are distinct enough we could
>>>> have two simpler nodes.
>>>> Would it make things any better from a dts and camss perspective?
>>>>
>>>>   camss: isp@9253000 {
>>>>      compatible = "qcom,kaanapali-camss";
>>>>      [...]
>>>> }
>>>>
>>>> camss-lite:ips@9273000 {
>>>>     compatible = "qcom,kaanapali-lite-camss";
>>>>      [...]
>>>> }
>>>>
>>>> That approach would create two distinct CAMSS instances and separate
>>>> media pipelines.
>>>> However, it may not work with the current implementation, as the CSI
>>>> PHYs would need to be shared between them.
>>>>
>>>> I guess this should be part of the broader discussion around
>>>> splitting/busifying CAMSS.
>>>
>>> And this discussion CAN happen now, stopping this camss and any future
>>> camss till we conclude the discussion. Whatever internal plans of that
>>> teams are, rejecting technical discussion based on "no plans for that"
>>> is a really bad argument, only stalling this patchset and raising 
>>> eyebrows.
>>
>>
>> To be clear, I expect Loic's comment to be fully and technically
>> addressed, not with "no plan for that".
>>
>> This blocks this patchset and any new versions.
>>
>> Best regards,
>> Krzysztof
>
> I think we should stick with the existing bindings.
>
> There is no "lite" ISP there are so-called lite blocks within the 
> CAMSS block.
>
> It makes sense to split out the PHYs from this block as they have 
> their own power-rails but, if you look at the block diagrams for this 
> IP there is no specific ISP lite, there are merely blocks within the 
> camera called lite.
>
> It might be nice to structure things like this 
> arch/arm64/boot/dts/rockchip/rk356x-base.dtsi with each component 
> separated out into its own node with its own compat string but, I'd 
> have a hard time justifying changing up the bindings we already have 
> for that reason - aside from anything else - all of those components 
> in CAMSS live inside of the TITAN_TOP_GDSC which is the power-domain 
> for the whole camera system.
>
> So not meaning to answer for Hangxiang but, I think the compelling 
> logic here is to stick to and extend the existing bindings.
>
> So in fact I have no problem with the bindings as submitted - not 
> including the regular fixups these types of submissions entail.
>
> ---
> bod
>
Hi @Bryan, @Krzysztof, just my two cents. I think we should consider 
separating CSIPHY, CSID, IFE and IFE Lite into distinct DT nodes. Having 
a modular DT structure brings in several advantages,

     1. Simple to manage with much better readability.
     2. Better control to disable certain HW modules from DT.
     3. Less error prone as we don't need to maintain long lists of 
clocks or other resources against their names. Accordingly, easy to review.
     4. No need to maintain resource lists within the CAMSS driver to 
identify the resources specific to the HW block. Offers centralized 
control for the HW resources.
     5. Allows re use between the platforms when a same version of a 
subset of HW modules is carried over to future chip sets.
     6. Is more scalable when we add more functionality to the CAMSS driver.
     7. Finally, it brings in parallel development ability with 
engineers (within the local teams) working on different HW modules 
within camera subsystem.

If not for the current patches in the pipeline, if you are comfortable 
with this approach, we will try to push the changes for the future chip 
sets with the modular bindings, leaving the existing SOC drivers and 
bindings untouched (if that's recommended). Please let us know your 
thoughts. Thanks.
>
>

