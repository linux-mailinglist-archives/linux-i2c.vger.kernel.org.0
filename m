Return-Path: <linux-i2c+bounces-5926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846F9647F7
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 16:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D45AAB29B0E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73ED1B0102;
	Thu, 29 Aug 2024 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DKZih9YA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881C1AD9E7;
	Thu, 29 Aug 2024 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941090; cv=none; b=XyVaDL6xw8Woi7ghH4f7XZJHY2hIsYXNEIEOASSiSiPt8MzY0hQ6GxBCbq9Ny3oEBpKA4LXTbjqOkUPhHhtXdeIkp5nluT9ZWN4Hmu+iQvee46lgjIyG1BTaBwCzoQQcuIG2hI/JRh8VzZvPap6AzjMgMApOCmwvfObCbUvy7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941090; c=relaxed/simple;
	bh=t+RKO9TNWxY4HrBdBWb9BA8+VLsmoITn4UlYlIT7srY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MfLaDi/bGUE9OU7itVdbrTB9FKBXWRxcufyA4egl4FAxlIPelyvs94Kt4jMlULYWcwUOMAt1MI4svsXSusU0JOkXlVGGTo7KKnypE+ytVGOyHq0GYlTGM8p5tZq4RD8H/jvGupoU35IW2qa/ioce9r14HcGWVvRNhXvF57sw9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DKZih9YA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8qot9013831;
	Thu, 29 Aug 2024 14:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+RKO9TNWxY4HrBdBWb9BA8+VLsmoITn4UlYlIT7srY=; b=DKZih9YAEWADMmXQ
	sdVY89ixeiTr1iAWqukECdtYmZU3kK9mfKqDrNlx/2MVx07VTIMwYLUdAekmAwsY
	idKsx1qQdliqNzMmL9RdIXevrNeCfsoOIu/ELTc56mEmrWjf8bp7ZM12e/GI96Ej
	DaSElKuQYHRAdPzjCAJIT0bHx6RK176n9KnCyta/tsltRB8wTbcScppbSRTcVubo
	j99yRUOew5+8MtfigQ8/CLlhRpcCeCY/3hx7u7J9A04mimYzRX4/Qhb9YlYA2RQK
	n/OXRIp5JXMJRqhqv0LSHxthi6XoKGt/pFOZp7J5QLRmghU7c6sH5h4ksvCOZnOx
	pIT7gw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv15ejs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:17:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TEHPsx001357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:17:25 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 07:17:21 -0700
Message-ID: <d15927f9-bd00-4e32-9c25-535c69fe56f6@quicinc.com>
Date: Thu, 29 Aug 2024 07:17:20 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] pinctrl: qcom: sa8775p: Add support for SA8255p SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robin.murphy@arm.com>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-12-quic_nkela@quicinc.com>
 <erlzqkxrogk24ugfahfsxrramay6tfhljnxrcfcuhe24pla7k3@lytnz3kmszyj>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <erlzqkxrogk24ugfahfsxrramay6tfhljnxrcfcuhe24pla7k3@lytnz3kmszyj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5ZcCT-ksT85jhXv9aplZcsONon_gYS75
X-Proofpoint-ORIG-GUID: 5ZcCT-ksT85jhXv9aplZcsONon_gYS75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290098


On 8/29/2024 12:29 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 28, 2024 at 01:37:10PM -0700, Nikunj Kela wrote:
>> SA8255p platform uses the same TLMM block as used in SA8775p,
>> though the pins are split between Firmware VM and Linux VM.
>> let's add SA8255p specific compatible.
> The change suggests devices are fully compatible, but above description
> does not.
>
> This looks conflicting.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for reviewing patches. TLMM HW block is exactly same as used in
SA8775p however ownership of pins can be split between firmware VM and
Linux VM. It is upto devices to decide what pins they want to use in
what VM. I will extend the subject with same description as used in DT
binding.

Regards,

-Nikunj


