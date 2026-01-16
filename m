Return-Path: <linux-i2c+bounces-15218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C833D2ECBA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3534F3051F81
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DA2357717;
	Fri, 16 Jan 2026 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhMJDEgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/puADIc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126D344024
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555981; cv=none; b=NQyCwa4eubjzcZaK0XK85TV5kvDzMi37PNW9HXVan3r/BxcPvOGNvQwyPaXBEmGAtp/YhXuochSqdBHBTBuVOA78bsl640tdN44iq7y3tNg8EIJWKwSKPADZ+ubDiZ8FxUdoUjLJy5e3bAp44B9oPCBzvMCxPgbeVfIuIyHK2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555981; c=relaxed/simple;
	bh=4DK30zwrdkHkSbuIWBaRqIzhR+GfaeYi+4giTk1kn0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEDWsvUg8UTDKTyMrPbZLnZML7TsemveCe/PapxDIMucPBmG8gWjyf2z4c52l6saKWHb+pTWA3haA6OsbZruVDi0oytMHVDs6j630Wm7IzsZndoPOXFVRavB7sKcFMqJDIMpVgJCKF+TJlh6WEkwv0VoKJGUO+XTxKQ1KkRfJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhMJDEgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/puADIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8HLB64100630
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 09:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=; b=fhMJDEgoNHMyq9oY
	W1rEXEsbFons1+UH1kZ8oyHfbxIXEFV8DzBubq16FLbeytjOV0b4HEbJx/8FHnTz
	6qP7a5TjXaZ4xm2uM0r/vet2FDVznVQ9AuoiBGcg9fz209FYZdZJ4oa3/1MbB8WG
	RjmnoLRCVd31ih0Ya9CABi2vjndlzCQQElmOaCoMoFXjFbDFNh8QvYTm18b6/VnL
	oXstbRDXUrcFKswPQ+p06yVWFkgm8/3yUQEJJsuefT0PKUGjZiFXEB00xxs3N1Z5
	EjXz7i8Mjk5Oe2eKE0j+6IXH9G4muJW1Cp9L14VNmf7dzaU+x+VKJfX25B6+9NOq
	haA5Wg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9751m6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 09:32:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a0ec2496so318828485a.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768555976; x=1769160776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=V/puADIcRQm86dleOD2Pyg7RgzYFc3Y1ur8qX8ZxO7StH+g6DexzUI0OUA0vRFoAj5
         R48REYYGvhmPzkLNf/lFYtv03ersbxOuXauVWT43pXvtC8cIHJNaVEACJT+xO50Pyqj6
         WKjNmF1nbD0iipjL3V7STnzmd0dh5VPP6yARZKfFkcRSScsCSiHTMulq1YBezRFgokmX
         MT+MGh2DIkmrYfc6rtUigbBblbRAGqgZ6n/KvFSrnypXn+cUYMTDNqFdI5q4FNQaY7Tv
         99KYjbt9RZQ59GVK0iQ7zDiykvOC5O0azwjDjLdZH49W42jVr7I3GqrGhq9r17wXXz0l
         rBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555976; x=1769160776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=YbwxhqArGrc9yyVOBNB5nJ5Pc9nEBYd888fwRemyRQN4WgslE+6TF9ONbep69pqXZ3
         3xvdfuJw0QppM9rA5LUEewxw0FKgjfAw0Sb5w2wRmyjDyTodjz0LYMb2H/da6Jy5ohSk
         vDqB2Jc54n4OM2EeDx6abeflwawrj0Rq3qQhCKlkcbBOPNt2YK/lydWV5fF88THw7a3w
         7h71GyHaVhe7WJpDM18yZhHOsvkFSjgH0B43nphWS3E71bnx2UpI+Mg9cjE3Nxby9UbP
         KhEOnIO3BWsPHcydFWDLBsgMQqLIQK+fiJ+3FHTyxNvdQBrm3ld/BxNeN0Htu1eOIpsE
         c4sg==
X-Gm-Message-State: AOJu0Yyxy0ku4EDCxXSqbSLXvrNWDcgSxjlI3YYtjiYZ3kTx7SsgN2+J
	Q+Pa5ZaHRstz9rf52m13eWjZI7da9in/Dz7NBttp2fAKKGuzJgDBRTzazbk9kQsA/Cu0OMvjN8q
	bPoHCTbzgybZa6S1W9h4H1AFkepCyVsqr7vqAeCwKhdP2g6wA/9PyvqUyJ5v1w1k=
X-Gm-Gg: AY/fxX4GT3is0EcnYJmVx4SSG0HRVu+z/zu/9oxOabeOOeYYC8lnm1ojmV10Qx0Faql
	ZOCpCuAdn4kRykD9qRVFW9S3szj1jScBq0EfYLkkKiZI2ENauQ/PgzVLIsYe5ZQh/kbJR4YYQ+H
	aVbTzLx65A90ETLS4efo+iqD1jEZ6I0vgMPTYe32Qp2g9ZworzD7cGYWUA6zHZ9yJ9eG1XXXXW6
	4XLHg3VUB5pQCge2px9e146lTRMv8VyvZjERimaZPqcxSCdDsLvS0AB+4NKnPSnd+MfIIkDfVnu
	/QRI4LQJ8yn2/XAtP/TZ/OEq2YvKX+Odu7OjAovdZ/VCY5pFOtzT8zpT6LxLA7MD0QLP1iPVxUf
	rx+atim3UPvRHsemiTxzMHyAd2buYjb9oSQUEjpjpYlFpKZyMF2aNFUJ6ZXixP1MDJq3cTvkqXw
	==
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306191385a.67.1768555975733;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306188385a.67.1768555975194;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm186480285a.40.2026.01.16.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:32:54 -0800 (PST)
Message-ID: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:32:45 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfX6Aa9JvqFcMob
 5y20vVu2xExcHTTLGTlAWbkoFUfou6/aJ2VxjXh9dDuLnpW1swfrm3zcbP6El9NKsJRBsE+DTkS
 4vcZTKMWmvflZRjYPEPWyuHzPoYbGRRfPiqeSsydLl/Wlq5e4rX8T00qtt1MYtPVq6vfGefSJVv
 YIB4Q5DL2oexRDefpwHgLYzkZXT1vi4mFCsQYyM2asfY4oncQDI2ef6bodgRJ/qygdpKW2TwDE1
 xOQi/6E5o0+tBdAhyc1OOE/ecSgb9KkJEhIXzdJdDrwX8ZJhOoVkCWD3jxBW1xqZhuJbM3ueouT
 RP0CA5z1qd/q0CTC4idYditwEsdB9J8rMOFRTY56J1H0+eODXiA/8PxoYTG1/YfhdDslRe14zJJ
 pJLsbPZiOaZFO4TBC1xN/D7VxaaR3Sx7DdZRdypwbdoJKuJBR5HUX2NlEge6jEh/X+IkVQa1yix
 TQj8CLhCbtyLXuitAEA==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696a05c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tQJASglR_GpgkQO9bp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G3ZmtHubsnNh0NKu1cA64jOEUyg9aa6r
X-Proofpoint-ORIG-GUID: G3ZmtHubsnNh0NKu1cA64jOEUyg9aa6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070



On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
> On 1/15/26 12:12, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
> 
> Please remind me, what does dtbo-y Makefile target serve for?
Rob mentioned:
https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

I checked, dtbo- is not an upstream usage, it will be updated form 
dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.

Thanks,
Wenmeng>
>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera- 
>> imx577.dtbo
>>   talos-evk-lvds-auo,g133han01-dtbs    := \
>>       talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit- 
>> el2.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/ 
>> arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&camss {
>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@1 {
>> +            reg = <1>;
>> +
>> +            csiphy1_ep: endpoint {
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep1>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci {
>> +    status = "okay";
>> +};
>> +
>> +&cci_i2c1 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        avdd-supply = <&vreg_s4a>;
>> +
>> +        port {
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <1 2 3 4>;
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 




