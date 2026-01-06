Return-Path: <linux-i2c+bounces-14923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02362CFA929
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 20:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 512A8307CF05
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 19:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AA03559FB;
	Tue,  6 Jan 2026 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiJvXYK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jhv+o3re"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C83559FD
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722578; cv=none; b=SKlr7MS3cPabVRMEtKyFle861MDE1Kfv9EKH6HjwMbRkS46TeOt5P5347t3aAlrb8NjgMHoKiyyvlPsia9d76D8KfFiC+4i4rBxGlBt87dQObjzu8+MPJmtJI6CJCav1296mGo2795Z1t906bb+WDC2ayhKLEAQCF8jf/UhXjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722578; c=relaxed/simple;
	bh=lvcvCny0TmxSGMdq7cp/oIKucCCF/BYd8yrR7hvTLPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foyuGQcrFOyPT1Xo8jR3PGtzm4Hxzzeh0+sdp0mUHG9Uqf5EU4DX3uZ7AC0DMCEeFjegWh9yYdJnBWTYX9fUeigFW3+cV5wlulmU+sxm/8O9y8Vd04QB8Rf3MdTqWLi06FM43QlZsQsJG5A91Ph4DdEbZ5SmeeY4CyuhB9843Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiJvXYK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jhv+o3re; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Gilqt4137528
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIIgwyqHhHLYLpRZZa8pvZl4il54kRtKwJstUItc5I0=; b=PiJvXYK0YOmiUKAo
	qtOKg251CLPfTusQnGB05a8e9actLxX6wvv+rXcyH49h0cYuS7qSwRUFWQp93n8A
	DkO0Oid85vhaJtN5S9FGWw0/pm6w6N2yXDB0AasL6ldaNozPee3VO0CFB33rh3I+
	oeYq+nOaeqIFhsanadQXifxVoanJrc5H994KbX3xkQU3ah1HEZOR7qBjBHIjySIr
	eoNM1BYhj4EttPw7070ECYJSI5/WUNXNnoT6f2f6TYEukQ/vg8UFJNxV1yC6z36f
	eVj88zk8uOxEkeSd4JU6w9USAo7I5nhezh5ZRlXH9i2sQdzkafMW8JQyNQW2zC0+
	wBA0GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e07sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:02:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b062c1aa44so1283093eec.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767722575; x=1768327375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIIgwyqHhHLYLpRZZa8pvZl4il54kRtKwJstUItc5I0=;
        b=Jhv+o3reY+65/Q/oPhE6mXuZpLPSdB81+hob5DTtEYK+sqx6/RwWW3gcCTIPXqnkis
         lOfaJfChZVigB6ziISN2+jT/XFNtLp4F9gyfWoa8ku5BGrxnEqaUBKIBUfZlPjzirtLA
         zcX5y31HAhnIUCsX9vkiXBKdcdOEvh5QLHvp6pQZVwVid84HcztpyqyMgBUIUYlbBRSy
         giGuavNhizcKVDlSvylzsNZajA38gJzx4bWxFX7CW0Mf9gcejnL0w+9OVNU04HXDhdE/
         sIBrk+6qMrurgDLtPKOWkD9KWnl+DNe9jeJKaDiP5n+SJQdz0QZVcKLRla9oIxuK06JF
         XCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722575; x=1768327375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIIgwyqHhHLYLpRZZa8pvZl4il54kRtKwJstUItc5I0=;
        b=njqpCQb8ZOHFO0WZmmdlb26bIhIH6HGe2RKW1kwRwYa37EBRogxFhIKKu0UPpCdhdO
         JNFpfTC84EetpS9Q9cr/V1C+hScvCN7nphUTmnjCyFTJwaj1NXAgWD+fecNFe9Bs/12i
         auoUBFGWTbgEg0kSrI7t1jg+qfnspBYPQicsnpST29F+QtSm6SJRxlLQ0he3U6+5LWDl
         zVZMoL9dAQOnHns1riE8UkNw2FSGRj7sjmBLh8rgKOnPz/WXW1/ZxlJru6/yyBoYN4/E
         aSi8AKNBOkR4aH7WmqtLbYPihQ94jxjaDxbd3O/WLuzI2MsxD93C7MRMiwXV1okvQ7oP
         B3pg==
X-Forwarded-Encrypted: i=1; AJvYcCUIu2KE1TReBeYIoplHfZjAUe0xP0YyA11uwJWmN+byfiK6IjQzEw0nSWfGDZDn6XWo17o0Ed8r7ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDR8x7tD5QXEtE1llKQetmGZ1PH9Bym7VKzPXe0sUDPGONMc4m
	87D+K7jlxGPlwvL+pa/FzHBnIdvWAXx6X/gWAczdDO7kpQ8oBQciiRQBnx57E9d8tGNFf1tTMpe
	qC9Q2QqNOQ65yYik9Pj9nRUapG6bG+fKCe5cuUg9L0YVIJLdbCUugZezNXlSs4AY=
X-Gm-Gg: AY/fxX7kpF9fWYncdh+Cz/IFZx5/ZsO9/uhuIb5KAdZ5wZ3wPOQnq4SOKd6uxUn6din
	Agu2w7Y88cWfFQUUsKUFmvMq3tjak+eaSch8TsAq35QmSOj4W2PlXIEf7MYXnEPqr90Quhejj6G
	JEvSXwGBjbiHpV0mx5UG0ucgLnm1iIKvbaY+r9MPXiKiNPXR/utNc0i2KN0lBFOWxHXlMqecilu
	A83e6nkyYc2RMZMs4rNGEMDaw0GSWXiu8usXRuCo8zCoIJixgUpe3PILQ2VvA8uqI9AJJGu3Mf3
	Bx1InY1FlnyCa7rJ5KNkKQ5Wdx9YPGkOHn2seHUeMJvaDnD8spH8y4//oZ7nzznu1JLv/wW/Ly4
	8E7t7g7dbCyQDgCGw1ZxV6vQsdAXOf9NENWHvGdZmZLdm
X-Received: by 2002:a05:7300:1802:b0:2b0:5609:a58c with SMTP id 5a478bee46e88-2b16f924892mr3922753eec.32.1767722573005;
        Tue, 06 Jan 2026 10:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqN3fC4CHs8O90rLaYo/mMqHXWqZ+VV8NHdkTRW/9qmN1IXbalu6uADFCWa7YGZdqDiyy4ug==
X-Received: by 2002:a05:7300:1802:b0:2b0:5609:a58c with SMTP id 5a478bee46e88-2b16f924892mr3922575eec.32.1767722570475;
        Tue, 06 Jan 2026 10:02:50 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a55e2sm4286114eec.8.2026.01.06.10.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:02:49 -0800 (PST)
Message-ID: <1a371977-1fb5-4f3d-b4bf-7fb08c9c577f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:02:46 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
 <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1NiBTYWx0ZWRfX5T0d9DQ/6C6m
 ayJkt+rwI2fQ252anIMSqsvgeHgh8FL0E5o4PoICUKknkN28Dt67QVHRK6J5hzGYwNmtRXrOmJ9
 kkvTqPNPFcIT3V2NUOnjGMD0yanQqLNr7jbKDeY9/TYAVaP+DzX1rmjWD0Oaq+v3vBaKTtiTjab
 sS2uLXuuRkEWJ060cxSpQ2X2TKr3J61VcbFNVlnEjN8DIt4UGghrJLtCWRT+FSqJ7s1mFPa3cm/
 K/thCggy+9dn7OHM8PpIqEMZCovJcU4isKDQDRPe+CEhET+0I1sJSy8oA8Z7YAOoB6wz8Lk5NLe
 NtcxtpQUNcN1G6i6ecPVAIxQuWQi9oSGAB8ZyPpjvQYukfidGq+a175CTtDcQ7cfYT1cX5a/RmP
 xvkmBeV4SNOUghud/jeUQ5q80eda8M0lta3fNmXuhOkR7UKCgRbcp1n6efSG5WJhpJcZ4V7LLeu
 QYulB63a8KNq63XHWOg==
X-Proofpoint-GUID: NsnGFeah-uDsuUMWdbpg-5sLZntWl-bl
X-Proofpoint-ORIG-GUID: NsnGFeah-uDsuUMWdbpg-5sLZntWl-bl
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d4e4f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=SYJUZRzdtcDiQi1wpHUA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060156


On 11/27/2025 12:10 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:35AM -0800, Hangxiang Ma wrote:
>> Add the compatible string "qcom,sm8750-camss" to support the Camera
> s/to support the/for the/
>
> Bindings do not support hardware.
Ack
>
>> Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>
>> The SM8750 platform provides:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
>> - 2 x ICP
>> - 1 x IPE
>> - 2 x JPEG DMA & Downscaler
>> - 2 x JPEG Encoder
>> - 1 x OFE
>> - 5 x RT CDM
>> - 3 x TPG
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8750-camss.yaml          | 664 +++++++++++++++++++++
>>   1 file changed, 664 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
>> new file mode 100644
>> index 000000000000..6b2b0b5a7e19
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
>> @@ -0,0 +1,664 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm8750-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM8750 Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  This binding describes the camera subsystem hardware found on SM8750 Qualcomm
> s/This binding ..../SM8750 CAMSS (Camera Subsystem) is foo bar..../
>
> or any other form which will describe the hardware. There is no point to
> say that binding describes hardware. It cannot describe anything else.
Ack
>
>> +  SoCs. It includes submodules such as CSIPHY (CSI Physical layer) and CSID
>> +  (CSI Decoder), which comply with the MIPI CSI2 protocol.
>> +
>> +  The subsystem also integrates a set of real-time image processing engines and
>> +  their associated configuration modules, as well as non-real-time engines.
>> +
>> +  Additionally, it encompasses a test pattern generator (TPG) submodule.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8750-camss
>> +
>> +  reg:
>> +    items:
>> +      - description: Registers for CSID 0
>> +      - description: Registers for CSID 1
>> +      - description: Registers for CSID 2
>> +      - description: Registers for CSID Lite 0
>> +      - description: Registers for CSID Lite 1
>> +      - description: Registers for CSIPHY 0
>> +      - description: Registers for CSIPHY 1
>> +      - description: Registers for CSIPHY 2
>> +      - description: Registers for CSIPHY 3
>> +      - description: Registers for CSIPHY 4
>> +      - description: Registers for CSIPHY 5
>> +      - description: Registers for VFE (Video Front End) 0
>> +      - description: Registers for VFE 1
>> +      - description: Registers for VFE 2
>> +      - description: Registers for VFE Lite 0
>> +      - description: Registers for VFE Lite 1
>> +      - description: Registers for ICP (Imaging Control Processor) 0
>> +      - description: Registers for ICP SYS 0
>> +      - description: Registers for ICP 1
>> +      - description: Registers for ICP SYS 1
>> +      - description: Registers for IPE (Image Processing Engine)
>> +      - description: Registers for JPEG DMA & Downscaler 0
>> +      - description: Registers for JPEG Encoder 0
>> +      - description: Registers for JPEG DMA & Downscaler 1
>> +      - description: Registers for JPEG Encoder 1
>> +      - description: Registers for OFE (Offline Front End)
>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>> +      - description: Registers for RT CDM 1
>> +      - description: Registers for RT CDM 2
>> +      - description: Registers for RT CDM 3
>> +      - description: Registers for RT CDM 4
>> +      - description: Registers for TPG 0
>> +      - description: Registers for TPG 1
>> +      - description: Registers for TPG 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
> I had impression there were talks and plans to split CSI PHY out of
> camss. Some other patches got blocked by this, so unfortunately this as
> well. Your cover letter does not answer on this, so unfortuntaly this
> concludes the review.
I believe we are not blocking the ongoing patches for this. I will let 
Bryan confirm this.
>
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +      - const: icp0
>> +      - const: icp0_sys
>> +      - const: icp1
>> +      - const: icp1_sys
>> +      - const: ipe
>> +      - const: jpeg_dma0
>> +      - const: jpeg_enc0
>> +      - const: jpeg_dma1
>> +      - const: jpeg_enc1
>> +      - const: ofe
>> +      - const: rt_cdm0
>> +      - const: rt_cdm1
>> +      - const: rt_cdm2
>> +      - const: rt_cdm3
>> +      - const: rt_cdm4
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>> +
>> +  clocks:
>> +    maxItems: 61
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: camnoc_rt_vfe0
>> +      - const: camnoc_rt_vfe1
>> +      - const: camnoc_rt_vfe2
>> +      - const: camnoc_rt_vfe_lite
>> +      - const: cam_top_ahb
> cpas_ahb?
Ack
>
>> +      - const: cam_top_fast_ahb
> Isn't this cpas_fast_ahb? Why every schema comes with its own naming...
Ack. These were based on Kaanapali patches but we updated these there 
too. Will do the same here.
>> +      - const: csid
>> +      - const: csid_csiphy_rx
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: gcc_hf_axi
> Look at previous generation how this is called: gcc_axi_hf. Use that
> name.
Ack
>
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: qdss_debug_xo
>> +      - const: camnoc_ipe_nps
>> +      - const: camnoc_ofe
>> +      - const: gcc_sf_axi
>> +      - const: icp0
>> +      - const: icp0_ahb
>> +      - const: icp1
>> +      - const: icp1_ahb
>> +      - const: ipe_nps
>> +      - const: ipe_nps_ahb
>> +      - const: ipe_nps_fast_ahb
>> +      - const: ipe_pps
>> +      - const: ipe_pps_fast_ahb
>> +      - const: jpeg0
>> +      - const: jpeg1
>> +      - const: ofe_ahb
>> +      - const: ofe_anchor
>> +      - const: ofe_anchor_fast_ahb
>> +      - const: ofe_hdr
>> +      - const: ofe_hdr_fast_ahb
>> +      - const: ofe_main
>> +      - const: ofe_main_fast_ahb
>> +      - const: vfe0_bayer
>> +      - const: vfe0_bayer_fast_ahb
>> +      - const: vfe1_bayer
>> +      - const: vfe1_bayer_fast_ahb
>> +      - const: vfe2_bayer
>> +      - const: vfe2_bayer_fast_ahb
>> +
>> +  interrupts:
>> +    maxItems: 32
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +      - const: camnoc_nrt
>> +      - const: camnoc_rt
>> +      - const: icp0
>> +      - const: icp1
>> +      - const: jpeg_dma0
>> +      - const: jpeg_enc0
>> +      - const: jpeg_dma1
>> +      - const: jpeg_enc1
>> +      - const: rt_cdm0
>> +      - const: rt_cdm1
>> +      - const: rt_cdm2
>> +      - const: rt_cdm3
>> +      - const: rt_cdm4
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>> +
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +      - const: sf_icp_mnoc
>> +      - const: sf_mnoc
> Which previous generation you used as ordering style? X1E has it
> different.
The ordering is based on Kaanapali patches. Some names have been updated 
on the latest Kaanapali patches to be consistent with previous 
generations. and will update those here too.
>> +
>> +  iommus:
>> +    items:
>> +      - description: VFE non-protected stream
>> +      - description: ICP0 shared stream
>> +      - description: ICP1 shared stream
>> +      - description: IPE CDM non-protected stream
>> +      - description: IPE non-protected stream
>> +      - description: JPEG non-protected stream
>> +      - description: OFE CDM non-protected stream
>> +      - description: OFE non-protected stream
>> +      - description: VFE / VFE Lite CDM non-protected stream
>> +
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          VFE0 GDSC - Global Distributed Switch Controller for VFE0.
>> +      - description:
>> +          VFE1 GDSC - Global Distributed Switch Controller for VFE1.
>> +      - description:
>> +          VFE2 GDSC - Global Distributed Switch Controller for VFE2.
>> +      - description:
>> +          Titan GDSC - Global Distributed Switch Controller for the entire camss.
>> +      - description:
>> +          IPE GDSC - Global Distributed Switch Controller for IPE.
>> +      - description:
>> +          OFE GDSC - Block Global Distributed Switch Controller for OFE.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
> Previous generations call these IFE, I already raised this and you
> changed to ife in Kaanapali. So are all future devices going to use
> rather VFE name?
Will change to 'ife'.
>
>> +      - const: top
>> +      - const: ipe
>> +      - const: ofe
>> +
>> +  vdd-csiphy0-0p88-supply:
> 88->8, so: vdd-csiphy0-0p8-supply:
>
> Same in other places. This is how it is called for every binding.
Ack
>> +    description:
>> +      Phandle to a 0.88V regulator supply to CSIPHY0 core block.
>> +
>> +  vdd-csiphy0-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
>> +
>> +  vdd-csiphy1-0p88-supply:
>> +    description:
>> +      Phandle to a 0.88V regulator supply to CSIPHY1 core block.
> Best regards,
> Krzysztof
>

