Return-Path: <linux-i2c+bounces-6239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A05F796D6EB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B3D01F21F3B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 11:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E66199954;
	Thu,  5 Sep 2024 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MxqGHbKZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3341993BD;
	Thu,  5 Sep 2024 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725535074; cv=none; b=sbtY10a01v1eUL1vFtJT6cR+0vssITgUVFZHM2uLTPpNHnqXTVx39OfTWxZw1MvrVEXXRHy9dzZDZ1nwHO+UQAZ+nG1n09tvcn4tjSiB6M0bPYyiKtOf7nobhebMCaCgnDZtpJ2eZSjVBjBcMPexCl5HTrtUWA//RIMYatcr+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725535074; c=relaxed/simple;
	bh=rNrJ+Makhp2ktAUjt0H56eLtGv83se7Mi4bk2avFFpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LUDMopp4ziD9D+TIVMHl8X4J7DLEpmT7LfizDrJrnbXSV1glT1puqbkH1kajDtS0R29qcZ+Khjz8lSpdSRSoXyD4fpQPYqvXQZ1Ox8VrKoonGlm1FIrr2aJJBl9FKJNAOFCBNJZZ9xQcZC1JCGiU/rDDrs/Jc+ACdzQYi8aRaMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MxqGHbKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485972JM021519;
	Thu, 5 Sep 2024 11:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMfNsE+5T6Pgtpnj6f0bQbM5X6p1IlyIxLopnCPDoPE=; b=MxqGHbKZ9oHD61B0
	1R+VQttmpKU9cXEYLZKbNS06zDVXgADKGodw+ZvBKzAuGSf0ti7eKsl8eGkSIFfH
	zxZJBWPdN9oKSrpGxa7zU+Zwo+IuIPytWIHwYT6MRQ8qR2mT450hSkhHlIOU627w
	xWsYaomqMyY3K6C5wqKY0XHLdkGgN1YN/hIt7bcAIdjnwauVXyfM4B8/6KhQ5nYs
	9XWOyCekXEKlwDFAo6ysq2W7+xoGmAqeq8WlOC0HHE04pgNwVVLH/9pKPPplhxRl
	08HPDKaZnrj8Nilet5raGUGKvkLbpviAP6ksikEyKv7NM1LYg3FKd3ukLZjFzjo9
	pdbdpQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41f6rngta5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 11:17:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485BHltr020377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 11:17:47 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 04:17:44 -0700
Message-ID: <2b7d98e4-dc6b-48e1-9aa8-cf8c6310aacd@quicinc.com>
Date: Thu, 5 Sep 2024 16:47:41 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
 <74c13a4a-0d4b-4cbd-9a75-9933c098c3ba@kernel.org>
 <cb7613d0-586e-4089-a1b6-2405f4dc4883@quicinc.com>
 <a4bbb898-bf91-4dcb-b7da-ab032b228aa2@kernel.org>
 <dc434cb2-7eb0-48fc-967f-5ed93ad1284c@quicinc.com>
 <497c8852-8aa5-4d46-b547-9ca22f1c7673@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <497c8852-8aa5-4d46-b547-9ca22f1c7673@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JxnS--uIEVaMfPRt1JfPVdCaS-R6DSVf
X-Proofpoint-ORIG-GUID: JxnS--uIEVaMfPRt1JfPVdCaS-R6DSVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0
 mlxlogscore=606 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409050083



On 9/5/2024 11:51 AM, Krzysztof Kozlowski wrote:
> On 05/09/2024 07:43, Mukesh Kumar Savaliya wrote:
>>
>>
>> On 9/4/2024 11:50 PM, Krzysztof Kozlowski wrote:
>>> On 04/09/2024 20:12, Mukesh Kumar Savaliya wrote:
>>>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>>>>> people, so fix your workflow. Tools might also fail if you work on some
>>>>> ancient tree (don't, instead use mainline) or work on fork of kernel
>>>>> (don't, instead use mainline). Just use b4 and everything should be
>>>>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>>>>> patches to the patchset.
>>>>>
>>>>> You missed at least devicetree list (maybe more), so this won't be
>>>>> tested by automated tooling. Performing review on untested code might be
>>>>> a waste of time.
>>>>>
>>>>
>>>> You mean flag addition into DTSI file ? If yes, then the intention was
>>>> to just enable feature support but not into mainline because it should
>>>> happen per board or usecase. Please suggest if i can enable particular
>>>> node with DTSI feature flag.
>>>> Please correct me if my understanding on your ask went wrong.
>>>
>>> How is this related?
>> "You missed at least devicetree list (maybe more)" - Do you mean to say
>> i missed to add DTSI changes OR maintainers for DTSI ? seeking clarity
>> to avoid confusion.
> 
> You did not CC maintainers and necessary list. I wrote nothing about
> DTSI. You are expected to use tools, not manually come with some address
> list.
> 
Got it, yes, i missed to add necessary list subsystem wise, sorry. 
Thanks Krzysztof.
> Best regards,
> Krzysztof
> 

