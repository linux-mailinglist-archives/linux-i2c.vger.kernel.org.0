Return-Path: <linux-i2c+bounces-13765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6C8C02D98
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 20:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3AD3A8690
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 18:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DDB34B68C;
	Thu, 23 Oct 2025 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8ABAYx+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113ED34B1BB
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242818; cv=none; b=PBH5tzCFxEIS09tI2wZ/XqyCQrNFajCVWusKo+SHGKQ68ly0IoPWjn2fP29UbqKd51G01uEeXa0cUQXjBjomvzGm+mt+HXHppSMq0txrOs0PZ2lBpIjmjAhNYKQQqx4TyAiYpxsXL0hW1qWZtrR9CAdNOogmqD5R6Jj7J/c26fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242818; c=relaxed/simple;
	bh=GDBnkPexQkkYl2bu0lUEtQtyvIN1sbxzvPo1RR+QT0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1fbG7FvwRBk/VpoNrF+QcqqCgQ4fuCfyl2HU1Tldd2u9cjUWV1Fsc46D3t6+JQJNbHltUjR6uQxefxtktiPR7N00BVu4sw81PSB7QAgXo793NQg9r0q/JS86xl2w6xpVi9uylboX+jRIzi3by9MdtvWplhTQ1w9UMsT/egWbs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8ABAYx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEiOlZ024844
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 18:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WhgH/IHL/AJ70KJqzso0EUFol6jlfey6+ytRqUhjUk=; b=C8ABAYx+HbFoeNRX
	BwotEdbvwCi7KZYugul2NQv69q9tIxAy9yvUeXU5kXVE6DxqWIMc3ATBpx5pyb+v
	gQoLeckwNwokjs2XF9zg59m5bpVMyfId+wWZqxh7c7WTL0A/1BYmjQ/wikZdZivC
	tCndYGYkZdYDmZvmX+fCFoUDNMgQ5CGHbEL7WsEE9HIjwRyJq/RFIqPadLu+LWBg
	Z4qPEFsJQ6TcWrdmw3MAamlJFy1v0JF7jFq52Bl1NPS/k2sj5fWuCfZsdCnuKlUw
	PL+nbZC3VcCHYZxTKHlD9X6XAAwrzHT1BVZOKsjvK8vDaYj/oAfSil+GhnnFTD+L
	Uybyjw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w89e5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 18:06:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26e4fcc744dso7183995ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 11:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242814; x=1761847614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WhgH/IHL/AJ70KJqzso0EUFol6jlfey6+ytRqUhjUk=;
        b=VS+XhYIowKCwpRgPm49kr91gmRuxe5g37mzEODFeoUqo5qboqPBJYLXKtndrUiCaFK
         NfdFuB84i2Ms4GJIeml2x8H5geCyZ8WsJ7iRP2VyJkZAgpMNyPeQCQotdB4CQcpKmHlH
         9/EtR6nmcl8IDe+p+ovelUtuGPOJ7Gdi6Ypxg3wtt9wWeNf26y6SJdt2ji3SJNEeC0nN
         fPJ5BTxyiy+VDAeh/4Em9tzxK4BiYAAl3d6gaOuawmUzrTbyBRbHr3py5pgV3WySCgrk
         ZEyJGBwr6G5DkdcfwSckuuV7AOph6AAMW+tU745LHBmj5RsnDiMifNYnWmVKLYq11YEk
         sAuw==
X-Gm-Message-State: AOJu0YxiobwRwLG5noKFoNYNWIYwJQtRccKxDgUlduv8j0UPHyfwyri0
	OFgwOMDYPEh/7OOuBWiz1QKl0P5XYX5BcARlKv8I/Xw8JZZikWllsaBek16oc3HKnVacGeL91l+
	wq6IUs2VChQXhInXWf0XAK/9+5btcxehrrX++/OMqXxgnJIsLepzQu3ZZ3y+xmwY=
X-Gm-Gg: ASbGncvSGS6okzodVlDkyd5xpS7mHISCGuy3py5fudF/3bMwekCy2qdXeizfdnqFabs
	COkNT3LpLYzBe/7Z0Xd1RPYd60b5L1kDqQb30l70n44NR/eNJ75TFAW8UgcPrxSMy1KgSICBwXU
	JstaSETZvIuoKNKQ1WQYmCDe5KiLsutL2Pqt9aaTU3hFeVLR0UP+BkMzN3yp7lmwvYVWv+lWCgk
	xJ10ELfcoEZxt1VLUNOvBEVh9vRHlAaUbKTe+ouAZcDLajMafvnJLN+/yvJco03U1KtDFcAFoQ6
	4bIaUTFa8prQVQrEWbaEmnaJRH2RlLd9YVG3N3H/ewkQhgrRBILkYmUgo0BHgjNDlJSXUN15cyQ
	IUEk7zL4Eb1Q5kQdLYDBVT6yUlwJfan97+jgqoaAQNvz9s1m/Y9PFqA==
X-Received: by 2002:a17:903:2445:b0:246:80b1:8c87 with SMTP id d9443c01a7336-2946e220396mr41675325ad.43.1761242813370;
        Thu, 23 Oct 2025 11:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSbrj1B330BrfNNugomwZfM5VOdQUAFVqFEpA8S9lTdIDLjXk5Ys5pthq10q2T/aWnS0jpHg==
X-Received: by 2002:a17:903:2445:b0:246:80b1:8c87 with SMTP id d9443c01a7336-2946e220396mr41674785ad.43.1761242812755;
        Thu, 23 Oct 2025 11:06:52 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e243a4dsm30029685ad.110.2025.10.23.11.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 11:06:52 -0700 (PDT)
Message-ID: <c9f5dc86-3e48-44e3-8796-104e0434bbdc@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 11:06:50 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
 <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
 <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
 <24b6ce21-aaff-4ecd-8cd7-42df71cfd222@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <24b6ce21-aaff-4ecd-8cd7-42df71cfd222@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX4fr7JPIqEEvJ
 hr0c7V+LyLWcierYFWLLADQ3gepjpm+T8GZkOiSHmXXFzL/U/vu9O1ZZ9fdH3TwDLhwDxAZMIl0
 +nloSq3qj4zV+9qEid0sEf2OovBuhfUG1xLeqj5T+v0ET/IsW4POQwah7iAnPQ2GDbvTkYzdyw/
 tAgSlk59uwSDotlYZoGmgiShSPJzgAojSsaoI3OtVmrKNqdhPgkTiBDpXcS9HsyOalbD4YuX28S
 jz7+uGGc53rTd8TtBOoKFTuRYCcv8ClWB5gllHOYtwnKxrSZRc07tuTTiE27XNuRaEWawq/wKE6
 juMEuuTtbgEp1YQLtLKXsez4z0TSRnj1ld6oLeiNnsoWGraWGTdGtjFXGb72xikjLQ5cd5fpBxv
 TRhKTRZZdkxe/Qf4h9n3ebfG/fySAg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa6ebf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=u1-GT3FIYypCIcOJEnMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ciqm40fNCth8FpAktsMKPfaweF2l77G8
X-Proofpoint-ORIG-GUID: Ciqm40fNCth8FpAktsMKPfaweF2l77G8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015


On 10/23/2025 4:13 AM, Vladimir Zapolskiy wrote:
> Hi Vijay.
>
> On 10/23/25 07:52, Vijay Kumar Tumati wrote:
>>
>> On 10/16/2025 5:27 PM, Vladimir Zapolskiy wrote:
>>> On 10/17/25 02:53, Vijay Kumar Tumati wrote:
>>>>
>>>> On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
>>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>>>>> subsystem for Kaanapali.
>>>>>>
>>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/media/qcom,kaanapali-camss.yaml       | 494
>>>>>> +++++++++++++++++++++
>>>>>>     1 file changed, 494 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..d04c21103cfd
>>>>>> --- /dev/null
>>>>>> +++
>>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>>> @@ -0,0 +1,494 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm
>>>>>> platforms.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,kaanapali-camss
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 16
>>>>>> +
>>>>>> +  reg-names:
>>>>>> +    items:
>>>>>> +      - const: csid0
>>>>>> +      - const: csid1
>>>>>> +      - const: csid2
>>>>>> +      - const: csid_lite0
>>>>>> +      - const: csid_lite1
>>>>>> +      - const: csiphy0
>>>>>> +      - const: csiphy1
>>>>>> +      - const: csiphy2
>>>>>> +      - const: csiphy3
>>>>>> +      - const: csiphy4
>>>>>> +      - const: csiphy5
>>>>>> +      - const: vfe0
>>>>>> +      - const: vfe1
>>>>>> +      - const: vfe2
>>>>>> +      - const: vfe_lite0
>>>>>> +      - const: vfe_lite1
>>>>>> +
>>>>>> +  clocks:
>>>>>> +    maxItems: 34
>>>>>> +
>>>>>> +  clock-names:
>>>>>> +    items:
>>>>>> +      - const: camnoc_nrt_axi
>>>>>> +      - const: camnoc_rt_axi
>>>>>> +      - const: camnoc_rt_vfe0
>>>>>> +      - const: camnoc_rt_vfe1
>>>>>> +      - const: camnoc_rt_vfe2
>>>>>> +      - const: camnoc_rt_vfe_lite
>>>>>> +      - const: cam_top_ahb
>>>>>> +      - const: cam_top_fast_ahb
>>>>>> +      - const: csid
>>>>>> +      - const: csid_csiphy_rx
>>>>>> +      - const: csiphy0
>>>>>> +      - const: csiphy0_timer
>>>>>> +      - const: csiphy1
>>>>>> +      - const: csiphy1_timer
>>>>>> +      - const: csiphy2
>>>>>> +      - const: csiphy2_timer
>>>>>> +      - const: csiphy3
>>>>>> +      - const: csiphy3_timer
>>>>>> +      - const: csiphy4
>>>>>> +      - const: csiphy4_timer
>>>>>> +      - const: csiphy5
>>>>>> +      - const: csiphy5_timer
>>>>>> +      - const: gcc_hf_axi
>>>>>> +      - const: qdss_debug_xo
>>>>>> +      - const: vfe0
>>>>>> +      - const: vfe0_fast_ahb
>>>>>> +      - const: vfe1
>>>>>> +      - const: vfe1_fast_ahb
>>>>>> +      - const: vfe2
>>>>>> +      - const: vfe2_fast_ahb
>>>>>> +      - const: vfe_lite
>>>>>> +      - const: vfe_lite_ahb
>>>>>> +      - const: vfe_lite_cphy_rx
>>>>>> +      - const: vfe_lite_csid
>>>>>
>>>>> The list of 'clock-names' values is not alphanumerically sorted.
>>>>>
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    maxItems: 16
>>>>>> +  interrupt-names:
>>>>>
>>>>> Missing empty line to separate properties.
>>>>>
>>>>>> +    items:
>>>>>> +      - const: csid0
>>>>>> +      - const: csid1
>>>>>> +      - const: csid2
>>>>>> +      - const: csid_lite0
>>>>>> +      - const: csid_lite1
>>>>>> +      - const: csiphy0
>>>>>> +      - const: csiphy1
>>>>>> +      - const: csiphy2
>>>>>> +      - const: csiphy3
>>>>>> +      - const: csiphy4
>>>>>> +      - const: csiphy5
>>>>>> +      - const: vfe0
>>>>>> +      - const: vfe1
>>>>>> +      - const: vfe2
>>>>>> +      - const: vfe_lite0
>>>>>> +      - const: vfe_lite1
>>>>>> +
>>>>>> +  interconnects:
>>>>>> +    maxItems: 2
>>>>>> +
>>>>>> +  interconnect-names:
>>>>>> +    items:
>>>>>> +      - const: ahb
>>>>>> +      - const: hf_0_mnoc
>>>>>
>>>>> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml
>>>>> etc.
>>>>>
>>>>>> +
>>>>>> +  iommus:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  power-domains:
>>>>>> +    items:
>>>>>> +      - description:
>>>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>>>>> Controller.
>>>>>> +      - description:
>>>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>>>>> Controller.
>>>>>> +      - description:
>>>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>>>>> Controller.
>>>>>> +      - description:
>>>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>>>>> Controller.
>>>>>> +
>>>>>> +  power-domain-names:
>>>>>> +    items:
>>>>>> +      - const: tfe0
>>>>>> +      - const: tfe1
>>>>>> +      - const: tfe2
>>>>>
>>>>> Please remove all 'tfeX' power domains, they are not going to be
>>>>> utilized
>>>>> any time soon.
>>>>>
>>>>> When 'power-domains' list is just a single Titan GDSC,
>>>>> 'power-domain-names'
>>>>> property is not needed.
>>>>>
>>>>>> +      - const: top
>>>>>> +
>>>>>> +  vdda-pll-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>>>>> +
>>>>>> +  vdda-phy0-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>> +
>>>>>> +  vdda-phy1-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>> +
>>>>>> +  vdda-phy2-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>> +
>>>>>> +  vdda-phy3-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>> +
>>>>>> +  vdda-phy4-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>> +
>>>>>> +  vdda-phy5-supply:
>>>>>> +    description:
>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>
>>>>> What is the difference between vdda-phyX-supply properties, why do 
>>>>> you
>>>>> need so many of them, when their descriptions say they are all the
>>>>> same?
>>>> Each of these supply power to a specific CSIPHY and could be different
>>>> based on the board architecture. But I agree that the description 
>>>> should
>>>> probably capture that than just relying on the name.
>>>>>
>>>>>> +  ports:
>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>> +
>>>>>> +    description:
>>>>>> +      CSI input ports.
>>>>>> +
>>>>>> +    properties:
>>>>>> +      port@0:
>>>>>
>>>>> Please use
>>>>>
>>>>>       patternProperties:
>>>>>         "^port@[0-3]$":
>>>>>
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        unevaluatedProperties: false
>>>>>> +        description:
>>>>>> +          Input port for receiving CSI data on CSI0.
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: video-interfaces.yaml#
>>>>>> +            unevaluatedProperties: false
>>>>>> +
>>>>>> +            properties:
>>>>>> +              clock-lanes:
>>>>>> +                maxItems: 1
>>>>>
>>>>> Please remove 'clock-lanes' property, it is non-configurable, 
>>>>> redundant
>>>>> and tends to store some irrelevant value.
>>>>>
>>>>>> +
>>>>>> +              data-lanes:
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +
>>>>>> +              bus-type:
>>>>>> +                enum:
>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>> +
>>>>>> +            required:
>>>>>> +              - clock-lanes
>>>>>
>>>>> The 'clock-lanes' property is expected to be removed.
>>>>>
>>>>>> +              - data-lanes
>>>>>> +
>>>>>> +      port@1:
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        unevaluatedProperties: false
>>>>>> +        description:
>>>>>> +          Input port for receiving CSI data on CSI1.
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: video-interfaces.yaml#
>>>>>> +            unevaluatedProperties: false
>>>>>> +
>>>>>> +            properties:
>>>>>> +              clock-lanes:
>>>>>> +                maxItems: 1
>>>>>> +
>>>>>> +              data-lanes:
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +
>>>>>> +              bus-type:
>>>>>> +                enum:
>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>> +
>>>>>> +            required:
>>>>>> +              - clock-lanes
>>>>>> +              - data-lanes
>>>>>> +
>>>>>> +      port@2:
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        unevaluatedProperties: false
>>>>>> +        description:
>>>>>> +          Input port for receiving CSI data on CSI2.
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: video-interfaces.yaml#
>>>>>> +            unevaluatedProperties: false
>>>>>> +
>>>>>> +            properties:
>>>>>> +              clock-lanes:
>>>>>> +                maxItems: 1
>>>>>> +
>>>>>> +              data-lanes:
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +
>>>>>> +              bus-type:
>>>>>> +                enum:
>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>> +
>>>>>> +            required:
>>>>>> +              - clock-lanes
>>>>>> +              - data-lanes
>>>>>> +
>>>>>> +      port@3:
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        unevaluatedProperties: false
>>>>>> +        description:
>>>>>> +          Input port for receiving CSI data on CSI3.
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: video-interfaces.yaml#
>>>>>> +            unevaluatedProperties: false
>>>>>> +
>>>>>> +            properties:
>>>>>> +              clock-lanes:
>>>>>> +                maxItems: 1
>>>>>> +
>>>>>> +              data-lanes:
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +
>>>>>> +              bus-type:
>>>>>> +                enum:
>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>> +
>>>>>> +            required:
>>>>>> +              - clock-lanes
>>>>>> +              - data-lanes
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - reg
>>>>>> +  - reg-names
>>>>>> +  - clocks
>>>>>> +  - clock-names
>>>>>> +  - interrupts
>>>>>> +  - interrupt-names
>>>>>> +  - interconnects
>>>>>> +  - interconnect-names
>>>>>> +  - iommus
>>>>>> +  - power-domains
>>>>>> +  - power-domain-names
>>>>>> +  - vdda-pll-supply
>>>>>> +  - vdda-phy0-supply
>>>>>> +  - vdda-phy1-supply
>>>>>> +  - vdda-phy2-supply
>>>>>> +  - vdda-phy3-supply
>>>>>> +  - vdda-phy4-supply
>>>>>> +  - vdda-phy5-supply
>>>>>
>>>>> Please exclude supplies from the list of required properties.
>>>> One of these supplies is required based which PHY the use case is 
>>>> being
>>>> run. Can you please advise how to handle that? Thanks.
>>>
>>> 1. Please rename all of them, reference to qcom,x1e80100-camss.yaml,
>>> qcom,qcm2290-camss.yaml or published on linux-media
>>> qcom,sm8650-camss.yaml
>>>
>>> 2. Remove all of them from the list of required properties, and in a
>>> board
>>> specific dts file add only the neccesary ones, that's it.
>>>
>> Thanks. We will try to follow the same for rev3. Just a caveat though.
>> If, for instance, two CSIPHYs have different 1.2 supplies and they are
>> required to be operated concurrently, it may be is a problem? as we can
>
> It should not be a problem, you can add two regulators, and it's fine,
> anyway all of them shall be optional properties, because it's unknown in
> advance which ones are actually needed.
>
>> put only one of those in the board specific DTS for the 1.2 supply node
>> (ex: vdd-csiphy-1p2 in SM2290). Is it not? However, if we don't have
>> such a use case requirement on the upstream may be it's OK. Thank you.
>
> Link to the published SM8650 CAMSS dt bindings, please follow this model:
> https://lore.kernel.org/linux-media/20251017031131.2232687-2-vladimir.zapolskiy@linaro.org/ 
>
>
> Please note the chosen naming scheme, when the supply property names
> follow the SoC pad namings one to one.
>
Thanks @Vladimir. Yes, this make sense if all of the reference and 
customer boards follow the internal power grid design. But agreed that 
this is all board specific. Please let us know your thoughts on the v3 
bindings for KNP. They mimic the existing 2290 and x1e80100 bindings. 
Thank you.

