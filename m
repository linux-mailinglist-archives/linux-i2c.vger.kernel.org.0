Return-Path: <linux-i2c+bounces-2251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A78874BDD
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 11:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DCF7281A03
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 10:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5F1129A9E;
	Thu,  7 Mar 2024 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XQtsZgcJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB70127B69;
	Thu,  7 Mar 2024 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805796; cv=none; b=dlZ2drj3siaDlWrj8DhliA4BXNgrbFKzGJ6lQ/RoQyLbEQidovxCDbdzAs6o8Ec7YVVEKEJtcJw3RNxdKP6LLKFslfkrNlkMvjY/JHbl1wIcC43MwNOjhrOJKuU6bT0cLtT9GRWHU7/kJgphUxznJ44SOdJvBXavB+HmCUMR+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805796; c=relaxed/simple;
	bh=zJyo4bnZGLxCdnY9Pzpotz8jl2H6vBOxOn7RieSQHoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sHvXvMHu/6T15F1wFtarzkk1znOc2gTtLVzeg4jRpwzeD22bpRe24sxSLEFqsAf2F4zcNWCgFSMY9GtGcIVd+75Oc18YfIuBoaqQXsNQndqRMO6o0AY0dd1Td+3HPPl9QtnfDnJf3I9+lijktbTJtPhxvcSk+N4+6fnAAGINxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XQtsZgcJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4279PBub030562;
	Thu, 7 Mar 2024 10:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qyIQAGdttLWJE5dmHv7lEFyOysIlQJZF4NtHIZb++L0=; b=XQ
	tsZgcJCnZCI7yv/QAViXLFGkSJP2iVEhQNWRkSRtvlLanl9rZMcwcCKY4uErZCJ/
	+KfoEeI+3i+j1CTGS5931hqqiAeF+pgAS6xuNCrnOKKIqg476jIVp9PTdU/Eta8/
	Cw+y5iCqafvS0vnptXop+Om7iTVeIdx6QUMLDU9niPNSUyglPvnvajieWhYUzrpB
	5IJWj0N15xAikZcbDh8ZgrUEAXkqbt0SBU0SRDqzxU9/NgLq+uUETaIGkw4qW0oG
	FYBwFfM2to9ILH8/+cm1LwTrPnqV9SjmvOQRewstu0PfIyG68++3ZVMLl277Giwa
	RqiIyDUA/Bct/4b7QAew==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqaxd02m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 10:03:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 427A3Axv018481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 10:03:10 GMT
Received: from [10.216.46.193] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 02:03:04 -0800
Message-ID: <9769c51f-a672-4ec9-b1c8-d8022f1988f5@quicinc.com>
Date: Thu, 7 Mar 2024 15:32:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <bjorn.andersson@linaro.org>,
        <vkoul@kernel.org>, <wsa@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>
References: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
 <2wala6lz4vanhvfx6jtpdexnpohabuvhzt4i7kt2xvmlfrapq4@tmvl37npj7jy>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <2wala6lz4vanhvfx6jtpdexnpohabuvhzt4i7kt2xvmlfrapq4@tmvl37npj7jy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LFmIAbC4mhK5uPI_FFbzuPwYzrryFWn3
X-Proofpoint-ORIG-GUID: LFmIAbC4mhK5uPI_FFbzuPwYzrryFWn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070073



On 3/2/2024 12:14 AM, Andi Shyti wrote:
> Hi Mukesh,
> 
> (I'm sorry for the noise but my mail server has marked this mail
> as spam and put the spam tag in front of the subject. Therefore,
> my reply might have been marked as spam.)
> 
> I'm going to send a new e-mail with the old answers.
> 

Sure, no problem. Sorry for the late reply.

> On Fri, Mar 01, 2024 at 04:56:38PM +0530, Mukesh Kumar Savaliya wrote:
>> we are seeing protocol errors like NACK as transfer failure but
> 
> /we/We/
> 

Done

>> ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.
>>
>> Hence we are adding such error support in GSI mode and reporting it
>> accordingly by adding respective error logs.
>>
>> geni_i2c_gpi_xfer() needed to allocate heap based memory instead of
> 
> Please use the imperative form.
> 

Thanks. New patch uploaded which doesn't need memory allocation dynamically.

>> stack memory to handle and store the geni_i2c_dev handle.
>>
>> Copy event status from GSI driver to the i2c device status and parse
>> error when callback comes from gsi driver to the i2c driver. In the
>> gpi.c, we need to store callback param into i2c config data structure
>> so that inside the i2c driver, we can check what exactly the error is
>> and parse it accordingly.
>>
>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> 
> What bug are you fixing here? The description doesn't talk about
> fixes rather than support added.
> 

Updated commit log in a latest patch. Basically we are getting simple
transfer error which ideally should be NACK error. This happens while
running scan test for devices.

> ...
> 
>> -	config.peripheral_config = &peripheral;
>> -	config.peripheral_size = sizeof(peripheral);
>> +	peripheral = devm_kzalloc(gi2c->se.dev, sizeof(*peripheral), GFP_KERNEL);
>> +	if (!peripheral)
>> +		return -ENOMEM;
> 
> This is a massive leak. Why are you deciding to make the
> allocation dynamic?
> 

Agree, It's a memory leak. Thanks for catching BUG. Considered other 
approach which doesn't need new structure and dynamic memory allocation.

> Thanks,
> Andi
> 

