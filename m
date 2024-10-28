Return-Path: <linux-i2c+bounces-7616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E279B24C4
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6792D1F218B2
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 05:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A8118D63F;
	Mon, 28 Oct 2024 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ksoxl7Eu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5922629D;
	Mon, 28 Oct 2024 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095091; cv=none; b=l0R0JfUhBVppJaYAFFCM1WcymLYxml0KiG/ODY5PMa7zr/OB5XSVLuo+acZyZNsaW2pForJCyjXySCnNjNKG6uLPm35OvZufN/Z9LjGyfHfnVM98joXdzoE7HzLDoWDSanoLozLRn4/Pn73sZEVvTGdlX/g5ymJULF+klFxbVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095091; c=relaxed/simple;
	bh=TVnHvZr62rmVm2loqYHdo5pXcTEY1VqEKnk1v8vlDWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y3M5JN+rCGLj8uPyMnYoOygJ307VYN1Q/mbiaOk1d/3onXhLvF48U5bgmxn3mItqL2OKgjJ9zrFWekFbY/Pi3PnNi/YZSa9YH3ESVuMOg7q+OgPonS6hFZphOgzZCw5awg8Jdrg/ww1b9cYjWaokIaxV5DUatguhIRI8r6MiXxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ksoxl7Eu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S0kHjw023659;
	Mon, 28 Oct 2024 05:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtU2mVAly4FjXRBeZWXyc452DAFhIhXB8rbwZqI+qk0=; b=ksoxl7EuyWDsBoTL
	HyhqsD5ku5014iX3AKK04Lbg/UXfKLMkwy3tLt2dD2YPVk61MgNCbLWagPYM8UyW
	lDyrNEKOT4eGA9DQDD9QugX77IFeq9nbS4BgV7MibRU7c0dfg7QzGRFtVXsozCmK
	dgus3NAMAyFaUE6F32gyIV19GF4aJb6J8ew3I9pVSfup+ptP8toXiNl01w2ey04W
	GDmzNclTRXPr1jeTh3zQrj+CR3DHjTFpWVFa4IvTBoxMy1HAD/KUodNUwp8TJi9J
	E44k+jGHduaw0kU1MqzAi5pNkmSaC5tXDSXq/zEbimARZdkpbodDB91KWtLgu4Ya
	mdmBuQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjuqs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 05:58:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S5w0AQ005536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 05:58:00 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 22:57:54 -0700
Message-ID: <2cd4af43-e600-4a39-8b8e-cb25b8c0168d@quicinc.com>
Date: Mon, 28 Oct 2024 11:27:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: dmaengine: qcom: gpi: Add additional
 arg to dma-cell property
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <linux-i2c@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>, <quic_vtanuku@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>, <dmaengine@vger.kernel.org>,
        Andi Shyti
	<andi.shyti@kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-media@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Vinod Koul
	<vkoul@kernel.org>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-2-quic_jseerapu@quicinc.com>
 <172899877472.523926.14548368912530185631.robh@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <172899877472.523926.14548368912530185631.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4-JczcihqfZRpvgxpZxOrdCuTgT3y3sr
X-Proofpoint-ORIG-GUID: 4-JczcihqfZRpvgxpZxOrdCuTgT3y3sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280049



On 10/15/2024 6:56 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 15 Oct 2024 17:37:46 +0530, Jyothi Kumar Seerapu wrote:
>> When high performance with multiple i2c messages in a single transfer
>> is required, employ Block Event Interrupt (BEI) to trigger interrupts
>> after specific messages transfer and the last message transfer,
>> thereby reducing interrupts.
>>
>> For each i2c message transfer, a series of Transfer Request Elements(TREs)
>> must be programmed, including config tre for frequency configuration,
>> go tre for holding i2c address and dma tre for holding dma buffer address,
>> length as per the hardware programming guide. For transfer using BEI,
>> multiple I2C messages may necessitate the preparation of config, go,
>> and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
>> potentially leading to failures due to inadequate memory space.
>>
>> Add additional argument to dma-cell property for channel TRE size.
>> With this, adjust the channel TRE size via the device tree.
>> The default size is 64, but clients can modify this value based on
>> their specific requirements.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/qcom,gpi.yaml: properties:#dma-cells: 'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/qcom,gpi.yaml: properties:#dma-cells: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241015120750.21217-2-quic_jseerapu@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Thanks, i followed the instructions and resolved errors which observed 
with 'make dt_binding_check'.
But in V2 patch, i have reverted the DT and binding changes related to 
adding new argument for dma-cells property and instead used existing 
value for channel TRE size in GPI driver.

Regrads,
JyothiKumar

