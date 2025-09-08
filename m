Return-Path: <linux-i2c+bounces-12766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574EFB48A29
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 12:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4151B3A5204
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D912F60CC;
	Mon,  8 Sep 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l2YmdzA8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952692E9EA1;
	Mon,  8 Sep 2025 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757327225; cv=none; b=UezH1MLBN2eu0Dd67A3zQtDikLLshzRBJtfZTrzvwn0w6AdpnWsD0GQHRqWgVRkhtbcotREgCN4qFaY9mFUU1t3pjJqSxrgix/zHEuBxxz43YX69w2GV3ybVcYgPo3IB4avdHb9ZX7TXxdCByE1QStpd+vKvGptHfuGGvPbrmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757327225; c=relaxed/simple;
	bh=2ZzxvSBShoA/30DwcDt+e5oqEhOfb6AXkUiZp46YYJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SHrpHWYDpBoDXNKFeLX5k9CCvZ5D5iSpcrNK57CMne0YDH1fey712ujESuXFVM5OyXuOiB9G7/G6M5VUQ2L2L2Ywl2bUJFfwIIugWj8oOTeUxgSC/HcPbh8buQfRCZtHlusqQF61TFJvFuBMueuZ7exKqLET1A8Opf+DlT/heFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l2YmdzA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58893GZf030332;
	Mon, 8 Sep 2025 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nKFbcMCJHuaQHg+i0ynE26tRayp8+zze2zH/yBa7K0=; b=l2YmdzA80yGl1OH3
	jUyHKDHjHvm/tRdTbVezCkGCI9gpWl7jaW4KDzNxoZDqpBzPBYtn37mDebhHZl4I
	zidPV/2cSAGfG7/ZBNKYN8KDTb7j94JtiGE6FXzEPtpcWvXoQrSS4WEapqLrPwCh
	MTyW9bSo6MSueYPJFTEXHNBBeqHnBAQwFWJqM20j0RdPIVqSX6LBzArAAUKC7Wke
	RYwiI9XNA2cANW12ju5MLMkieJCVo7wruF+B+m03ITjr78Tk2PuZvzmGFscoABoG
	S8bBle3p3JyQpp1hBQvw+yOohBBaaqdLDBMX6WuD54R2tbdOdrJQKAWJvaLfduOb
	K05F+w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a44wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:27:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 588AR0UD008036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Sep 2025 10:27:00 GMT
Received: from [10.151.36.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 8 Sep
 2025 03:26:55 -0700
Message-ID: <99c42878-2b77-4ca1-8fe5-8d51ead618cf@quicinc.com>
Date: Mon, 8 Sep 2025 15:56:52 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: qcom-geni: add OPP table support
To: Andi Shyti <andi.shyti@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
 <20250903080948.3898671-2-quic_mmanikan@quicinc.com>
 <iixfu6y43vh4ymgqbpo72oooowyxmbpz7wprfkkei67jutkj4d@dbinauujzapx>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <iixfu6y43vh4ymgqbpo72oooowyxmbpz7wprfkkei67jutkj4d@dbinauujzapx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68beaf74 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=Cyh4iyD3QBNivaBo-lIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: YEeVbWL3DnAOXasCFA6RcEFXrnHYPzXY
X-Proofpoint-ORIG-GUID: YEeVbWL3DnAOXasCFA6RcEFXrnHYPzXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX9BmCTDsarv02
 6M+6masPp+gcX8gkMdsDlOabBdFLkw5I5gYrWFOubhCTsgYUKEo9udWPYf7KJmKbnuImgFsK6+9
 ElaJiyIFIxInwe79jjgr9njQ5VwBZH58Ml8LBFcHye4onUvuJnSfrma0tCqFxarpg3QGF60ASbR
 ZRHHs+LVJJ1kTC+PjClhFdtlgO1vXaEtY576bw18XRazEee7p2PES5ZwQuryARmvk7n69DMzsI3
 o4oyWLnURiaVA47fwIiS2k16l/bz9ghlorLpYaUmjunaTdnNKHRLgBUej8cepJI/3npD+q30VRw
 ESbOTmsmAp2y7bPRthiO1j5MuhWP8DIBNVD2+Bco541ByNTGWUeR65EGo3tt5bRApqr/82FyQna
 sEt4aTyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039



On 9/5/2025 3:57 AM, Andi Shyti wrote:
>> @@ -814,6 +817,24 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>  		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
>>  	}
>>  
>> +	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
> 
> /&pdev->dev/dev/
> 

Hi Andi,

Okay, sure. I will update in the next version.

>> +	if (ret)
>> +		return ret;
>> +
>> +	/* OPP table is optional */
>> +	ret = devm_pm_opp_of_add_table(dev);
>> +	if (!ret) {
>> +		opp = dev_pm_opp_find_freq_floor(dev, &freq);
>> +		if (IS_ERR(opp))
>> +			return dev_err_probe(dev, PTR_ERR(opp), "failed to find the frequency\n");
>> +		dev_pm_opp_put(opp);
>> +		ret = dev_pm_opp_set_rate(dev, freq);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "failed to set the rate=%ld\n", freq);
> 
> %lu
> 

Okay, sure. I will update in the next version.

Thanks & Regards,
Manikanta.

