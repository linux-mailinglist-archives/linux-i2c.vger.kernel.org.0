Return-Path: <linux-i2c+bounces-6174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90696BD76
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC041F20F3D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7D81DA0F5;
	Wed,  4 Sep 2024 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FnLGEm41"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173B1D9344;
	Wed,  4 Sep 2024 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454748; cv=none; b=NKs0OJUF8m6Bq03/Gt1+Rx4bYxxjlvTlJLeTthvyHz3J9Ac6AsLxpq85vvFR9MX8A1WX+B5zg1qaa+ufEdUpQVuOHvIdj3ZxmACcvgd2/wL+1bx9NWBfSbFdOrewSPsGNKtBWvHDCGuEsvXXCYvPcY8NXsrchuUM2MSX5IJU8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454748; c=relaxed/simple;
	bh=cufdcsefzRbjrRxrUtSpAMqU+L+OLWENmAOh0cCRkQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k1zbbYuznnQ9h8gkHRrDQFElQOQ0rFSf+4+7oL18hfnK3qVEhOWOXUy9WMg2a9/sEeSNfcq9ELsqH8KlfxSkf/P2RfSOIzXjSsH3rGsP6BYDUHzLzm7F+Z/LiAxUNrKZe8JbilZZx6jA5Pu6Mf5YinfZziHSYlZHo4QBOPyeJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FnLGEm41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484AXGuD032277;
	Wed, 4 Sep 2024 12:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IF475OtMV49GuJTorggo0x/huhW9Mbg7NQzbxMUq98k=; b=FnLGEm41Xr6krBS7
	3FCaGBLGutcwgWVfqR7i9BmLY5JzZMSKeucWO/1x2M5jfJ28bhKDfVj5onewo76W
	Rpfyxm9ty/QGaTs4SmxSIkMRISVEB0EmP8TTMy4NEkY4T9Nvuu3WYzHF4VUhzCFZ
	qybZv/ohAK0a2m00ytzdFNkP9jDTosiY4zpq3zAu1txTCQ/cXn8bjkq5eTkk1cs5
	SFaW7gFRWfTHHoeKpFYfWAwp3L2sQcPbt5gwEAdLkcQlmCMB/ThYDtopzL+uJdyx
	R8Z4LaVUX9MdINg44X01lGp6JBFEYwtIii6xTD5bXjQknvlleRlDc+WTYJPSlRXk
	wpFlKg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvbkjmm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:58:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484CwZYo028022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:58:35 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:58:32 -0700
Message-ID: <9b9dfee5-5ce3-4140-9340-2001d6e0adf0@quicinc.com>
Date: Wed, 4 Sep 2024 05:58:32 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] arm64: qcom: Introduce SA8255p Ride platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
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
        <quic_psodagud@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <glo34r35r2jqypeureu5dzoe6udkniqbma627jnv55ihfoatfu@ujvsxcsrhhdc>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <glo34r35r2jqypeureu5dzoe6udkniqbma627jnv55ihfoatfu@ujvsxcsrhhdc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c8vZkm80WZTU8HCRdHZaM0UBp4pbnxWL
X-Proofpoint-GUID: c8vZkm80WZTU8HCRdHZaM0UBp4pbnxWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040098


On 9/3/2024 10:54 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 03:02:19PM -0700, Nikunj Kela wrote:
>> This series enables the support for SA8255p Qualcomm SoC and Ride
>> platform. This platform uses SCMI power, reset, performance, sensor
>> protocols for resources(e.g. clocks, regulator, interconnect, phy etc.)
>> management. SA8255p is a virtual platforms that uses Qualcomm smc/hvc
>> transport driver.
>>
>> Multiple virtual SCMI instances are being used to achieve the parallelism.
>> SCMI platform stack runs in SMP enabled VM hence allows platform to service
>> multiple resource requests in parallel. Each device is assigned its own
>> dedicated SCMI channel and Tx/Rx doorbells.
>>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.
>
> It does not look like you tested the bindings, at least after quick
> look. Please run  (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
>
> Best regards,
> Krzysztof

Will fix spaces and send v3 in separate thread. Thanks



