Return-Path: <linux-i2c+bounces-7956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 776429C7839
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D869287C13
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB521632E7;
	Wed, 13 Nov 2024 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CAZI+eeb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295811632DB;
	Wed, 13 Nov 2024 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514007; cv=none; b=szVBl7T6SWHtuMw3pv86j8hyB9igUrxuJ+howfmBlVZ8xSBaBvd/DUcy1KDR6a90lGINazX9R/1RdN3UftRSi9bKc15y+8S0+knGbxCTMBszS0wR6sJXrxzkUWLJDfnoiDdSrGyhQqsHT1G1xVz1b/42ToiERwKMtdHwB3rBuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514007; c=relaxed/simple;
	bh=BCXuXOpixphOFtcRJkSlub1GGiYVlksBP7cnJHXukQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PSj8r2V8RyUpKpMTF+zgGqtdf/81Qgif8KefXUx7maNMUvmrwXBSVGDxI7eLTzkkZKkrLnz7g7oKNfakcWKFshKsBmUgzKxxd1d/3BvwsefNYaY7wzV/mzVNtb5S38U3xVStqYOmaNtRZDn18A8cBSW6RbZXe4yoRI9zYslXeHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CAZI+eeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADA55m9015535;
	Wed, 13 Nov 2024 16:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GV0mkOpXi8oM+Az+cni/vtxeKvmP84jlYSbIPu5yTA=; b=CAZI+eebtvHKvu99
	3+/vTMHxFFkjgSn1pISWe+lYHUDZqRzdhlvK4znl6YswnTIJ0YhxIG/PErLx7R4a
	E/U4eZTDt6YCj175nQ9NvHaDbX+ULJr1EuLIvRmYHoJb253fMtK6jYk73w3N7rTt
	gQyHzfY0877RBUSAK9xjp3TtUwQI6foeR/KNUT97FhhHZ/sKBon1qlOG44KCnVoR
	CgN1SLA7LKhPW6HeSiU5K8VakBA53slJigjKkBZfWGgVV1DCSNIVeX+FrUWUVboU
	4U3eacsvt81IAXg7tfJVfLQUijkiCqe44YG46J3AhmJCsxJ5LqbvY3E9mphKJ+Yg
	YCDGGg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1vfw0kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:06:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADG6boc030603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:06:37 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:06:32 -0800
Message-ID: <cde88b1d-c9b4-4dbd-bf1d-45233a78daca@quicinc.com>
Date: Wed, 13 Nov 2024 21:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
 <34dc6392-e90c-4512-b5d7-10247a3c0f29@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <34dc6392-e90c-4512-b5d7-10247a3c0f29@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: coLG-uUQBRyAHT-LpbrQl0HozHqFHL1X
X-Proofpoint-ORIG-GUID: coLG-uUQBRyAHT-LpbrQl0HozHqFHL1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1011 phishscore=0 bulkscore=0
 mlxlogscore=845 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130135

Thanks Krzysztof!

On 9/27/2024 3:31 PM, Krzysztof Kozlowski wrote:
> On 27/09/2024 08:31, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
> 
> Also, fix the typo in subject prefix. It is dt-bindings.
Sure, Done.
> 
> Best regards,
> Krzysztof
> 

