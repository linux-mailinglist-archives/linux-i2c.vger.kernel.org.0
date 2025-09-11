Return-Path: <linux-i2c+bounces-12858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F8B52F12
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE3F1898FD4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F6730E0D1;
	Thu, 11 Sep 2025 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHdJ+1SV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB398F7D;
	Thu, 11 Sep 2025 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588584; cv=none; b=kQPUR6tGRz1CUDRh9E5w49Xq6kal22EIwvYbX/l1PlU6DgNo07MM+a3cpdS2jnhmlVJcDqf60GI1Qmq+JZjiEg++iwdH0Tv1vT7DtahQjQJKVLXb3fEEgIrOgXN5wjB3QnB0NWpPB3GAf4Om4H1ipaEDL2sKHfC4GHu3KX9/l5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588584; c=relaxed/simple;
	bh=RgJzz1Mg5TehAZXBA/0g/POPvT/11Mry19/CxyiXO+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bk8NmsoTsLKMpMCiUprZIKDo+EGerXs9kSlrNvjw4EGafZrJ74jeGWGBno7zLiH6VNlF75NE/IjdTrrttwn+cAUk2EBZL8uTIgBGCXnTL/7jmzH9+Kyd54ivXYdmwxFz9FkCSWohGLZaZ6aeLJCZJxcGuRkStRx4VDtFK0JtFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHdJ+1SV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAvfm7027092;
	Thu, 11 Sep 2025 11:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUFR4MCKacDuHAQmYt69UhD58DWx5xlNQ1BHfWFZGoQ=; b=hHdJ+1SVdCfuI/d8
	BzFPRpeMpSQ96W3th7b1NKz514yethRzA/4i1vZxxrO0msYc5l26ZIDi2TIugi9o
	+BTiUwdLwXI/V1a4IS9b5Om1mB6gcdvoiZqTcHrfTp4lcQZrdcONguqCGh2JJvmI
	gNltyeQKP0viBoKnySMx358eY35YiaoLMg2hLVOuCtLpGxUP5zeQjx0WHnkL8GMD
	IoAgQPEmX3jR1rmrZq4if0tCa4jWe672j8cO0GiNIEPxJEyFw9HhsvpVq2yiTbLL
	02S990Iv//YyE4qse0DJw6H7bt4TruIE7nkhaJoZVK68wh84SiIgTYqRtc/qEQV2
	+Z8Tjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h2atk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:02:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BB2u2k017320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 11:02:56 GMT
Received: from [10.64.69.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 04:02:51 -0700
Message-ID: <060d79dc-af41-455e-8f64-29b6967e363a@qualcomm.com>
Date: Thu, 11 Sep 2025 19:02:48 +0800
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
 <8b194a19-182f-4f49-9427-c0044a9b4dfe@qualcomm.com>
 <srawt2oh3hcevopcrvpnmbocw4wknaytyvxt6yjmnet3yujupr@ub3t36ffbrcx>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
In-Reply-To: <srawt2oh3hcevopcrvpnmbocw4wknaytyvxt6yjmnet3yujupr@ub3t36ffbrcx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eGVtQDRtJFeq3N5I6N-cu7SfJpPXlf4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX+1WaD7LCfrwV
 pXbHi85ABy+OZsensgDhHnuxci9W5Ob4GfBbZdK2vKLKAUc6y4vbH5YwwfiW9ab+Fppx7jyfbqV
 nRSMEt9oxIQe2FZnBUUXIFVcHcF7wMDIdUTv0xiQFojeSfxNrXWvOmftayi9wEWNzdkQpzOW8YQ
 cXKL2RQDDEjm9YUnbOvpX67voEfxmxD4MHqZ6xK6twCRTVRs73VmDXzdZVw1LRoMYToCisz8pln
 dRw0jRRcKvdFlv7EvlA/f7kNEAlnRxSWUVTME1h1k2mTyG5vFqPOQy7mnrq4trola6k6Pi1aSkj
 9C9viTGzJ6DDgBQuCGbmwP4vq7XsnjRdnkKaTVn1EG2MEFes2dpa2IH9EsNBQUvnsLF6yqIF3Za
 E7yEdSTX
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2ac60 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VhYYApp5dJRVSGecflEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: eGVtQDRtJFeq3N5I6N-cu7SfJpPXlf4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177



On 9/11/2025 6:15 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 01:45:59PM +0800, Wenmeng Liu wrote:
>>
>>
>> On 9/10/2025 11:23 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 10, 2025 at 07:06:23PM +0800, Wenmeng Liu wrote:
>>>> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
>>>
>>> Is it a part of the Core Kit? Is it a part of some kind of mezzanine
>>> board? Why is it being enabled as an overlay instead of being a part of
>>> lemans-evk.dts?
>>>
>> Since the sensor is not part of the default hardware configuration on the
>> core kit, we adopt a device tree overlay solution to enable its integration
>> dynamically.
> 
> This is less helpful than a similar response to the similar monaco-evk
> question.
> 
> Is it the only configuration that we are going to support? If not, then
> the overlay should be named accordingly.
> 
> These details should be described in the commit message.
> 

Sure, I will update the commit message with an explanation in the next 
version.

Thanks,
Wenmeng

