Return-Path: <linux-i2c+bounces-6967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DDA9852AA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 07:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE972829FC
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 05:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587481547FF;
	Wed, 25 Sep 2024 05:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ohmrFixT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F011647;
	Wed, 25 Sep 2024 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727243677; cv=none; b=rzEIwrdoBaJXjt7BpAi6zOi0qtNeVAWoKTr7HK1EzJoP49E9clLoiVOPLfkUSYR7BbVtWUB2ch5Pz73B+56X+oY/LI32RTOYMTJiXw/OhevUPWoqL7oQHkodBAJbgIKI7iZo0Thx0/mjznK05dxbNtML4svsFbMoIUO7jnrZjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727243677; c=relaxed/simple;
	bh=oVswNYLnEoD5zEA0wrmCASqrkEP51wpblqiA7ANqzvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OvW5RRA447lJjk+i4i4lproisMgtj7dRkbHgyZHmIP7wyT0s2rC00LuCz8zDxdyeqPRPeljcBUQA8YRKKNdzzfsyeEJj2D7vCS4hPwubG9SsEj1LLDFnA5i2X8leOnKpAGvEyBsUVZkA+8z5Fl7tOsS7FD/tS3KRkqas1AE5HAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ohmrFixT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHRw6M029701;
	Wed, 25 Sep 2024 05:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Kf9+5slkHdtEckGaucAo+JggGPof+cfq0j8LP9ln/s=; b=ohmrFixTvDO7GNWl
	Nl48PXcOHx3sSnln3hLJiIX7qBIBxcBxX5vRVYwf0kCae6yPOu07Jwh11yDBycVs
	c41cN4yWuthOYgh0TONvQ+LJ7avlt1BeCZbaE7HXMWpYZYKBNvyi4J8eW2+fkztQ
	CU4fDV6XGwc5zvdDU3BKdgIuBtf2d/1yrY+ElI6iX5ieB5MYcEu17yNh6wrIy5mV
	r6MUNB5hdWxk747GHKrokGHD+k71MVuMokAG0K/syi7LOvmN8acfSfQyc6pSvT0y
	hMUK9Zbrtie4iF8kqPmlBui2J9WhRYQCfon5cX//3Y+u0JDfX0EUhNwIqN0TVtiq
	e8UdJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnbefx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 05:54:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P5sTLl001364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 05:54:29 GMT
Received: from [10.151.37.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 22:54:27 -0700
Message-ID: <e2b26bf4-d5ea-4fd8-bcb7-2200aa1bdabc@quicinc.com>
Date: Wed, 25 Sep 2024 11:24:02 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: qcom-geni: add 32MHz I2C SE clock support for
 IPQ5424
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240924065020.2009975-1-quic_mmanikan@quicinc.com>
 <ZvMk8T0dK+heMLer@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ZvMk8T0dK+heMLer@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BbxOtHXvvnEy-fNQzqRmLTmbfCP78NiR
X-Proofpoint-GUID: BbxOtHXvvnEy-fNQzqRmLTmbfCP78NiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250040



On 9/25/2024 2:15 AM, Bjorn Andersson wrote:
> On Tue, Sep 24, 2024 at 12:20:20PM +0530, Manikanta Mylavarapu wrote:
> 
> Subject gives a clear indication that this is specific to IPQ5424, which
> it isn't. So, please drop that wording from the subject.
> 

Okay, sure.

> Perhaps:
> "i2c: qcom-geni: Support systems with 32MHz SE clock"
> 

Okay, sure.

>> The IPQ5424 I2C SE clock operates at a frequency of 32MHz. Since the
>> existing map table is based on 19.2MHz, this patch incorporate the
>> clock map table to derive the SCL clock from the 32MHz SE clock.
> 
> Then here you're doing the right thing of introducing the IPQ5424, so
> this looks good to me.
> 
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 212336f724a6..bbd9ecf09f4b 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -71,6 +71,7 @@ enum geni_i2c_err_code {
>>  
>>  #define I2C_AUTO_SUSPEND_DELAY	250
>>  #define KHZ(freq)		(1000 * freq)
>> +#define MHZ(freq)		(1000000 * freq)
>>  #define PACKING_BYTES_PW	4
>>  
>>  #define ABORT_TIMEOUT		HZ
>> @@ -152,11 +153,21 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>>  	{KHZ(1000), 1, 3,  9, 18},
>>  };
>>  
>> +/* source_clock = 32 MHz */
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32M[] = {
> 
> I'd prefer that you s/32M/32mhz/, and that you rename geni_i2c_clk_map
> to geni_i2c_clk_map_19p2mhz[].
> 

Okay, sure.

>> +	{KHZ(100), 7, 14, 18, 40},
>> +	{KHZ(400), 4,  3, 11, 20},
>> +	{KHZ(1000), 4, 3,  6, 15},
>> +};
>> +
>>  static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>  {
>>  	int i;
>>  	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>>  
>> +	if (clk_get_rate(gi2c->se.clk) == MHZ(32))
>> +		itr = geni_i2c_clk_map_32M;
> 
> Leave itr uninitialized above and add an else here with the assignment,
> to make it clearer that it's one or the other case. (Compared to "It's
> always 19.2MHz and then in some cases we override that with 32MHz")
> 
> 

Okay, sure.

> PS. I wouldn't mind you dropping the addition of the MHZ macro and just
> compare clk_get_rate() with 32000000 and 19200000. But that's a matter
> of taste.
> 

Okay, sure. I will drop MHZ macro.

Thanks & Regards,
Manikanta.

> Regards,
> Bjorn
> 
>> +
>>  	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>>  		if (itr->clk_freq_out == gi2c->clk_freq_out) {
>>  			gi2c->clk_fld = itr;
>> -- 
>> 2.34.1
>>


