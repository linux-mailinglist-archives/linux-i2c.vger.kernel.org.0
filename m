Return-Path: <linux-i2c+bounces-8363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C09E7FDD
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 13:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 295E6165AEB
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 12:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C364146A9F;
	Sat,  7 Dec 2024 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJZBlDqZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE66F149C7B
	for <linux-i2c@vger.kernel.org>; Sat,  7 Dec 2024 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574299; cv=none; b=dtNNPZzC+Ug5h9uylbXqnyrigGE/BXZ1hWhkY29V78NAvPHoyckhTa0obhRrcIqIIMuNellSGGHScyAlVRsV+6WmSJbUZ8pavHMWFE70hXLpSIC1QRi7u6gMS8Kk1+nzrRoRmRA7OCj3K/IAGQA65K39cgsn8q8q1Sgq4ppBgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574299; c=relaxed/simple;
	bh=Imkwjvr8OjZv9fFVDAgn9vb0dZxjoY+OVBVdlvMWILM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pML/H6AQOk5xeEhndQUfeh3WEIPDJs4nPtqoFrvlJQAAlYMBJo9fRMliaS09Qprz0f48IHn5s06k6hJh5AebB/VOFIY6aqTCeZgEGLt0ivOJJX32rGUjekd6INa74DsGRdU4lTuYcJzx+zeI36JQFRM98MBrrt8oaTZcHYy/pys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJZBlDqZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7Bvj3J014832
	for <linux-i2c@vger.kernel.org>; Sat, 7 Dec 2024 12:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQ1BefPPZjsefk+Q7pM32V79KkOTPD7KhjkHUZEtT/k=; b=nJZBlDqZ+b9Yua5E
	mXTXJlvIv05Mqj5rN1UIOjD4GjbItQeFae8dq6PhSauWIDEcP3Axb7wFROEpYbNG
	x6wylpHx9NzKmL2DhQIXod/nA3HJ/D9sS1ZDNeAfmQs9C+0tc8DLN26DSJf1lfFw
	2J/kdJppCP4G2hl9y7to0N1gxxg3VvQXAPzsi/apeHsa42MQVNqfGh9bG/ZG0sWB
	SUa4XD5o2nZvdK/JFHpmrnOQSjfK1tyax6e8rT/fj9Iksxk8XkQGGTJhO2dRO0f6
	50q1XvTss7q8qFL6LalhOJ3k3cMOKvwiTgzKinzRgvhMm+yxC8wle2gDFjRatLeL
	nTlpuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpggnx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 07 Dec 2024 12:24:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f77bf546so2495316d6.0
        for <linux-i2c@vger.kernel.org>; Sat, 07 Dec 2024 04:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574289; x=1734179089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ1BefPPZjsefk+Q7pM32V79KkOTPD7KhjkHUZEtT/k=;
        b=icDdfGBs3xQ1Jkfm4Nwrh3ofRyj8mr9kHp98IVK/c2ip2/mmTpeP1rJlqICVComOQN
         viZMg7jHhYUopMIzUNAEGO+cZN9Zc6026EMXjgvZ09n9n34mibjiY/2ITVXthhuCd1pH
         aTQrNz4hARnwPPkXcU3BH3wMF392QJMko5JLBGk3g9/c/OMVA76WdXdRq/TU2T0HGRs3
         fP5F2csJR23QG93z14jyNjYnk75dmorKYzDX4DnW0eWKhJCAwEqRLYW5c70ypT5AkyBx
         CbjM7UV+DpEx8HyGjl11RmyZLKcdOzC7AE6YPQ1AY0UKcqWTtig9nDdVRO4O+6YzKnbb
         xw6Q==
X-Gm-Message-State: AOJu0YwiFwLolN48m+S8ySdbU7Uz4psavorGd+fxAJNqnCrH0Vmk4M1c
	XdKl6p27B6iBRzjeU6bqKuwpkx17TN5xqZlF0vWmycsdHm3WRCMXHeysKInjmbGhCxac8O5ihLa
	Dbsp54HU5kijsaeQ0E+dr52e1pFAJ5/Suk2AZzMj9aNQkBQqseTQx6N2IcXM=
X-Gm-Gg: ASbGncuzs61mgFH4YIY92Ythwp0QDVJoL1DgGGeC5L3TpjsoD2JHWJhSKKr+eah+rca
	YzmtE/YwiwBBt7Qqz51lAFo/DX/9InuwS8TwwDKGluEbWzzzxpvZ50ac0wq18L/fB2It0VFcSE6
	T3iQUttNhQFf/G/295cI6lxF6VRL9NFAsi6So00uKyePKQc+8oCXYIawWfORyGRhFrHyU6gftdR
	I9gy1V9UjWHiSrPNBDv9j0oIXdqWFpJMi6J9+1TJIE55GVdQ0FGRBwDqAlRkZPm8XBOAJWtXb+/
	iDgGiOK0bswNpflIuNT/TwF50oRGmC0=
X-Received: by 2002:a05:620a:2681:b0:7b1:4579:80fd with SMTP id af79cd13be357-7b6bcaf410dmr314489485a.7.1733574289366;
        Sat, 07 Dec 2024 04:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq8U8Ty2ix6xok3zzJyL1MAVWdr2aIcau1ywhGnswjMwOh+jLaNEvEH5AowyHkAWxYwSII3Q==
X-Received: by 2002:a05:620a:2681:b0:7b1:4579:80fd with SMTP id af79cd13be357-7b6bcaf410dmr314486985a.7.1733574288928;
        Sat, 07 Dec 2024 04:24:48 -0800 (PST)
Received: from [192.168.212.163] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e92a79sm380101066b.43.2024.12.07.04.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 04:24:48 -0800 (PST)
Message-ID: <3c34afac-478d-47a6-97df-cc45415f6411@oss.qualcomm.com>
Date: Sat, 7 Dec 2024 13:24:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0EXoo8-LzAjZ10hUMLB68tXyY_l25F1t
X-Proofpoint-ORIG-GUID: 0EXoo8-LzAjZ10hUMLB68tXyY_l25F1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070103

On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 180 +++++++++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c19754fdc7e0fa4f674ce19f813db77fe2615cf3..f23352493cb270c0fdc3c42add032286601db1e9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4730,6 +4730,186 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: camss@ac62000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>,
> +			      <0 0x0ac62000 0 0x2a00>,
> +			      <0 0x0ac71000 0 0x2a00>;
> +
> +			reg-names = "csid0",

Please remove the blank lines between x and x-names

> +				    "csid1",
> +				    "csid2",
> +				    "csid_wrapper",

This doesn't seem to match what the commit msg promises

[...]

> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x820 0x60>,
> +				 <&apps_smmu 0x840 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x1800 0x60>,
> +				 <&apps_smmu 0x1820 0x60>,
> +				 <&apps_smmu 0x1840 0x60>,
> +				 <&apps_smmu 0x1860 0x60>,
> +				 <&apps_smmu 0x18a0 0x00>,
> +				 <&apps_smmu 0x18e0 0x00>,
> +				 <&apps_smmu 0x1900 0x00>,
> +				 <&apps_smmu 0x1980 0x20>,
> +				 <&apps_smmu 0x19a0 0x20>;

>>> for pair in a:
...     print(hex(pair[0] & ~pair[1]))
... 
0x800
0x800
0x800
0x800
0x1800
0x1800
0x1800
0x1800
0x18a0
0x18e0
0x1900
0x1980
0x1980

Please remove the duplicates

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

Konrad

