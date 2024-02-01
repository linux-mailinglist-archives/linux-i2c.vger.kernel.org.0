Return-Path: <linux-i2c+bounces-1584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A0845533
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C3651C22E31
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 10:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92F015B981;
	Thu,  1 Feb 2024 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QzsCbL1w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A80E15B111;
	Thu,  1 Feb 2024 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706783042; cv=none; b=bNmyekD4s+9wmpboZCK9nlR4OO5DDA4v9E6VEgSr2V9Z5Lsw4wsvAdYOiUdxNso+IYlFEIttp7vC7H27zcpdSD7DdKB+z09/DFrc5X48FU6lSVOB3Jd5ya5FKDswHK24N1VCYyonsH78UpdA8ONamv0j6byHWFcK8ZvMUKpQeko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706783042; c=relaxed/simple;
	bh=UzApKOwAu6KXGb5r1whM6A4X+Y50am79ZhevAwHik4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=emonwBriARi70uyCW8iryzXl1MZvK/TBAxTBj7eiuP1xelmmCiJYQB8q2M9gCCVGuEhEkqZhkwHiEDAekG7W9ZpkW4bbbvydTRhkReva7QrUBxpbZkTfUwDNRE5NKc8feXO8vm19UbbFgl2+Mi2QTcUS7ZbJwo3ZWF1ZfF7+/OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QzsCbL1w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4114lBkn008203;
	Thu, 1 Feb 2024 10:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=kjEZOoEUgErW7tInatabktJlStgF5tg8wctHS4rIlqE=; b=Qz
	sCbL1wgasU3hyMC2egYkGbUatO1HmHULroMq1aFUy1VcziuFk78RTXPKEVb9MLbn
	jugIiah6NnayI7O4ZfBVSVxmiGvm8O5wNpSuE8wJsdSCFAtkktaIYGF2bqGbJVzm
	sDSpJObKLGiXCbF1m4YTC3E2D8GzbbVE1AZmK4IbnaBXW3KMZCGNchvURWv/8ThX
	BRtuiGzUOFtZuBiFIch3QMpfpzxoK7yINfT4CKMns0sRS0SnNWvBTjP6bdmFyH9/
	o5RPF/mp2jfwIEvZH+CakVBNViYmiUgsakck8awwJfyCrFP/lnc/1nGDfkkt3knf
	kEZjOu8khZN8IiCJdh7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w03hh8xc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 10:23:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 411ANtda012887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 10:23:55 GMT
Received: from [10.218.25.146] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 02:23:52 -0800
Message-ID: <ad0b0ce4-3f20-4268-ab86-165a9e8bfbff@quicinc.com>
Date: Thu, 1 Feb 2024 15:53:48 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
        <quic_bjorande@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>
References: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
 <b94c4c9f-a3dd-40fb-a80e-569199e93ee2@nexus-software.ie>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <b94c4c9f-a3dd-40fb-a80e-569199e93ee2@nexus-software.ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RkpqUqceY4130C-Rrf38Q_5Bf7i7cDqk
X-Proofpoint-ORIG-GUID: RkpqUqceY4130C-Rrf38Q_5Bf7i7cDqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=717 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010083



On 1/30/2024 8:54 PM, Bryan O'Donoghue wrote:
> On 29/01/2024 06:10, Viken Dadhaniya wrote:
>> As per HPG(Hardware programming guide
> 
> Since you are doing a V3 here, please amend this too.
> 
> "As per HPG" means almost nothing outside of qcom.
> 
> "As per Qualcomm's internal Hardware Programming Guide"
> 
> Right thing to do to reference the document IMO but, you should make 
> clear its an internal silicon specification that's not public.
> 
> Also not sure the TRE description adds much.
> 
> Just give a high level description of the sequences being out-of-order 
> with respect to the hardware spec.
> 
> ---
> bod

Updated commit log and provided TRE description with sequence in V3.

