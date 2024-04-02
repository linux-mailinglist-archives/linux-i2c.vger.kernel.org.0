Return-Path: <linux-i2c+bounces-2703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC1894B47
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 08:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD801C2195C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 06:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C63219BBA;
	Tue,  2 Apr 2024 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o/HBd7/w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B9199C7;
	Tue,  2 Apr 2024 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712038894; cv=none; b=eIq+00PLVUpkLJsSFs4HUvWnQihpgyOfdEP8TvOeXMagyH2gsu0SbeRswN0AGApDyfQTUQ9tBBLFAwwwZCtzBTkF+vJQwpIp5rYGSMJG6F5v5PiztFVteGhNrs41unsB93BmSspz6X5Ozmjs7AqtZgqbt7gTR1QqoYPunrV4ZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712038894; c=relaxed/simple;
	bh=OrDoztM7yEZtjITIAKOCffNv7t1yLBKOBPe9gbgqTDk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=h1VQgT1++KmIHnVD3XWWR86NFoHmWaMSqY7VP5qL5GdelWp7w+fde6xC2X9EVhPp13UqHYzvxMPlKoeeTRroGfKDaik2pA5krKwKLvOaWbFSn/s00+qAfg9OJvEbaYQ4g/tdzPWFy1SpbLhgLj27dZ1D8H6uSaCaSrLNFgV9A5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o/HBd7/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4323JMv9005349;
	Tue, 2 Apr 2024 06:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:from:subject:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=t9DB4vdm5CnLWowjemfG6EcfbafvgD8qo7f81Vc+6t4=; b=o/
	HBd7/wVmIEOD+uVPYHCljaNqf4AKaLtvtblOoEzuIh9eNMYhd8PJTrtp90Ct5m6H
	DHTpqbAQnhk86ss+oT3RowYhw8cnMEqeRdQKHqZCJ57UPgsQmn3PAoqxCqc31r+/
	yg4425UYtCgWlhE0bgW41K4mQyrWVlVKUYOj3f/tIOmtTvzaFUlS0TvzbQemLk36
	7mG5wKB+rO13FPx7X08RGtW5Dc0VnHZG4ELM+XF+zhFVbwJ5VQsJbRUk9JnbHIWJ
	geh4vIzZFkZTqhLALutRjizc1XlD/GdfMf5MAcQ29Te7I6fpnqdh9gJ2aVuoyYB+
	xGOFNFQ3tQFbCNMhXxIA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x80w5hawc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:21:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4326LPa6022845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 06:21:26 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Apr 2024
 23:21:22 -0700
Message-ID: <b7125064-4b20-438e-ac1d-7107d28b1bf9@quicinc.com>
Date: Tue, 2 Apr 2024 11:51:18 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <vkoul@kernel.org>, <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
 <ccb312aa-3c4c-41bb-a3f4-b94971edb346@linaro.org>
Content-Language: en-US
In-Reply-To: <ccb312aa-3c4c-41bb-a3f4-b94971edb346@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X72ZRfUT64us3rfWQPaEIAMmdB9B1x2o
X-Proofpoint-ORIG-GUID: X72ZRfUT64us3rfWQPaEIAMmdB9B1x2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=447
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020043

Thanks Konrad for detailed review. For dt-bindings sending a separate 
patch soon, rest comments tried to address and updated patch V2.

On 3/28/2024 2:35 AM, Konrad Dybcio wrote:
> On 27.03.2024 11:18 AM, Mukesh Kumar Savaliya wrote:
>> Add feature to share an I2C serial engine from two subsystem(SS) so that
> 
> from -> between
> subystem -> subsystems
> 
Done
>> individual client from different subsystem can work on the same bus.
> 
> client -> clients
> subystem -> subsystems
> 
Done
> "work on the same bus" - access the same bus? Does that concern both
> read and write to the same slave device?
> 
yes, access the same bus suits better.
Yes, they can read/write from/to same slave device.
> 
> Please give a more specific example. Could that be for example APSS and
> TZ?
> 
sure. Example: APSS and TZ, APPS and Modem, Modem and DSP etc.
Changed Enhanced commit log accordingly.
>>
>> This is possible in GSI mode where driver queues the TRE with required
>> descriptors and ensures it executes them in a mutual exclusive way.
> 
> mutually
> 
Done

> the "it" and "them" are confusing, could you reword this?
> 
Sure, i have modified.

>> Add Lock TRE at the start of the transfer and Unlock TRE at the end of
>> the transfer protecting the DMA channel. This way not allowing other SS
>> to queue anything in between and disturb the data path.
> 
> 'Issue a "Lock TRE" command at the start of the transfer and an "Unlock TRE"
> at the end of it. This prevents other subsystems from concurrently
> performing DMA transfers through the same GPI channel, so as to avoid
> disturbing the data path.'
> 
> Would that be a fair representation of what this is trying to achieve?
> 
Yes, that's what i meant to say. I have changed into similar way.
>>
>> Since the GPIOs are also shared for the i2c bus, do not touch GPIO
>> configuration while going to runtime suspend and only turn off the
>> clocks. This will allow other SS to continue to transfer the data.
>>
>> To realize this, add below change:
>> 1) Check if the Particular I2C requires to be shared during probe() time.
> 
> This requires a dt-bindings change. Had you run something like:
> 
> ./scripts/checkpatch.pl -g $(git describe --abbrev=0)..HEAD
> 
> you'dve noticed there's new warnings.
> 
yes, I understand this needs dt-bindings update for new flag.
Though Ran this script now but could not find any warning, i shall 
update dt-bindings.

>> 2) If shared SE add LOCK TRE inside gpi_create_i2c_tre() before first
>>     message.
>> 3) If shared SE add UNLOCK TRE inside gpi_create_i2c_tre() before
>>     last transfer message.
> 
> You already described this above.
> 
sure, i can remove it.
>> 4) Export function geni_se_clks_off() to call explicitly instead of
>>     geni_se_resources_off().
> 
> Do we expect other SEs (UART, I3C, SPI) to also support this "shared"
> configuration? Would it be beneficial to make the "shared" cases common
> and bail out of geni_se_resources_off() early if a SE is marked as such?
> 
As such this is generic GSI based supported feature, But I3C and UART 
doesn't have GSI mode support Added. Right now, we are enabling this 
feature for i2 only, in future we may enable for SPI, I3C as and when 
required. Even Considering commonality in future, shared feature is 
known to individual SE protocol driver and would be little complex to 
add into common driver.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/dma/qcom/gpi.c             | 33 +++++++++++++++++++++++++++++-
>>   drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++++------
>>   drivers/soc/qcom/qcom-geni-se.c    |  4 +++-
>>   include/linux/dma/qcom-gpi-dma.h   |  6 ++++++
>>   include/linux/soc/qcom/geni-se.h   |  3 +++
> 
> This is a big no-go, you're changing files across 3 different subsystems,
> you must split this patch up. In this case, you want one for dma, one for
> soc and one for i2c. Check ./scripts/get_maintainer.pl <filename>
> 
Please correct me if this is wrong. The overall change is for i2c in GSI 
DMA mode. This also requires changes in resource control like TLMM 
changes. But it's more like integrated feature.
Are you suggesting to make 3 sub-patches under same change ?
>>   5 files changed, 62 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index 1c93864e0e4d..df276ccf9cbb 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2020, Linaro Limited
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -65,6 +66,12 @@
>>   /* DMA TRE */
>>   #define TRE_DMA_LEN		GENMASK(23, 0)
>>   
>> +/* Lock TRE */
>> +#define TRE_I2C_LOCK_WORD_3	(3 << 20 | 0 << 16 | BIT(0))
>> +
>> +/* Unlock TRE */
>> +#define TRE_I2C_UNLOCK_WORD_3	(3 << 20 | 1 << 16 | BIT(8))
> 
> The comments you're introducing don't seem particularly helpful, looking
> at the define names. You should also avoid adding random shifted values
> and #define the bitfields used in your messages with BIT() and GENMASK()
> 
Sure, Can remove the comment as macro name explains it.
Will define macros with BIT() and GENMASK(). Made changes similar to the 
existing macros.
>> +
>>   /* Register offsets from gpi-top */
>>   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>>   #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
>> @@ -522,7 +529,7 @@ struct gpii {
>>   	bool ieob_set;
>>   };
>>   
>> -#define MAX_TRE 3
>> +#define MAX_TRE 5
> 
> This almost looks like a separate commit itself? Definitely needs
> an explanation.
> 
Agree, Added into commit log explanation.
This is changed because we have added LOCK_TRE and UNLOCK_TRE, hence 3 
became 5.
>>   
>>   struct gpi_desc {
>>   	struct virt_dma_desc vd;
>> @@ -1644,6 +1651,18 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   	struct gpi_tre *tre;
>>   	unsigned int i;
>>   
>> +	/* create lock tre for first tranfser */
>> +	if (i2c->shared_se && i2c->first_msg) {
>> +		tre = &desc->tre[tre_idx];
>> +		tre_idx++;
>> +
>> +		/* lock: chain bit set */
> 
> What does this mean?
It guides GSI engine saying there is next TRE queued, Basically not the 
last TRE. I am removing this comment, as it's code specific.
> 
>> +		tre->dword[0] = 0;
>> +		tre->dword[1] = 0;
>> +		tre->dword[2] = 0;
>> +		tre->dword[3] = TRE_I2C_LOCK_WORD_3;
>> +	}
>> +
>>   	/* first create config tre if applicable */
>>   	if (i2c->set_config) {
>>   		tre = &desc->tre[tre_idx];
>> @@ -1702,6 +1721,18 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>>   	}
>>   
>> +	/* Unlock tre for last transfer */
>> +	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
>> +		tre = &desc->tre[tre_idx];
>> +		tre_idx++;
>> +
>> +		/* unlock tre: ieob set */
> 
> What does this mean?
> 
It says, end of block interrupt. Engine will generate an interrupt.
But comment is not required as it's code specific.
>> +		tre->dword[0] = 0;
>> +		tre->dword[1] = 0;
>> +		tre->dword[2] = 0;
>> +		tre->dword[3] = TRE_I2C_UNLOCK_WORD_3;
>> +	}
>> +
>>   	for (i = 0; i < tre_idx; i++)
>>   		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>>   			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index da94df466e83..c5935c5f46e8 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   
>>   #include <linux/acpi.h>
>>   #include <linux/clk.h>
>> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>>   	struct dma_chan *rx_c;
>>   	bool gpi_mode;
>>   	bool abort_done;
>> +	bool is_shared;
>>   };
>>   
>>   struct geni_i2c_desc {
>> @@ -601,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	peripheral.clk_div = itr->clk_div;
>>   	peripheral.set_config = 1;
>>   	peripheral.multi_msg = false;
>> +	peripheral.shared_se = gi2c->is_shared;
>>   
>>   	for (i = 0; i < num; i++) {
>>   		gi2c->cur = &msgs[i];
>> @@ -611,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   		if (i < num - 1)
>>   			peripheral.stretch = 1;
>>   
>> +		peripheral.first_msg = (i == 0) ? true : false;
>> +		peripheral.last_msg = (i == num - 1) ? true : false;
> 
> Why the ternary operator? == already returns a boolean value
> 
Sure, this was more easier to understand. I have removed ternary logic.

>>   		peripheral.addr = msgs[i].addr;
>>   
>>   		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> @@ -802,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		gi2c->clk_freq_out = KHZ(100);
>>   	}
>>   
>> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>> +		gi2c->is_shared = true;
>> +		dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");
> 
> How would this line be useful in my kernel log?
> 
It informs that particular SE is shared between SEs from two subsystems, 
hence respective debug can happen accordingly in case of the issue.
> Konrad

