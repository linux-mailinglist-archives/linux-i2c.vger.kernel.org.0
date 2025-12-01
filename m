Return-Path: <linux-i2c+bounces-14351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F15C9881D
	for <lists+linux-i2c@lfdr.de>; Mon, 01 Dec 2025 18:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBFF3A2B59
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Dec 2025 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA33337B9B;
	Mon,  1 Dec 2025 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjKU1XXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th1ViOFr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B0F30F80A
	for <linux-i2c@vger.kernel.org>; Mon,  1 Dec 2025 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609884; cv=none; b=fFZiZcc3oI8n2V8zBOzdT/xs4uKZywC8PLo9JroW11EK4nZyHK66n54pdA2mXdHjpOEV8eapxwl5NdlbF2jScj1ofcSKOf4q7xPRIlKIj6XYc/1LU2KV81RXYjpDQJT/71JaW8NgbaHJbujb3xKSoBv05KiFBb64pgTtXHFcBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609884; c=relaxed/simple;
	bh=cYl3jbH+LXHwA6WLbwvDQD1O6MZOzA4LWIXkjBLsAMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJa0lrfdW5Twx4FKxOrD7wGVERajDqfKtZOO6Yhtlg6uCa+bkVQYmC09ATcfvM+PnOay8btL/mPyZlxpcTiOETiHmA1YId3dvNZq8tA+1IfLUr3ZTvF7ktqWWoTLruI9npzgnP9hoENtHfzGYzsHU6fKLsYChddk7IzVK3qARrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjKU1XXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th1ViOFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19rKb8212156
	for <linux-i2c@vger.kernel.org>; Mon, 1 Dec 2025 17:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	423zZjtovCHUfGHqY+UH0Oj2EJZxDhKB0fpSdQzZuY0=; b=FjKU1XXslG87+n0N
	T0DQfK+SlyaqG0aNpCb9+sYos2RXVeyU5Dc/ITtv0koq4uAjicgn/ToEOuNGK950
	oOz8R4YV6US2wjW3pljJUS4LtMeS8s/aCly+1FFYNF32WuBS6qVKIMch9mWvoini
	WI1gqidia6c6NTm8ibG6GRkjgErkcxmkTObm393XZBCYJIglQow22JPYmmCyO0ex
	FNffPRMKYeVirAckrp0RsPQBnEchffF+8VvAgtJs3kws4FB/CvHXpDbSrtLK47XS
	990nev93z0ze7Iwb+JLlAIf8rQECtCmwabUtW5PQrWmQ0dUehiMAcQSfi/ouZhNH
	1CrFmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8sj18wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 17:24:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3438744f12fso10989906a91.2
        for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 09:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764609880; x=1765214680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=423zZjtovCHUfGHqY+UH0Oj2EJZxDhKB0fpSdQzZuY0=;
        b=Th1ViOFrVGUqiTw3v/+BhDjRTAH8O+8/l1KfJIP+NLx8rAxqD8vU1ecFmv3CYll9b4
         P0drRGbACuToR72kT0mTRW3GVmG0FIIDYZJGSnWm4rTxFt6ASoFTrS+G3gGHnPTHFmnr
         3RSBBs1ya7GIZz/cnK3z8PNl2eTsTxblRde4j5pt8vDLyjPhUjCZQa1PI1GliV4GuBQ8
         200BEjfXOpeOystTSsOuBTQGivJlZdTxgG0SQk8KgmC3m/AjA/gZjB3M1dd3Le/i7OcY
         PQW6uAQtyw56bejT/Ui+X/HopnzU0/SaWri4MQxPGkGVWMGZCczivpdKRYqxUD+VnXqc
         +yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609880; x=1765214680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=423zZjtovCHUfGHqY+UH0Oj2EJZxDhKB0fpSdQzZuY0=;
        b=cfydPMiRdFX+oMtbaeNHX2TXOSfCFS8fjarh8tzP4/gmHBs8cxCgXzGkSN8FqhwhZI
         BE1VRUw9zEQvVLCUyvWH1szUXVrpfpijwUw27mDJB2eDH2ozaJb1MVYsY8hPWIi5iptS
         wMvHzzg1IyZtMATPKMagWxgQnAV6pF5DyfkTwxyAwdGscp7r5/bFlr5t+9GUIg6E7EUs
         w07zFJA0VY0wCLBiys/igHt23eaOZ+65RJU+FStvLkSLzyARB7nOxprGyHGCZajuizk4
         jKtmq1pNrufrfs6RsUeZxzdjTS+xRWWFCVg/CjhnZo9CS09yEGaSZqq/c8c9DUbxN30O
         KVJA==
X-Forwarded-Encrypted: i=1; AJvYcCUDiVYWMxpFdmbg0KCCWxq5VJZF8cjyd3uy2sjbAJz2lNZadpwQp8g//blBOpQgDpKcW+u3LCQtoHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRaFAdtTSocOaqyYJgjqT08eRfrCg8PedW5tChgvIMQMur4UZ
	MtabixAYaCc0jGp2uzKnwO0lOXs/9HtUwyaH28wM+qtocq5b7xF35pOzWVBHoCga7LfQcY6igRM
	CN15VdY3JGyu3qpZjMbXLlIEN9IX1ep4MhmXe/StJDTL6Aa8WcXdz60fyjVVLRco=
X-Gm-Gg: ASbGncv1yJK+pNHj2/gPrAi/Uj4KNUD3LmqdUFBJmKG9w4HSUwylIABARWRTzuUUDBW
	8Tv930bwPRTYS5cMUHMKkZatZD6J2ohKyIKuFuY6U9XdsAiZlBFCBMFLC+lhhEXI7B35f3R1FS9
	HGTWU/kCN0JQKUVeIttP464RHceLLEK5MSh9k/daP9LokOmqLYa6Yme5gEZpDmtkAdwqB4C6FCm
	VN6w0b1i4LTFx7W8KKqwZJdWF1t2GKhgcBGhvPDATM1+oex6HC860V0anFaDMDBZbR/raYmrzIh
	2/XKMvWpg4hqOrFuPbL2J3+EP/YMV1fpVggdpMREue5smyHhJA/wkhm0b+SQ8cWEx58oDuIzdAy
	2FyMvTOOe1Fxu3zp2heGe3vxIY0mJjYsXrl7IuXS7Aw==
X-Received: by 2002:a17:90b:2d8e:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-3475ed46424mr30211053a91.24.1764609880204;
        Mon, 01 Dec 2025 09:24:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrQDzSIU3NGEb2rwQjUqFB6Q6luZ1vcrX4kBDqC84CAhhyoKXxzjEkXBsgdHCbXUYcc4NAAw==
X-Received: by 2002:a17:90b:2d8e:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-3475ed46424mr30211005a91.24.1764609879480;
        Mon, 01 Dec 2025 09:24:39 -0800 (PST)
Received: from [192.168.1.5] ([49.204.108.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a547483sm17716893a91.4.2025.12.01.09.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:24:38 -0800 (PST)
Message-ID: <473d842f-5d70-4bd9-8cb0-a4c28acd5fe4@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 22:54:32 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-13-praveen.talari@oss.qualcomm.com>
 <4kjkadmhf67ts4pryhvqdk57b2k27ggwkt2vqdijvhmwygpspb@rpdwcpxpq2up>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <4kjkadmhf67ts4pryhvqdk57b2k27ggwkt2vqdijvhmwygpspb@rpdwcpxpq2up>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k-8HPfHfT3rRsLlZ0WMMyqSmen09dxXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0MSBTYWx0ZWRfX0HhnnbfGgege
 GvinJMjUjCeE0VJev2uAJmkyJIwzY34JoypoyyzJn8u2qnfa/H4TZUoAGsubkHpejQxyTYaa5t1
 BtaC8uIimWMSS1iFXSCVA6zf/cjrqkC7LMJYtV2WFqZ+Nhvw1jBdNbxkmPGtv+PUmjBUkxMkbc3
 x+zjr7pJ+XZMhKdYJ4VD1QCUB/z4vZIYgvWPNucHpgRcmVRTtWtKBbXyFm5cwy/+1noPMJYe0lx
 6Qao7xf89qjO6KQqV3YdU9+OdgaFQyT53TToFPnsdNmBgFETZ46JrUn/5m7i1kHuaTCUO5qNe4P
 Py9LQRwT0CEsCUQOHHrITxEaOS15TCsSfZaSaenxCiEjqFvQo+KgUN3ABJ9innS5nyAvfyD/JPZ
 YfFYpzwv+iNkXHlFDDG5LdPDTh2imQ==
X-Authority-Analysis: v=2.4 cv=Lr+fC3dc c=1 sm=1 tr=0 ts=692dcf59 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PVN08cSn8zglVHm8Z6xkeQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=caMqFigBIdtHwiK--ggA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: k-8HPfHfT3rRsLlZ0WMMyqSmen09dxXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010141

Hi Bjorn,

On 11/26/2025 9:22 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:18AM +0530, Praveen Talari wrote:
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power
>> and performance protocols.
>>
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power states(on/off).
>>
>> The SCMI performance protocol manages I2C frequency, with each
>> frequency rate represented by a performance level. The driver uses
>> geni_se_set_perf_opp() API to request the desired frequency rate..
>>
>> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
>> is obtained using dev_pm_opp_find_freq_floor() and the performance
>> level is set using dev_pm_opp_set_opp().
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
>>   1 file changed, 35 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index a0f68fdd4078..78154879f02d 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -82,6 +82,9 @@ struct geni_i2c_desc {
>>   	char *icc_ddr;
>>   	bool no_dma_support;
>>   	unsigned int tx_fifo_depth;
>> +	int (*resources_init)(struct geni_se *se);
>> +	int (*set_rate)(struct geni_se *se, unsigned long freq);
>> +	int (*power_state)(struct geni_se *se, bool state);
> 
> You have isolated this quite nicely now, so I'd prefer 3 (four to keep
> power on/off separate) if statements, over these function pointers, at
> this point.

Thank you for the feedback. I understand the preference for if 
statements, but function pointers offer better scalability here:

- Qualcomm has various power management schemes (Linux-driven vs 
firmware-assisted) across SoCs with more variants coming.
- If statements would require modifying the core driver logic for each 
new SoC variant, while function pointers isolate hardware-specific 
behavior to dedicated implementations.
- New SoC enablement becomes a matter of adding new function 
implementations rather than touching core logic.

Thanks,
Praveen
> 
> This saves the future reader from having to remember the combination of
> function pointer targets in the various cases - and allow things like
> "jump to definition" in your editor to still work.
> 
>>   };
>>   
>>   #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
>> @@ -203,8 +206,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>   	return -EINVAL;
>>   }
>>   
>> -static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>> +static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
> 
> This sounds like a qcom_geni_i2c_set_rate() now that it takes a
> frequency argument.
Yes because of function pointer compatible

int (*set_rate)(struct geni_se *se, unsigned long freq);

Thanks,
Praveen
> 
> Regards,
> Bjorn
> 
>>   {
>> +	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>   	u32 val;
>>   
>> @@ -217,6 +221,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>>   	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>>   	val |= itr->t_cycle_cnt;
>>   	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
>> +	return 0;
>>   }
>>   
>>   static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
>> @@ -908,7 +913,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   		return ret;
>>   	}
>>   
>> -	qcom_geni_i2c_conf(gi2c);
>> +	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
>> +	if (ret)
>> +		return ret;
>>   
>>   	if (gi2c->gpi_mode)
>>   		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
>> @@ -1041,8 +1048,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>>   	return ret;
>>   }
>>   
>> -static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
>> +static int geni_i2c_resources_init(struct geni_se *se)
>>   {
>> +	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>>   	int ret;
>>   
>>   	ret = geni_se_resources_init(&gi2c->se);
>> @@ -1095,7 +1103,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	spin_lock_init(&gi2c->lock);
>>   	platform_set_drvdata(pdev, gi2c);
>>   
>> -	ret = geni_i2c_resources_init(gi2c);
>> +	ret = gi2c->dev_data->resources_init(&gi2c->se);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1165,10 +1173,12 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>>   
>>   	disable_irq(gi2c->irq);
>>   
>> -	ret = geni_se_resources_state(&gi2c->se, false);
>> -	if (ret) {
>> -		enable_irq(gi2c->irq);
>> -		return ret;
>> +	if (gi2c->dev_data->power_state) {
>> +		ret = gi2c->dev_data->power_state(&gi2c->se, false);
>> +		if (ret) {
>> +			enable_irq(gi2c->irq);
>> +			return ret;
>> +		}
>>   	}
>>   
>>   	gi2c->suspended = 1;
>> @@ -1180,9 +1190,11 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>>   	int ret;
>>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>   
>> -	ret = geni_se_resources_state(&gi2c->se, true);
>> -	if (ret)
>> -		return ret;
>> +	if (gi2c->dev_data->power_state) {
>> +		ret = gi2c->dev_data->power_state(&gi2c->se, true);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	enable_irq(gi2c->irq);
>>   	gi2c->suspended = 0;
>> @@ -1221,6 +1233,9 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>>   
>>   static const struct geni_i2c_desc geni_i2c = {
>>   	.icc_ddr = "qup-memory",
>> +	.resources_init = geni_i2c_resources_init,
>> +	.set_rate = qcom_geni_i2c_conf,
>> +	.power_state = geni_se_resources_state,
>>   };
>>   
>>   static const struct geni_i2c_desc i2c_master_hub = {
>> @@ -1228,11 +1243,20 @@ static const struct geni_i2c_desc i2c_master_hub = {
>>   	.icc_ddr = NULL,
>>   	.no_dma_support = true,
>>   	.tx_fifo_depth = 16,
>> +	.resources_init = geni_i2c_resources_init,
>> +	.set_rate = qcom_geni_i2c_conf,
>> +	.power_state = geni_se_resources_state,
>> +};
>> +
>> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
>> +	.resources_init = geni_se_domain_attach,
>> +	.set_rate = geni_se_set_perf_opp,
>>   };
>>   
>>   static const struct of_device_id geni_i2c_dt_match[] = {
>>   	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
>>   	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
>> +	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
>>   	{}
>>   };
>>   MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
>> -- 
>> 2.34.1
>>

