Return-Path: <linux-i2c+bounces-12898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91796B54051
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 04:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D79516F099
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 02:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E9A1DE3B5;
	Fri, 12 Sep 2025 02:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCbYYy1Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478B1D54E3;
	Fri, 12 Sep 2025 02:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757643817; cv=none; b=bwv5oe6FhvsZ9IwJXf4uuWUsJ9wcE1b2K1J4naHmTMTUp73BiFcQuDDjtv9YTwsyXB0YNGcTLauW/+dADmFV2WMl8EzFsyBGS3sbJtFItAXT1w7hxBo6g14kqcBpqEoFTSJ9Lb5du6+ympEUkUbNat2t7Vv9RCqWOoMBSSi+1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757643817; c=relaxed/simple;
	bh=Pf4S51ga8IKbyss+FqICpz6u61R+SEHTBjBV91Yi2+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QuJCtAxiy6pScXmHiuQsjrwsU0P2EgRgelfXFQxbw9ejhH4g8cQP609NWLWYfdPlx6oF7M4+EisdTIPiy1zCEp4aj8c89pRhPtvSBjOJlUjfevUQT3iRt9LUCBfhYhqbmcRL3aCkDySg2prDlLgOpLNHCzIvVq6wsVzuykUB5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCbYYy1Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIXGxX005633;
	Fri, 12 Sep 2025 02:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQBdHUkUZY+KokUQndZcWU2aTrSuesqymEB00Aeqp1w=; b=TCbYYy1QdU//HWSe
	SOuB8LoNmExOqea6IHzE6rYypLqdPa5wWjquXW3hvxS7/wEj9JsgrJRJhSwrbvwx
	p593dsOFqZVzdLPuO1XuXSg7pE5g54i1tp1Sg/hHcv4M5aua71AzFRxT44QrMc+V
	DIewUi2h4Qis/bUOeVe1pwuDxjTjhTv/He0RJ0SxsDuDxWccr87X7WJCxQumyhho
	TOHnnzFxbC9sz5u3VRlIJ4kySU12B/5HBerVapO/GIsU0TM10alEmdUf7brlwVSc
	m5rt5ZAS2hZ35k/myA/74zBTjWItsBHtuh4UwQx6XABDoAL1VbOXK91DeXQbFRfZ
	1CZOZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2e09n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 02:23:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58C2NUAP013525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 02:23:30 GMT
Received: from [10.64.69.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 19:23:25 -0700
Message-ID: <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
Date: Fri, 12 Sep 2025 10:23:22 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
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
	<konradybcio@kernel.org>,
        <vladimir.zapolskiy@linaro.org>, <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
 <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
 <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
In-Reply-To: <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c38423 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=-7q_Gg4UhoZt8uNEcLsA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RYXSl40THPTmVSrKxIV319V5ZINJ53NR
X-Proofpoint-GUID: RYXSl40THPTmVSrKxIV319V5ZINJ53NR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX+mv9qFPFo1FY
 OB/F8ENGzGxFwxK8xdzFHRLLntU/ETeJ1InRRGNiAS9TrA9BM3zOu0I9I2ycAlebzaAJB6TqDPo
 1Ijq1mpt94UzSnsTgYBp1cZkQbygwzd4F+Qpz3BakI+fW25tWfyQWqT5gWadtPEfhS8uGQpyxNU
 WX7AIwQ9LJvfFAjM+XGNTqoFZraOnfxIw7TCLgruo9dNss3eBbd0ry8g3PuGARG4SYixEXs7Nd/
 Wy7e/tzjpq4eIWZ2I0M991db7Yl/2bVN5id+hIGfN2jVz8AMl2JG1nsVynWc8hnV2hEPD0oTEcu
 ry8ZqA7TPiJ7RLIF1NKeZ9ib36q6iURPW/JLfpSHl/Dz5Zcr+hjAxZgoPUeUAf0MpS8zkL9Enz7
 XJ01kzv+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094



On 9/11/2025 8:15 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 07:55:16PM +0800, Wenmeng Liu wrote:
>> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
>>
>> The LeMans EVK board does not include a camera sensor
>> by default, this overlay reflects the possibility of
>> attaching an optional camera sensor.
>> For this reason, the camera sensor configuration is
>> placed in lemans-evk-camera.dtso, rather than
>> modifying the base lemans-evk.dts.
> 
> So, is it the only camera configuration that we are going to support?
> If not, what happens when we get the second sensor or second set of
> sensors to support?
You're right, although currently we only plan to support the IMX577 on 
CCI1.>
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile               |  4 +
>>   arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 97 +++++++++++++++++++++++++
> 
> At least the filename should mention that this is imx577.
> 
>>   2 files changed, 101 insertions(+)
> 

Would lemans-evk-camera-csi1-imx577.dtso be a more appropriate name?
It more precisely describes the content of the dtso.

Thanks,
Wenmeng


