Return-Path: <linux-i2c+bounces-12917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC52B54A9D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 13:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F74D7AA8B9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B822FDC23;
	Fri, 12 Sep 2025 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WdWXokpe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E951C2DC778;
	Fri, 12 Sep 2025 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675144; cv=none; b=liiMNSTfeeaJZj1fXXIYJJSeiNGunJnF2OszaNJ1GizDO4B1966EObDjDIS0a9EMqUFfuNXoIiPECzVUCuE/CjGxg1zQSHZDlKohN3raAraMWKn9hKFVJ96uhXoSJPUQg2+2ArEkyZa6RmnvZdU1+Gj5k3+LxnYVXLrfnph1OUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675144; c=relaxed/simple;
	bh=VWr6YEk/eWyuf8GX6B8kqrku8rVzmRGsF4aKQi6DPC0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElyIpK+TIqxLS0OvhKEBOjieZPu/DnQRXb2Fx9DacVQvm0TXeH1Bh7MImeADf8sUdLN09tmh5GS+NB5URVJhzQegVGEptz8ZsedeLadZuT7WV5RPTqdxFmwV68ReeWpvvqT0xDojBwN6eoF39tECtT7rV6jSjCPVOdU5CG5vQqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WdWXokpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fD3e017429;
	Fri, 12 Sep 2025 11:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ePnXDXr8x1lIo6VZAPonJQEP
	xXdMy4DI0k4pmkIC51w=; b=WdWXokpeTtEPV6RLCqA4X0W2OW32tyrmRNuKH+N2
	ExWZxiT19tLZmV0CN5bMT8YYIYxsSt4KaTcco2HVVvEnha3ezi69s9Z9dKM1IR/M
	hmtJRgieo1/PZBELBFT4oQvysxOI7vjd4f6DCmvAKcG0HGOsekAbWI9WzrJwszXM
	TwwlOPgUWhacXxjlng5Thlzy3wOkNN73OxLJOqsLbbsXKGRXCT+mv7Xi+1oJtoLz
	U5Em42hBCJgCUFNP7BEGMdtwSupaD9gkOdW30H56eImfbwrr5jizS8ED1jw9G0M2
	dRgBNW905R3zqdWoVh6pmUl6cJRY3+l9ORE6kmr4sJJjkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ufwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 11:05:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CB5bdm016550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 11:05:37 GMT
Received: from hu-mchunara-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 04:05:31 -0700
Date: Fri, 12 Sep 2025 16:35:21 +0530
From: Monish Chunara <quic_mchunara@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, <kernel@oss.qualcomm.com>,
        Wasim Nazir
	<wasim.nazir@oss.qualcomm.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: mmc: sdhci-msm: Document the
 Lemans compatible
Message-ID: <aMP+cdmPkej+lPtN@hu-mchunara-hyd.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
 <20250908-lemans-evk-bu-v4-1-5c319c696a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250908-lemans-evk-bu-v4-1-5c319c696a7d@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX5305g5kY05Qf
 cXFnWL/GGvkynL+M97Po0o58mwqLIL1k7uqrq4UbC+by8RLygtCBc+RFAw3boa/Z9WbE8B0ljFW
 qeydOXhEhCJnpiW1mFnDmMLs4SohU1I/ggIsIBrIaQBHoAd436+pPkOOLTUr56ONAcDCHtD6W+k
 jy3kno1tuRLh0WR+Y3LxdPfou8YeNL4t6BxHG6zATRnf/ws6jlWAo77lmtLJ/Li1OSHLu/soXiH
 6fp5c5lgK9O+7pFzjnTtfXE6D9QI+zakJaeyKar+XuMJRsXkaW6jHjh7tHABdTXuhkpSlwFlJ9u
 fnz1etNiUuhTo3tNLGJ+e1CBW/f1vxyi+3mMqNxcF5LbV1pUlEJdg3187rJhngTifaERgtGh0i0
 y3nLMSBm
X-Proofpoint-ORIG-GUID: EN3UG_QBNxLiwh51FQOdz9fKj5SKLwvk
X-Proofpoint-GUID: EN3UG_QBNxLiwh51FQOdz9fKj5SKLwvk
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3fe82 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6_WQ6zm6zWfZUhxJvNAA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Mon, Sep 08, 2025 at 01:49:51PM +0530, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Add the MSM SDHCI compatible name to support both eMMC and SD card for
> Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
> compatible string matches existing Lemans-compatible formats without
> introducing a new naming convention.
> 
> The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi Ulf,

Could you please pick the binding (this patch) through your tree, so that the DT
Maintainer can pick up the remaining dts changes through the qcom tree?

Regards,
Monish

> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 22d1f50c3fd1..594bd174ff21 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -48,6 +48,7 @@ properties:
>                - qcom,qcs615-sdhci
>                - qcom,qcs8300-sdhci
>                - qcom,qdu1000-sdhci
> +              - qcom,sa8775p-sdhci
>                - qcom,sar2130p-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
> 
> -- 
> 2.51.0
> 

