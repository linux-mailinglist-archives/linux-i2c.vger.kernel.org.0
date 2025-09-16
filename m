Return-Path: <linux-i2c+bounces-12975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37436B5949A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 186FF4E2E4B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 11:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BDF2C0281;
	Tue, 16 Sep 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZ6riIwC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD727D776
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020523; cv=none; b=GpNfv9iM24Cj04QExHg1hPJMD6pVJUMR4fPd+2kaaMD/vKnQJBRJ1n4An957TquYNDZcF3aMsOHRoRzQJeZEckpgFVse7wGDlckvH1W/g47mXusTssUtK1VgNNWAxBZdkICP1KbVuGOqN9NV+uMLE5s0NWJ79csGI6yeE58lEIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020523; c=relaxed/simple;
	bh=JecI4baRKbxg9mlRZPX14WKgBFLLGnH9ACj7lbwRX78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjCkaUrkGO7WKjXkfdK82TsCFQTzom3Lf0TRv9twK14FP9Mk3+Pr0e7vJk3288wSEpYST2Dn21ZFkW0oPmYtuM6gYeh/7CRX5nDO8i+VqcZbf2U7v5M1wWEGowYQyHWPPaWbrrb7KrnasZX2ZPTFtADMJQGN1D+UzkxYE3bmAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZ6riIwC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAGHWS005684
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OWBe468scwOzFXQ4FxY74VVg
	9u9BX5oCReSyR7Jc2vg=; b=mZ6riIwCeVoyP9biCabTnNSPvQyOeOZmDSXFkNgu
	c9HT8QqkzJYfxPZiSKYzkQEG+ALrKKM1nwYKwXlyRZi9cJtIQ7pvWFhS9MqC6WRh
	4YG7jHroAaC6ZMkUlcwInkZ3CNTllvyQLbvJrjMtD/Vg9GAfMc81ddILUn+FjERc
	4M+Yyxp7Hzg2Hl+th7HmfrShx/7DaUh3h02xfMf7LN/HNtlpRT/xiMc41fRfnSA2
	Bys3yD6jE0iplgnAfucmVWEw5pIk65V+b+revqmyYX8n684cgD8/lEUM2COjifd4
	6d/xEsT/Oh2dBvrCMEjm2ZQcCO5NN513W2mGCwMqnKx8Xg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58hn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:02:01 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-544c4d72ee2so6250341e0c.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 04:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020520; x=1758625320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWBe468scwOzFXQ4FxY74VVg9u9BX5oCReSyR7Jc2vg=;
        b=fAM3mkxSFfp8iw2j65OqaW5Oay4CQNyH99CSKWqhzjygILiKz+TuIyvriVrN90tJ5J
         k5XprX7whdGfR3e3CsD+Rf621sfG7GO0IMJlKY2SfZKHsp/jy5FVh4CfV0AmHSRjbrrg
         1pA3cMVEOi7Lb2M+6w8Rn1LQ1OOW/APddajguX7oHL7MWHjHXWl67c7km/6V8aGXi9W4
         B9vbsVvXXlTCoffC32H/airz8BIh6776PQgY6LiwpOu5smreP3TKrHSUNdiKNQXIqX8k
         72VV0cSItwdcwviUDm2Jh1bo6X0kFQExAebB+wseR076YpYwM4Xg0pYbeYONLe0VHiuH
         rliQ==
X-Forwarded-Encrypted: i=1; AJvYcCWksuwSmmgJScxR/QLW5mU+O7k50mRsEH2l4tHSlGpgBVXT0NiIpbfFrAvJnn0cFB0g4vFrkbBDzDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYuOe03j0TqssG7jY1cn25866meark105LS49r+aWxmYA45EZ
	mYX2g/SQ+Y+a0c5ce7VMUeKG4sY5ux3G+8F30ht5DVhjOd741XKD3e0uHPDtdSwmQ0rSYc2Wrf7
	mxVR9vGTaCgLm+G0iIkNCh9YnGRVNgjdG29RlJHNcCgVYpDYPc66goGOe4k040xk=
X-Gm-Gg: ASbGncscTvxgTvSJAPx412rftcqSxiIBAdnaWjfSTllr4jKvKDwo3bvYGsOv1mW/oUW
	XAMzrptmez+XhsqI4/QTvlh4vDOedIlpC+SAmGqf9OqV5dRtyE41TqFpe9TYpzwU9442Xnk4GXX
	APDzGJtNMHFAFjjDVOzJF9DYlTsOPxx4aqh0++EvWS+59yWYgfeXWrZRLc9WUqIT1DTv7E28VQM
	kdeggKeiYZQ39RFQrPXUhFpLEsdBezT+rXaRlSP2xgG5mEX3mck8ry9SR5OLzlCLl1jEu7/7Hg6
	gqRHH0rU/z1iQ7UsV/Edf0by+77EuzUz+3bmNnXJNMZDy1aN4071OVSeffWEJTUZhu9HMT7slav
	REK5bmsSX5CrWAu2nXy5iTLoocBYa6UW2LwsIhFoTJ7F43TAdtgrw
X-Received: by 2002:a05:6122:250b:b0:537:3e5b:9f66 with SMTP id 71dfb90a1353d-54a16cb4b3emr5739171e0c.12.1758020519575;
        Tue, 16 Sep 2025 04:01:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIhQ74kakQxgpRzO0ONsKwulv83qkPHfKj7TAFJZhqWDBg4A4PoFyYmOJehH1fow8stkNEhQ==
X-Received: by 2002:a05:6122:250b:b0:537:3e5b:9f66 with SMTP id 71dfb90a1353d-54a16cb4b3emr5739122e0c.12.1758020519115;
        Tue, 16 Sep 2025 04:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-353725e1bc6sm26001481fa.27.2025.09.16.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:01:58 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/10] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
Message-ID: <nz2dsvc6qyz47dxfbj4deo5xttnegv2qmueo4k5mhrvnkqh3oo@ddakv5hphfw3>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-8-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-8-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-GUID: IyBh9FzNNrAv2hpg--rZvar-tXFoWi-5
X-Proofpoint-ORIG-GUID: IyBh9FzNNrAv2hpg--rZvar-tXFoWi-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX09tPRBb84oj8
 iJIWhXqoDOSLVzqADRrjKa6jM4BBR2eNz85h3GLGKc+0gFJTYNZK+zmVoikCPlnSi+gocA+YvHe
 mWU27K7ok+F/S9aRiy+0Qq0OfJd3qiy/YDpe0pYs1vtGWnQMqRnP1wLKSzGBZDoadZsImaioZJ8
 66wb03FLQSaMpLD7D4+69dy7D/I5GXI0KvfS1rz4h0n1jwGGR6AOCVIquN6D/Ri8Ns10MTOSJ3I
 ZYR0L0PaV+9vpHVdkzOV4iavNPHJ99HjaxOEJShj92jkJL1j5rQ1MqqdH8Fjv6i8AdlCnf6v6dz
 ZzP9cOZtP6/Ym1wFra266KQrq0GZ5EHbJxkeuD35SnQcFlGNj3m959M0ACOfeX5gzJaY+rTaOZJ
 mWI/XWtt
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c943a9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B3P4ua6ZyXwAq7e7NPAA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Tue, Sep 16, 2025 at 04:16:56PM +0530, Wasim Nazir wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable the first USB controller in device mode on the Lemans EVK
> board and configure the associated LDO regulators to power
> the PHYs accordingly.
> 
> The USB port is a Type-C port controlled by HD3SS3320 port controller.
> The role switch notifications would need to be routed to glue driver by
> adding an appropriate usb-c-connector node in DT. However in the design,
> the vbus supply that is to be provided to connected peripherals when
> port is configured as an DFP, is controlled by a GPIO.
> 
> There is also one ID line going from Port controller chip to GPIO-50 of
> the SoC. As per the datasheet of HD3SS3320:
> 
> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
> pin low. This is done to enforce Type-C requirement that VBUS must be
> at VSafe0V before re-enabling VBUS."
> 
> The current HD3SS3220 driver doesn't have this functionality present. So,
> putting the first USB controller in device mode for now. Once the vbus
> control based on ID pin is implemented in hd3ss3220.c, the
> usb-c-connector will be implemented and dr mode would be made OTG.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

