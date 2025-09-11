Return-Path: <linux-i2c+bounces-12851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17059B5283A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 07:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382FF1BC6D01
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 05:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98C324A04A;
	Thu, 11 Sep 2025 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw69tnfV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E096E329F29;
	Thu, 11 Sep 2025 05:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757569579; cv=none; b=JFE68btfk96Wi05H3qY78OrCeG7KRu81bb5MlgnwyRcBks9XqRMyLDO6OzQwL12QnoOLHVyhLitnS2NjyCJbT7GThMpLCPVm5nUU1Oniwpvze3Apg3KElGhmr19bRDjFRrrisvxx/IGqvWgf50Q9oUwYkbO4mGRUYbqxDflO4Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757569579; c=relaxed/simple;
	bh=c2nj22zVziZFPvapQg27VQzeDhrb67McvUBfPobnuoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mG/AIYT96gfFL0K5M18euUcceIXaTjZeP4SDk2Wr16Yg4Mr0B/0BzNfzqNlkwt0UDKMeQZR2/F1wQ04BOrWUoni5rMaV9uO325914QPd0PkLsMlOttlBO4NHXdcoUDLjTEVrtlYx0+k5HgmSPqgWo7/hCSG9yDh9fxBnRoVX/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw69tnfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Iudm002518;
	Thu, 11 Sep 2025 05:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hk0nyjFBdVjbYa0ltbjCu4YLTzNc1aOKbnfW04uCYs4=; b=Qw69tnfVBEoyHO8T
	x6HV0MdRcqYOuFxPE4rNtHaf92FgQ3zubL07HMlLlvBzLGpVTWLN6/+O5pAkONaZ
	O7zl/EQav9hN/5m+KyqYSOzQN7DIk+SnoeZSVqJhVH0aiwEuYqQQX5+q3nMPPSUj
	GMH5VeVfTPyO0qeVLQxbGIcUKHdIoh6yDibFrARROkgRP5Za27eIcL2REgqkn8p8
	ey3sLOUwczstxjf906MGan7tsMxRcny82YyueSl188x/3Iio7c61RxMgf81YWiK5
	PfnWkAfdMOqK9wkuSNUZ+sTYjwUlNwFqKFsDfIkEV8MqM8OrcbvsoKrmnKyFHv1X
	0Gumug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8pe5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 05:46:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58B5kC9G006874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 05:46:12 GMT
Received: from [10.38.244.45] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 10 Sep
 2025 22:46:04 -0700
Message-ID: <8b194a19-182f-4f49-9427-c0044a9b4dfe@qualcomm.com>
Date: Thu, 11 Sep 2025 13:45:59 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
	<rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, <vladimir.zapolskiy@linaro.org>,
        <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
 <20250910-camss_rb8-v4-3-28f44e1880b8@oss.qualcomm.com>
 <u437qomhok4yg6pef4xttd3a6zibuybzaeys33gxu5frbyp2kp@mgmym6c5dr72>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
In-Reply-To: <u437qomhok4yg6pef4xttd3a6zibuybzaeys33gxu5frbyp2kp@mgmym6c5dr72>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXx3J+vFEioTpC
 yQ+XysRwFvZIJSBHP1dJ/Tw2Y2uMC6hLN2NsDC4Q7cSHsupeOBQCt2wcA7gIOz/+zZ4oov5lgMl
 PKld15bkn/dQ72a82C7/W3wV2ZAv0n+PFEFULwHQ+/SjS4TLRF1jfmZ2vJUWwj/wstgxpFNLARZ
 c29jAqbfNA+D09+JHSnB6IZYe1r1r8BYXjujS+A88VBtqPZ+/ypTMYqZ+eCbCVfgQ+imW4X7fAS
 F4+7Wu8TY+WJjg7AR3m3PzUSVv4tQMmUIqug7dyXg1RSA1eO7BB5Ll71kOK1V9G/H0VxEt2v4tt
 Fa91mmEPN0/YRgWkIzKvwaaQGeeE2YU8oM2dH5f2arKLue/1uqhqnKDcJH7od5mHGvn6tM5WvpL
 f6HIq9UT
X-Proofpoint-ORIG-GUID: FgBDNynFUxujAwApYBUo3niDWhMtQkQj
X-Proofpoint-GUID: FgBDNynFUxujAwApYBUo3niDWhMtQkQj
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c26225 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=7BtIlnkysfzPWxNvCm8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/10/2025 11:23 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 10, 2025 at 07:06:23PM +0800, Wenmeng Liu wrote:
>> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> 
> Is it a part of the Core Kit? Is it a part of some kind of mezzanine
> board? Why is it being enabled as an overlay instead of being a part of
> lemans-evk.dts?
> 
Since the sensor is not part of the default hardware configuration on 
the core kit, we adopt a device tree overlay solution to enable its 
integration dynamically.

Thanks,
Wenmeng


