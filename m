Return-Path: <linux-i2c+bounces-13938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F022C26731
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 18:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 319FD4F6983
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 17:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2845A26ED55;
	Fri, 31 Oct 2025 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YY8Lpu64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jl3UyC9z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556C2638BC
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932392; cv=none; b=HAaIkOK5OzuHIM1SF5JFLrriDjAzgm/zLxbka5ApUgf3OWFEqsdg72xmy5HabQP+HK9vinrmpd/bOP/WtUVvOgAoDHQNHRWXQTHg3SdGRRNWqJ1kA+u14VxZkY+ENDx+k5h7tEoU0gd+zGwwN0nlMD3jMTB1OIAn0qL6GxzTNPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932392; c=relaxed/simple;
	bh=9r95UIBBjp4mnnhzDK3albRfTo6ajUxhz5dWwRn3JT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUctDUJ4wO0E10TvPOovzzY6omuYTJXq5bED7E9U04bK8yZRG2Avf1kwzhUT4e2lH5sR0FamEBfJNpRgHaj+gKXEfXeoFRPeK+sWKSh8muwLZq93Qr3J+w4UdMjRbN0dBwk8b3Mtq8cfT+t/4U+67iVhZ3XVDm4TirmVjjpjlm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YY8Lpu64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jl3UyC9z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VHWQY8832760
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 17:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yR/eQ6nEfWYK1gsoP/1xYu+tjBXbd2aFGNjOcR4YMY0=; b=YY8Lpu64q6kUMUSn
	YHdLXm+cx6KiAp2az+U62ud93deOdzjyD4CsV3t/c/R+jK0uR1Bk8xfR8WYGLHMu
	sXUGVrkU/qlYHaoYzSA/YsXAaoMq8JFv0YQu3vxpUjnQ4l4iPEJ6PFqChjNVmHCI
	liUY+N/Q5thk8b5oXctaDp6eh5wJKw7VdwEAqNZmVovIh0/hT1JcMgV+NRNkyU9z
	McMWTArr26bse5Z0oz1W5VhvjtzKerv0Cz/pN/j6QT1zKgVA4k5pQxxiztsLc0QG
	Uy3tIpVcv3aju6CzVTMxh9qJvRYn5L27V10FdG8fA7ZDOMmdVSaaAMEEcBkEsjMh
	RtGC/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb324n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 17:39:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-798920399a6so3383058b3a.0
        for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761932387; x=1762537187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yR/eQ6nEfWYK1gsoP/1xYu+tjBXbd2aFGNjOcR4YMY0=;
        b=jl3UyC9zR5jX3XnqB6rtN7PwF+IlHgKPalhRCoMi3gMgCcIL2d43p7YZNF0LJATXqm
         AHUFLO1ZKwXhSscJ6bmMQy8Ed81EJ/CAjir4JBfJYWyr/C/dt2w3QqimoZvA5Q9JhTC0
         PGsBwoNDObf91ICT6UQhxvwID+htKL+WhpJxItgjDg1hay+vp7ek4G5AvxBBhuAgLKIS
         94ZpslCexIdE3+33LPD7ZaoCDGzDe0oB9KUX9bu6WwAST52Dp55Oar3hP4OLMJNkieQu
         qbYLbVgRkLFfyKtO98tGAHcXkOVx6T9XjbcVb15XgJgXz2AmCD0VZJR9yrQY4e6a7y3v
         YHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932387; x=1762537187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yR/eQ6nEfWYK1gsoP/1xYu+tjBXbd2aFGNjOcR4YMY0=;
        b=wXsRyTLAnvv6urLBHknjDDXCWxmOa9vACYor6eBZ4N9tzgf5/esO4tliusL18X9zQH
         6C8bxCdJeDqHyvg2F4ThKO6bb2UeoJFWFvGq3fnUGpuYNLFl7upFzBAuxR+RcEMfgtA7
         btFRjw/GqCezbhpZeSF/ZIbB4mrk4nuNW56+qT/T4taAbN7HS0Y3LZ0dBhx8+KfOK2fG
         eTh6FnsL6UqrTKGWrf1Py/MrLFh9rcdRu1d19gQFpS47EpNlB8uHvFcXXso3A1zaT05h
         4bV5Nq2Od+rPETezrdhDozZ7nVTBWnjMCQvYxvjB+v/qc89c7lkYSvsySEgrT7nDzeWI
         0JKw==
X-Gm-Message-State: AOJu0YylUnC+W7Q37EE3cC7If4ucc0rj/dVSlUo3B8+gG3Qh37zdHMPf
	++VSIS9dhYjp80BtEqR61/gsYGaGQCLBGAKfuu9DOMBNfiOgo2DHFBOimP3KXFggBY0Orl3URoc
	oyQDc7pm4jH6g0I2Q4MQ8k4/cn4aaDmKo39Vxrx+ZH/4o6S5hBFuqpYJuTPmqQAQ=
X-Gm-Gg: ASbGnct1OSKKwxNQvkDm7aQ4oPIwSf3ZP8ZPFIMtg+j8YVYLTjfyT88aWaH4IVvag6h
	71xvFkJXeJJUXPWQBcbJTlo+BF4s3/Eds+QivIe5m4g+Uj859Lz1xbj6D7QxhdHXSGprdjEX76y
	V8UZoAkxFV4vWrbhkcgjd6UgICSD+nh/OaH2Po3RMxBcNO52hr4rWiK/ax8kzSRGA8YtwANDnvg
	fU4pw4unN/Mytvse69h7z0xXyDx5VwaIhInex85W1CmW5DpGLYWgxwfP8BDTme8q4iciBsY4hqo
	obQIORrvKeHfUf7keOeX3/Cm2wMirYQC1kuL3x8H/apGn564nCu+oa3QigbSzl5XaulgqUtRKyD
	11nsjg67sGnsNWaAqC7dtg2fZgFx+gT2V4BsGxFV5HHyEDHyuP2InNQ==
X-Received: by 2002:a05:6a20:734a:b0:340:d7a6:e4f0 with SMTP id adf61e73a8af0-348ba48c29dmr6205055637.7.1761932387001;
        Fri, 31 Oct 2025 10:39:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDvDg3/tyOBLk5l/9n31MvNUAadc8WlCR2EWs628AsYHlPuKlXd1Ebmld8BJ4tcvQ5fMueIw==
X-Received: by 2002:a05:6a20:734a:b0:340:d7a6:e4f0 with SMTP id adf61e73a8af0-348ba48c29dmr6204999637.7.1761932386484;
        Fri, 31 Oct 2025 10:39:46 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b9162523sm2706166a12.16.2025.10.31.10.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 10:39:46 -0700 (PDT)
Message-ID: <e9da04ab-5119-4bfd-a25c-50e7b2ef05d3@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:39:44 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
 <20251030-add-support-for-camss-on-kaanapali-v5-2-f8e12bea3d02@oss.qualcomm.com>
 <631e4da1-92a0-4d44-b92e-bdcc56196c26@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <631e4da1-92a0-4d44-b92e-bdcc56196c26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yQHUaJHINgNZ0uQq5nstQ2HWJwDHvkd4
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6904f464 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=S8sT8YeZYYt2hGoWfaQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: yQHUaJHINgNZ0uQq5nstQ2HWJwDHvkd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfX+iwfXVuKQWOL
 50xREP85KiaVuzNGI2QzEAQbwwlSfcCUWe82CGatuOyMZfTSoxEO99JucFlJ5aBDJqD1CEAlmgq
 MPx1LiG6j2+9ARRcFB42vjPNE++uO4NbQ+XFnVRLjOnf2CuA5MPAYB8ghDhOsjin932wXDqurvn
 KLi53N7NqrMLnCLns5m0droWwBBAlEVgYdXx9Rp0/nnQr8y9CXUQ/GEtZBMmVsZr2DYynmwRnGC
 rU8Ejgup3zNgQATHQJnlSNg46YtFpdzSQ3xnEvDUkeMdwGcKQ0Hf+pC2zejYnpT6jLDoxz79pKR
 LrYrXi+YEoHFj5+gvqyh0QnW/uLmEv6jQiEBzDHW9adiugbv+IGMPkGb5X5jMo1KGVcfjL90YBS
 1rz7nPYeASo3PqZNSTKoxxheBr0tzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310158


On 10/31/2025 6:50 AM, Bryan O'Donoghue wrote:
> On 31/10/2025 02:59, Hangxiang Ma wrote:
>> Add the compatible string "qcom,kaanapali-camss" to support the Camera
>> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
>>
>> The Kaanapali platform provides:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 406 
>> +++++++++++++++++++++
>>   1 file changed, 406 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml 
>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..c34867022fd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 16
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>
> No test pattern generator on this part ?
>
> We have patches in-flight to add TPG so it makes no sense to omit 
> these registers from current or new submissions.
>
> https://lore.kernel.org/linux-media/20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com/ 
>
>
> While we're at it we should consider adding in the other key 
> functional blocks.
>
> OFE, IPE etc, there's no harm in including the registers even if the 
> intention and outcome is never switching that functionality on.
>
Hi Bryan, we have quite a few register spaces on Kaanapali or any other 
target that are not required for the RDI only CAMSS driver, including 
ICP, JPEG, OFE, IPE, CDMs and some custom modules like CRE along with 
the TPG. So do I understand your suggestion correctly that you advise 
all of those are enlisted in the DTSI and the bindings although the 
driver doesn't make use of or map them?
>> +
>> +  clocks:
>> +    maxItems: 34
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: camnoc_rt_vfe0
>> +      - const: camnoc_rt_vfe1
>> +      - const: camnoc_rt_vfe2
>> +      - const: camnoc_rt_vfe_lite
>> +      - const: cam_top_ahb
>> +      - const: cam_top_fast_ahb
>> +      - const: csid
>> +      - const: csid_csiphy_rx
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: gcc_hf_axi
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: qdss_debug_xo
>> +
>> +  interrupts:
>> +    maxItems: 16
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +
>> +  iommus:
>> +    maxItems: 1
>
>
> This can't be right.
>
> The experience we are having with Iris for example shows that 
> restricting the iommus is wrong.
>
> For this and future bindings I'm expecting to see the full list of 
> AC_VM_HLOS S2 VMID targets.
>
> The second we try to switch on say something like the JPEG encoder 
> this list and its upstream binding becomes a problem.
>
> - S1_IFE_HLOS        @ 0x1c00
> - S1_CDM_BPS_IPS_HLOS    @ 0x1820
> - S1_CDM_BPS_IPS_HLOS    @ 0x18c0
> - S1_CDM_BPS_IPS_HLOS    @ 0x1980
> - S1_CDM_BPS_IPS_HLOS    @ 0x1800
> - S1_JPEG_HLOS        @ 0x18a0
> - S1_RT_CDM_HLOS    @ 0x1860
> - S1_CDM_BPS_IPE_HLOS    @ 0x1840
> - S1_CDM_BPS_IPE_HLOS    @ 0x1880
> - S1_CRE_HLOS        @ 0x18e0
>
> The ICP mappings can come later if ever via iommu-maps..
>
> ---
> bod
>
Similar to the above, You are advising to declare all the S2 HLOS mapped 
streams in the bindings and the DTSI? If we do that in the DTSI, I 
wonder how we can specifically map the RDI output buffers to the IFE 
context bank only, for instance, going by the current CAMSS driver 
implementation. Perhaps, IFE should be the first one in the list for now 
and the driver will be extended later when we support more devices? I 
will explore on that. Good to understand these details and practices. 
Thank you.


