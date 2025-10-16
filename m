Return-Path: <linux-i2c+bounces-13578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA44BE2D11
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5415734C8A5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 10:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44E9259CA9;
	Thu, 16 Oct 2025 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6fpOvo4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385BB32863E
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610800; cv=none; b=GnEKniKN5z0OfRNGfY8+PbsOe3YRDkiMd04lYA1GHkahugnr9WbkJk55pwNKiEeofnRi/GDUw4YBApC2pWDIu1HdgdaogbjyygbHiUzMZOsLP1egZ3cayPvdzkmI9sYv17rEq7pFkOZpij+Dw49eY/8/97wG4xyMdrIz4YAtl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610800; c=relaxed/simple;
	bh=WFikhz7ZRtIbncmZ1wHT1zy/N5DaaleJOyfpRNbdok0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lclDuAonRxLbi2nWVdzlTrj23cnRK/oBClTYcfimHhAhLlguf8I4emCRS27d6rGf6U5ne/BaVhARec/dZuiFajxeewRSbX8aQRB3U/T54/zmxiSDI/FbzUaCFtMVOlYZSA65v4bdKznEl6S1RLfgQwoK/lvrobNWET959rFaC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6fpOvo4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GAS6ov022053
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 10:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7US01srTXfkHjr5hd7/lzike6tL4rbOPwhEWWKSwns=; b=L6fpOvo460KhSOZd
	IR1UNC51UDHLG9/U+HSEU7Sn9EXpTTvXH3GWmp7Ms949QvaVNuquvgHcfEi+/zjk
	yepd+WwUIb0wIcbfdk8KJWvwwQfFZiHjzsmtTDwtsUlTlv5bXLzq/lJzDHOPyhuZ
	r/TQxYCThokuZGANSVcrvyHjpPi24yutYk/FK3LjsxocD9w4+D36P5jKSTqWgNPU
	sdsFgLhwUfLB5WCmVQIUIvtpO0hpwdxkI6+sgQdBTooI0oIs4ei4wSQcXtDM6Xws
	3DLcZLjc/agLtLnKSUsjYjCgHzHQK/IWzdTRqV3mIF1ek3qF7FZyFr2vXotloMXv
	YqX7vQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvphahh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 10:33:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78117fbda6eso632014b3a.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 03:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610797; x=1761215597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7US01srTXfkHjr5hd7/lzike6tL4rbOPwhEWWKSwns=;
        b=UL5/MRqsFpf4ibGomdZzI7WSsnL+MrEUfWRrp5/DURJKVPZXeIS7+7/B51fF785ki+
         bR8bNekVXZ5WzPE7kozdblIt0RpgvhOgbZzRzHU154ibDJ1nUBb2eGECQjNLubruStE1
         ATzJ/m1tY+tMmCm8d/2wYgbvRPeUAlwtdtCp6xNXFFMGzW7XZbgo4s8mlwhSuKvB+enj
         rlOOqsYn06fdcMMMSes/GbdanLvc8huEJuz3xjPcunzD7cPJ+j7tRXH8zbAeu19GkvWs
         FdrHLSTG2dXkwZ5MlYHeCYI3q+7fIkNmM1JY48M5ozhb9akBtvZPEXq6ekMMOsug9o9Y
         OVtw==
X-Gm-Message-State: AOJu0YzZRTpgnD9VqI7WcE9GrrSiWYL3qGt5hcky6fTv/D5U7dfQdH+z
	5Puq0Iq72n/hslmtMOUJ6HB1k80MWc+0HPtHh6BIt0HKKVQ/OK3M0/TtEv6DM5QQgxxQ38MpE1B
	DXJbHI2ecOoI8cvGE08tVo5TmQSM8cYGSeqoIDBvJT5TC2/jp0/3mq2FNKRkHhog=
X-Gm-Gg: ASbGnctPnTuew/tyLqUIxWvPLEipX7TDGGn50YcS//zEFh8sSWlC6/dCdAdrfMPst+L
	troT88V4veQi+88+XOZsfZmg/M9jH3yN5qZYYaPNpyP8gDpMDQH2db1lDjxNdLmt/LQl55QbM3k
	aOA2/0XmeaO0RmJpke9ELFJVTWKWbWpYsfO0mSi0CInBX3UA1CK+nPYi3LKXHotzVBElFkZBr1J
	DLYw8b1j9kF0iS21kVRIvGQzQx6rczsryQGKOpn4xMnu3AZifjnIadTSmM5qQOXO1RgGxgOz7Js
	Y7xUkFAMIVc7Afm6TWP6ed6Vvus9ix+f9RY4Eg5wZbo/rLDAk2U3rSHsliiKoY5Nv9ZyTe3nL/W
	1//F3INxwSiMybRi61B0Zs/x78a6ytuphMY57tUPWNXRy/t2SqbNxKT3+eTFy67+re1czmA==
X-Received: by 2002:a05:6a00:2e03:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-79387636930mr34814524b3a.21.1760610796810;
        Thu, 16 Oct 2025 03:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrLSzML+DluoqwIueLsJrUswg52tFyRY8b4V6YDJvsQCOJ7oWVWF0juXOq/0Srsugj9SZ/Vw==
X-Received: by 2002:a05:6a00:2e03:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-79387636930mr34814486b3a.21.1760610796287;
        Thu, 16 Oct 2025 03:33:16 -0700 (PDT)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2c6csm21712627b3a.57.2025.10.16.03.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:33:15 -0700 (PDT)
Message-ID: <1aa133b9-2a99-47cb-8309-7e49b5dc4f85@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 18:33:10 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
To: Bryan O'Donoghue <bod@kernel.org>,
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
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
 <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f0c9ee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RkO7Omd9_SwxoHUsMI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX/bFKTaQW1m5s
 bta6QVVaX5ild+LoOoq7MLOOBZajWXAohUe8y++YhgVliJ77n481V34uILrc/rT8HFaASpJESlr
 19gL0fIHHXCYLo9zq/AYvxwvMfixtY91jDFJkgXK9vWv0fw4WSBHVZzgk+/zgUfLRgiW71ulbzX
 u300XBeOlRxOi0bs5/55X7XZYQ2CuYVYzQY5yBGg5v5KKrf403YarmaVMwgC5aAe7tBoDAaBmvL
 fueALxPGsSLtet6rsHZHoeJkPUcCVAEhUlW6LbMDA0I6X9L5t9NwlF285Kx4I6dRAgqwfo1PELf
 oax8+OpK/LIm3F1TMCtNNZri1k/IE2xxwCtp0aXbrtoZOV38ohDUA+rg7F6wK9s8s+KzIuzB3EK
 J5DAKzx8yG/EjgyXhdWiYBq5lfPe8Q==
X-Proofpoint-ORIG-GUID: KA_IFVzQ8zh39Mz83mIVUXj3GCIxlwRE
X-Proofpoint-GUID: KA_IFVzQ8zh39Mz83mIVUXj3GCIxlwRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

On 10/16/2025 6:09 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +
>> +        /* Deferring the reg update until after CSID config */
>> +        if (!vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
>> +            ops->reg_update(vfe, line->id);
>>       }
> 
> But why ?
> 
> ---
> bod

That a story. When testing the RDI path on Kaanapali, we found one image 
buffer starved at 19/20 stage. We want to capture 20 images but only 19 
received.

On Kaanapali, the AUP and RUP are split into two separate registers not 
a single one. Maybe this hardware change impacts something. Calling 
ops->reg_update() in vfe_enable_output_v2 function only applies one 
buffer address. The downstream code defers AUP and RUP to CSID 
configuration stage. We mimic that and find it can solve this issue.

---
Hangxiang

