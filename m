Return-Path: <linux-i2c+bounces-3012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8638AA26F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 21:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0445B23023
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 19:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C9E17AD82;
	Thu, 18 Apr 2024 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W6J11maf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A83E15CD47;
	Thu, 18 Apr 2024 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466924; cv=none; b=hMxbf7urhTWszrSBC1kX/8wE04BwjXOU4swgsU6CoDVfz/K/FQo9ZQjiyFOiY2E5J+HtzZMK9jGJ6lt0+zhRBvC6+P1aV+klNld7z2CNx7TVMWdv358Zy+93oedrE3676VIqGCz0bjWTqHahucMrP4GiFlj0OvuhsJxNHfXEB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466924; c=relaxed/simple;
	bh=SpFE1kOMBBpcqTzZG1ZNlrJFy9DCEcrfGxK4uI34ipQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N6nN8++Eiq+mKtTinNUu5Z71cRqTUkC625Q6jhY5Y0/p1e85pgUtu0AzxtwB3dM9N3/wfnY11bY1mi5aEq3wWoAHRCW1EBYYAYtb97QRNqLFov3nbpxo9oWIOI7cquzr/1b3P46AHOkhn2ebsn7LLz3j0sBraJ49t/aLjZcusHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W6J11maf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43IF0R0E021375;
	Thu, 18 Apr 2024 19:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+Mir++Ln2FLqixl+vlLlko21XetSHbEOEt/3RZvuAJQ=; b=W6
	J11mafes8MQoI2heUKouENf1aCzTUOd77959urY3c88FRG+mMs1Ox+VcErkKb2Mt
	9Qgc7ao8bvV0iFVf8yQrfQyHrkQVGwwS4YZAODs0iHofM9GQBlJmA4C4R2mcZPDk
	3gyIV3jIVoYDQL6lkgRcdcQr37A+mum9uoQL6CMH0lxvwbIUtXOV1B9mQ55JJePU
	t6T9Bn1gekryYqMvZWvl30hYPfgN3ccAk1+UEPirhvl2mUFEBqdq+y0fdCA9mW37
	VulXpHYjzkqFjkZzFVbnXxktrDFAdwv45zgYGsyPe+cwulBtIeHhK2FubQ5Fy8yp
	aPid+t//5VzPy6PbgT8Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xjx54hr1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 19:01:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43IJ1xiT031867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 19:01:59 GMT
Received: from [10.216.42.77] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 12:01:55 -0700
Message-ID: <9a18b752-c13a-4b46-ae71-59b8372dd953@quicinc.com>
Date: Fri, 19 Apr 2024 00:31:51 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <vkoul@kernel.org>, <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
 <ccb312aa-3c4c-41bb-a3f4-b94971edb346@linaro.org>
 <b7125064-4b20-438e-ac1d-7107d28b1bf9@quicinc.com>
 <f4cbacca-c2e7-42e7-8ed9-dbc6bb59f1ce@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <f4cbacca-c2e7-42e7-8ed9-dbc6bb59f1ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TpIUsx_2-9TYumIgcNyeAdW866jndCia
X-Proofpoint-ORIG-GUID: TpIUsx_2-9TYumIgcNyeAdW866jndCia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_17,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=884 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180137

Hi Konrad, Thanks for confirming your preferences.

On 4/16/2024 5:14 AM, Konrad Dybcio wrote:
> 
> 
> On 4/2/24 08:21, Mukesh Kumar Savaliya wrote:
>> Thanks Konrad for detailed review. For dt-bindings sending a separate 
>> patch soon, rest comments tried to address and updated patch V2.
> 
> [...]
> 
>>>> +    if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>>>> +        gi2c->is_shared = true;
>>>> +        dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");
>>>
>>> How would this line be useful in my kernel log?
>>>
>> It informs that particular SE is shared between SEs from two 
>> subsystems, hence respective debug can happen accordingly in case of 
>> the issue.
> 
> This amounts to "not very useful". As an end user, I couldn't care less
> about the nitty-gritty of firmware-hardware interactions, so long as the
> thing works. You must not spam the kernel log with debug messages, as it
> slows things down and makes actually useful messages harder to spot. If
> you want to keep it, use dev_dbg.
> 
Sure, will go with the dev_dbg. I am uploading a separate patches for 
i2c and GSI DMA sub system.
> Konrad

