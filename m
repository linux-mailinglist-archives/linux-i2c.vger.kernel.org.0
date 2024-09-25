Return-Path: <linux-i2c+bounces-6980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5589856B6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 11:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63316B22EA4
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DA3156230;
	Wed, 25 Sep 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RSY+RqN7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411A13B284;
	Wed, 25 Sep 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258124; cv=none; b=bMoP3FILJJ4TrP1/lgzCXSr2ydbcJEVuJ0Oz4yqyDB/BzisXMK0gk9UnFqH2xjFKBCnB9TcizL/F8BAdPZdTykAWi+DUBQhdKr/+pTP3ohpldBuMKXpu8PsYZcIrXlsfZZ2q2sE0SXH7Opk0ORZO3DCh+SP/BnrY1W+qE/34LTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258124; c=relaxed/simple;
	bh=lnq6ZO3x7xysWD7okx3yWWPn1VbGS7K24zu5ipQhMTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XBl6/+W/D01/z4+dq+jsJeGWte2lwbYryn04COCT0wUhtfbSDyatWBfVvgbo2eyCrUYYH7RxTxQ334Pdb5R6qwKws6v02+RqdoPUtS9Q1qc2rqSehUehqjOdzpaMAWVnYa1PeKKlCqOqbEZXs10+VwP3NFakxgs4YjbhiRld/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RSY+RqN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P7LBuH006979;
	Wed, 25 Sep 2024 09:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYHA75fE9IatDsWvPNyuWaPSE/JwKHRGcBQvG0HJumc=; b=RSY+RqN73zkyfqUQ
	qNUEt5aD1Mef47PflnJISOPuM4abuPNKONQ904/rDpOCbRapurDchR4Qs7I2+pKp
	vjYQoYvKqYHJZc3RnpzvszMOQ3K6GvNEtMMvjzqBdz+pc5BkZm0kp4YeVOzJvDSY
	UNAGcufzaM0ezjHunxeqD+omtH3kugtXRs0pRM68CJdIGjuIOCVy7zYzWF87oLl1
	JzGC6uBmPz63ZXpTX9pASVA6hOxntmsjZgHhh2O+l9kUGkbyLTblRUvHMm1NaIQu
	R+VAmL+oBkSVBKCfrRzB3YL8CynBdeWUyaZiqJdPDcgT26oXfgqQJviGPv1WsCFZ
	yrYO7w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnc30w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 09:55:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P9tHCB001378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 09:55:17 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 02:55:15 -0700
Message-ID: <ad86f820-1e9f-4e15-b106-3e2136dbf438@quicinc.com>
Date: Wed, 25 Sep 2024 15:25:12 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
 <e14e2136-54eb-411d-afff-f6803a23ad6a@quicinc.com>
 <3c3647c1-8d6d-4038-8815-30c1570d856c@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <3c3647c1-8d6d-4038-8815-30c1570d856c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z1HJJ-LSDMZapJc6Q-gLp44OXnlkQKJW
X-Proofpoint-GUID: Z1HJJ-LSDMZapJc6Q-gLp44OXnlkQKJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250067

Thanks manikanta !

On 9/25/2024 2:14 PM, Manikanta Mylavarapu wrote:
> 
> 
> On 9/25/2024 1:06 PM, Mukesh Kumar Savaliya wrote:
>> Hi Manikanta,
>>
>> On 9/24/2024 12:20 PM, Manikanta Mylavarapu wrote:
>>> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
>> would it be better to say , I2C SE is sourced from 32MHZ ?
> 
> Okay, sure.
> 
>>> existing map table is based on 19.2MHz, this patch incorporate the
>> based on 19.2MHz. this patch /,/.
> 
> Okay, sure.
> 
>>> clock map table to derive the SCL clock from the 32MHz SE clock.
>> from the 32MHz Source Clock frequency.
>> SE = Expand OR  (I2C Serial Engine Controller)
> 
> Okay, sure.
> 
Please also mention the reason why 32MHz got added ? Need to describe 
evolution to understand the purpose behind this change.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> ---
>>>    drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 212336f724a6..bbd9ecf09f4b 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>>>      #define I2C_AUTO_SUSPEND_DELAY    250
>>>    #define KHZ(freq)        (1000 * freq)
>>> +#define MHZ(freq)        (1000000 * freq)
>>>    #define PACKING_BYTES_PW    4
>>>      #define ABORT_TIMEOUT        HZ
>>> @@ -152,11 +153,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>> A thought - Should we rename this appending _19.2M ? In future one or more may come as it evolves speed.
> 
> Okay, sure.
> 
> Thanks & Regards,
> Manikanta.
> 
>>>        {KHZ(1000), 1, 3,  9, 18},
>>>    };
>>>    +/* source_clock = 32 MHz */
>>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32M[] = {
>>> +    {KHZ(100), 7, 14, 18, 40},
>>> +    {KHZ(400), 4,  3, 11, 20},
>>> +    {KHZ(1000), 4, 3,  6, 15},
>>> +};
>>> +
>>>    static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>>    {
>>>        int i;
>>>        const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>>>    +    if (clk_get_rate(gi2c->se.clk) == MHZ(32))
>>> +        itr = geni_i2c_clk_map_32M;
>>> +
>>>        for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>>>            if (itr->clk_freq_out == gi2c->clk_freq_out) {
>>>                gi2c->clk_fld = itr;
> 

