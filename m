Return-Path: <linux-i2c+bounces-13005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CACB7EB4C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587A51C04926
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48415306490;
	Wed, 17 Sep 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIaj6d43"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD5A305E09
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096421; cv=none; b=iBFOmOK0PxeiXLSxuoFjZpR9+4MESqZEgK7PZZyWF9F8rbA9lxJQSXGi0kUAKzaEHpIPgWXuB1DOjegb9oCW+GQ+SWPidLDEhQkTzP8qKdUv4k6okpXxl4BkCQUh3VQPEBb/G6zcleDOwovDK4J4VOoXjn2+pGR3hlvkD8F0tBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096421; c=relaxed/simple;
	bh=99E/Q8dl1z6a1fSwTsa33XnQl0e7pN1bDPF/vKPOGmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncJEdAPtDqpTTIQyZEX+KW7fNZXLv0TJAIKpgYrOO/CILGCi5RMr6TDtlPSxMjKHDWA3yoBW88Vwim89wHmpNwqwQRqcrOZkM3/ParPZTtlANsnorzNw7p4wBI1io7XR6rvDwl8K5K2B3I+oyBNaw2rWeZxED8fnpRWOfb6lND0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIaj6d43; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H5QbfQ031503
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 08:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4+1T7hrQrCbgIKXWS+wJqveQlpBa3wYZt9yOaHwkvU=; b=MIaj6d43UK9ZQSx8
	agM81e5wqoSWBC63D43WjsF1gm5IB6k/xb2BpVZo02QhE//HDj4YZ0HW4pKmu6K4
	aBDGT3bH/DZIWE5OLCyG7elAqlIIaR9pO5kL+zq2+Uaq/raR82fc0MvpWJOAC/A6
	I6qnI2kA6wvFxm+Iz42kP1C15JzKsqH5jKlFIvI7h7hhWtNLPcMcTdpZbXLQADtS
	y/3kf/z0catX7heqa8vF7T0miUEZknxZ99Sc7Jhry8IApYEKsozHOqTGI8vkraD3
	hrseruWwNV7XY02zlHATrDUAUvvXqkTdl/8tkjyZMWyc6W4rbvXFNx9vEo/cA8yH
	w/bkWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu1hqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 08:06:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26166420e5dso40296845ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 01:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096417; x=1758701217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4+1T7hrQrCbgIKXWS+wJqveQlpBa3wYZt9yOaHwkvU=;
        b=YjJjHDsgJYHoqWLsXkfWkFUEy+5w33MbHMVVqyy6E7MuVa7o3ZdexzBSmT199MXRKH
         zirsbSj/gkjUCNySITOgGrY97Ce8sBq7T5U6pKHpioEfndvPPdoWyekd2MCoLNLXCnKQ
         h0+cSHEmafKLUcpr0CIhxJUSBBqYf/9WfWusUmYr3d3xodOVm0RR6KMCMDjUjqTK7Y37
         YQAZFQR1tdH5THfieMo5fB635MNZXN+yLfg6OqNDnwN2BK/fPLsCpX9rmIQzDct/SPIY
         tWQj0oUz9bE07ZqRKq+gkhbA2oIYE/RN7/QJNDOGMuYeuSG4AgmHLk74cI03tF6ZZCdA
         cV2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkl6h0E2Tk4hK52tNwTyzzhAHue2sE8p3JrXVU1dLoXILHzEuBsLK7GIxxtwi2OmiuHpCImdgY3GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsApeKtiFnyz1xHkEx7RXYE29/c6ehqZNtgXs3DPsL7jt67FrT
	P2dm5WUNqIRgTXW6bPqjE4sPUHZdZo13goEF0/AVdt/pAngvLHAt8C8m+4TnTYOk9OBp3iFmPbr
	KPV3pHnCFi8gIVWQxy5RWMEhNBUWiAT9dpHtFydDn5pphB1tMvYUdXjP7vkGLs30=
X-Gm-Gg: ASbGncs58MI3gcacxfCWLNvZ+SN+47bRBZVng2b+wqV016zo6HK41H1ic22dcnPUJmt
	6uf7r6Z8lsAKHcoW+HmKVIYwTzf5gRzaUb3tm+uV6eBD5c/jIFh9y7Rj4erxdQyIqRK/Zr2J1ey
	dx9TcSfE9L8FkeG3bxlrzkL0aV7G1GtNG2prIjM0bdfW5CykSA6tJzuLdG56KKdMNH311CXWILi
	2BNtjhOM79DImsTN5SfbzzIrSDQGO5Dg9jjr0TtY+sZk5WseetvZ7Ol7T5plfR+ZYctjsB+9Rx/
	KBdkdo3h5kU90cXiCdnngylMf+dFPpduLtTVDnOtWOnSUCdLI5O/bXI=
X-Received: by 2002:a17:903:8ce:b0:24b:1609:5e2b with SMTP id d9443c01a7336-268119b3b6emr16788465ad.5.1758096417027;
        Wed, 17 Sep 2025 01:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5UMbMaWJIzZ57Vql1tJjVuAN5j2QcuMqGy0y+1atO6oPbE3RHp/4BjwtArBerLWUYCCdoJg==
X-Received: by 2002:a17:903:8ce:b0:24b:1609:5e2b with SMTP id d9443c01a7336-268119b3b6emr16788085ad.5.1758096416585;
        Wed, 17 Sep 2025 01:06:56 -0700 (PDT)
Received: from work ([120.60.54.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ee223f2ecsm1177088a91.18.2025.09.17.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:06:56 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:36:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Subject: Re: [PATCH v5 05/10] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
Message-ID: <h2t7ajhtyq3vivbw67tifrn73i4zisicoktsgab76zptxre6at@vl2q4d6i3lms>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-5-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916-lemans-evk-bu-v5-5-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyNHUvEdHM8Fx
 BTU1lBPnmtNqVF4A78Krfa9YCVT4E4Cwt/IGq9f7PZboBSk7HeniHzkOvWklYj4l7jE3d4qxAvI
 QwRzf7Y+IMX01lT5/M/u/A8WssTXyImERJZh481Hmg8rXRuiDJQ89G/T2QgyOi7eAviuWdyGQPy
 QYrLPVR26X92Bxp+XdsBCZCiGyv2nGZVQKhq5feY0nrFqdN7v/eiTd5oby5eJMQqs4gxaKt7W3O
 kcldptN7BI1VMVGtzhj2OFb+RU5dxklGLVtA+4ZMfBWWp1d0GdqyRmlw+K54vNY6+vU9OvTVfvN
 dgFbxXu5TTnyfEIPGzNp1mnRH5JkDkscVL7paf/zPnHlCSC4PxbPxT0n/rmndHyCPq3IA7Xg5o0
 EEsSCzHI
X-Proofpoint-ORIG-GUID: 4LCMWba0_EEch4CHs4oqriWX8dsSmCY5
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68ca6c22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=zfGe9qrPU0lfmTaoSSnydg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qGp1FZVzPMbQ2NxWyGYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4LCMWba0_EEch4CHs4oqriWX8dsSmCY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Tue, Sep 16, 2025 at 04:16:53PM GMT, Wasim Nazir wrote:
> From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> 
> Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> 

Where did you define the supply for M.2 connector? We don't have a proper
binding for M.2 today, but atleast the supply should be modeled as a fixed
regulator with EN GPIOs as like other boards.

- Mani

> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 97428d9e3e41..99400ff12cfd 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -431,6 +431,40 @@ &mdss0_dp1_phy {
>  	status = "okay";
>  };
>  
> +&pcie0 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -447,6 +481,54 @@ &sleep_clk {
>  	clock-frequency = <32768>;
>  };
>  
> +&tlmm {
> +	pcie0_default_state: pcie0-default-state {
> +		clkreq-pins {
> +			pins = "gpio1";
> +			function = "pcie0_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio0";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie1_default_state: pcie1-default-state {
> +		clkreq-pins {
> +			pins = "gpio3";
> +			function = "pcie1_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio4";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio5";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
>  &uart10 {
>  	compatible = "qcom,geni-debug-uart";
>  	pinctrl-0 = <&qup_uart10_default>;
> 
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

