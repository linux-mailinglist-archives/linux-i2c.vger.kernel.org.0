Return-Path: <linux-i2c+bounces-15240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B179D323DF
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 15:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DC68301666A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E56F27A103;
	Fri, 16 Jan 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KevvH2WO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8zDb4Y7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55491287263
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768572005; cv=none; b=HkoG+yINlctJQedx4Vn2vly2Kn2o9dfWGW8V2VOrQ8GKFJ05KV4M0ltF9WPGdM3w85sDVX34ZkDdghj+pLbRz5+eCZc6MSOl8BD57kwI+LHJLJdPV4LNRZyai+swVrM3Bqyo4tWeHnNNVRp0IqgVBENJlgtiatH7erDyvA+8V2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768572005; c=relaxed/simple;
	bh=pFtgrG/9xAvdm84PtKpsXhm6cgJUYFvV26c0FrAPSPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bp2aev/yB4ifgGjcskI7ROFNQwVQnVidDHN+K2VTZuN/eNwAfcgmkNmBG+d7ec2ln3IGwX7J4TtAm/weQpTrXFfTjSpY7qAmCrLcnjrD79aaFswBSLXUcDxfcoopvS3hlXFb5hwiOXjjsctKdZ61fVP16ZwDJWdaV3rW3UaStkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KevvH2WO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8zDb4Y7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDZasB1195903
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 14:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wjoEmTGmdqun7WIM1XyjvNGiQ+Uv1Ih/FUP2Ph7r58I=; b=KevvH2WO0XiyPPY5
	Ex98NQDv4Rt271U/tCq2I/HOKFJPDPApB1mLmxQTYfMiChszxom4MKJ9cnsqIhua
	NvqqIpNM5/67rntCe3Ot+4cfnlEO5xuquqpvwaiWWdJyX76V6ky2HdeGIEoXsf2x
	dDrNbYKU7Sz2iYtKssUOBJ6n45nXM5ahXrxkQP0+5KW6HWKcTMyL6NI/ty8cNajb
	xfaEbZzTr/Ad+b8Sy7CXPa1JoeG9TLtW4JBY9QL9MGKrBRcj2coAc37ktpxfM5Sx
	Bcn8ZzZkZ3Ekx2HQU0nf3kK04Sn9eS096UMCVi0K3tZGRVGCeUuBPvku2bAQqmtA
	kXOorg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqpbr01sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 14:00:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c231297839so55473085a.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 06:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768572001; x=1769176801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjoEmTGmdqun7WIM1XyjvNGiQ+Uv1Ih/FUP2Ph7r58I=;
        b=I8zDb4Y7m5C1M1dXX8qSqLlBN98KEWMxD2ffima40obXsioOpaN9YQKr/P5vnfqNhs
         AO0DbOFZEQycS7tvquxkbZDDUH6HS34UMePLb6azV/flrAghK2ctJnRKCCAGdH83/PHa
         4j26zINgCa3NrReElfQb4hEbjyYa1JDeAMaWBahxlRNn0q776LxkfbYo99OQ+7F6NQIE
         DS4GZNQ2ZLubIDZkmddRTmEIAg879cX7y6YVLSgpNn3t/quSJVhFEAvYO/TjwfM2UTh0
         UzLjrcEP9bxdwWjmvfP1VGORofuXVkF+9WJFnYrCB2eA3ykutz+CNc3C6PC4xtsLG/Wf
         sFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768572001; x=1769176801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjoEmTGmdqun7WIM1XyjvNGiQ+Uv1Ih/FUP2Ph7r58I=;
        b=okLHakEfSGXfjA6cL8/L8C6Zvkbj7yjAKQzX/39wKjtL5ONEV4eBK/0qF9qXK/BAxy
         PuRbw/FrBqC2IRxRocFsK6GyHAX9wLo8xscDpA2pmDWDgylSdUbOZidwd4E8ch09+pY6
         fJEFbphIUGxxnbPF3WGLNfMVHfJusGBol1OcwaB1QFsyt0YelxAT/Eof6kPs8tCDIAhc
         rQaA1eDUW7t+2A8AMoakEoKJucKZMFLtEd62/qEe2o0Xu6Siq9GyKMx7kurGgft36eD2
         5to6Q+32h6P3Nuj4ze2e/FHGk9E8sM39hS7LcPjqaIcfjjQ7s216HY6ci8xKDgugz+l0
         Vv0g==
X-Forwarded-Encrypted: i=1; AJvYcCX+o0Z7id0s6DK2BkTBpDU/aQPSvknONmANrqOJRg95gTr5zfCBPlrISxMYd2cdh80bT4/AVoHFYJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG293RMeRLBqkEPBoVDDq9AO+PBtQ0tGr7TUX79ktcTw67eR6+
	IxOG6XxIl28CRcI8JCJy9EQxITcDw236mYFJV7rWv2vkE1OF7OKaJJCVOkHnh0IziOBvvUC+5ck
	zxdR89OFoYVrND1zMO9V14pbxWFDaiDeWeZgNV1Cob8jQauVAKKCVdhA2Bh6XctY=
X-Gm-Gg: AY/fxX6My6aRyR/VMKAD3BTp74x5WO+ji/LulERkjI3JbKYpqQeUFzQ+7E60OjvvVjZ
	d5Gn01C4UD4cMIHQn0sf7SXI2u1iiG1n3ixKb+u3CO+qPTFj5QoiPPKWjYWkpkaP7BQhLnV/qLm
	CUx1gfyRyj8XQGvYmGSbDDoIDW90K3WUEKB48psNWeZN2nIUr6Gq5KrHspiiO4W61WeCsmhZ6Uf
	c6f8Z+JnMllkDroEg63QVcHxlImptZqWIzZx0SvC8KIO3o38T2wrR3g/azws9lhnJL4oDw0KAJI
	s+7uiBdIkf9asEqhHwkkQYDR89HqhtF9+pPFodUq7jMDcj2pGGW1EWangtCjO4/ckBwPTaP2hIn
	RfnOFRhi8mWh0hGCMewcOmn/sfSS41WKsbDKWYKer44ODV/VPE6/Nja7b/RHX4j74Tc4=
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr307395185a.9.1768572000694;
        Fri, 16 Jan 2026 06:00:00 -0800 (PST)
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr307393285a.9.1768572000248;
        Fri, 16 Jan 2026 06:00:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce411sm2505931a12.7.2026.01.16.05.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:59:59 -0800 (PST)
Message-ID: <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 14:59:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA5OCBTYWx0ZWRfX6aMgfxdfAwz+
 af3tMDWc+GqFWtznZF2kG3dxEEW71sozN4RJini3j6oSYvU4jivUw/SUZnTP98fqhwHr+d25mTe
 8pKZxp106OypE6kVfLUnLe+fcMgZLS/Q5rMXwZsMsSvi8CYsXomKLcF4obsMXki9BVIc0TRC5Lb
 yNwlyw1M61JiS7FncX8gzIYwTvrZExqPUDvRawmoWQQmqvo0scGPaltKO/DN8Y1jsIA6PmlHmAa
 QeKmzUmQPNVGEkIKxruSaZ5zV8re2nEXatBX6tyPT2ToT6clCz2nXglBfFe0cL2H3dCd0067cpO
 lNUVVp8X5fm5XOKUfwU7oIheVxmkR/vEHN8p00JAUW99i5uQd9rXCMQsyErTbmxNAIkCf6MZTB8
 vKM/zhqqZxknWAd8dyBJczDq+5sTbxP8CDkRhzgUZv/ckZziBtLU0U7OoUIx+oaL9Y93w2RP3To
 5xlETMyflTfneralY6g==
X-Authority-Analysis: v=2.4 cv=dL6rWeZb c=1 sm=1 tr=0 ts=696a4461 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=VnghLoSi7ao9u2dwz9AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: zrUnKWo3VbRDq0wRNuDUkwpgW4OyVZYd
X-Proofpoint-ORIG-GUID: zrUnKWo3VbRDq0wRNuDUkwpgW4OyVZYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160098

On 1/16/26 2:38 PM, Luca Weiss wrote:
> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
> camera that are connected there.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 7629ceddde2a..c4a706e945ba 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>  	};
>  };
>  
> +&cci0 {
> +	status = "okay";
> +};
> +
> +&cci0_i2c0 {
> +	/* Main cam: Sony IMX896 @ 0x1a */
> +
> +	eeprom@50 {
> +		compatible = "puya,p24c128f", "atmel,24c128";
> +		reg = <0x50>;
> +		vcc-supply = <&vreg_l6p>;
> +		read-only;
> +	};
> +
> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
> +};
> +
> +
> +&cci0_i2c1 {
> +	/* Awinic AW86017 VCM @ 0x0c */
> +	/* UW cam: OmniVision OV13B10 @ 0x36 */

There's a driver for this one!

> +
> +	eeprom@52 {
> +		compatible = "puya,p24c128f", "atmel,24c128";
> +		reg = <0x52>;
> +		vcc-supply = <&vreg_l6p>;
> +		read-only;
> +	};
> +};
> +
> +&cci1 {
> +	/* cci1_i2c0 is not used for CCI */
> +	pinctrl-0 = <&cci1_1_default>;
> +	pinctrl-1 = <&cci1_1_sleep>;

Let's keep them per-bus-subnode so we don't have to override it

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


