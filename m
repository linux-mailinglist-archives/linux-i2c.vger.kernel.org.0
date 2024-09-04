Return-Path: <linux-i2c+bounces-6208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D283596C63B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 20:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907C828617E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0556F1E1A36;
	Wed,  4 Sep 2024 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SFpGh1IZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63C1DA319;
	Wed,  4 Sep 2024 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474106; cv=none; b=kH1s43Lt/g6ymOB2klJ4ICARa3h+eMYDiv4y8DpLl68DwDOYv/7A2EZXiga8FjLpsUkdUXL3ecLkpqQBGftUzTYYSlhm49Hi3GnCIXyRz2zW6zjd3Xa4xVSDtXoVITW7LhgFIBH/myjP/k4Ca3C3NewcHmhgtZuwEvqwAOIc1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474106; c=relaxed/simple;
	bh=ivVzmakiww/mUgwhOJvDoHiy3lho5R3DvgRbZFSLzKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SHdb/RBTtzQikDJHbPGfqMgOhsn0w5ckgI+tShUYwaPS6SrQuNddn9LG/RyJr2DAy96CvwyOqclxHHD7GdL1Fn4/1j8NfbnH6q6iOrcbkIpkwRMPcb1M6aTcDLKtTQRxPhZWQPiAvld0DiBAPQa4MCfgKUGwv9jN+YFH1YAFhFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SFpGh1IZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484EDVSP019788;
	Wed, 4 Sep 2024 18:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcmCAzv7dM3casnsHLsBoi6XQz7cclsKAfbdyrnzQ58=; b=SFpGh1IZEE6ebgJX
	rKy/vr4rr03xLAmB9ga2fpoP3Ube7zHcoPFNEtrjIMIyQ/a9Z6yXY0glMDy+uol9
	UKWkH8HgzRQj77efqC+yEBE8XS9dDNjHHc2BqFVyrybHuctI6b2oxyAB6WAjz2YX
	3AEQ3XQ3B8aAEbFISSLlkYn+iYsNZdFeKByHAZ9TCjlCs3qvxiQYTwoN2k7oGJHd
	fRaPE3X9WWBfqIlhbnbnrKWu9mARbzN7x+4rboucd3FrTwWXhx92IN2Gu2QhGDcy
	mo4YWAF7B/R30J4q/aus1w4M+Mx+To5VmRyFdjNTFN3FJZERnUVY3UX7UnG+aH6X
	RLxQcA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrt56b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 18:21:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484ILeKK026328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 18:21:40 GMT
Received: from [10.216.2.237] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 11:21:37 -0700
Message-ID: <46653560-d8ea-4255-9df2-40a141d16fe3@quicinc.com>
Date: Wed, 4 Sep 2024 23:51:32 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <9eed39f3-baf3-41cb-bd19-361d76207b09@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <9eed39f3-baf3-41cb-bd19-361d76207b09@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dI7adEftBAyJ8zeSt_UJfxJmbXNDVk-8
X-Proofpoint-GUID: dI7adEftBAyJ8zeSt_UJfxJmbXNDVk-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_16,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 adultscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=1 mlxlogscore=191 spamscore=1 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040138



On 8/29/2024 3:26 PM, Bryan O'Donoghue wrote:
> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>> This Series adds support to share QUP based I2C SE between subsystems.
>> Each subsystem should have its own GPII which interacts between SE and
>> GSI DMA HW engine.
> 
> What is SE ?
> 
> GPII - general purpose interrupt ... ?
> 
> You have too many acronyms here, which makes reading and understanding 
> your cover letter a bit hard.
> 
> Please define at least the term SE in your cover letter and in your patch.
> 
> In the patch you use the term TRE which without diving into the code I 
> vaguely remember is a register..
> 
> - GPII
> - GSI
> - SE
> - TRE
> 
> Need to be defined to make what's going on in this series more "grokable".
> 
> A cover letter should assume a reviewer is familiar with the basics of a 
> system - no need to define what I2C is but, similarly shouldn't assume a 
> reviewer is numerate in the taxonomy of vendor specific architecture 
> e.g. whats SE ?
> 
> ---
Sure,  Understood what to mention instead of short names. Let me have 
cover letter and upload next patch.
> bod

