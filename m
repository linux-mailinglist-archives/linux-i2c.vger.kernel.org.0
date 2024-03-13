Return-Path: <linux-i2c+bounces-2346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E087A2B7
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 06:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A3A1F2279D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 05:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D824312E5C;
	Wed, 13 Mar 2024 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUaMZqaY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6910A1D;
	Wed, 13 Mar 2024 05:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710308145; cv=none; b=aEgMXsRhDPOF0xy64sg0q86bGx/Ll151Zw1LnRuBjdydKUNAmEx3g1Ikby05ZmRQNgQAQ0g/Da0jT69ukzbE2jmlF1DoSN9QipTpNucuUhS9Qdq4V31ucrZTcPMrOB9TDQTco0WN5rqMEv02yeL1CPeRRw2+wbcW/1OstYKybo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710308145; c=relaxed/simple;
	bh=icYO5AqGUEJy2g2FzBgaoVvXzp73Jbi9ol7QJfdrF4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KzcP9ib2kABmBDVXq2YlXtCJU9MsI5cJEd4JgnzU8tI4V2LfnTPCZA0/WA3bRaelgVw0RMn/Cm73IfPGUX/m8iYJOWyN1F4X/lQ949n+YQ1u/UiswtPBhlE7V3HEHlmdcpP5kLBbKE8OwwiQG2rPly8HLTEWvdWEmDusdtv0FxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUaMZqaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D3Dhnw026482;
	Wed, 13 Mar 2024 05:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cCwcK/aazlsFy8Zq3Ky6o32u5JSaZ75YFGnu+hvDL1M=; b=jU
	aMZqaYcdE1rEi2xEVBLaawc/DIuQ5LtLdCFHCYjZ6yn8sU3NTC+BeD8bRH+lsuG4
	AQT8AiIuhrbLdpEfyzKCOnYiG5FOA5ZMGHfCHSprqFHq9nHjf/5ggiRn8v0wGGS2
	o4/xdddGuPEbaQ3sEy7GIdLtF4abVVc9y+FxfV5iKx2ZXV4TswVQbv/0vEVJTy7T
	j6eJu2rfTb/sWnmuz7EZu6oxINuzjLAbvWTSO9G/bsNAf+FumXEDlHtblvepRUdC
	NoPDLL5/ck0vabsKiu/2izXwlzJou0p4XyvZsIb5/Yfvm49CcPNxQOclz9MI7xNE
	E385+4sIeeQFiK4/e6zg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtmpd2by2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 05:35:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42D5ZYWf019620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 05:35:34 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 22:35:30 -0700
Message-ID: <0971ac51-f823-4338-ba95-3ceced9d2a1c@quicinc.com>
Date: Wed, 13 Mar 2024 11:05:27 +0530
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
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>,
        Stephen Rothwell
	<sfr@canb.auug.org.au>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <a5oiihch2yqsosq337hogqzd3r4ldgfrzub4m6kofheh2k3qjv@wxageydv4q37>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <a5oiihch2yqsosq337hogqzd3r4ldgfrzub4m6kofheh2k3qjv@wxageydv4q37>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gb-huY-5_rp4JyJruohlt362HGxFuzk4
X-Proofpoint-ORIG-GUID: gb-huY-5_rp4JyJruohlt362HGxFuzk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_05,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=939 mlxscore=0
 spamscore=0 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130040

Hi Andi, Wolfram,

On 3/12/2024 4:19 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
>> +	status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
> 
> This fails here:
> 
> drivers/i2c/busses/i2c-qcom-geni.c: In function 'i2c_gpi_cb_result':
> drivers/i2c/busses/i2c-qcom-geni.c:493:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
>    493 |         status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
>        |                  ^~~~~~~~~
> cc1: all warnings being treated as errors
> 
> I will remove this patch from the i2c/i2c-host and we will need
> to wait for the next merge window to get this through.
> 
> Please submit v4 with the Cc list recommended by Wolfram.
>Submitted V4 patch. Let me wait for the dmaengine maintainers to sig off 
too. Sorry for the trouble.

> Thanks,
> Andi
> 

