Return-Path: <linux-i2c+bounces-6170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706796BD30
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C971F23EEE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B089F1DC070;
	Wed,  4 Sep 2024 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pVerrnM/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF71D9337;
	Wed,  4 Sep 2024 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454356; cv=none; b=ppT2mymD125xQg8CtCVAKN0xEkty9tiabkcnlA3znIAjVv6xLBUJgi/Yzy4oLgjrcG3iSu6N9WKEZIjswYaFcsm2mJ9ttTRkwtynXYmWCIbwG7bocvjzxjUFqM/wjnsGiaYDRgS61q9bRummN7pQMkNWTkC5wX3J/7gy4bu89K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454356; c=relaxed/simple;
	bh=2FI7kUugQ8AZNyDv48uoku3rUnL9chur7kuEfnt2whs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kGU7+VBqHOpzdcvjBhtRMYO0hvjtI118/zBAydiJ0J8DSPh8igXl7jaS5+XXsxsstObFynMsoCcqVclwYR/xTSj6jRfCTEWSnccFrw3/ydvGYN4mg9ug/pI05RP6KUxbBvMS6wByopRJHw21DL9AGdxpI0hcNsBqG5+FQoAHdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pVerrnM/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4849hvk9031157;
	Wed, 4 Sep 2024 12:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FI7kUugQ8AZNyDv48uoku3rUnL9chur7kuEfnt2whs=; b=pVerrnM/J4KZjcOE
	/hnl/13e5yz0GENRYaQ/u2vhLTLsMLqlEhq6CeHU7KYupbYeO3csiuFcSXQZhvvs
	hSj8JHX7d6OPemM1nwFnWy6ww1vxL56TOVKNxxCgr4aAutdr21eKEmkDLB+IS+OQ
	1M2NtoSf4ZHgu2sqH+vuLlfyXulXDI4Ae0bQ5IFkfOlUJ5wIGI8GkD0vnwhcmBDG
	9s4fMeweWXqwlDly96iTh/AAhbPEBnmTV0mgHKhvFDNI1nyLDK4ojV7dNo0cO120
	rzrC9eA9zHXe7ooiOh7/IdSinlBK50h7cgPjPT/lx016nCtQK8pQB2U/xI/MIkoG
	tHxrng==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvbkjkq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 12:45:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484Cj9hC013102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 12:45:09 GMT
Received: from [10.110.120.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 05:45:05 -0700
Message-ID: <24d4676f-4385-406d-9728-54afc3144e17@quicinc.com>
Date: Wed, 4 Sep 2024 05:45:05 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <andersson@kernel.org>,
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
 <20240903220240.2594102-16-quic_nkela@quicinc.com>
 <7fc1e4c3-ca09-4a0a-b072-0c4f1d21e44f@kernel.org> <ZtgSd_SLndvLLVYF@shikoro>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <ZtgSd_SLndvLLVYF@shikoro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GfWhUZz5Jq0_pwPHu9T0QF37Le3YywI6
X-Proofpoint-GUID: GfWhUZz5Jq0_pwPHu9T0QF37Le3YywI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040096


On 9/4/2024 12:55 AM, Wolfram Sang wrote:
>> Just to clarify to I2C maintainers:
>> This is incomplete. Missing driver changes.
> Thanks, Krzysztof!

Driver changes are going through internal review and will soon be
posted. For your reference, we have pushed driver changes in CodeLinaro
git branch(nkela/sa8255p_v6_11_rc2)  in kernel-qcom repo [1]. You can
take a look at the changes that are in pipeline and will follow soon.

[1]:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/nkela/sa8255p_v6_11_rc2?ref_type=heads


