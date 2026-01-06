Return-Path: <linux-i2c+bounces-14929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715DCFA8FF
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 20:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECB79317F456
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 18:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20993446B9;
	Tue,  6 Jan 2026 18:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKKYMF1b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvTuEJOB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEBF33B6F1
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724076; cv=none; b=tnmB66ygIprXZ422UMPnoS3pNkSCVwNu2U7s2Gj3Jgjt43ifBiCEAkNv7gSgvti3aPAXXZhoLoKygpsuULXg34zlSex2yjYSbXfM8Qfpl1qmAt2DErOHvgyCW0d1OLAqA6BoXn9qYqMG4eio0XKSTjTDzAMVCDsOvm8m5gNb7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724076; c=relaxed/simple;
	bh=hevyR2v5UnvB3P1hEItKYkWCuAwttD5s0/yqjxNhfi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjn47rMD8ihLfdrVIrSCvbvNFKJ+p4nuZjXWkCGfKHZpSyMhOKH83C5GcNaeoxoodiZ8KyHTZj4+IX6Nhem0u3juLiKyTQjmGJTsM9sFA1Pvd8xmoosOLBAmtmXwHPrkhAQDo7Q/7+Y6ZWjrdSkzyvC0SKbv5P1BFi0BFpafjL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKKYMF1b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvTuEJOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1Lk8822603
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zbq27qXc2G+YUG9Eao1aPz+j
	rHm7MvW1CZEwhgSHi7I=; b=UKKYMF1baR+GgszvcS/NaOHiu9HShC/B0c7Flz8Q
	UBGk8OabmyAlD7L2l/t30Ublwiadtdnw3lwK1l17BFCeIaoNmj9JuioEqSb9jKGe
	QMl5O/YE3SeID4n64Tc6TYFcVEQu0UIfPjU0u+4sQF9leEjMyKN8jN3WokeJt6PH
	jJmh62mCGjy5+j4LEcE3iFWC/zxdq6WY73mDaButx4I7VQODvKhRiGdvGxZEK3DZ
	MvpJR2Ugw36HWkObBMWS4d291F3mAtFZUiFEfKwhZxa/5MiYQjASfeNZpStzoKFx
	D4LvhF84xpQQOODcOGuy2u7b69T41FG7iKb8RsWeG2bjMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e80967-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:27:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a5dba954so34599741cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724072; x=1768328872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbq27qXc2G+YUG9Eao1aPz+jrHm7MvW1CZEwhgSHi7I=;
        b=JvTuEJOBpFAuVrymIrDzkcdmKThYu/WqVMeMkQN3c8+PaX+umibJItnR+7vX6fa5/i
         MTY3at60DLiYam40waTtDf4HMIeg8M/FOOWuYUnRqlxvbTOQpWxnwLnR4JmBcfEVktdR
         ErdkZgls4WZsONLAx1kZV8o4d2/qNrazpmeINYA8cGM4F+FGB4CMMBycEn/HaEhg7rON
         FgPpWDSwBVKwUQM3C0PPKD6Xe3oFlDbbGKfA7uioxdUl2jeBXGVbFWTcuO0RCAyhCR1J
         LTavqV3FaZqyGoRpWfrUtraHR8h7pe6EQZdF6ebyA1Dg2OqJ7jsJQe34q4sS2qeuMSB4
         NHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724072; x=1768328872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbq27qXc2G+YUG9Eao1aPz+jrHm7MvW1CZEwhgSHi7I=;
        b=rtzdUxamIugf4rjpsb2SWDetypGjc3Nn4AePxR/yJZboWoyBsnLtv1kkEYmaIiOlMl
         PzpoHYKqKQOTV/7Bm5gVyY2BkldUu5hz6NqXt1e97vMLJMC4Ng/juBAF+xJZBSfw+Lf8
         8AG6qeSDMo1cbfVIvS0pZzUzKxLsy1rfxWtv0//9L+o95QN1kB+FOI/IvsuyWs/mh3/O
         GemHh4TpvrEjuxEJzPaIVVkNEnWP05ITLxmhzpgbV6+nEtIaHZKpkJjzAhyZT/a5CqY5
         e7qG0L1bnXen65KTVRE3M3A3vSZe9ybZjllfDZD+rQG5w9lAIiYDmYIez20J088TzyNo
         eV+g==
X-Forwarded-Encrypted: i=1; AJvYcCUrrC8iHUN8Ai1TaD3AAPd9ISI43vT1yFyDHBBew3R847lGgIuizeyEdxhshICPWffDvBCAQ1fLHiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGspOwM0AAES6sLJVI8hbNj38N42H6kN4rXu23bTRhz5d0Gxu
	47RT0n4Wbv+W71zEFMqsgQPzViS+ExeuOL1rJp5VMVFAznAh6gjBzBbd0BLuxbugNlCwqr5Mb1O
	HdPBPvF5c5b8VzmmF5VY2UCVonN1wo7QmIerJxFYLx67ZfSaJ900q9eVaHtAzkkk=
X-Gm-Gg: AY/fxX4Rj8z2f6l6YX1GsgOWryGGwTc1Zxv5tOuQxepTsFuP3rbbEMeKQ/GyUtJWv8O
	UfsW3t+gKGfGA2MhqnBeaHBvKpHhBXdOJYhzeKu2c72G0qovzsqxw/Yr+nPcTgJLfMkNsWSD+4D
	ryjNDR0ijmg0N4UAbJVYTwJQRU0cq3dI+k+SZcpEuNDN0usHbdIUhyrlvNV7oSD7opzIFOlQRQx
	YQLvqgSgBcubQSC47yHx9lqDLH901A1QLTobCxiHZtb4MZ+nihQf5XTFB8aP61hPvPquXXPmaPM
	iZhTwYsEKfYfzGQOAWMVqZhmEmaRs4RyMQ67ditPQ+cVjmacFZ9dZSv7THRc5t6E3XU0pzP7vmU
	ar6uwYviGWni04O4zRwk4onBDtuJlCWBmblc6l6N2cPJYCC/CffZ4NW2G8F4puhIe0xi5/3JkXv
	S/ICQXetEUFrdCIjCWyWaRTGY=
X-Received: by 2002:a05:622a:1106:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4ffa7808058mr50291621cf.66.1767724072165;
        Tue, 06 Jan 2026 10:27:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpa8t2J+xNbmiBOjOlobvGIsyKnixEwHEuIMtCBrOGb618b9Xf2yvBuMmE8Lwt1egtbEQvqA==
X-Received: by 2002:a05:622a:1106:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4ffa7808058mr50291151cf.66.1767724071584;
        Tue, 06 Jan 2026 10:27:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6cc4d11csm203749e87.74.2026.01.06.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:27:50 -0800 (PST)
Date: Tue, 6 Jan 2026 20:27:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add CCI definitions
Message-ID: <z2co4ligqcydhk5cxzjdi72nuhf2gm36hrf4qae5hb36m7yvbs@sen7esib2k2x>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MCBTYWx0ZWRfXw8VZcF/JObro
 3LvK536j3oVbGhjfONFcVlUkItdeUpUCOwU+4aIy0jJi/u6lx9vv+JUB+Wx4L7TMN9lOf5GMiCy
 Nbtf4vFRXABw+m4Y9zz1Wy53LNiLK6P0GXgOPdHZosKVrQvhiJnMNw1w22Y6JwYh8FSb/44BZ2R
 74blV+TCr9us3HGG/+1AfLuL1mmURrO3OAJBlE3fVzE6jTqd0DGoFVGH/5spfLCyFiuWMifKi6F
 AedyqBhaESKi92/mg20RCQ+b9Qkt01QQWRzX9eBkYrsQQg9Uh4Q0jOuxB0LoiYOMoAlHzQ9dijh
 lNrqsTHbQvbfcfgaYS7AXXeMfefGt3na0EyAWvQ/NJV2RH1ky6WLrzYGnWDzzlKgjE2B2EKSf7Y
 oJRiICVN4RyIKSEAGZsjKLaSl1DlDLUkvYoDotzDh5rL/IPLIHa55lPY7TZRgBGY4u49vri1CKl
 Jxm40l5nE0EbImdjUWw==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d542a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Io2tlQXC3H8IfOpeASMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: U7O59h7hDVUs5lUa9lZtFGo6oFx4ysmG
X-Proofpoint-GUID: U7O59h7hDVUs5lUa9lZtFGo6oFx4ysmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060160

On Tue, Jan 06, 2026 at 05:39:54PM +0800, Wenmeng Liu wrote:
> Qualcomm Talos SoC contains single controller,
> containing 2 I2C hosts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 72 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index e1dfaff9b6bf8641b19a685e74d60ad4e1e99d41..461a39968d928260828993ff3549aa15fd1870df 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1549,6 +1549,42 @@ tlmm: pinctrl@3100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			cci_default: cci0-default-state {
> +				cci_i2c0_default: cci-i2c0-default-pins {

These need to be split, having just one host per state.

> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci_i2c1_default: cci-i2c1-default-pins {
> +					/* SDA, SCL */
> +					pins = "gpio34", "gpio35";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci_sleep: cci-sleep-state {
> +				cci_i2c0_sleep: cci-i2c0-sleep-state {

The same

> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci_i2c1_sleep: cci-i2c1-sleep-state {
> +					/* SDA, SCL */
> +					pins = "gpio34", "gpio35";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>  				pins = "gpio4", "gpio5";
>  				function = "qup0";
> @@ -3785,6 +3821,42 @@ videocc: clock-controller@ab00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
> +
> +			reg = <0x0 0x0ac4a000  0x0 0x4000>;

Extra double space.

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK>;
> +			clock-names = "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci_default>;
> +			pinctrl-1 = <&cci_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		camss: isp@acb3000 {
>  			compatible = "qcom,sm6150-camss";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

