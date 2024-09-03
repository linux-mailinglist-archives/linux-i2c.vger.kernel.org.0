Return-Path: <linux-i2c+bounces-6049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB996A2C0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523F728B2CD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D9518B48B;
	Tue,  3 Sep 2024 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B8uH/Hu5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94726AEC;
	Tue,  3 Sep 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377424; cv=none; b=eTwGUZp8qOlDHRM3ZBjzZF8dXe0F5lipT/65uepxe4ragjVC8qwTYq6soL1Z7+gO/jqjXxg3walvD98EagpUhT8CpoYfAJsw+n/bYP0aMR+jeGWqwmK9QhTqaxYa520V2cQnA9rgMd4efp7kfYo+Iup6wGDICWni1YqbFNAeq60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377424; c=relaxed/simple;
	bh=6piqvsdwZK7m2rQI2xaAzlLX4itMjm+cIfYUK76i/9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TcWJVXoxeOjjqpTVESg1BRyom5rbUVkLgy9M6iNyT9bOSxqcZUqFFNuWEazihkt70MTf+OYb0rC8FGFEBB8yWIR/D5TZvpMItlO8Y4aVrTPsTGDE9l7MzRoK+KPYWhOCw+V9H/mcz1x5pvgB4zdqkyZl+DIiemXjE3myIwL1FZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B8uH/Hu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483C6D5a009100;
	Tue, 3 Sep 2024 15:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6piqvsdwZK7m2rQI2xaAzlLX4itMjm+cIfYUK76i/9c=; b=B8uH/Hu5GO1wPnC+
	V7P+1suidAjBz8algBBAEisJFWoejjT+7IiHvbN989/gYH6/qFw0rveL7SE5ZLZx
	0IEQkeyq/8J3O2O6670dOXhxPPWRy3Ikvswir+YwzzYKWHxkKiexh8NZDaTYPUw4
	VX+/duYB69K9KB6BApD64+Vtl0+m/xA5OkGzRJZvJbLpAYPusr1hq0LK4wvgCFQr
	GNH9+/upDX42qqTPWBcKRcKwtxTpmmp04D19xSewG8ve1oTVl28ZMFOhizAI/e+S
	c46/mv5mhsEUJ1NGAi7RHvauXR6a7SZaXAIFcNCCn7k3FKY+h4MmtxZUrltx4ymk
	D8a3Dw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxqt7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 15:24:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483FOXh5020808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 15:24:33 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 08:24:29 -0700
Message-ID: <b855f1a9-35c2-4c53-9485-0989b3eb5a6b@quicinc.com>
Date: Tue, 3 Sep 2024 08:24:29 -0700
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
 <d15927f9-bd00-4e32-9c25-535c69fe56f6@quicinc.com>
 <f227c799-cf9a-481a-b359-21828d6e8bca@kernel.org>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <f227c799-cf9a-481a-b359-21828d6e8bca@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bWyf1ZPtHhHPINAXIshQXWfk8GFZ_w_W
X-Proofpoint-ORIG-GUID: bWyf1ZPtHhHPINAXIshQXWfk8GFZ_w_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_03,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030125


On 8/30/2024 2:52 AM, Krzysztof Kozlowski wrote:
> On 29/08/2024 16:17, Nikunj Kela wrote:
>> On 8/29/2024 12:29 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 28, 2024 at 01:37:10PM -0700, Nikunj Kela wrote:
>>>> SA8255p platform uses the same TLMM block as used in SA8775p,
>>>> though the pins are split between Firmware VM and Linux VM.
>>>> let's add SA8255p specific compatible.
>>> The change suggests devices are fully compatible, but above description
>>> does not.
>>>
>>> This looks conflicting.
>>>
>>> Best regards,
>>> Krzysztof
>> Hi Krzysztof,
>>
>> Thanks for reviewing patches. TLMM HW block is exactly same as used in
>> SA8775p however ownership of pins can be split between firmware VM and
>> Linux VM. It is upto devices to decide what pins they want to use in
>> what VM. I will extend the subject with same description as used in DT
>> binding.
> So there is no difference? Then devices should be made compatible with
> fallback.
>
> Best regards,
> Krzysztof

Yes, I get your point now. I will discuss internally. I am leaning
towards using sa8775p-tlmm compatible in SA8255p TLMM node so there is
no need for adding new compatible. Will drop the two pincontrol related
patches from the series in next version if agreed internally.

Thanks,

-Nikunj


