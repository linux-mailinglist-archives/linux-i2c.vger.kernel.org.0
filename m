Return-Path: <linux-i2c+bounces-6442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2A9723B1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 22:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BBE81C222B7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 20:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BCA18B46E;
	Mon,  9 Sep 2024 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yz6uNCpy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830114428;
	Mon,  9 Sep 2024 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725913835; cv=none; b=qPEMwCzuPt5WPrCaI1mLHz1W2hoQi08GI3TRklGooGhw9nvYaK3klPGaKcJPHcSgLMNIb7P+DX8f8V1o1LU0nyS9/pGIM8Knr8nQosixtmO0DjsXuqyDsUNcnEx7Ux2JLlADBY1lEo8ZTagFcnC1jcIBmE4JQvOjMMgYarmDs5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725913835; c=relaxed/simple;
	bh=e/lXweERor0ETtdzLqqAZlCy9RlOEBK030OaDQWeOhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bLHVAeUVXvtP5kaZoMfBk71FCBKnaaDWpn7WQ7COhCPDsVd1H2Uh9UOaTuhFpYgOE5pjGhQEsOaKZKaAlEjxrKBMJkvbHHMPNi7hSlTr71c4ghkfzeoygDdoz3Pi5Y7eUsFd0M4T6ha2DII3VTYqCSQjVbmIeRGVGLI5iQ3IJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yz6uNCpy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRTrg026720;
	Mon, 9 Sep 2024 20:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1C+dV5dIn4U4sQGXBEilezGsLj0xJ9FofhsWLX08yM0=; b=Yz6uNCpyk2hOa6sn
	jOi5b3vGjCaNsePo4yzmO0aN9UClUScbNyNvblb3w6qXJAlED4GfrWlufNKupHDJ
	S5CjgOk++kkx+J/XNElYXWxqZOKD2DrS/c+Oh7XRkf3xFlPeYPKo7w3N+jEDlQkU
	jjPiyW1riTQ7ToAZEg9Ifw0KQPeyl/TbwvaLsB/QifYID1FwPb7NrOgwmDeXRQVI
	NXe319XNNSE95I+NLaVfQ1C5sD5/F19syXePY9MgbhiAq8HdF5wN8YPbvvfqLFGb
	u3j/TLWYEBpZBnvVrYQyQn1HrZFzdM2oP+8q74grZHxWvp5KUjiSjdsnNfbrKhqu
	haI0wQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6e3x6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 20:29:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489KTfoQ002368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 20:29:41 GMT
Received: from [10.110.76.134] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 13:29:37 -0700
Message-ID: <d206e315-3324-4814-b98d-027c3af6ebb6@quicinc.com>
Date: Mon, 9 Sep 2024 13:29:37 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
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
        <quic_psodagud@quicinc.com>, Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7fCK6lhX7moA3Z0_YwrAyh39NPgkf4B7
X-Proofpoint-ORIG-GUID: 7fCK6lhX7moA3Z0_YwrAyh39NPgkf4B7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409090161


On 9/4/2024 6:21 AM, Krzysztof Kozlowski wrote:
> On 04/09/2024 14:48, Nikunj Kela wrote:
>> On 9/3/2024 11:34 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 03, 2024 at 03:02:35PM -0700, Nikunj Kela wrote:
>>>> Add compatible representing spi support on SA8255p.
>>>>
>>>> Clocks and interconnects are being configured in firmware VM
>>>> on SA8255p platform, therefore making them optional.
>>>>
>>> Please use standard email subjects, so with the PATCH keyword in the
>>> title.  helps here to create proper versioned patches.
>> Where did I miss PATCH keyword in the subject here? It says "[PATCH v2
>> 16/21] dt-bindings: spi: document support for SA8255p"
> Oh, wrong template. It was about spi prefix, 

These are the latest 4 commits in linux-next for spi:

12736adc43b7 dt-bindings: spi: nxp-fspi: add imx8ulp support
b0cdf9cc0895 spi: dt-bindings: Add rockchip,rk3576-spi compatible
d6d0af1b9eff dt-bindings: spi: add PIC64GX SPI/QSPI compatibility to
MPFS SPI/QSPI bindings
1c4d834e4e81 spi: dt-bindings: convert spi-sc18is602.txt to yaml format

Now I am confused which prefix format shall I use? first spi or first
dt-bindings?


> should be this one:
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> Best regards,
> Krzysztof
>

