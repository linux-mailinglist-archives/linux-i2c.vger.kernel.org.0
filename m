Return-Path: <linux-i2c+bounces-5964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A8966489
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 16:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA9411C22B0E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 14:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE541B2EF3;
	Fri, 30 Aug 2024 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="keXX7Cms"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2918FDA7;
	Fri, 30 Aug 2024 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029517; cv=none; b=b9md6qmOlLeskBsc7Bif6WktRPkYv29I5lzkBIARwNuUKMo4DTMlVz4eHiohV9Q88IegWtO6GgZj8bIUav3D6J88BzCsW4A89Cw/5jmhl/abIm1zu7yECKL6ByKY15jj+eKnzVER83Pg2KBnABH/w2BN04l211egXAw0cWfiX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029517; c=relaxed/simple;
	bh=zU+svjlKF/2e4UUrvfiN7V/JtaJgwQswUZSaJy6T60Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mJFUo72sTg3dU0YWTJTr/fWKAyRva+0ZRKFFP0k9lD5yQKP4lU0M5gielI6bC4n4v8rBe2LRh1Humit5ecGQfXycfUncyuAgSiCaDc51nllgJTlgV8LKHCxy/O4aEya1ezQ0GtkkKxjrZhPcij0a1CRr0SEhDcKRzesKuWSxj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=keXX7Cms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7RPZv013565;
	Fri, 30 Aug 2024 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zU+svjlKF/2e4UUrvfiN7V/JtaJgwQswUZSaJy6T60Y=; b=keXX7CmspAeYm/OF
	WM/G2FXxl9g3jh45R0ax9R6Z03iiRSk8a13mpEhlJ1KmwWQC1T8ZF8UZQ0gSOgfZ
	Bso0LvMVCqjwqDlMeGs9FOL3bffA10YCkF+5yPClUQL1AFpnEg1BAstmcfbLZNK2
	AYDaS/m6pN11eAkmiARfvQTzlKmSr91ELLvExnWddM/mg/VpPHV+TmypRk9yi7JY
	uwRoluUBWmym2HmxPLQk+1i7p1uKtOiJTbgtxCP27Hd70MsYsNrqVjZ16uTESxX6
	r4l+9G0znVQ10vA3HvQOg1JmoI9At6hu13rkcYeWNtVErVcqywOJKPYVj21MhggV
	w99KYg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5s2bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 14:51:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UEp9BP025912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 14:51:09 GMT
Received: from [10.110.28.107] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 07:51:05 -0700
Message-ID: <fdca4af1-a625-4eb8-a5e9-60ffd285af33@quicinc.com>
Date: Fri, 30 Aug 2024 07:51:05 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] ARM: dt: GIC: add extended SPI specifier
To: Rob Herring <robh@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <sudeep.holla@arm.com>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
        <will@kernel.org>, <joro@8bytes.org>, <jassisinghbrar@gmail.com>,
        <lee@kernel.org>, <linus.walleij@linaro.org>, <amitk@kernel.org>,
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
 <20240828203721.2751904-22-quic_nkela@quicinc.com>
 <20240829185240.GA914553-robh@kernel.org>
 <de0c40c2-3627-4c63-9112-4eb13cf75c0a@quicinc.com>
 <CAL_JsqKS1pB9GMjEwji_XO_DmrKs4J6GkcxpRkUqcAAHwCseQg@mail.gmail.com>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <CAL_JsqKS1pB9GMjEwji_XO_DmrKs4J6GkcxpRkUqcAAHwCseQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6b-3vOaXGsYsKH_DEtulg_cOaF8YTRTW
X-Proofpoint-GUID: 6b-3vOaXGsYsKH_DEtulg_cOaF8YTRTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_09,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=831 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408300113


On 8/30/2024 7:44 AM, Rob Herring wrote:
> On Thu, Aug 29, 2024 at 2:02 PM Nikunj Kela <quic_nkela@quicinc.com> wrote:
>>
>> On 8/29/2024 11:52 AM, Rob Herring wrote:
>>> On Wed, Aug 28, 2024 at 01:37:20PM -0700, Nikunj Kela wrote:
>>>> Add interrupt specifier for extended SPI interrupts.
>>> What's an "extended SPI"? Is this a GIC spec thing? If so, what version?
>> Extended SPI is an extended range of SPI interrupts supported by GIC.
>>
>> Excerpt below from
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
>>
>> "The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
>> interrupts, 2 for interrupts in the Extended SPI range, 3 for the
>> Extended PPI range. Other values are reserved for future use."
>>
>> "The 2nd cell contains the interrupt number for the interrupt type. SPI
>> interrupts are in the range [0-987]. PPI interrupts are in the range
>> [0-15]. Extented SPI interrupts are in the range [0-1023]. Extended PPI
>> interrupts are in the range [0-127]."
> Looks like you should add EPPI define too while you're here.
>
> Rob

Sure Rob. I can add that. Generally, there is an ask for a usecase
before we push anything that is used in DT. I won't have any usecase to
show for EPPI.



