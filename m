Return-Path: <linux-i2c+bounces-12951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59154B57677
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 12:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05DEA44330D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 10:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EADE2FDC23;
	Mon, 15 Sep 2025 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n52fYylc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7652FC892;
	Mon, 15 Sep 2025 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932410; cv=none; b=eO6WAj6sOMRln/hycgeqh+hSwBOUBZx3L6WQydIJX57clKAcAlbfl+5LlrYkMvMWAE/XQEOy7yhBF4ePkYHf3GkuLiGi7HdHM6Cxz7aI0E/CBm+aPeC8xXvblKt5+4cHszsRH1pW55jEeP/j0MbEoinHPBAG2+VRY9uLZrUZhvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932410; c=relaxed/simple;
	bh=B+vY08F4i/HnCv1ScZcxAk8Aza1H/zvJQLkJgxXZeNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qlrhzXH4WYJTe9d/1W3mX/E65vnK1y6Pkbwjgq5hHvNJb39Xj+QF6O1+W9OkosBx+lZMUuhWTq0FaXC6Y7l+mq+yBUMvXY5znqAPvy2uiROcqcd7ij0AIidHYT2JBIFdnahTFIhY9gw+47ZOu9dBnSm2SYsTyyJoNmDTwRnBd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n52fYylc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FiYk018062;
	Mon, 15 Sep 2025 10:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEwwZy8ATsI5rPJueJK8Mx9VooV1umz/QHEkRLAcREw=; b=n52fYylc7qSgB3eV
	Yq8T9m4YvkV6suTPvdHEhNr2U53aDcWrxgSkfOVypocqN2xVZVjtVnnXxQPJPuHw
	3TTVcLRgsoochUq7FSUQ0Eiu0B4gqImRFTAzWfzWb1ilwhwwblo/cu/eX9aakQ7u
	wvs0TZWcn0NEF9PQSzvKq9tbKDaWShs9sBF2p4ouUr/vSuMSL5WWDdip5rG61H/s
	Nh+2GQB40NMUZucg6oT4/6DhdOs+ekqubCdUghiyeodBdc5CPOyQ7bSDiIdEB+HH
	RpgEQJloWZAVcqcWzBmeVveUvaJb3ppg1Mh/R13CrBCkp/MbYdO48Kug2l886uLD
	csqK7A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u54h7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:33:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58FAXNwQ011646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:33:23 GMT
Received: from [10.218.18.194] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 15 Sep
 2025 03:33:16 -0700
Message-ID: <8f8df889-3f88-4b9b-a238-16044796d897@quicinc.com>
Date: Mon, 15 Sep 2025 16:03:14 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir
	<wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <kernel@oss.qualcomm.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
 <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
 <cb2a5c93-0643-4c6b-a97f-b947c9aad32c@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
In-Reply-To: <cb2a5c93-0643-4c6b-a97f-b947c9aad32c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FwbzkJhGeavS9d001wAdTXfxE2E5nA0T
X-Proofpoint-ORIG-GUID: FwbzkJhGeavS9d001wAdTXfxE2E5nA0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX5A8o8LawJiuj
 ZfRqPlGLcbUehF2ldAHuPlAYE2Zqi8490lZVou3ouPVQ84oPO2siT3oo17b5qPtRA5V8tQB0+9K
 fAByYXkREws+8q8Qg0vEIH6v3zmQKuqjfgAiTK5GfjJrUmtRS3+GbgvkjcSrYbzLkW20iXz7VOK
 1Tj6GWGgVSS1STzo1UEkAyO+JL6ALV7r9Nf/t2RgM+tLsluqsidDhCDf7StCNYzqFDYqiiXefss
 6f/Df74X+3PeRvCbSNzbles0aJYf0ItTBZnq5DD7PhaCDSCRDb9K7ab42OHzc+i+GhTz4FSzJaQ
 V6OXqbUCHYobs7eCJUkKzMC44XxHgUE/WbV5OkCelgwLVfvdWlIGGn27sNcV98qN6JWpJaBP6UK
 q60A0o10
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c7eb73 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=XuqPMlvQ3-AsHj1PTisA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031


On 9/12/2025 5:57 PM, Konrad Dybcio wrote:
> On 9/8/25 10:19 AM, Wasim Nazir wrote:
>> From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
>>
>> Enable PCIe0 and PCIe1 along with the respective phy-nodes.
>>
>> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
>> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
>>
>> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>> ---
> [...]
>
>> +		perst-pins {
>> +			pins = "gpio2";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-down;
>> +		};
> Pulling down an active-low pin is a bad idea

Ack, we should do pull up.
we took reference from the previous targets which seems to be wrong.
we will make it pull up.

Bjorn,
can you make this change while applying or shall we send new series.

- Sushrut

>
> Konrad

