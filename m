Return-Path: <linux-i2c+bounces-2276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A238875F84
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3E50B21846
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3DC1CA9A;
	Fri,  8 Mar 2024 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R0Gk5oDx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874C3214;
	Fri,  8 Mar 2024 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709886680; cv=none; b=J7XMoWmgxlQ9OXTr/7MC/n4VDFWgzfjDs25td+L/EJrdUGMObMrS9T6oxlG2NiKKyxM2+r5/bfnBx9WytlMNc3y8gPGSBgRJF/mSFl4mjxUB+at8SZhh94XVfWN3svJ4vRlCxRECMtQFk+IUtAf2FAchqT6aA8I40yt/EDkX3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709886680; c=relaxed/simple;
	bh=+DF9vRiArhUyXhhhb8gcTRYI1HSCO9TwBHB3JFkJRDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tdi6uJoygLVwjiOw/cHQtUliNRFMo6T+Gi3JUcTecrI0dy4ULTDKkij7fM+xATC9YjqL2USd1bSUCQsYs9b6Vu0PK6Z1nZxLSIbYcT3441M+H+NsoFC32n7t7aL4hp7LiV6JVK92ZT9PcEvRHEm1ddSp9p2CDUDdKRtcZUvQlZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R0Gk5oDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42868sT2006942;
	Fri, 8 Mar 2024 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=yIccJuIEDZZJkTHxklIyIAT7gx8dwfNVhqyWMGhbaOU=; b=R0
	Gk5oDxvvzonVZ9Xa7t+iNWmMoGGMJ277dApNecQLZQ2FTqbyl7V+uYDWJaGVakAx
	A3lh1G1RPFhrU8ISsyi+FgPdxJntX2DVXKdUHvv66LvDW6nXRQ7xwbq1keH7qyGD
	ATGyGzwryNddxbW5icy8Hj284Qe4efb+T4A5NX2kE7wz5+WwWI2nU95itN6aGiBi
	6waqWcvzv9orZ2mO3m4MT3vP9Y2ldpFujUpwxG8JCMnxAjypI9ubhxudrlbGWFqI
	D59Y16TXXfbcx7A45mtgKu/rmN2b88dRfvHRzHrU5pbmS20g8KUMX+uMuZJyhzT6
	ZvPj3CxacKFce6z+wcAw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqn8n18re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 08:31:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4288VEOb024189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Mar 2024 08:31:14 GMT
Received: from [10.216.43.112] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Mar
 2024 00:31:10 -0800
Message-ID: <6bacd2be-14d4-49cc-9c98-7010a5f9f9bc@quicinc.com>
Date: Fri, 8 Mar 2024 14:01:07 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>, <vkoul@kernel.org>,
        <wsa@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <cmtru4nvoab6g5emp2yrxnvfpvtrcsuna6dqsyewpagg3qmkau@r2zoj6vgslet>
 <9dbe987a-fdd1-4bec-b350-5936abf69b1b@quicinc.com>
 <yocn3rjxn37c7qniv2kkawgg2k7ghdwvrxcf77tdlpujnul3du@6oqvt5v4ykno>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <yocn3rjxn37c7qniv2kkawgg2k7ghdwvrxcf77tdlpujnul3du@6oqvt5v4ykno>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PFNXOaHvYy00tuIf_lCSNwkrriXsvgFP
X-Proofpoint-GUID: PFNXOaHvYy00tuIf_lCSNwkrriXsvgFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 mlxlogscore=921 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080066



On 3/8/2024 12:32 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
> ...
> 
>>>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
>>>
>>> I still don't understand what's the fix here. You are making a
>>> generic DMA error to be more specific... where is the bug? What
>>> exactly is broken now?
>>>
>> This is about being particular while reporting specific error.
>> Like i mentioned, instead of generic DMA transfer error, it should be
>> particular error 1) NACK 2) BUT_PROTO 3)ARB_LOST.
>> Ofcourse when data transfer via DMA fails, it can be considered as
>> DMA Txfer fail.
>> In summary so far driver was considering all failure as txfer failure,
>> but i2c has errors which are kind of response/condition on the bus.
> 
> I understand that, but what I need to know is: does the system
> crash? does the system act in unexpected way?
> 
> Moving from "you received an error" to "you received a nack" is
> not a fix, it's an improvement and it should not have the Fixes
> tag.
> 
> Having the Fixes tag decides which path this patch will take to
> to reach upstream. It's important because after it gets to
> upstream other people will take your patch and backport it older
> kernels.
> 
> I want to avoid this extra work when not necessary.
> 

Sure, then i think i should be removing fixes tag. It's not a crash but
it's an improvement. That being said, i think don't need to CC stable 
kernel list and i should remove fixes tag ?

>> Sorry if it confusing still, but please let me know if anything required to
>> be updated in  commit log which can bring clarity.
>>
>>> Besides, keep in mind, that commits with fixes tags get
>>> backported to older kernels (this one dates back to 5.18) and you
>>> should also Cc the stable mailing list:
>>>
>>> Cc: <stable@vger.kernel.org> # v5.18+
>>
>> Sure, will add into CC. was waiting for reviewed-by tag.
> 
> No need to resend.

ok, sure.

> 
> Thanks,
> Andi

