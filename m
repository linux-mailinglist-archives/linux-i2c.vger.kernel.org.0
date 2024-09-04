Return-Path: <linux-i2c+bounces-6213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58096C95F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 23:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5D8289A94
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 21:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA0118757D;
	Wed,  4 Sep 2024 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eiPEcMAy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E6154456;
	Wed,  4 Sep 2024 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484261; cv=none; b=JJ7jyReioGPYlTVUn6vO9XyMoJzaoBJobURAvdFclY2/CTtlz/A6VwHxup67CIMEOSc4bu6ZedZfZ4v0PYdSkWG7bf/bDevCGK1HiTcBFYqkAeDv13qcFS6mUsiVCJK39uDdD8CpkU/u5g9qyzCSdK99FsHeDwpfOvNVkPspJh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484261; c=relaxed/simple;
	bh=Apb16QQhUSwrfL++PWVYETzaYnBU4cK1qQk5EOBE37c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C1+SLca3Mw2DHzMAvdt4kojd4qYFYyu0chO2BXAYJRtAN0Kvoijn/ooGcsBNmGn8ZDq0c/PExNMqkjhyM9vLkWYV8CY5FJSAaZ6vPJC1rH+fQZh2Smy4xz/YVc/YHOzlBSFKvvWDRNcRhtjdHlcf1I+jm7kDMvKXVYU3le06jKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eiPEcMAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484H1HIp020935;
	Wed, 4 Sep 2024 21:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xaHlela7QPPItCQWIDm0FfYJqVIV/L5MmRd2uE9Daw=; b=eiPEcMAy42BW8fAl
	DjeBpowSj6aTGG/W91ubr/W+Lqt3Hr23c8eB8rVQw2njpeCvaxZkc7ONJCLdSivg
	VnydvIfBBHP+wZSYbZzOgtQCuNYNLmsxr1v5CxhWHsqRFObwyVUyH4CMlVz7/bGw
	LAJQyCUmyPqNzC+NQ+xTGm+C8E6nLQWf/rZFuJiRtNtIBxYnTQl6xBD4tvoviTnv
	+ABcTdx9BZ3GT5sfP1kGza5mm65PS/iOcOcVdPKTU31wQocnV0ZhBNXZDq/1cKJj
	rjpar+8+SdOLSVFjq8Q3h/bK4zZ+p2z21pPplZp4xY/xdr9BAOmm172M1+JusOea
	zCs7NA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy25dn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 21:10:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484LANe6022520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 21:10:23 GMT
Received: from [10.110.102.234] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 14:10:19 -0700
Message-ID: <c9255fe1-dc62-44f4-a105-54e94abde915@quicinc.com>
Date: Wed, 4 Sep 2024 14:10:19 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] dt-bindings: serial: document support for
 SA8255p
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Praveen Talari
	<quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-18-quic_nkela@quicinc.com>
 <db4cb31f-b219-4ee8-b519-fdec7f7b8760@kernel.org>
 <634ab05e-3b8c-4cc1-bf23-0c68c1d28484@quicinc.com>
 <f42fe73d-1579-4fa1-89ed-9d2a4b7c7f6e@lunn.ch>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <f42fe73d-1579-4fa1-89ed-9d2a4b7c7f6e@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RmVFkQZYU-RpbGJzqKmvCrSyeNzMXzeN
X-Proofpoint-ORIG-GUID: RmVFkQZYU-RpbGJzqKmvCrSyeNzMXzeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_19,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040160


On 9/4/2024 10:05 AM, Andrew Lunn wrote:
>> The driver changes will soon be posted. They are being reviewed
>> internally.
> And what do you do when internal reviewers tell you that everything is
> wrong and you need to change the binding? You just wasted a lot of
> peoples time.

Let me clarify here, the patches have already been through multiple
rounds of review and since this is new architecture that we are using,
we want to make sure this gets reviewed internally as much as possible.
While, we will be posting them soon, they are available on public git
repo for anyone to take a feel of the amount of changes. Let's not be
judgemental here.


> Please don't post patches until you know they are correct, complete,
> build W=1, and pass all the standard static analysers.
>
> I suggest you try to find an experience Mainline developer who can
> mentor you.

No one is born with experience. You learn as you go. Please note that
this series has gone through internal review before I posted it in
upstream.


> 	Andrew

