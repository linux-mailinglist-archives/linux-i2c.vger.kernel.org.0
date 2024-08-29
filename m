Return-Path: <linux-i2c+bounces-5930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F2F964883
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 16:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F781C22122
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 14:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024251B0111;
	Thu, 29 Aug 2024 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pUIn2GP9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472941A76B7;
	Thu, 29 Aug 2024 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941977; cv=none; b=dkI6EZJi2FMFRY35fFxQZr0HdpACUlpOtBU4lxgftw9Lc6T/Y2gJWXJiMw+pL6SBSkDeflbL38pT2+gkg77kNMaVcMqQT8RXyPLgS/ZeLVtBipaSi/ixmQn6Gej+uqjo/FWxDCybUG5ruOCAg1tYdm4zABme2mZ3Q2l9C+Cc18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941977; c=relaxed/simple;
	bh=Eb2ZPuL+3koYo3fJiQg7r+u2ELH+/JY4bfYIJUUyklQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PM66MnWmM2MU+RigcYj5UkO6MJaNRxzocFXkS9c8pdfGutOI6Dp6B8+bcJz6ieP12HE0FmrKOp3jACKBxXrPMNyGs0STdI/wxGs1h/hGBXl6S7+O8aHjsJBus/gXCRikXegUgvLhPIfzhwk9MNAXxb9zB6i3TCPblLyzNysSi/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pUIn2GP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8OgEF010887;
	Thu, 29 Aug 2024 14:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqodGm77Krj1I3ICwjAgMZxw71umf4G4EfC6q1kQGnc=; b=pUIn2GP9ddnHQMb4
	T2kX9Iqau3GZVC3a1ozrr4tFfUrgabfm+3+wAGdeP5QVJSSAGQnR7i6mRTiM7laZ
	fyOpIFF+8NbM7EwE5mWqAcOMPx31DasKVQJSR6mc0st9dwYqzZHbugtrQfgptnYP
	uLRcmPmzIl6SeMJfsTHakblCSOb1fPj040sgiC/7RqQdMaAE+/V97UYzcxNga84x
	eU4GY0imdLwyQmiqV6/GQrPbaXO2Wpo+8fwbl/0YVTaz97VQ3Ypq/5Raz3bwVyfv
	qC/kSEpO64eDMPm1AytzMMHI5Kw3YrV8rGhozJUbK9QQSJ+T01ifJmTOm5bPzwK6
	YS7fFA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0nkr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:32:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TEWLm9000806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:32:21 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 07:32:17 -0700
Message-ID: <b263cd16-b5c2-4dd8-a6fc-7d6861338bcb@quicinc.com>
Date: Thu, 29 Aug 2024 07:32:16 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] arm64: qcom: Introduce SA8255p Ride platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <joro@8bytes.org>, <jassisinghbrar@gmail.com>,
        <lee@kernel.org>, <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <robin.murphy@arm.com>, <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
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
 <11c897d7-ea9c-4474-81f6-1fc2198d289d@kernel.org>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <11c897d7-ea9c-4474-81f6-1fc2198d289d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fv5TpYAMjB7nkZE4j2aSXpV4D3dEfStr
X-Proofpoint-ORIG-GUID: fv5TpYAMjB7nkZE4j2aSXpV4D3dEfStr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290100


On 8/29/2024 12:57 AM, Krzysztof Kozlowski wrote:
> On 28/08/2024 22:36, Nikunj Kela wrote:
>> This series enables the support for SA8255p Qualcomm SoC and Ride
>> platform. This platform uses SCMI power, reset, performance, sensor
>> protocols for resources(e.g. clocks, regulator, interconnect, phy etc.)
>> management. SA8255p is a virtual platforms that uses Qualcomm smc/hvc
>> transport driver.
>>
> Who is supposed to merge it? The Cc-list is quite enormous and I got now
> 20 bounces:
>
> "    Too many recipients to the message"
>
> at least drop some non-maintainer related, I counted 5-7 Qualcomm ones
> which should not be needed.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

I ran maintainers script to get all the emails. I kept maintainers,
reviewers and "in file" ones in addition to some Qualcomm leads. I will
drop "in file" and Qualcomm leads in next version.

Thanks,

-Nikunj


