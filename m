Return-Path: <linux-i2c+bounces-12305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168AB27A59
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 09:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2700A602B79
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 07:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461D529ACC4;
	Fri, 15 Aug 2025 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jNjXbNhN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0727C84E;
	Fri, 15 Aug 2025 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755244141; cv=none; b=YvRbhOnUbMBunSgsRm+EwfKuR/qm0dwWWZt8VVnY2bDqTRsz0auj+JFAVROR6hXq1ZZ+oW+GZIq6aWZqYXGSuCffxOf8ugUApq6cQ7uVV+flcm0N2rI4Xu+hKUFEks7m1vnQqMAP2moiOvEtNH8X+HUDCbY+dyYxzOAJDBZ9yGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755244141; c=relaxed/simple;
	bh=WIGdqRGQkWuU02CDA2Z3jWQgZCJG7VSTqROPS5CuPdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mmdMwkkRIpJZVK2L1RT5AA6hQ/j58heEpV7oto5159yj0bvpV68HxooYLTbWvfeOyVzT1AHv02guUke9Umi337SB6+Wklz7KxZtZusUGvgHem5sCauXMAntL5RHCwM5xHPDPzjMO97PD0+MbvdTY/HTCpwD6a9XonC8H8fc1bnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jNjXbNhN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJfRgO029021;
	Fri, 15 Aug 2025 07:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKYUjr/LKHOkrvdAdUEteiYS5Dm6BMUylPEMQFqc8Ms=; b=jNjXbNhNojDchO88
	JWP6kxVgQG1vB8UwgYUra42Bfxj2YKXh/zgKPTsL9BIgXKGgCjBkUBEWdIUpNIJn
	Uc7wRy37XXR6DpvrdAkU6g4pSsss9HBIwxnwmi6WKXyl48yP9F8ZNYsqAdUjpegd
	Pz+9YBfjYAwzTQyHWkLNuFROooyUU2FYcIET3sNS8fEbYWQu4/BdK5TlDwzYv+Rg
	D5fHpWS5pwazhk6bB5D5v3540+PK0aUCwTGPAKvDmGeLzy1zMoJYYRHpaAS2194w
	zW5a98LTCKPYRp1YFZeztIVVZLXhl3C1s3zxLRgbqd7y98DTC3fCYhYIu7NcEKqZ
	ti4Skw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa1dkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:48:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57F7msSF024346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 07:48:54 GMT
Received: from [10.253.75.233] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 15 Aug
 2025 00:48:49 -0700
Message-ID: <3cbd4a43-22ea-4d84-a556-67d8e7e573bd@quicinc.com>
Date: Fri, 15 Aug 2025 15:48:47 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CCI and imx577 sensor support for lemans evk
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
	<rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>
CC: <linux-i2c@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689ee666 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=MCSpsR8RhAqmYnD9AtEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jF__pgEJcsqc_ioTgyEMfVsuzb4p0Tdl
X-Proofpoint-ORIG-GUID: jF__pgEJcsqc_ioTgyEMfVsuzb4p0Tdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX0410l3kmKEkL
 O7EuWp8RqEZ+edN+hh2R0hDMh7emzE7QqYUQGzkgKME/5iNXjfxLwyIJQivLe6uVtWeZwyEUI87
 4hPJV7KYtyuFMvK2WYHr1q89wvRIEDmsUd9cDROIU17bviiT4ozHZxmzQf5McRzyxdDMzZW7szS
 WHeQnGvuFte9jN0qU3n7+muP3yLCisZ2ueor50a+rhHzNDvJwkrC98PC67Ksh41QtvmVTpm80Ks
 TqfMfabRzBJG4t/zBD9O6ET8p1L5YWHH29EvuAtq/1cZnGmmXKfXe3yQ9KW3yWAMBFWC/kbq1TP
 Y5RP2dVx7/N3P9TcuicMyC7SRcooRPSWPeKdbqASBbW9y9268fLhWE44cAXLlgDnB7oSoAFmYre
 SXiJMbl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164



On 2025/8/15 15:07, Wenmeng Liu wrote:
> This series adds cci definition and imx577 sensor enablement
> via cci1 on lemans evk.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl -d /dev/media0 --reset
> media-ctl -d /dev/media0 -V '"imx577 0-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
> 
> Changes in V2:
> - Remove the patch that adds PHY supply documentation in the sa8775p CAMSS
>    bindings. This change should be submitted together with the sa8775p bindings patch.
> - Fix the string ordering in the DTS file.
> - Remove the source clock from the CCI node.
> - Move the sensor enable configuration from lemans-evk.dts to lemans-evk-camera.dtso.
> - Remove the definitions for CCI and regulators that are not enabled.
> - Link to v1:
>    https://lore.kernel.org/all/20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com/
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
> Wenmeng Liu (3):
>        dt-bindings: i2c: qcom-cci: Document sa8775p compatible
>        arm64: dts: qcom: sa8775p: Add CCI definitions
>        arm64: dts: qcom: lemans-evk-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   arch/arm64/boot/dts/qcom/Makefile                  |   4 +
>   arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    | 105 ++++++++
>   arch/arm64/boot/dts/qcom/lemans.dtsi               | 268 +++++++++++++++++++++
>   4 files changed, 379 insertions(+)
> ---
> base-commit: f0d48d68b1e7323d253068c5d4f7b470c5e927de
> change-id: 20250815-rb8_camera-877517c45388
> 
> Best regards,

Lack of dependence:
This patch series depends on patch series:
https://lore.kernel.org/linux-arm-msm/20250814101615.1102795-1-quic_vikramsa@quicinc.com/


Thanks
Wenmeng

