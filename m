Return-Path: <linux-i2c+bounces-14937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39592CFBC73
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 03:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89ED30B8F4E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 02:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1AD1A285;
	Wed,  7 Jan 2026 02:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFwxsRpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fECoZuIq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC9AD24
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754049; cv=none; b=jEoVyS3aeSloJDBz95mYu+sLZxlp8jCoiDu59cPlbsfD3H/uLW/zuYp5QeWOYc2euy1iknFpdAjciAEGywV0el9WGXcBw7LxlG/zNQOiNgNWnL2hqMpznUM1pjjWgw0/gURtXUv/UoIOcOwQcoN8n/OhYYEusRO4awc/8NKPQO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754049; c=relaxed/simple;
	bh=aVUjkqBKuLkFvoFxQhqbD8RO9yFMzlqB2n0vIoOV57U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdYCkyvaJ/LG7VD9CC0UMilH9ESyxpKvxKSxyWBf8ICpCkIiNLwBbS3h0gnuNzmSkMuTvAYJyGwywhb+v2qzVEsbQDLTt/+N1CSqfAVoIKNLwYwBSPXKtWep2ilaTm/Is80JY2rOL2fW6rQNKFgoyl9xvHSHXBD1TIku6gDBRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFwxsRpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fECoZuIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606MCRsq1476055
	for <linux-i2c@vger.kernel.org>; Wed, 7 Jan 2026 02:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiWzdhAD6zcmAW6Rhaf/VVCt0T+Y+P8B0EWKCRqfOA0=; b=lFwxsRpbEGQCqcuW
	NBSCiNw2EqqnwqMZSulvcgCTtl4jaQ4BMyHKP1+QRW3tMmcEtK8zdQlMYhWzRjCf
	m9WgAW0Ys7Nck31M1iF7vBBTLp6PGqq95RLjX3MK/9aoBEtzAA5xqUjPZfKCeqi5
	wtAMkTXsIhS1Oa6FLcuQSqfxUyUxOEXcQaVk5ZnGZ9f5C6162Dxw79zgQ6/7pTYe
	PgnWyF1LFusceWc0XCt7uehp/1EhHaguFxib0VaKg6frys9rr9KVMFwwnhUPLL5f
	O/9DkqZgppWeLkVtdEARf9U9XxpQAjwqygv4Ww4DBbUBC8xIyp8uH42HQx8L2SQ8
	s/DkJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhayhrjk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 02:47:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so20564826d6.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767754043; x=1768358843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiWzdhAD6zcmAW6Rhaf/VVCt0T+Y+P8B0EWKCRqfOA0=;
        b=fECoZuIq7tlMYjWsr1Knvy8vXAVH3XNK1o4e1CfrI4PpNkVS5+DzgKGAPzNyF1SSYl
         CFu+QbQkcCQYJDJo31fUKd8cZS0SfUHotpt83ztRF0QVFw9QUEjtMQ0zEARplQF5tJQS
         2TOogFhxwWBYgpBp7hBnVy72zAU+8vb86+RdeI4XrWGJB9UK1Ucj64yhprC9Aa8JNfS9
         mf/PNXYKzm38oommuvK+Lc9VoSxNKc433psO0wHL5ilW7p867M6Bqz7uLrBzb/ytfSAI
         PSwQKc6hPWI/V6ylEcjNaHsvngjN8ruJ2vgYf+B9nVm+3ZuUU9fT7cIyxIUYVYmgbrzM
         4hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767754043; x=1768358843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiWzdhAD6zcmAW6Rhaf/VVCt0T+Y+P8B0EWKCRqfOA0=;
        b=vMOSZnIcO6tNs3+YVjmr90CkKh1Mjj5xDEGatPDoBF9fHU6nWXbR96yvBc5J92ULAQ
         lkuciQ7rKtGcEKVNJJQU5CjdeEkoOtusa9HYFOCdI6L4c1TvBqwFsoYPK9HZAUkPlLYa
         Sx86CWCMY45U3QF3ghUqEwpzEFRuvunZd9KOHeSrLEO6kw4/4BOe2W06GwtZgP2Hrz2V
         uL1WO431Cdsyk8q8bdRKYDScxtRr2Dy4/QHuYYNmB8Agf9F6xh2nGsFz+K0FyfABOP0G
         agpugyrLp/sueqsp+NDl2r8SVPu7gKMf4sC5xnIPBmYOlONICKtN9GN/Gg9Kjnjw79hm
         iFeg==
X-Forwarded-Encrypted: i=1; AJvYcCX5bpePfG5Fd0+4Jcp0598ZlqupdW1MLR1ipY6WfVlbtV8YBHHkFB1n0WF2vU6P2EGqhoaANaOUeek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9q5V9iXwE0iaGl5lvPBMtmee+rs1EsKaCsfWZqRkJj5gVq6pP
	zEm2YI3JPGh+0v2bpEEYU8NKwuJnHEnbs8JDX/ABFHcytO/clQ6MIp3tWs9pakKtYHW1zLHw+sF
	Mk5SnLM7olGmoZcD0GWcqZsrM1CDnqa7vVfTgmHUSCfxChbjNTg7gc3d0Frm/LOk=
X-Gm-Gg: AY/fxX6y/ns6JCEpHkh62lX9Uv0WCk4hEMJUzdupxsP6rWAuYnmtkvA9X25Zx9uR6cm
	8Kbp/yN/ZcAOmlHVb+6BEYkXLX0s9upFfq5fQRNG49eU3cZxYQOyLnOtUJNPFUMHd6NReCtS7U5
	OY4C2ZeVwmqdjHe0toIMFmijRUbIl6JnVwzLZiMQNBgWm/Jkh98MysW4r3Ud03aC0tlIoEnwBDk
	PuOcQ5ci4N91VRAOGkzeFZsmzsDBaj9uLm5mu7rsqGhsfdsprpTQ9Af/dDPGyK2d6QZxtV+1d/A
	UnRstDbkqKyYhBy9thFBFSpvJAP17xwF1NHztsJhYEMGpXCswQoQKtbV8pVxzHhl6QJmA6ZPFXo
	EYgOcM1WoQo/AaY9npReP1Vp5+SzUm67TcDtxIeDffwAh8oqSJU57YZBfax7hz49YLL6MiDVu
X-Received: by 2002:a05:6214:4a85:b0:890:7329:4cc8 with SMTP id 6a1803df08f44-89084183bffmr16456106d6.8.1767754042988;
        Tue, 06 Jan 2026 18:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUrHLKpex8Xy1L5oDQg4t4M46YX3NbV1JQUe4hRL6xcQN4GUC2xlX5yB+xllsl3kFs8YQs9Q==
X-Received: by 2002:a05:6214:4a85:b0:890:7329:4cc8 with SMTP id 6a1803df08f44-89084183bffmr16455826d6.8.1767754042504;
        Tue, 06 Jan 2026 18:47:22 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077284f23sm24910446d6.57.2026.01.06.18.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 18:47:22 -0800 (PST)
Message-ID: <9730440b-b4ef-4b9a-ac77-37945c5b4f5c@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 10:47:14 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add CCI definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
 <z2co4ligqcydhk5cxzjdi72nuhf2gm36hrf4qae5hb36m7yvbs@sen7esib2k2x>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <z2co4ligqcydhk5cxzjdi72nuhf2gm36hrf4qae5hb36m7yvbs@sen7esib2k2x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyMSBTYWx0ZWRfX4wsnJx2gPNvw
 tYJlR3CwAYtdripyohlKibaixV3dKT3jbC0Xb+3HZxKZejvd2N9neUvJffzDlOq7hdKtjov6cyo
 HzxK3ce0+S0zwumCXIp5QXLCYOWln6H6jCOESfERlgHfa5VPc7UobjQTyBAME5N3XRpxpamftIt
 wCmp9QW7Zc29sUiiJ6QC1gYyuVpbHkyAOhXkLWr4u5bcsqRev2fI8Tzv90zOzKtjJVlZxKkFiYz
 7dCHT4V8HrS2ewpwFohxSCw3RXQFXbPO0s1xvsVs4FzSfjZO/M6xU6/FD+i5B6K93Hwgfzq308X
 hkt/8OeIn3zsVN4ZW7KlOXTtYU3pWtjC5uABF72jJCqqDYuyI/dCH5mIPtypjc8/rWReVL1ig0h
 XDAwAQlQMR7dnFpuXzGjArwmhGyfUdYe5A8m2+J6KOduKPIOYEdU8+6WJOGKMhpYPo2WqlNilfA
 DB2HtvXr+DWBGoFvWEQ==
X-Authority-Analysis: v=2.4 cv=VI7QXtPX c=1 sm=1 tr=0 ts=695dc93e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eyU4tusHGcKmyRKv_OMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5DT1wCjBhL2-NaDAvK2-ovo_P8VEnEiF
X-Proofpoint-ORIG-GUID: 5DT1wCjBhL2-NaDAvK2-ovo_P8VEnEiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070021



On 1/7/2026 2:27 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 06, 2026 at 05:39:54PM +0800, Wenmeng Liu wrote:
>> Qualcomm Talos SoC contains single controller,
>> containing 2 I2C hosts.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/talos.dtsi | 72 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index e1dfaff9b6bf8641b19a685e74d60ad4e1e99d41..461a39968d928260828993ff3549aa15fd1870df 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -1549,6 +1549,42 @@ tlmm: pinctrl@3100000 {
>>   			#interrupt-cells = <2>;
>>   			wakeup-parent = <&pdc>;
>>   
>> +			cci_default: cci0-default-state {
>> +				cci_i2c0_default: cci-i2c0-default-pins {
> 
> These need to be split, having just one host per state.
ACK.>
>> +					/* SDA, SCL */
>> +					pins = "gpio32", "gpio33";
>> +					function = "cci_i2c";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				cci_i2c1_default: cci-i2c1-default-pins {
>> +					/* SDA, SCL */
>> +					pins = "gpio34", "gpio35";
>> +					function = "cci_i2c";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci_sleep: cci-sleep-state {
>> +				cci_i2c0_sleep: cci-i2c0-sleep-state {
> 
> The same
ACK.>
>> +					/* SDA, SCL */
>> +					pins = "gpio32", "gpio33";
>> +					function = "cci_i2c";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				cci_i2c1_sleep: cci-i2c1-sleep-state {
>> +					/* SDA, SCL */
>> +					pins = "gpio34", "gpio35";
>> +					function = "cci_i2c";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>>   			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>>   				pins = "gpio4", "gpio5";
>>   				function = "qup0";
>> @@ -3785,6 +3821,42 @@ videocc: clock-controller@ab00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		cci: cci@ac4a000 {
>> +			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
>> +
>> +			reg = <0x0 0x0ac4a000  0x0 0x4000>;
> 
> Extra double space.
ACK.>
>> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>> +			power-domains = <&camcc TITAN_TOP_GDSC>;
>> +			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +				 <&camcc CAM_CC_CCI_CLK>;
>> +			clock-names = "soc_ahb",
>> +				      "cpas_ahb",
>> +				      "cci";
>> +			pinctrl-0 = <&cci_default>;
>> +			pinctrl-1 = <&cci_sleep>;
>> +			pinctrl-names = "default", "sleep";
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			status = "disabled";
>> +
>> +			cci_i2c0: i2c-bus@0 {
>> +				reg = <0>;
>> +				clock-frequency = <1000000>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>> +
>> +			cci_i2c1: i2c-bus@1 {
>> +				reg = <1>;
>> +				clock-frequency = <1000000>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>> +		};
>> +
>>   		camss: isp@acb3000 {
>>   			compatible = "qcom,sm6150-camss";
>>   
>>
>> -- 
>> 2.34.1
>>
> 

Will fix in next version.

Thanks,
Wenmeng

