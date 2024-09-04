Return-Path: <linux-i2c+bounces-6205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D4F96C615
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9B21F23D76
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F14E1E1A26;
	Wed,  4 Sep 2024 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ghkzN2/v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3F6E619;
	Wed,  4 Sep 2024 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473584; cv=none; b=lKNb2+cqjTWjQbE5WZLfR3UF1NolERTYafUqdy0K9Uji/0PfEwbODg1C4/ajvTsd6MLnDafL2D326SZ33SbUEP/QJS+MCdlrsVYqFTcVBUKyYliN1ct0XJ6LtFQqmiOVKY90YJwMGGlF2L2SFnfF19t2w+RFEaohWs91xQgzDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473584; c=relaxed/simple;
	bh=Jk7G2TpsTASryJFRNVOP6PjlHuFQFoBYI80VRUHa6sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O1q0UmBrdlqEYq5CXfRpgDxVW0GVGAXP5P5PbLnKbpxxB31Ne+ZVGE9T9pZa5fwwsMy1ayJ9HPK1u6bN5IC6t0+KyuqEcZ6vcaCyVKjKri07Z4UvUdkkDZHzfIHG78zydzfJFF3MT1OcUslfrjqiNszotVb4+IbMvyVk4VRM/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ghkzN2/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4849hsAE004948;
	Wed, 4 Sep 2024 18:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+juPx8zIkxLO8OAnjniir1nw5bgl+Aua0oBeGYtwDK4=; b=ghkzN2/vfNNcJuPK
	J238D7bicUZm9gQu2GzB7mbRIO7gcPq/RVsNF587JOeQEqVhqQhDKJDeK5f6GNW0
	Ox7IJlMc5neF4n1t1VL5APBF0Bg3aqCXMnDJ/bpyhVC8/A6OTOqDYDkDGoIZXNeh
	XIq6gMOCUTJpSMmJihHhUfeokX4CIWRSirDlBpmHPJiyUutO70Nh/uszV8AI9kpu
	KgV9jv9lVPbRQc27+ibJsh8q+woGjJL8cSD6CgEjWdNuVcIrAIoVyD4mj6nT3Gob
	p1HV0pBwZk9aaCPeVDMVXT34M80LQ2hK6PUCR76l2gtNoezmcpffmUFRtcnio/wF
	BruQxA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe5xqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:12:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484ICvgr020097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:12:57 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:12:44 -0700
Message-ID: <cb7613d0-586e-4089-a1b6-2405f4dc4883@quicinc.com>
Date: Wed, 4 Sep 2024 23:42:40 +0530
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <74c13a4a-0d4b-4cbd-9a75-9933c098c3ba@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TdXD8YaUdYjnYX4-YPn70LKMeIjU7Q7F
X-Proofpoint-ORIG-GUID: TdXD8YaUdYjnYX4-YPn70LKMeIjU7Q7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_16,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 spamscore=0 mlxlogscore=478 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040137

Thanks Krzysztof for the review.

On 8/30/2024 1:41 PM, Krzysztof Kozlowski wrote:
> On 29/08/2024 11:24, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
Sorry, i forgot to add list for different SS. I am adding all 
maintainers and list after running maintainers scripts on each patch.

> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 

You mean flag addition into DTSI file ? If yes, then the intention was 
to just enable feature support but not into mainline because it should 
happen per board or usecase. Please suggest if i can enable particular 
node with DTSI feature flag.
Please correct me if my understanding on your ask went wrong.
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
> 
> Best regards,
> Krzysztof
> 
> 

