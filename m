Return-Path: <linux-i2c+bounces-10029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA8A70FFA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 05:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A2263B8BD6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 04:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D5317A2F1;
	Wed, 26 Mar 2025 04:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ECsaqbgT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912294A29;
	Wed, 26 Mar 2025 04:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742964972; cv=none; b=eGmPx5b/B8ENf5S6MbZLUCEWZaL5WZXxIqX+kVXjCjKbgjLKByu73UAN4cFy4SbhK5ZD1f+Rs6eHYBSc3hdNH6xROq6FFvZUjjgtoAyQRw6LmaMdt6WOabs1rd9k8cEPNDt1KcCQyT81sdLkeTMKUv2GfiUaQdDFgCM8ujbCGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742964972; c=relaxed/simple;
	bh=yTKIOfryki/fGti6w2Shb9aoBfWhc04+/l+3kndOBtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G6p5Tk4jZRAQI5aEkJZQ0BH0P+hy4sPKd7PQUtP7A7m62KG8PNutk98z1TE/vSkBC4XA/Hh4jXo82V5LjT1ocnb+N1kVs7tf5QCFyvy8klB46ZPL30iXWRW6b1pkTe0SocqrJEsUBhxOEdmVaAw5mqOjjDca5QZ8ugLxDqbd9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ECsaqbgT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q18dJA008529;
	Wed, 26 Mar 2025 04:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipBLkZWSXOLbfQtNCwRbaZjtD4DLXDasHWxjzOeqQQw=; b=ECsaqbgTUeNPSrd9
	2MVNS5zS/viZVefHOtZl8IpmL8yYFCCnuy4sBewzrg6q0gQJMXZfPTlgf0944IWO
	h5rdIykDegVoHoW7sA/Sgak0E2xLe5uFsPQB/IjS0tX/C+vIkH4jNqW2MBbaK7dy
	iu8hxrHIqCxoUBrC74ZyUdFylSjqmckfb8CpjTuCoutB+zitoY6frmIOeus9pXXR
	LR8LH9+B+ardMv7i5tC19o+kyvbBLlkoKVbrePIXLQkKVmZJfM9kdVR8RcfoIkBn
	6EeXwJLcqN8drSeUIApvXpFywH9L7kCKgXZTwtJB0cCHj/iJkoZfPretLeuPd3Q/
	6P5XmQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf0e2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:56:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q4u5m5019647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:56:05 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 21:56:02 -0700
Message-ID: <dc7ae8d3-f5c0-4d5b-8a21-1439f518fe4a@quicinc.com>
Date: Wed, 26 Mar 2025 10:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] i2c: qcom-geni: Use generic definitions for bus
 frequencies
To: Christopher Obbard <christopher.obbard@linaro.org>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Viken
 Dadhaniya" <quic_vdadhani@quicinc.com>
References: <20250322144736.472777-1-andriy.shevchenko@linux.intel.com>
 <CACr-zFCF_b0_3NSLFvtgfpAbsSwUOYv5fS==PPbn9zXPBS0NHw@mail.gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <CACr-zFCF_b0_3NSLFvtgfpAbsSwUOYv5fS==PPbn9zXPBS0NHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1HdTFIfhCuIvupX-dt2yeFJm908t3X7f
X-Proofpoint-GUID: 1HdTFIfhCuIvupX-dt2yeFJm908t3X7f
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e388e5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=umFOggLF3V42L3TlGzYA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260027

Thanks Andy for the change !

On 3/22/2025 9:48 PM, Christopher Obbard wrote:
> Hi Andy,
> 
> On Sat, 22 Mar 2025 at 14:59, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> Since we have generic definitions for bus frequencies, let's use them.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Looks good to me.
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> 
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 515a784c951c..ccea575fb783 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -71,7 +71,6 @@ enum geni_i2c_err_code {
>>                                                                          << 5)
>>
>>   #define I2C_AUTO_SUSPEND_DELAY 250
>> -#define KHZ(freq)              (1000 * freq)
>>   #define PACKING_BYTES_PW       4
>>
>>   #define ABORT_TIMEOUT          HZ
>> @@ -148,18 +147,18 @@ struct geni_i2c_clk_fld {
>>    * source_clock = 19.2 MHz
>>    */
>>   static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>> -       {KHZ(100), 7, 10, 12, 26},
>> -       {KHZ(400), 2,  5, 11, 22},
>> -       {KHZ(1000), 1, 2,  8, 18},
>> -       {},
>> +       { I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26 },
>> +       { I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22 },
>> +       { I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18 },
>> +       {}
>>   };
>>
>>   /* source_clock = 32 MHz */
>>   static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>> -       {KHZ(100), 8, 14, 18, 40},
>> -       {KHZ(400), 4,  3, 11, 20},
>> -       {KHZ(1000), 2, 3,  6, 15},
>> -       {},
>> +       { I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
>> +       { I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
>> +       { I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
>> +       {}
>>   };
>>
>>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>> @@ -812,7 +811,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>                                         &gi2c->clk_freq_out);
>>          if (ret) {
>>                  dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
>> -               gi2c->clk_freq_out = KHZ(100);
>> +               gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
>>          }
>>
>>          if (has_acpi_companion(dev))
>> --
>> 2.47.2
>>
>>


