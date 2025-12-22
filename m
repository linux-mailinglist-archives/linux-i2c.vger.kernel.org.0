Return-Path: <linux-i2c+bounces-14672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B475CD5637
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 10:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07D15300018E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 09:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B70311C11;
	Mon, 22 Dec 2025 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK/f6JAq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMc9hrWi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAE75FDA7
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396991; cv=none; b=t3FHZYonwHMiyRV0HJTxMm3rqHEGAqR7Erk/1ruDTyjrHZu3qAZMz7eymjZJk6bBfcFhCqZBBJ3zhyMEtLdPrrUzFIhaPwrXjU6rTFiLQy45kyFdMi2anLhBVzQI2GXhcqXko7BkEMvg2vNqP3VHKTlGP/M8G2G193bgf8WCt5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396991; c=relaxed/simple;
	bh=jZ1gy20BI+hPZbCo6LxsQGFErVJ08MmN3NyvoXuIrcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0h5EMOD9c690vK0aijCrUoWL7ABCifCvDjzQrxUsvNeDzi4faEFlv1gHrmEjbvABWsE4IWktIUH3UpmtM3hfVlkreJoLkE84VF2NGzfTyHRoDyBrEJdnTwW311GdxHjVgOLiOuzb9nghQ9C28lWqJjv8OmafwNDeHGD8XMAVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK/f6JAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMc9hrWi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM6a12h4117924
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 09:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QikoOVKOAaU3VQD1Nx/2DEE9L5YAA7S9otjAkNFCgvQ=; b=dK/f6JAqxdisNshh
	yZy280dhJZ9LAb0ucnZDp+jiADxDiU1YFslj+Oemdcg6tkOGq1to86vLJ7kQyv5s
	93r/YJjs3crpuusRTlD3RA6U8XQbl8Usk3Z8Bv1gLgK8VcZb/lut7S+sMmC65ufB
	hVn3YMMnK5PrJtmvi+AZ3ORymugMv1UNfegvRy9TXZrjshjl5vO7LPpP2cupc7Ro
	TTDdt2L/+zHuogi5Puuh7V4iav9XW2Z10af5sSpe6o6DI5S9zPh/uMaWqqghjHUx
	lDFqM0gOEEA71wwA8bOBGKAydruPT3UhGc83pTS8kLD845rroCq1sarwsFe2f6US
	HMDXtA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b70v28jvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 09:49:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88fce043335so4218816d6.2
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 01:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396988; x=1767001788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QikoOVKOAaU3VQD1Nx/2DEE9L5YAA7S9otjAkNFCgvQ=;
        b=aMc9hrWi+ZH4bWfZkZ0/Wzgsg+noEdGUJ6Iobmxb4KocdmuY0bUPfUHowl+B2xiMri
         P2cISLeY4LtHmVezxLZgkjCWg4uZnQ99594SbFMnyMDk+gD/FLA0ukbw/JDCyObCrdc+
         RIZEVmWvgqfQYfa/xH89BTCZexAig1c31DY5RBBt4Lw0KTC3DwYSCf9hDF3psxgLRP8o
         HlAh++HdFxklxcYy1bkk+FgODPXHxiIPhkWQUCPTj5wkm9vHaby2+fDAwYM17/2eVMlc
         FhSLpriLQE7D7Tfn2mEiWdzbfoC6VHQms2iycuzdSBfeDDTIYFkDNX/NHvEtsl8nZGsz
         S9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396988; x=1767001788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QikoOVKOAaU3VQD1Nx/2DEE9L5YAA7S9otjAkNFCgvQ=;
        b=cOunHL1AkeBMMjO58l/S7rIvuDV6MBiY/B4UbuDuqL/gGVuBWPs1At4x/L06thfLI8
         ZeAXwnlZSXDlU4aT1U24SsHlcExzIAgvEbY4PDawl51NDsMoZdTwbBcNnq1uCufuO9kO
         lipg/yQvhqHq3vCZhitMvIjgii8lF4zm9RSwh/0rAm5SjAhjd/324L+xS2cBG5xZxOzC
         f91qW0+/uK6RSIrbX5jc7xf6OXVvBgf0yefSMuQxcDYc5FOojfFqVTYDsM7CWVLgkeN/
         Oh9PAt+bfo92efo7vKsHyLR21e1F2xPet7ssT8HRrTAUAGhLbGolT99RurushL7WrlEu
         Jltw==
X-Forwarded-Encrypted: i=1; AJvYcCWuXnY9yNXyHQXa3AoU+AYsAcvoWMbuLPI7SdcVWd1nsoAyZjgKHPjcFDgglDiNJsCDA3QMkD/5DrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSteFF8/I1SPwPW4jgDv0LssLfoK8+uCzKn1xEqYqH8bhgLDOK
	txE7L5+svaYZqbGnDL70np3TIB01EVLhkN9D/f+K7gqWTvINr+TUEvUxbhQzwIERx8elhIdPZp8
	Bn+piqgmfgKZTYGkob5MWdE7GmhkLrFRhiXxnx6sTe0KuZV3l959kSndyULRthiY=
X-Gm-Gg: AY/fxX7ow8+2xgNmbxL3T5LMBLLS09q/dKcgJCNpUyrH0xGy+ZfSmKuGMPq30+gsVJh
	7Ck+/RsL0+gkjVNGzNgBaJmOuTgQQVTMuUFEVFVk/lkSMjz2kwRsneziOTm6xwMmUsbGFdw+fCU
	w2NYSFbHuyqK5aUKBubWsQz3LyYrhCmL6sLOvKqxkTqfavgAJoybYwJdH66C8DRSLvr0dG5mFjz
	x9xmtXEm1XhJvF/LKbywSeKvwpR0idTaHg3uFB4AUv/0HLjhQ/liS7jDpEOr1ALNuq7GPMXc+0R
	OF6ZRd4JLkEfh5//xBiRPDm/qVcnEBZRqWPNDAiMNkD2VwBKpOmEbthryORIIeFvpgOa5OLc0bX
	U6ZIgHgLnTf85aNZDNBFKQ3UczLnZjpj0/bI89OQzasdBNztLO618Nia+DzwPNdT0yQ==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr117197551cf.2.1766396988309;
        Mon, 22 Dec 2025 01:49:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWSVlfXTRSKe1NNCeLCnGxRG2+Y6FML/3XAhkgPNY70pmRHX8af0w7w0Znk0rJD5e92DcYuA==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr117197441cf.2.1766396987919;
        Mon, 22 Dec 2025 01:49:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffc7sm1040818566b.43.2025.12.22.01.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:49:47 -0800 (PST)
Message-ID: <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
 <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
 <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rZKrKxEaZLovmwH7ob26Ujb7AKp2IFmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4OCBTYWx0ZWRfX5Piw0ffvMk2V
 eV6pEnTFGkmqrKoi8TurPdMIp5wgsLVzC5EWZfLZS6XMAg4j+tX/qBOsR1w/EotShuD+NsNTuIs
 z666qRuB2cYvoGU3xgnNMupCId5KPiY/iYDPjg3Sh97Gp8BnK7ADfJSSkReqLScylEw0KsHAUL0
 9WA6+4jkZKAIIG87wWAdQXbLi/RwCTz0hjSUJO1rmpxq2U00USe1xdzxuQ/gpG7nYs47UBjeBmU
 BKP37RUyAcBt07kxZ0bNXNlRb2VTTaJ10mKPpU+l+UcvjQB2gfYkEnea9huS3tP+Fd3tqSee9yo
 OS0chZRsy8utSBi/nqwTCKLdaODOxnyZIhU/JyG7DGEaow1gF93YETxGQgF4cR1pG304+JzyHXp
 DNKjtbZeT4bnqdIN7EEQAoyRBuhlw+QhRfWnoMjsVzlLlPqm7HYsCkpxBZSzyZIeszTxx8NsT5L
 4jmfrj4Hpf9tyeWsImQ==
X-Authority-Analysis: v=2.4 cv=YOKSCBGx c=1 sm=1 tr=0 ts=6949143d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KwbCpzI-l7fhGBOHbL8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rZKrKxEaZLovmwH7ob26Ujb7AKp2IFmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220088

On 12/22/25 10:13 AM, Wenmeng Liu wrote:
> 
> 
> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>> Add the sm6150 CCI device string compatible.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -33,6 +33,7 @@ properties:
>>>                 - qcom,sc8280xp-cci
>>>                 - qcom,sdm670-cci
>>>                 - qcom,sdm845-cci
>>> +              - qcom,sm6150-cci
>>>                 - qcom,sm6350-cci
>>>                 - qcom,sm8250-cci
>>>                 - qcom,sm8450-cci
>>> @@ -263,6 +264,23 @@ allOf:
>>>               - const: cpas_ahb
>>>               - const: cci
>>>   +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sm6150-cci
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +        clock-names:
>>> +          items:
>>> +            - const: soc_ahb
>>
>>
>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>
> 
> On this SOC, both soc_ahb and camnoc_axi exist.
> Is it suggested that I use the existing ones below?
>  - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - qcom,sdm670-cci
>     then:
>       properties:
>         clocks:
>           minItems: 4
>           maxItems: 4
>         clock-names:
>           items:
>             - const: camnoc_axi
>             - const: soc_ahb
>             - const: cpas_ahb
>             - const: cci

Are both AXI and the two AHB clocks necessary for the CCI to operate?
It wasn't the case on other similarly-aged platforms

Konrad

