Return-Path: <linux-i2c+bounces-7057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E5988410
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 14:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1091F228E2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 12:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F5318BC0A;
	Fri, 27 Sep 2024 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fo5sIA+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5F18BBB6;
	Fri, 27 Sep 2024 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727439590; cv=none; b=QLeEnr14FARhjDksq5izPBgw4wIeoR4vSYCRIZQWFIwHM6H7tVGhWVoj1g9gJAuXZzvU4YHOlbjjtxeeiqA8TnymxcdlllxIE8xdQxubhfIQhlw0xj4BjygC1esmzkHCSvNer1RMZc/ye3H3MHNLlNHF8NQC/OwKXqBI+/AZnug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727439590; c=relaxed/simple;
	bh=/15zZNSKOt2WUEVyGxetW5cGg/kn6L1W66o0KMpYX3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qy376liEWWcI4+fMV43CJSWkKqoURTJJ+lKjORh+7+anzC4MuL8NcvTUGzpdXX5sozp6Jv50sGlnKb9Ev5cbdwGwanBkEPQHhRkldyMx1Pj6yj2jR4sZjWXJ4ln9mSc75xlcn4z2dnj7A5p5RwnUpnTezj5XrwNxhC1suTHBfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fo5sIA+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6WIuN022973;
	Fri, 27 Sep 2024 12:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25c2JxjzCkcKhseOpu3Fe5tPOLmd9XRrGTGy4VnlaGQ=; b=fo5sIA+Y8l+EF2Mr
	8YETJT/aSFUOmzM1c22Yyh1LpVcIHJMTVpvAOHG8lt12TfT0zlOPtu9h/doYdsat
	cERN+L1CdqEeHXLRh1KccIodGFxejQ6FA7dqQt4a7joLbBDMMNJF+2duMvFWs4+W
	XKMW+7YF2SB8CwlznTVumC51Tee6P82aSWqdRzdyj812VFPvQkN8XVTHpyeiAT9M
	9ctWr3XrG6qRShtbcHFGp5oSZmP3x79Yh63AXI4r/4V2V57wXvwwR/SaW/wDUNBK
	mPWnfGKZrDpCU015gNQcCyLdFJNW6EjelKKnX7S+Yj0GNgt8RdNlc1oFEtmQjed5
	RJMEYA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwf2nwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 12:19:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RCJNdj022748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 12:19:23 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 05:19:20 -0700
Message-ID: <85b156c8-aef5-4080-bc4d-e1bb8a4f0977@quicinc.com>
Date: Fri, 27 Sep 2024 17:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>,
        <vkoul@kernel.org>
References: <20240402102741.128424-1-quic_msavaliy@quicinc.com>
 <uib7it3noxnkekza4p4ngf5w677fizrb7j5ov7ekos2vinge5x@sh24m63gmkrr>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <uib7it3noxnkekza4p4ngf5w677fizrb7j5ov7ekos2vinge5x@sh24m63gmkrr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TBCQ83xMowucYXQYLzxzzTB90mzCTuq8
X-Proofpoint-ORIG-GUID: TBCQ83xMowucYXQYLzxzzTB90mzCTuq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=591 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270089

Hi Andi, sorry. Yes this is active. let me push V2 addressing comments 
for V1. i was completely away earlier hence restarting now.

On 9/12/2024 3:32 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
> Is this patch still needed? Can anyone active in the Qualcomm
> drivers take a look?
> 
> On Tue, Apr 02, 2024 at 03:57:41PM GMT, Mukesh Kumar Savaliya wrote:
>> pm_runtime_get_sync() function fails during PM early resume and returning
>> -EACCES because runtime PM for the device is disabled at the early stage
>> causing i2c transfer to fail. Make changes to serve transfer with force
>> resume.
>>
>> 1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
>>     to avoid timeout of transfer when IRQ is not enabled during early stage.
>> 2. Do force resume if pm_runtime_get_sync() is failing after system
>>     suspend when runtime PM is not enabled.
>> 3. Increment power usage count after forced resume to balance
>>     it against regular runtime suspend.
>>
>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> 
> Should this be considered a fix?
> 
> Thanks,
> Andi

