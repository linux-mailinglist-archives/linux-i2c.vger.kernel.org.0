Return-Path: <linux-i2c+bounces-8474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746A9EF2FA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 17:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2A371888FD3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 16:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDF1235889;
	Thu, 12 Dec 2024 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QGi5zYHd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1F223E71;
	Thu, 12 Dec 2024 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021131; cv=none; b=qAoGrNFEKeaXEDW2g+zl7qvNO7exrLZxzEpgEIGR/E0jGphtYSJuWYlz6XfwoOENAJHpQQltgRZNkgY2M5sjWNFB535kXI5JPGVLdlD4kgm4TtBQMZkV1idCvry+W6IKLsUdzjfGQIIs8GNlAwHeDKbwnrlF2JZo8wv39qeH5IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021131; c=relaxed/simple;
	bh=BWISh9/YM0tfqbQeLcg9PE7M66MOqPekX13FRb4PjxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C3yFcXJre+HYFu085dSqywwMZvrVycBi4TuKiTesPnS56GIGJkCXcYkmIGFbLHs4s57HlhjSB2pu0+g+SoPeMCmYd17T/PhxBc+f6AzKrfPWcbyK69IA0y9yPVC8s0cOQ173c5nFa5p7nFHQi4z2bg4QyL4qkaTAxw/suL2l0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QGi5zYHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kdca030156;
	Thu, 12 Dec 2024 16:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07UFKydAPBRtSd3wupb1d4fAByuHRcDkCfT6XA2HGiM=; b=QGi5zYHd24RA7jqS
	R2gIUevkuHM2v2MhY1Rqbo/8e+kU8KgSBpqUVBOBEjCsSqiICkY5bt21tlDi5fmr
	uwYVcW+Z1IqMleSZiqwmIOr9/0OPBsl9hLme9GKysT19NsZX7Iosi4dToEwK7QAh
	/Wdz10sb1LxRIfYnaaM67Lj1jE3tdBf3NzTQay7zfWcqLEZKxmydbhk865GGTTfC
	tXt1INLLpAck3t7bTeyZBUdQiTEIQXVcsW1A6kMiALF+BwQ62KrM9MP0zoA6C7M2
	ps68AsRXTB152WKF3L9B9XtVlZJ9IRnzw9s151HyQVYEcZ/zxwgFvEKItonMWo5t
	WU+udg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgeh43f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:32:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCGW7cY013976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:32:07 GMT
Received: from [10.216.33.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 08:32:05 -0800
Message-ID: <c4a8393c-37f5-4115-a67f-2a4e98b6648a@quicinc.com>
Date: Thu, 12 Dec 2024 22:02:01 +0530
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
 <fd45ts4bgcaaoydvvkq52c3r65dhrmbe4ig3oxp7pqtmrckdwd@wnyfmzlfhgs5>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <fd45ts4bgcaaoydvvkq52c3r65dhrmbe4ig3oxp7pqtmrckdwd@wnyfmzlfhgs5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SaiSFJD04dkvBmnEAnsENO7Ch0JfCISp
X-Proofpoint-ORIG-GUID: SaiSFJD04dkvBmnEAnsENO7Ch0JfCISp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120119

Thanks Andi !

On 12/12/2024 7:15 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 01db24188e29..3fc85595a4aa 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -867,14 +867,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>    	ret = geni_se_resources_on(&gi2c->se);
>>>    	if (ret) {
>>> -		clk_disable_unprepare(gi2c->core_clk);
>>> -		return dev_err_probe(dev, ret, "Error turning on resources\n");
>>> +		dev_err_probe(dev, ret, "Error turning on resources\n");
>>> +		goto err_clk;
>>>    	}
>>>    	proto = geni_se_read_proto(&gi2c->se);
>>>    	if (proto != GENI_SE_I2C) {
>>> -		geni_se_resources_off(&gi2c->se);
>>> -		clk_disable_unprepare(gi2c->core_clk);
>>> -		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>>> +		dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>> Suggestive comment, can we make this second patch as first patch ? So that
>> we can have both above lines reduced in this patch.
> 
> I'm sorry, I missed this comment. I tried to swap it and there is
> not much reduction in line changes[*].
> 
> The reason I chose this order is to avoid changing the same line
> on both the patches, like here[**].
> 
> If it's not binding for you, I would keep the ordering.
> 
Sure, it's perfectly fine to me. No worries.
> Thanks again a lot for looking into this,
> Andi
> 
> [*] https://paste.debian.net/1339486/
> [**] https://paste.debian.net/1339488/
> 
>>> +		goto err_off;
>>>    	}
>>>    	if (desc && desc->no_dma_support)
>>> @@ -886,11 +885,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>    		/* FIFO is disabled, so we can only use GPI DMA */
>>>    		gi2c->gpi_mode = true;
>>>    		ret = setup_gpi_dma(gi2c);
>>> -		if (ret) {
>>> -			geni_se_resources_off(&gi2c->se);
>>> -			clk_disable_unprepare(gi2c->core_clk);
>>> -			return ret;
>>> -		}
>>> +		if (ret)
>>> +			goto err_off;
>>>    		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>>>    	} else {
>>> @@ -902,10 +898,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>    			tx_depth = desc->tx_fifo_depth;
>>>    		if (!tx_depth) {
>>> -			geni_se_resources_off(&gi2c->se);
>>> -			clk_disable_unprepare(gi2c->core_clk);
>>> -			return dev_err_probe(dev, -EINVAL,
>>> -					     "Invalid TX FIFO depth\n");
>>> +			dev_err_probe(dev, -EINVAL, "Invalid TX FIFO depth\n");
>>> +			goto err_off;
>>>    		}
>>>    		gi2c->tx_wm = tx_depth - 1;
>>> @@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>>    	return 0;
>> return ret here ? yes, we need to initialize ret = 0.
>>> +err_off:
>> can we rename as err_resources ?
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


