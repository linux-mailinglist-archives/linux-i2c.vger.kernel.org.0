Return-Path: <linux-i2c+bounces-8441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C213C9EC553
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 08:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F35E32860C9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 07:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C391C3F28;
	Wed, 11 Dec 2024 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D4aLRGeH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36E1C683;
	Wed, 11 Dec 2024 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733900811; cv=none; b=SYJT8KHb2XOgxV89MhwiQpMJxn2dFs6ZuMTdEFdtxnAUWW09YuXselrqFmxQnbGalHxWn76HQ84/zOt+ejtPj7zKBr76vmVEmBuzlS3OVK00BdEllzid3tuKGUosiwZMBBnFUoIERNn7PIM5GcTP8DAvEFgu+xf3dTew1I+/Cx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733900811; c=relaxed/simple;
	bh=lBwhGeTPGI2fSJRa8jIbJOjpWFHfhjB6JMjLpbcW6Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VyxDuzD+BMup4JlUlKONzgKcUZRQqAYpyPIyZVpiQfxE4QEJaJYHZNDSgG8aZDhJ7fkZ0ScTnP7EZ7YzISlPFvo1nBnhVJwYkeMjNqDWTXS7pEIzhi7ZuGRec74xgWMNXq6MGFLcezM/4XqYXlqCvMjRquZ0kC/QaQthIhTY+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D4aLRGeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB42frX028717;
	Wed, 11 Dec 2024 07:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGp2UCE6aoMSrVAM1t7trLJaFaL+V7+rXbAJi6/qAr4=; b=D4aLRGeHT4LxGrbr
	W328hJ8/XT8Q6XNC4oXrbITZE71UiJBMH15zmgW0K5UqyYQzCib/WxZaXUFF63G6
	LMqEpFebf3itJg4czO7s5bA32jnZXp+lSADWiuOSaxgjBQ3FETl8b7+xdWNUUnnJ
	6UFd0TmeUXI7FJfWnl79Cjnb2gIvUXuRL+I7r+QUGmfg5xkPa+tlsukxxrTrQrAh
	iOZ4II4agqmEOicpjc8HNNGA10WQAq6dQdB6f1eCyx+Czz2MQGeJ2zcwqHzgvf+7
	ynNjmpngBeEkxCAYenXZYRiOiwIwZyx0G9ZWoElkX74NbTol5OCAPrZPFOPC5/sL
	b6sCvA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eg9ekw2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 07:06:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB76kVu022855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 07:06:46 GMT
Received: from [10.50.34.16] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 23:06:44 -0800
Message-ID: <765f2a3e-a930-407f-83bf-ad3e6b928443@quicinc.com>
Date: Wed, 11 Dec 2024 12:36:41 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
To: Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
 <20241210231054.2844202-3-andi.shyti@kernel.org>
 <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>
 <gwl6occrun32l4rmcdrjnzymadhlwixba5eyeznnx462gp7gym@rsvsdjr2zgmp>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <gwl6occrun32l4rmcdrjnzymadhlwixba5eyeznnx462gp7gym@rsvsdjr2zgmp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GG6ipA00nn_k5mDXX3fYP6TEPR-UFwLo
X-Proofpoint-ORIG-GUID: GG6ipA00nn_k5mDXX3fYP6TEPR-UFwLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412110052

Thanks Andi !

On 12/11/2024 12:26 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
> On Wed, Dec 11, 2024 at 09:26:53AM +0530, Mukesh Kumar Savaliya wrote:
>> Thanks Andi for this change !
> 
> Thanks for looking into it.
> 
> ...
> 
>>> @@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>    	return 0;
>> return ret here ? yes, we need to initialize ret = 0.
> 
> here? It's returning '0', as it was before. I'm failing to see
> where 'ret' is used uninitialized. What am I missing?
> 
My point is - Except this place, rest of the places we are returning ret 
OR standard error code. If we return as ret with initializing 0 at the 
start of probe function, it would look good. As such No strict requirement.
>>> +err_off:
>> can we rename as err_resources ?
> 
> yes, it's better, as meaning it's more aligned with the other
> labels.
> 
> Thanks,
> Andi
> 
>>> +	geni_se_resources_off(&gi2c->se);
>>> +err_clk:
>>> +	clk_disable_unprepare(gi2c->core_clk);
>>> +
>>> +	return ret;
>>> +
>>>    err_dma:
>>>    	release_gpi_dma(gi2c);
>>> +
>>>    	return ret;
>>>    }
>>


