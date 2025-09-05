Return-Path: <linux-i2c+bounces-12690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C89B45AB5
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 16:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AFDD5C3EAF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CD9371E85;
	Fri,  5 Sep 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cBub0rmn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDB362061;
	Fri,  5 Sep 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083089; cv=none; b=B75lWrric2wLhQ61X+V4aIQsCM66eSckKHtfQHiuCAl7iqbmLy+DM13jtfZF3DN2ouNTFAb3M7XYVojf/JMU0gyGpU/ZZtWPWrLJhU7DIy6kiD6DU/eBikIPk5Fr9bHfM7D5I0awwSDYN5nPu3bEtfEtG05f2QqixKZSBFaXsGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083089; c=relaxed/simple;
	bh=MASUxpUKXpFs6knVd9mA2iPrY94gWLaqivhtucbjwMc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUrjzkaWPS23o1SoFvAo8r2vyAseilO8AcWUwme4SFeGVXsAKj3WxksBPsvxZZm5bcxxso1mTYXFxJH0Q2CTYIi/IdrtohXGerWRjtrvdpgUX3YBnTxtV9gvlMgYaIjAE5hrBj2pSrlM2DbxvhsCDXcNrR3va7S8XS+RtfnouTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cBub0rmn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857adqJ012043;
	Fri, 5 Sep 2025 14:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tkAuZrdocb41VJ8yvWLMZV4t
	ZHhlmuHC/I9JgbqAw58=; b=cBub0rmny3LzqQSCZITCY4bfnQ9BhbkiOQaiX/s+
	bKKM0VODb+tzX9KgCOhBTRoftdQXDguu3ihXpgQt6+gLIIkXSlidUegDFnd1jLxl
	+bNABUE631UBUy4DSq/L57xUs9WxU4RxUovmf8scYIZIHEsI2Hmdzam0KnaWOpVu
	4E43D1Ew2HUXn3mogm/sYq5Gu0N0QFooCjeIdN0eg0sr/ykimb8u2J2OsfsS5cJx
	6Pgqr0gA0tG5VnHHB4trZ/JA8F1VIAKMQCT7nhgtQaJdnuHNPULcWmMer2+C5gB6
	E1i4izB3mt5/3B4uyUCTga6jhGqRw3rADar1Ho6WIQMnew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7re3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 14:38:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 585Ec1gw013625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 14:38:01 GMT
Received: from hu-mchunara-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 5 Sep 2025 07:37:56 -0700
Date: Fri, 5 Sep 2025 20:07:42 +0530
From: Monish Chunara <quic_mchunara@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <kernel@oss.qualcomm.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
Message-ID: <aLr1nEKRjOtsrU7f@hu-mchunara-hyd.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
 <e1c593d2-603c-4c3f-850a-07c14467b8e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e1c593d2-603c-4c3f-850a-07c14467b8e9@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX5L7NJqgHaBpw
 dbDaxj+rCDioODp+ofemAPqr+y+20mPAj3DqoTBhMOmWwpp+djhHXc/4gnH+asyHP7K9j73bqNV
 YoPTCUIho5vxgeq9llKVqAesWyFF3ySYm2pwlwJgZp50GMPNMRO4ffzQvicAGytnHVqh4oW3xo1
 1jc0UYR1MaPAHZsmtWCAYEsRK8IXhjxsiFzkaHGkeS8FgTBcO3g0MATMVMdk6Bp2UNuzfTOVlw5
 xzg9IRj2img3755To4LhKfTmw/XBuOCz2TZG4i41uJ0Qfyda+ACWm4cQUGybj5YkD8F5sUprnRd
 BSoDFqpFbT4bQswYBI5aQaAcUL3as1rN3BcMGLTXyijQIvYNdDDqlCJ9H1R1P6IR4WMXJjtohne
 fFEcHjss
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68baf5ca cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=NN4jPqIYyidG5lZKxlEA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: k88Xu5lG7sKzzxmiKnSDX-7Yqs3T9spZ
X-Proofpoint-ORIG-GUID: k88Xu5lG7sKzzxmiKnSDX-7Yqs3T9spZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On Fri, Sep 05, 2025 at 02:07:50PM +0200, Konrad Dybcio wrote:
> On 9/4/25 6:39 PM, Wasim Nazir wrote:
> > From: Monish Chunara <quic_mchunara@quicinc.com>
> > 
> > Integrate the GT24C256C EEPROM via I2C to enable access to
> > board-specific non-volatile data.
> > 
> > Also, define an nvmem-layout to expose structured regions within the
> > EEPROM, allowing consumers to retrieve configuration data such as
> > Ethernet MAC addresses via the nvmem subsystem.
> > 
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index c48cb4267b72..30c3e5bead07 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -319,6 +319,18 @@ expander3: gpio@3b {
> >  		#gpio-cells = <2>;
> >  		gpio-controller;
> >  	};
> > +
> > +	eeprom@50 {
> > +		compatible = "giantec,gt24c256c", "atmel,24c256";
> > +		reg = <0x50>;
> > +		pagesize = <64>;
> > +
> I'm not super happy that this would be the only line of defense, but
> you probably want to add 'read-only' to the eeprom node (or not)
>
The Ethernet interface requires both read and write access at the driver level
to store and retrieve MAC address and related data; therefore 'read-only' is not
added here.

Regards,
Monish 

