Return-Path: <linux-i2c+bounces-6484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517E9738E5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D882B2881D4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B831192B96;
	Tue, 10 Sep 2024 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F1FsfxkN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001614F12C;
	Tue, 10 Sep 2024 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975774; cv=none; b=DRk2PubIJJGXk1ny3GyK5pW/ESYYsqSVjpyfXX2d8wXaw5H2tjQvP4Xf8QSBxKEY2WINpGhVAufoqVc9BkeI5D1ZFok39bygKjR4TIPai57lRJZyS8OgE/tMEbsUATbD4S9U4ltHRlg7TUUa03mItyqSQtZhDjvSGOYbT8tQKNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975774; c=relaxed/simple;
	bh=kmz9/uRHzbHRURjyrtbMw8pnB+oaWqG13ZRYbjUZycc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lfqdsyXgcF3qu5MHv9m801vtE5CBah1V888eKX5oZOJpoI6Un0hoRoNiji0v+gBAzFe7Dkf7ZmRtPfLdax0JwmLaKlIg1kHXk6QEMV2uRg3nRdGj/12huupqdS6b1ZKfH6PbtI63yS0HyiR1zBQEGHV0CDQafjdmrDsW8IgPbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F1FsfxkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A4GuvU021281;
	Tue, 10 Sep 2024 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMPWxYbCh15EiHAKOuG+aHa11XKoLFGhDzNuh8Ezn3Y=; b=F1FsfxkNP4Mu3amo
	y2MPE3teyKpD0Pb8ZqArZeVxuTzEPVi41Vb7WPHikzG8fm4gWl6uEQuWq+lmyZos
	7NaWXTaXWNXCJ4gmy454wTY3cfci9pY8ZXJA33XHTing4FNrIKJM0H60r1o1SHcJ
	Pd3ZJ47BmXjVgXLB1JYu43UqfIYWHMIqf1xAudc7WvsW2Wb0PLQ4TBpMblcqc87E
	y9dU2KvzP8G5ufhGSeKaamRVDug+nih6JYECR9iacJw+s9FfHsD+NzX3IMbOovcU
	YXEZbTI+SAlznUFaPn0p93C/EuQlwS1yTtzbfgBBoz+e+mqq5E+DaX0f1z1UdIPm
	wGvJoA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpp1sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 13:42:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ADggkK029921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 13:42:42 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 06:42:37 -0700
Message-ID: <6fbfe1b0-e99f-43cd-a099-389f65ab5b06@quicinc.com>
Date: Tue, 10 Sep 2024 19:12:34 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <pnt6pyeaqu3v3qk6hsccqfm5agtvzqjujs35roicovgv5xbsh5@gskuy5wefq6r>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <pnt6pyeaqu3v3qk6hsccqfm5agtvzqjujs35roicovgv5xbsh5@gskuy5wefq6r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -2AKxLctkDuWph-8fqXccuZp33wxZXIe
X-Proofpoint-GUID: -2AKxLctkDuWph-8fqXccuZp33wxZXIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100102

Hi Andi, Sorry for late reply on this.

On 9/7/2024 1:26 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
> On Sat, Sep 07, 2024 at 12:44:38AM GMT, Mukesh Kumar Savaliya wrote:
>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
>> usecase requires i2c controller to be shared.
>>
>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>> GPI driver to  take lock and unlock TRE there by protecting from concurrent
>> access from other EE or Subsystem.
>>
>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>> Unlock TRE for the respective transfer operations.
>>
>> Since the GPIOs are also shared for the i2c bus between two SS, do not
>> touch GPIO configuration during runtime suspend and only turn off the
>> clocks. This will allow other SS to continue to transfer the data
>> without any disturbance over the IO lines.
> 
> if I remember correctly, someone already commented on your
> patches to explain and expand the achronyms you are using. Please
> improve the commit log so that people who don't know this device
> can understand.
> 
Sure, Andi. Noted and addressed over comment. Will add full form for the 
acronyms.
> ...
> 
>> @@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   		dma_async_issue_pending(gi2c->tx_c);
>>   
>>   		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> -		if (!time_left)
>> +		if (!time_left) {
>> +			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
>> +						gi2c->cur->flags, gi2c->cur->addr);
> 
> Please, don't print out here. The user doesn't really need to
> know, let the upper levels decide what to do.
Sure, can remove this completely and user can handle , print it.

> 
>>   			gi2c->err = -ETIMEDOUT;
>> +		}
>>   
>>   		if (gi2c->err) {
>>   			ret = gi2c->err;
>> @@ -800,6 +808,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		gi2c->clk_freq_out = KHZ(100);
>>   	}
>>   
>> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>> +		gi2c->is_shared = true;
>> +		dev_dbg(&pdev->dev, "Shared SE Usecase\n");
> 
> Please, improve this debug message.
> 
"I2C is shared between subsystems" ?
> The rest looks good to me.
> 
> Thanks,
> Andi

