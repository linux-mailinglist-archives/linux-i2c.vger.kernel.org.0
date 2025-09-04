Return-Path: <linux-i2c+bounces-12620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCF0B43ABF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 13:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC45E1BC1698
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 11:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE22A2F7455;
	Thu,  4 Sep 2025 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqoPVOcO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391342857C1
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986694; cv=none; b=C67TYjWknLOk/ZlC4Pz73rhElM4wBRrM4xD+TGb1pFdG0tKSQ7KHAAizZdgvWfG9N0BdpYbl0TrZxSCgRCL1LCTJRSrAmod3/N3IwED4hR2YpbgIbCuVM8X7A1RcBTgqgFk7CVBCcNr00Uh+YYFlUPgtrFWXUgXv3irAN0jl+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986694; c=relaxed/simple;
	bh=JSAewW8zh+fZ1yWrIB6R0zPGW0XQeqq2H1lJm3a4q3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vv+92w89G7U2yzeE/VsWltKazZ4T2J81mRaYSjZAdAQ9adQBQalGstlUjW+NZjUVKr7KL2gTXNxZ+P7IuSZUJyK4whaO4Rd/R9L9OM+vLAKSQ4IHQfUR7Czad7Vg/b+7TglxVydHOOkRq3sPiEdJwNn/AaLaCucJZC5egQdW60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqoPVOcO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7mL013602
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 11:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R584vso3cXH+lZvw8QUqkj0DVoP99aWNoUcXQnm1Bos=; b=iqoPVOcOymn9TzJw
	ev9hVa9paR1Bu/l3KDd8xXCkudVJcQnKdARp0wjkqgE5Ji5oJXNHZToxR+8s037T
	U+XCLWZj6sT3PuAYLcflUyN4YlmLAgPS1pPcvwQMZC8Ip1BgTmsyW0VZksperwGP
	EB9ED036mlEHy7VcxDD6RUaYEcNlKPlYf4fna0SM68P3zyynlfFc6MkcxorOu6Ez
	6mYrBIiKxm5dKHiWcmUPX38kSlTHrkH7DigmqUwEw0Vqznvce8GzdFWuejvlCyBA
	dIPRkxdC7ZV7MvazlRdzpnpqFgQM80Mm1mWseqMyGiOz9Ycr2rgIOG8542YxxB23
	logJKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyb8kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 11:51:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32216a52cso2410701cf.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 04:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986691; x=1757591491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R584vso3cXH+lZvw8QUqkj0DVoP99aWNoUcXQnm1Bos=;
        b=RTj1oveq/sXjllqeZs3Wltckn5J7ppyWu0EoCgoZ969XAmf/P50uT14B74oF+RXDhv
         UjxcewyqbBlDhlPu+wge+zmfDf55/1LL74tHcEcAHDml90OZ7CQ97JANGh67377X3bS9
         tP+bEQaJ7ACSVoxoiGv3VkI77fYZO/ZoEMlRQ1VasRsKn05SmCAlkrNVpUz1eRYow8YP
         f4YiKwCsjDMtLEvjQroPyruRfi7whTkfwfznlfk+wKBzPAEmy2aDivvBgZLLz7vleQ7C
         +jgOE4thf/GjqOS6mM0UNR5Trd+M8eVLgCtjUJo8ir1JKAx4pYGVQAHZfyIL7sV0vGI1
         uItw==
X-Forwarded-Encrypted: i=1; AJvYcCUUDb9UxoExuolBNiuo2XvRRPz4ME7TRHT0IGPpf5EFSvbfONaVUDBQ8yFDdt1+nQ0B1y3reW/wWmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFibXfzVv8j/hLZqwEHDGT2ut6nnJrvU74ePIlseaYmAwMpQk
	Vj3i+Treld2RV6VPzbiThQa4z6e0fInc19q81/0nEGx2FCNu2WTTPUN6IRFnRrLR1mv0R2Vf4Wo
	Ch3+oYgtP6QN8rXhspUK4D+oghCUUo3Gn8V8va1sDC9byCyGjG8wSTDGrauuFdx0=
X-Gm-Gg: ASbGncs69Dm1Et24Fd0j0Q/0/TPtHo9L7pon9M5jZHKd6ykyKzCsRiJzNadbrT9r8Co
	GLPrW36xC4Z0qEWKw+B60mJpms+rPLTjoDyfToTT05RzTlYqnJyKzF+qRYLU6Gds4+Jx7osricA
	bGmzkA0gUhW2ujZhlDpOz3GRMbV+d/ZQzVRrBS76NWzCzLxr3FBU2EtUIC5ze0DW2Kq/UEBfR5D
	Rx1vexRVLr1LE12YaXjviWRtbKxADtCCAdFIwHcjOeOBVumXAw2UgK3ll+EZ4sezXEQlXLLODnY
	epQWyOe4P52fJ9PONZ8jp0cs/GLMVdTXHNDq9JmQdMbpnElrzdgdPmGnbrWaPaAzEk/DKH0p73C
	vXiyu3bMLTN4HQlphdfmvVQ==
X-Received: by 2002:a05:622a:1183:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b30e98a593mr167186551cf.8.1756986691124;
        Thu, 04 Sep 2025 04:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtk32uxf4nTUrAFGKTvW4bcrfE5iHxFvZZlL7ScTS2HEnwcL8cjqjvnygnT0gm/C5S7hxpyA==
X-Received: by 2002:a05:622a:1183:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b30e98a593mr167186321cf.8.1756986690665;
        Thu, 04 Sep 2025 04:51:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm1434629966b.88.2025.09.04.04.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:51:30 -0700 (PDT)
Message-ID: <72a24049-81e4-4ce9-8bdf-63315209be7a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 13:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
To: Luca Weiss <luca@lucaweiss.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu>
 <aJnefpETGJm_cuRY@shikoro> <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b97d44 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=_dxgTR6_AXVo8Bd06IIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jSzUYA2xL-2t0CyUdmLOojjtYkjW8G06
X-Proofpoint-ORIG-GUID: jSzUYA2xL-2t0CyUdmLOojjtYkjW8G06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX5j+fc945kLMm
 DNU4wJ05QPbDHiXb9GTjdOiOt1xWoOwoEuVR3M1Ln9kbRqFOmz2dENW+GJF102GJoVy5xOc5SS1
 ouE1Wvj6r/Qj9QqmjYzTJsEElZiV8j/DldVYS/r3LoxYGG/+cJGUmcvbEg0ENMoROF1IRLRebdS
 eSS0jbELCG6+3Xpv8SbV+CqLyu7g7/8T5VbbltEfsK3i+j7wYT3XlFIF8tNUDgLdsAv651TGNxZ
 4i1vnTJawB6rxGIQx4YnESVQGiXcViWghFiKIf75b/eecJsdeDdHnLw/RlwuPqzXAapdEHfaS3Q
 1Mz1zv/8bdf3XPx79N4LbLaAGF95sljDwQBkunf3r1vaqvDFVaNBZiyPmhTB3+vpVD3RfcRPEDN
 W8QVq4Ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 8/15/25 9:12 AM, Luca Weiss wrote:
> Hi Wolfram,
> 
> On 2025-08-11 14:13, Wolfram Sang wrote:
>> On Sun, Aug 10, 2025 at 05:37:53PM +0200, Luca Weiss wrote:
>>> Add a config for the v1.2.5 CCI found on msm8953 which has different
>>
>> Given the above version number...
>>
>>>  static const struct of_device_id cci_dt_match[] = {
>>>      { .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
>>> +    { .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},
>>
>> ... why don't we use it here to stay consistent? cci_v1_2_5_data?
> 
> I don't think the existing 'v2' or 'v1' configs have much to do with the actual
> HW_VERSION of the IP block. For example on of the newer Qualcomm SoCs has HW
> version 1.7.0 and is many years newer than the msm8996 which was called 'v2'.

Most of the i2c-speed-dependent configs are electrical and therefore may
be configured as you wish.. I recall Sony Xperia kernels made changes to
that rather often, whether really necessary - I don't know.
The programming guide suggests a couple sets of values, picked in order
to meet the I2C spec.

The queue depths and max r/w lengths are per-instance (SoC specific) and
change very rarely.

> 
> I'm also not sure what these parameters depend on, if it's CCI HW version, or
> something else. So naming it after the SoC should be a safer bet. Also the
> msm8974-cci was only named 'v1.5' because it's an inbetween mix of the v1 and
> v2 that were already upstream so arguably that one shouldn't have been called
> v1.5 in the first place either.

AFAICS there is no "v2" CCI in existence, msm8996 is v1.4.0 and newer
platforms are v1.x.y.

JFYI there's a revision ID register at (base + 0x0) which the driver's probe
function conveniently reads and prints with dev_dbg.

Konrad


