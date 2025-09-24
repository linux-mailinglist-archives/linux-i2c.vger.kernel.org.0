Return-Path: <linux-i2c+bounces-13129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308DB988AF
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Sep 2025 09:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C4F3BDC24
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Sep 2025 07:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F3927B4FA;
	Wed, 24 Sep 2025 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhlz/VJt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA827A45C
	for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699070; cv=none; b=NhxY/ZbXaONNmLzZaYq0ogIaFyuwCQYcviHopynxoQJt42ydD5UhH8Wl5UUMfSO0FIgA3AV/Wcbvx7laapWKAfMK6tCczptwgEoUnA1W/NOQXQQ9IHNFmtRWgqa63IoaGTjy7X1Y0mmAiNNsEeEqab3oSuEPYRF83JbCtBX9GxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699070; c=relaxed/simple;
	bh=Ms+occQZQuCSD44xVo57Svxy2dzQg/VEiswlEkHo678=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvYg3Am48doDDXVPY16qv2AzeBqpQUdvrTi8VmR1momJxnGugPFOljZn4eHoYPrTeXlvCScqBFIWFcGSgOI0fGZxCUAlD2I1wn55595J/wSFGu3GEtmsyBM7oORd5442G3Ir71EuWa9NuS/aKno5xtfldu+GUwl9NqFxxfhRHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhlz/VJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iFS3017437
	for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 07:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2q/vEK6CUTCvfuhUkYbzlC1U+3gSLyi11zmYNqSnbI0=; b=mhlz/VJtVCewsdE5
	0sQIuPu/0pyFTwJ9NqZSi6W+wYjis1ZlbQbBZd1/tg9JK0i+4IavM72VHsn2xapt
	ihq8VnO2ZvXYqLyEK4jSgNucMoV4AV0UhTbvHA30OsHllNbbqxpSza7ZoffreikM
	mqUDemdJZnGzThhu10VcQ7B0pLQszB4kpYHMD4gfVy4SaPlDxSUkefCPHYTCPaka
	PzFLEIDBc6Ifs+DJVaJWjg/3lvu+fxo2Y2O2UjmN/c/uUFIipFZAqKG1+VYf5nqs
	Wnp99/Ub0RSohqTzMCbvP+UsTzpUdztk0eUEDmuAnoOPTE5Ro2oPiFnE3Wzn/k8e
	dO3UAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjvrxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 07:31:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458274406so134442675ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 24 Sep 2025 00:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699067; x=1759303867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q/vEK6CUTCvfuhUkYbzlC1U+3gSLyi11zmYNqSnbI0=;
        b=QgMVE1HV1f6Rq6Ucd+0ImsOTmibFFAFFTTdM6nkU2jzi7hgwguJJCLRUz2iQqAZpTT
         ycvCEJitAEtf3N+x0ecNrN2Np++PscRryC9WOrhIbBUIlJJhnH+1SYb8qeIBCeyisJbU
         XfGtq8mdW+vYTHFjpsy5fkDVCzGjzL7JpB1FqMUAGXD+mRk1x0GI6w+1fLnyfWEYzMyf
         8lz1hsI8/4ICns2Z8lW/P7VPlqCyDwEuqUPdAm5GQPTxzZoTeEceAV2s9J//R3FpUWUq
         v4rrVv4qcQEiBM5chFKgCj1BjAxwM88hk6FblAiyDlXXi6/XRlExWOckbSj+I+iS3Mrx
         EmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeKMhmxY4DxX+cvjkd8O7LVs86Chm/GPCWfze08dtegQ4V5nvC8Eck9EWgVYRKVNPPviKXHQITYPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJusEfbKDCPMraIxcSKivSsSOmTM10HLEj1jiro5yRJ6zL+1Bg
	YUJz8CGegHgeaeEARcrT+5FCpAz4UIWs2brO/jp0bm3WQt9err8iJTHyHMUEMuFFoItYB+K+xHf
	saIvu70sx/EPioOFb/Al2mKuQ40KNc58cDfRLA2QlbmG0+jrJZq+rZerHrIl97VA=
X-Gm-Gg: ASbGnctRUxiGOv5yMNyEQIUpBpmd85+u9B509Baa3vmH73Mx9AnIuIDQ+7WqwFQR3Oz
	iVdqdsWJpzde22UKqWFZSXLxXX+zolmTz0VwdlijWqSFdaheEZ1vuCKkqXtNEpM6bNIPN8ULSPU
	F5upl6+x+Uw+Fdqn/jyLcjuVmai9nUnb3XlCMkLfUB+3/TK0DtVOh6C629qG51kKpc3RPiryGm4
	oHo8K3oAfmZxdq5r61fsUr0dPkiRLVruv8M9AxCMEh32Wj97Q/wHhTdeIofB/pw6NeOVCvtZoR1
	+NPtf0w/cceKYBos1H6Vteo2aScKCqXRXKV+PCkVjo+RApy9kiQc8GTA3NWg
X-Received: by 2002:a17:903:1547:b0:248:79d4:93be with SMTP id d9443c01a7336-27cc5624f64mr64835485ad.30.1758699066758;
        Wed, 24 Sep 2025 00:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENo8x0qp04/3UZ36KVsyuVbTLwCt9epj/KSnNqmr2EfiZ8HnO0G3WjkaZWL9l2LDg3+a9fJw==
X-Received: by 2002:a17:903:1547:b0:248:79d4:93be with SMTP id d9443c01a7336-27cc5624f64mr64835005ad.30.1758699066030;
        Wed, 24 Sep 2025 00:31:06 -0700 (PDT)
Received: from work ([2401:4900:88e4:3659:dbe6:c3d4:6632:e117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de963sm179237635ad.77.2025.09.24.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:31:05 -0700 (PDT)
Date: Wed, 24 Sep 2025 13:00:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <vas7s6i43v32zdpn3skipqwz65rhvzl6zep6szmo7yoxfkeqer@uoqgm7gfjeyi>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-5-53d7d206669d@oss.qualcomm.com>
 <h2t7ajhtyq3vivbw67tifrn73i4zisicoktsgab76zptxre6at@vl2q4d6i3lms>
 <d2d17266-68a1-4a63-954b-9076db5315a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2d17266-68a1-4a63-954b-9076db5315a5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: THHGdHiyM2AGjg7mN-ZU1Bo1-r_0zaNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX5fkDc3B8nhek
 IhVxKbLh/0L47FxBgRebgWaB5wFAeip7ROhE3+yqiLMfMZM9ShBHmQAS8RiGRbW2IQzDEEyVjTB
 C4EKeNnDAYXh6XsiXMM5C+zMLhJF1ArZ6gZEonXjG0FADV1bQ0PLatSi3sIZ8vmRKfnQi5zpHaT
 oiQSMuoU3oSROYYl6EGP5rGqqV2ytBV2Rbzfsf67WWEBBVaB9vz1/tsWNB1ebAjpCNOAcLH0PMR
 iXNfw0MB2IW9d04gzoSZ1oQnz6JGU4OPW3UqxZX57rxKhOlOYKMcpbC0+4PoXBwQ+6mnV6u3+2u
 b+9lViy01zGHRPyGLYXmdraxJj94aQS6puDI6/6YBzi1QQe3PCTD5rAI+ymDFd5v9CaKD2uYMpa
 qvhVboac
X-Proofpoint-GUID: THHGdHiyM2AGjg7mN-ZU1Bo1-r_0zaNd
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d39e3b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3auE-PQ2UgY8HC7PFGwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 17, 2025 at 07:00:43PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 9/17/2025 1:36 PM, Manivannan Sadhasivam wrote:
> > On Tue, Sep 16, 2025 at 04:16:53PM GMT, Wasim Nazir wrote:
> > > From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > 
> > > Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> > > 
> > > PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> > > attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> > > 
> > 
> > Where did you define the supply for M.2 connector? We don't have a proper
> > binding for M.2 today, but atleast the supply should be modeled as a fixed
> > regulator with EN GPIOs as like other boards.
> > 
> > - Mani
> Hi Mani,
> 
> This board doesn't have any power supply for m.2 connector they are
> always powered on.
> 

Not even a fixed regulator? If so, it should be mentioned in the description.

- Mani

> - Krishna Chaitanya.
> > 
> > > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
> > >   1 file changed, 82 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > index 97428d9e3e41..99400ff12cfd 100644
> > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > @@ -431,6 +431,40 @@ &mdss0_dp1_phy {
> > >   	status = "okay";
> > >   };
> > > +&pcie0 {
> > > +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > > +
> > > +	pinctrl-0 = <&pcie0_default_state>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pcie0_phy {
> > > +	vdda-phy-supply = <&vreg_l5a>;
> > > +	vdda-pll-supply = <&vreg_l1c>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pcie1 {
> > > +	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> > > +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> > > +
> > > +	pinctrl-0 = <&pcie1_default_state>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pcie1_phy {
> > > +	vdda-phy-supply = <&vreg_l5a>;
> > > +	vdda-pll-supply = <&vreg_l1c>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > >   &qupv3_id_0 {
> > >   	status = "okay";
> > >   };
> > > @@ -447,6 +481,54 @@ &sleep_clk {
> > >   	clock-frequency = <32768>;
> > >   };
> > > +&tlmm {
> > > +	pcie0_default_state: pcie0-default-state {
> > > +		clkreq-pins {
> > > +			pins = "gpio1";
> > > +			function = "pcie0_clkreq";
> > > +			drive-strength = <2>;
> > > +			bias-pull-up;
> > > +		};
> > > +
> > > +		perst-pins {
> > > +			pins = "gpio2";
> > > +			function = "gpio";
> > > +			drive-strength = <2>;
> > > +			bias-pull-up;
> > > +		};
> > > +
> > > +		wake-pins {
> > > +			pins = "gpio0";
> > > +			function = "gpio";
> > > +			drive-strength = <2>;
> > > +			bias-pull-up;
> > > +		};
> > > +	};
> > > +
> > > +	pcie1_default_state: pcie1-default-state {
> > > +		clkreq-pins {
> > > +			pins = "gpio3";
> > > +			function = "pcie1_clkreq";
> > > +			drive-strength = <2>;
> > > +			bias-pull-up;
> > > +		};
> > > +
> > > +		perst-pins {
> > > +			pins = "gpio4";
> > > +			function = "gpio";
> > > +			drive-strength = <2>;
> > > +			bias-pull-up;
> > > +		};
> > > +
> > > +		wake-pins {
> > > +			pins = "gpio5";
> > > +			function = "gpio";
> > > +			drive-strength = <2>;
> > > +			bias-pull-up;
> > > +		};
> > > +	};
> > > +};
> > > +
> > >   &uart10 {
> > >   	compatible = "qcom,geni-debug-uart";
> > >   	pinctrl-0 = <&qup_uart10_default>;
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

