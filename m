Return-Path: <linux-i2c+bounces-14330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F45C90D81
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 05:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1809351D13
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 04:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DCF2E370E;
	Fri, 28 Nov 2025 04:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTmlwuLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeEHoqbl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DF285C96
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 04:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764304951; cv=none; b=RaGFTOzLb6pnSn2RQoOWAedU/1o6I8LowzA4DoTUaLS+a4MDgnPdfanmBD2JLCqgLkrmWWzSOzbwqRVH3quZaPZfnzLB/o4/lPGN8HVaaGcyankDqZ2Pgu4iG06YkPkihFYy9/EXi1/oB0xQZwTChupOLYsUsrLpazxaZcPQwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764304951; c=relaxed/simple;
	bh=8rl0QrU3MlRdwHNYRZG/3TlzxVsvny1fEpzP63WAjJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uA1ykwaoti69rzCUxfjZQV/VHBpO+JLGg0iVFsgg/GHRL45Wtuo07R79Dn3DEU+VpXkaS1Xqr3ZdVsM+c06dly8LUWrNoUloPw3esNGapqkackFS7WX8ClXb2CiroIjRiTMWyEoQaqg9ZiAzb2qM1xFjEqU2wODM6Pk+YYeO1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTmlwuLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeEHoqbl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARM7XYi2411656
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 04:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB4p3JALjAdaEds41Kpv7aXiJdteIXPc5KCCtJz6euc=; b=kTmlwuLx2TObGY5n
	0ZMAKlUT2p2oyHcbJwK1dw7Q47LvSVVeHmDRls5dyvF7Tqk56hyHwSHGCLf4Vcv7
	wv7uHLpg1Z4WCkYU8IK5auaVIwfe+sJwZP2YU7E74xMKMU0RoMPppSRI4YYyZn2u
	DjZTWE9M/BtcVtDK3mBCQkKKK7Izphr2/FsgFfN0bT0xbJfenxEBVqndivZ458HA
	oebKsN/hxYGyhuW/uQk80YeSjBSmwpT7CiW+EB2VfBxzWiHWlUDyevsaIe8usYhj
	qdqTQzYcyuk0dqCm/UUNFWEDnAXSrl/HulQ4yDboNJh5CZ7ov6GUtZDwvj2RSxWU
	C+sLkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhcnbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 04:42:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982dec5ccbso25441025ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 20:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764304948; x=1764909748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XB4p3JALjAdaEds41Kpv7aXiJdteIXPc5KCCtJz6euc=;
        b=LeEHoqbl+uoM6lK2B0M50HLeqA4WzIcDIalqfKavFSbiuBu+8wOSHOiMQWzcl0UHc5
         azCfXUZHutsIPl2GQY+sKbjHS/Y+jllT4j6Y0XuIK3JECJhvZP2C8tPB0Ls/zLs4KyYp
         igfCI/7Pp6vAerYW130EGkXtI2Q85elqJLap1aDzdaArsq5Dej3MIUFlaw6NVE1EqxCm
         8kYA1xyQLMqGSttRLoNiQKhGVPRow7wPs+ado5rms+7/926LKlrq/t2JjpMLzeh8mmwF
         GKenlw2UCVU9vExhStThVUFszQbj5Nqheufzl6HzBHTKEGYA3xzWAoWxdSQAmQ2UhAXN
         xqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764304948; x=1764909748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XB4p3JALjAdaEds41Kpv7aXiJdteIXPc5KCCtJz6euc=;
        b=IMdmAYoVqEQjreaDqG4lpJVe1y12dx121LpqzpBlBfGh7tlTibnuW+PA2cwNgSsUXd
         LCekfEkw5mPj31eMnSC+re+A4ov2fmRQJxciPWf8yoDkMPc6rFug2/MVg+MJe/rtP1CY
         hqjEkARVlyNb0vbABsUgkQROKDf8tR++yU+2rx24LG4Fwxjcg1nUTUt7Dx7ooJnmJfNN
         MHkjh/fGB8ps5f66Ii2HKCsYKiDEkW9RfJg9cy8WxUOVEGT1bNlqOtOQVH58WmtPjYiu
         vAXXgYmFGk7Up6awOV2mIk2cxZYoOyxYz4R7AHXp/m3ZFdiL6Iv1rX109XBRo46jD/+Y
         BG/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5EzIAuPS9LPKM9T6c/TOvmD2DuN/2dbt73UR9AoJfhN24gEdPfwF+aAlRxKVOJN/pvgcuL1IE68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDKSidLcVNI8+S74R4LYC7m1G3MsjOeZNoKsdEHx+dm757sEx
	7xSQEqfk7/S3r20OUdGY9YnKy4FqGJCVQUR9eYD1gbZfoMoED9TGaILK2jMhDmwPbR1XPdTnoP2
	F+f/8XPVckVvBLONnnh/ulovjjZ5IVDPEgB6n5BlOBtW2O20U77U6BTzjw/ElYI0=
X-Gm-Gg: ASbGncsTtOTLZFmSvomO3jNZg8wdVEWKvSYsNCdd/GaEG3jb245KRLJXws65B3MoOil
	oeDA469F5B2z+66pTli4j8bGIy0xniwcSgUqXNA3slk3VBt66EO8zXj6Gfl4A+840DS3d78eLU5
	e435l3w9UAGZlA90tX1pQtG3/Mhsg/0800AeeGejQ0ieqMKAEyT8UIZlqDaLA11n7Y6ZaJu3vG5
	1Q/GW6WNOzUhWCdeMGQROmekoolBGF1wgS8IwPaMWilrQ7EeWPJqnV2iWPaBMo/JvuGBNK8x3vi
	d6u6SFp4aI46xycNMDL4B3c0RDX5s4149fVSomfej+UG2rJQqbCk7lY2cyjZgJsb+3cbytm9vm5
	A2FsApcv6eADnjGSHSV0puxWirvlViKeAAEb5olhyQw==
X-Received: by 2002:a17:902:d2cd:b0:298:3892:3279 with SMTP id d9443c01a7336-29b6c40542cmr296229635ad.17.1764304947720;
        Thu, 27 Nov 2025 20:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKoSQAoyWlLvG9Vcnnkn7v1pyhIqUhELgGxaiA4ZAottbIZWLZGceYNfF/YTGLtSDABNSzoQ==
X-Received: by 2002:a17:902:d2cd:b0:298:3892:3279 with SMTP id d9443c01a7336-29b6c40542cmr296229155ad.17.1764304947087;
        Thu, 27 Nov 2025 20:42:27 -0800 (PST)
Received: from [192.168.1.4] ([49.204.106.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb276a7sm31043815ad.48.2025.11.27.20.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 20:42:26 -0800 (PST)
Message-ID: <18c151c7-5c64-48ca-b6a5-3363544f292d@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 10:12:19 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] soc: qcom: geni-se: Add geni_se_resource_state()
 helper
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
 <20251122050018.283669-5-praveen.talari@oss.qualcomm.com>
 <bskhxahakxpc74rdoz54eqlplb4obaoleouh4pn6qdy6yjmggw@fojwzct2haxa>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <bskhxahakxpc74rdoz54eqlplb4obaoleouh4pn6qdy6yjmggw@fojwzct2haxa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzMSBTYWx0ZWRfX8OO8xqv2aXKU
 wTRCQ9tB6i5sT/9v5fJPnY3qewhY4319ItPuPzOzd0rMuED2Emr3f/USaATw4mIj2mFGAbBJis+
 +rZmVb1tJcfHtoRs90XZQqyWSx7LGmXho72aC+CPNIhZKM/avSLEiRfGfB+OonDkk7ohcM+GmyX
 kgNGijv/HBUNxuA3R3MsGsi3oISIGpNs0Cy4yoqbp62TZTE4T7w+pUUhn6T8Bs8mweWvMob9fTI
 o9MjYnvOzmNbgBwEIpW2/uq1QdmI9tpFMgK/UTQhx238+y/+daCVsk1svVPdXstQr2QquzS4oMm
 RGotbM1KS4WaMQaguCoLwpGRPoE1QAlVoQzPQ9HE0v7lIW1bly0l4se2ug+WsbRTVBMoYJPV5eU
 GoMt/yiA0QZ4rTkn+ln1+SArywkkxQ==
X-Proofpoint-ORIG-GUID: upN0BBDPqMIiM4sVGYfUdt8ZmaUx7-VL
X-Proofpoint-GUID: upN0BBDPqMIiM4sVGYfUdt8ZmaUx7-VL
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69292834 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=knFCEH6M0+SSkFC620ieTA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1NPS5M18cN_QFYAy7wgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280031

H Bjorn

On 11/26/2025 8:49 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:10AM +0530, Praveen Talari wrote:
>> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
>> activation/deactivation sequences independently, leading to code
>> duplication.
>>
>> Introduce geni_se_resource_state() to control power state of GENI SE
>> resources. This function provides a unified interface that calls either
>> geni_se_resources_activate() to power on resources or
>> geni_se_resources_deactivate() to power off resources based on the
>> power_on parameter.
>>
>> The activate function enables ICC, clocks, and TLMM with proper error
>> handling and cleanup paths. The deactivate function disables resources
>> in reverse order including OPP rate reset, clocks, ICC and TLMM.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 61 ++++++++++++++++++++++++++++++++
>>   include/linux/soc/qcom/geni-se.h |  2 ++
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 726b77650007..7aee7fd2e240 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1013,6 +1013,67 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>>   
>> +static int geni_se_resources_deactivate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (se->has_opp)
>> +		dev_pm_opp_set_rate(se->dev, 0);
>> +
>> +	ret = geni_se_resources_off(se);
> 
> Why do we end this series with two different APIs for turning (on/) off

Currently, we have resources_off() which only manages clocks and 
pinctrl. I’m leveraging that in the new API.

If you agree, I can migrate the logic from resources_off() into the new 
API and remove resources_off() once support for all protocols is 
implemented.

Code snippet:

static int geni_se_resources_deactivate(struct geni_se *se)
{
         int ret;

         if (has_acpi_companion(se->dev))
                 return 0;

         if (se->has_opp)
                 dev_pm_opp_set_rate(se->dev, 0);

         ret = pinctrl_pm_select_sleep_state(se->dev);
         if (ret)
                 return ret;

         geni_se_clks_off(se);

         if (se->core_clk)
                 clk_disable_unprepare(se->core_clk);

         return geni_icc_disable(se);
}

static int geni_se_resources_activate(struct geni_se *se)
{
         int ret;

         if (has_acpi_companion(se->dev))
                 return 0;

         ret = geni_icc_enable(se);
         if (ret)
                 return ret;

         if (se->core_clk) {
                 ret = clk_prepare_enable(se->core_clk);
                 if (ret)
                         goto out_icc_disable;
         }

         ret = geni_se_clks_on(se);
         if (ret)
                 goto out_clk_disable;

         ret = pinctrl_pm_select_default_state(se->dev);
         if (ret) {
                 geni_se_clks_off(se);
                 goto out_clk_disable;
         }

         return ret;

out_clk_disable:
         if (se->core_clk)
                 clk_disable_unprepare(se->core_clk);
out_icc_disable:
         geni_icc_disable(se);
         return ret;
}

> the GENI resources? Can't there be a single geni_se_resources_"off"()?
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (se->core_clk)
>> +		clk_disable_unprepare(se->core_clk);
>> +
>> +	return geni_icc_disable(se);
>> +}
>> +
>> +static int geni_se_resources_activate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	ret = geni_icc_enable(se);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (se->core_clk) {
>> +		ret = clk_prepare_enable(se->core_clk);
>> +		if (ret)
>> +			goto out_icc_disable;
>> +	}
>> +
>> +	ret = geni_se_resources_on(se);
>> +	if (ret)
>> +		goto out_clk_disable;
>> +
>> +	return 0;
>> +
>> +out_clk_disable:
>> +	if (se->core_clk)
>> +		clk_disable_unprepare(se->core_clk);
>> +out_icc_disable:
>> +	geni_icc_disable(se);
>> +	return ret;
>> +}


>> +
>> +/**
>> + * geni_se_resources_state() - Control power state of GENI SE resources
>> + * @se: Pointer to the geni_se structure
>> + * @power_on: Boolean flag for desired power state (true = on, false = off)
>> + *
>> + * Controls GENI SE resource power state by calling activate or deactivate
>> + * functions based on the power_on parameter.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int geni_se_resources_state(struct geni_se *se, bool power_on)
> 
> It seems the purpose of this "helper function" is to allow replacing
> geni_se_resource_on() with geni_se_resources_state(true) and
> geni_se_resource_off() with geni_se_resources_state(false) in patch 10.
> 
> 
> Naming a function "on", "activate", or "enable" provides a clear
> indication of what will happen when you call the function. Calling a
> function to "set state to true" is not as clear.
> 
> Further, the code paths that needs to have resources turned on should be
> separate from those who signal that those resources can be turned off.
> So there should not be any gain from this function, unless the same
> obfuscation happens further up the stack.
> 
> Just call the activate/deactivate in the respective code path.

Thank you for the inputs.
Sure, will review and update next patch.

Thanks,
Praveen Talari
> 
> Regards,
> Bjorn
> 
>> +{
>> +	return power_on ? geni_se_resources_activate(se) : geni_se_resources_deactivate(se);
>> +}
>> +EXPORT_SYMBOL_GPL(geni_se_resources_state);
>> +
>>   /**
>>    * geni_se_resources_init() - Initialize resources for a GENI SE device.
>>    * @se: Pointer to the geni_se structure representing the GENI SE device.
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index c182dd0f0bde..d1ca13a4e54c 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -541,6 +541,8 @@ int geni_icc_disable(struct geni_se *se);
>>   
>>   int geni_se_resources_init(struct geni_se *se);
>>   
>> +int geni_se_resources_state(struct geni_se *se, bool power_on);
>> +
>>   int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
>>   #endif
>>   #endif
>> -- 
>> 2.34.1
>>

