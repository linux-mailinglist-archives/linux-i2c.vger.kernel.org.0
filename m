Return-Path: <linux-i2c+bounces-14957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3940CFD1FA
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 11:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79C4B3013571
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A995330C371;
	Wed,  7 Jan 2026 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypk1jSHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Une8yqh+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE5306B12
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780486; cv=none; b=hTqH7fQaXI7A4FSN9vnVFN38A+/kfhykRJkMtGQrhZMu8QNx3LJAHlivvInbqY33EtHErB8LGIg57YuTXTUEowIia8m7Nn8/zon8nxDZF5lstYjDp9W7pi7vzcatnp1MfbuEdVyuV5TRLBuLnle//pDH1SRsSL7Obofo674emGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780486; c=relaxed/simple;
	bh=L69VkYdJmsTIClgxVnQFqU6KGnt9Tyfdb9oAJudyy7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1b0h4UhtyMnC2cUku8+znKveRP0x9mPtUFwCXtBqt7bfxD7wKBXBg2jo3BIxVlDBD6N0yobNZkLOissot6lGSVSQoADJqnzGRIgDyqARb0j/4LPQAbgI3JePM7wcG9foWz09MBCXRBwyF8qRwiQPsAb8blaIpr3U2B2BQvHj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypk1jSHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Une8yqh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079cFdJ2877784
	for <linux-i2c@vger.kernel.org>; Wed, 7 Jan 2026 10:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCZy5ZimfodLcwbOaVLFHW7iZbjkqH8ixo5lKjkcUd8=; b=Ypk1jSHwl/b00Pfk
	2AOrICYvkLZD5SxoBmRjodjR59meIdRymT11tyO6PLPzHHDfYptjq25kVnf17a3t
	vm58JPvgWMlm5At1d3rhW0pgnN3QgWSPFl7tzpUIFoDK5QhId7dmn0VCxefXqyaj
	2+Jnm+kW2OuX5V0PjyYiunkEg7aQVeBv7zbNO0T2MW5B6X8pOlLG6+KNqZflbqgK
	U2lH/zUfGhrg3D44O/coBCe+B+Al8BWnPNnAXbbbiUtYemzAuIvltnhITH3MRWFv
	HdP61BcSANtI5mTgQNwGSi1GNT/Q6xs7zuk/sTbVUrbVR+VqKDrQw75NWry0C5F0
	DQynHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1cr37b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 10:08:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb0ae16a63so222728185a.3
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 02:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767780483; x=1768385283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iCZy5ZimfodLcwbOaVLFHW7iZbjkqH8ixo5lKjkcUd8=;
        b=Une8yqh+WD/C5bg8CpP3Mzj3aL1KzV/eUx19vWVqyAIIryLD580oqo787wp56Y4JqH
         HlmpacHF6uogs5ShylLo8EiKyQVQSp8IL5pOrkCgz8TzQ7ETQ6njgzYP7p/CqQsKQBuy
         tlMm7kAcxOT5Zzx0Ohtn4CJ6J6sxEm/kXRiO9K+eEtxmPHZkP/hgXmyLNuTDaQmv3gyk
         w/FFiqUpnRwVVWsp79swFrwrOzRVkpvrziQfz0c9KwsE+v+3LiZd5zXpd/WE2UKWZDLF
         Kx+FhCiU/OBI+ZlT8iyTr/SCcYgKNnnMqGfGYE15yR7UxmkcCvyr47fmXIhAPtinVkji
         FBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780483; x=1768385283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCZy5ZimfodLcwbOaVLFHW7iZbjkqH8ixo5lKjkcUd8=;
        b=UmlS75w7zVbEQzLkp95yTpS7CjMtER9RnuTwf5/d68toZTxJmESDF3HN8aE2WXxi8v
         dQ5QVP50WhJpjDNFMw3ddlpP06AhQH5qFHlj41SrdKNqUrmxqKEH8BJqIEThDZBJrdBe
         xcnv2/k25Oa1Ve5JjAtEP/nRE20bWFPjYSmKJ/zU0bqVWAupf5fWZ8Sn5JrxQZ+AReRu
         sFOVj10PYyLvZNaIqo4rUvmcbBdgDD8s4K1Ch1SJgw7Efj5RVk0mm7BYQaHnSXeYnxii
         1iQnqknKtGFwWzm3FGYKYBPYOQYypTgbSzKK0zU9D3XmMVrtNWu9A6mzJlvGgvJw0vu7
         ir8w==
X-Forwarded-Encrypted: i=1; AJvYcCVqdpCHZkbprnrkAgiXGxEu1agDJemy110Fs4OLMqEZQiPC/6nHfrBfY+JsaBfQuBVMqp0HLaTwnXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDZUin7kSTEzoIDhf8XoHqONJAbR1rHpV65Q/sny0wmcGkk/5
	pEo47nkPLLp2U7eTbgGmjL95FFm2D9F34ISJHLp7+q/KxH1bfez/wUb0hk3FichmxNmzx/b2sJ2
	69zPxUZdy9wvuMBuv2FBpiyS4jcdFQTIJ01ER1QTELxtm+cgnHlaW9ZD1Ub+SpAQ=
X-Gm-Gg: AY/fxX60WP+p6BZaeT/kiNiZiVqfyIxyL82eEPmPb5gl3Rbo93tjufiTKK/LmVDrgJ7
	qGmWlYY5hptjf4rhHPru2ULsoetWjme1xz5L+g3TkC4dR9NlNo45Gc1Fku9ygl7sKVTVcc+tIDF
	KhWH4mHpQjEBj0PFAALx6H9dVahSI4M1Jqnph9OjlHcS+1L6v4w/TtKwXYazUTBgN9IirtrzJ+Z
	GyMlbJ7h7Ms9XWrqAmaGGlpc5VRM5c8zEBhPX93E7DS9gU/jPulonUjavWrkusQ2dy82JFq+1cU
	ro3IcS5R6v2Jqk1fpGZPKEawg2AX7BPKxVMggVV/P2PPA6xIkAjB6l2eKI6xT9CV6fqssHQopE3
	ygiBIYPlb3wOYsGEFhUFL8idDkQJh3L+dTl9k1AjqCNSIdKPHx+KfzTJYwYD9i82nhu8SAzZ7
X-Received: by 2002:a05:620a:290d:b0:8b2:edc8:13cc with SMTP id af79cd13be357-8c38938b5d4mr225850985a.40.1767780483217;
        Wed, 07 Jan 2026 02:08:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYzNjbE4AMTRaewbQHl+ZKSYZkDqR+2I4qrIYfJq5OvqY9hClxKzkE7h9e9jyTqreaqFI0Xw==
X-Received: by 2002:a05:620a:290d:b0:8b2:edc8:13cc with SMTP id af79cd13be357-8c38938b5d4mr225848585a.40.1767780482751;
        Wed, 07 Jan 2026 02:08:02 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm347290185a.47.2026.01.07.02.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:08:02 -0800 (PST)
Message-ID: <674b8615-dcd3-4ae8-8433-cda6e8347048@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 18:07:54 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
 <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
 <6a74e675-b011-4e1d-860c-4c3232beb2a2@oss.qualcomm.com>
 <7fc7c14c-a305-422e-8755-22e7c28bcfb3@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <7fc7c14c-a305-422e-8755-22e7c28bcfb3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfX01BkTlfBKxq6
 Ljp0HEuSzDnNIajrZkHOiJqP0IVj8MmoZ43xe7ikL2m4VNtofyGwCWmBgdYbGf5Kh9qfODGrYaw
 JmsKVjLt5q3hKhKcVJofPiijpErKzB7492stpJEuP+HTHe72gwF0DHjOIiJJg3PBfuLm4wzZYix
 zA83KecswcrqS5893T+zD//b6slpbK12qLzqadyEkFjRU3z8jJ7dTshWtosHG/1vr216LMQ73kF
 L8KfBsqmklLX1+9oiBzWkyRA62MlUnWuxHpsJ6lsWej1hRDptSkeH1tx2oSB7TPvk0buYjWJ58Z
 t2nCidPsai5bSzFmYMaiwUkUPFjZdAq/NJHfY/MgG10tCEJQSnhy7DGGm52CpnETxxaqkOWhRcN
 mEyCJY27xNvDgT1da9l2kwsY0i4DIe3Xwn8swrQe+Xl52jZLYi47Lw0TjP3JtZWzream9L0rxOE
 i3IZooSsjIIJAUO/Emw==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e3083 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tqjSdkmDS9pqd0uHxZsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: M-3AZq0d2L_sk35M-vywOyMI-7jpULOc
X-Proofpoint-GUID: M-3AZq0d2L_sk35M-vywOyMI-7jpULOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070081



On 1/7/2026 4:34 PM, Krzysztof Kozlowski wrote:
> On 07/01/2026 09:17, Wenmeng Liu wrote:
>>
>>
>> On 1/7/2026 4:00 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>> Same question as before. I did not see any resolution of this in
>>> changelog or commit msg.
>>>
>> Will update commit msg in next version:
>>
>> For this platform, it uses soc_ahb instead of camnoc_axi.
> 
> That was not my question from v1. AHB and AXI are both bus clocks,
> meaning for this device the same. You again name the clocks how you
> called them in clock controller which is wrong. You name here CLOCK
> INPUTS. What is the role of this clock FOR THIS DEVICE?
> 
> I already asked to pay attention to this difference.
> 
> Best regards,
> Krzysztof

Ok, i got it, just feel a bit confused.

+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";


	clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
	clock-names = "camnoc_axi";

If this is acceptable, I will update it this way in the next version.

Thanks,
Wenmeng


