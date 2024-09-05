Return-Path: <linux-i2c+bounces-6222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70396CE8E
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 07:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84DB8B24788
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 05:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D48C188A38;
	Thu,  5 Sep 2024 05:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b5kMD/Ft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D779F5;
	Thu,  5 Sep 2024 05:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725515038; cv=none; b=cbk5zvsaCLimwQJ4CBoejoSdbUI5uoCXYd4L0yx0FcPqDaTmH90eBTVQHxqsJmxJrcNyQXFqJ5YFVfeIQTfcJRehN4sGABvGQJpA6NC/NV/qOtaLUc83hMnjzT1ttd5Q9lM/gL2fOtO2atJf0is+3oAj85cHBtCT4QOhVIrMvFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725515038; c=relaxed/simple;
	bh=q+zcd/AxeOziSdwbqUmOmd4zSWg5vCcozQ08BK137UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VcUA4FHiSnNV5ez6nc0oYYEIbkMJB2yZL8pVjFNMLJ05/yNtRx7xJXGy5bldG30mHRs6Kpi6Yx3TZURhQprWqPosgDxuH9zVhU8/QEIHsA/2fpdRBzvrzGqeGEuADWreLazJofekXR3coR5GjrT4fN3WnpyNUrQqoosnP63bffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b5kMD/Ft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484NukP7015153;
	Thu, 5 Sep 2024 05:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcLeOZ+VFMi0rCey5/OVrJLPv82lHpaGbxk1UvZ6Xi8=; b=b5kMD/FtYBIz82uf
	pihjmW+92urCeLvjUJtsPUMMePePEfCnZ3Z2CCdWwELQmNGnucgln+LympRrin9N
	u0IRi1MbiK/Ood9m3hO1Wo5FSjdfZAzXSKBdmwWyCeW+G1UBpTcAHbi1FTqzFQfw
	JM8wrDaGUDCLr32trkSARxvzQTXQkK6GTRwWd+ql9TbIDpzxRcKol5Lq9f+/dX/y
	ReOAc+56VDLBYX2y3GGIv/12+1qFadDDfBBAoZCP0xvOSFD7EK0xzcUsu9znIJAz
	Q49tLZUcgNIs4FLoMPbc8jGQejL6GWn/dogNdSVbO4xZNsgtPRXhqS2VKKf34BOy
	c3YlEA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69f1bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:43:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4855hpeU023840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 05:43:51 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 22:43:48 -0700
Message-ID: <dc434cb2-7eb0-48fc-967f-5ed93ad1284c@quicinc.com>
Date: Thu, 5 Sep 2024 11:13:45 +0530
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <a4bbb898-bf91-4dcb-b7da-ab032b228aa2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bcmTdO1uQoLMnXacK3-MvmrmdQ_WTYJ2
X-Proofpoint-ORIG-GUID: bcmTdO1uQoLMnXacK3-MvmrmdQ_WTYJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=445 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050040



On 9/4/2024 11:50 PM, Krzysztof Kozlowski wrote:
> On 04/09/2024 20:12, Mukesh Kumar Savaliya wrote:
>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>>> people, so fix your workflow. Tools might also fail if you work on some
>>> ancient tree (don't, instead use mainline) or work on fork of kernel
>>> (don't, instead use mainline). Just use b4 and everything should be
>>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>>> patches to the patchset.
>>>
>>> You missed at least devicetree list (maybe more), so this won't be
>>> tested by automated tooling. Performing review on untested code might be
>>> a waste of time.
>>>
>>
>> You mean flag addition into DTSI file ? If yes, then the intention was
>> to just enable feature support but not into mainline because it should
>> happen per board or usecase. Please suggest if i can enable particular
>> node with DTSI feature flag.
>> Please correct me if my understanding on your ask went wrong.
> 
> How is this related?
"You missed at least devicetree list (maybe more)" - Do you mean to say 
i missed to add DTSI changes OR maintainers for DTSI ? seeking clarity 
to avoid confusion.
> 
> Best regards,
> Krzysztof
> 
> 

