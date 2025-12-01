Return-Path: <linux-i2c+bounces-14349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444FC98451
	for <lists+linux-i2c@lfdr.de>; Mon, 01 Dec 2025 17:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECD364E2568
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Dec 2025 16:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB2C33469D;
	Mon,  1 Dec 2025 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QoW2DcMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODYRs0gI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045133344B
	for <linux-i2c@vger.kernel.org>; Mon,  1 Dec 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606826; cv=none; b=MpUV1pNc3ziPuYb6kxYPVqh1A5X0gA0/bV8iLK15u188XzE+3IiO3JC5aVTkB16RQzhls5axKdk0M+W95MMfG62RMtzTn17LSXDv+Vvoe/C2ZULbaPZjvh5pHoNGSDYnj9s11EZcWRA9ltRJ2izXernvOWHIPAI04eaxWNQra7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606826; c=relaxed/simple;
	bh=AbhQ62nqAUfgrnUGD/R0jH3mo57htPWPyjSXy4JoUXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lal2p/hP2w8FINksRkJfbH3c1SqELxNu7AuYL5RQt7Oqvav5LrzrNmWjZL2b/BHzDwKkjGd/atI0jSibaN5ngLQSbiLgLEfYj5sqw6/oj7uqK5Cyd6NpQoTaito7yvzjXJ7jdJVJRRLj/FFm90E+iSxMngtHbQQiQf61CqpuLxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QoW2DcMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODYRs0gI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A80uA435932
	for <linux-i2c@vger.kernel.org>; Mon, 1 Dec 2025 16:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyef+WiezFSjoN3MHaQMwEyGi2XeionlLLph0yiVFQA=; b=QoW2DcMPKbNzjdPE
	OtiwOf8jYaQlUo+wHUaffpSp/gSj9fgTZCL8q6z4Bcsow+sE/iUtwpCVszARQupD
	JjPEEGU2Ts22IkByqPwEvwI751Tgwwh4xbo3OgElxOTEcHomnr0OmhVekZd9M7uC
	fT6PPkoLEYX8z/iFU8lIh85K3Cxzn1sbFVMDvL2Jr3/JUKY8BHQ3rH0JS2mfmCoj
	4eZYutFX7DiwRfMyT5xNepKNmkPQYSJaFdunii+dwVACJU5jwJWazfVSDLP8de43
	yEh25/cgg/svsvxfmCf6hF87PEgvPkYZpeFp9gD0JMlcG4/OayZuD89TYT4FmRhq
	RjRkLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909s2j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 16:33:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f587dc2eso88015695ad.2
        for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 08:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764606823; x=1765211623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyef+WiezFSjoN3MHaQMwEyGi2XeionlLLph0yiVFQA=;
        b=ODYRs0gIS7/NZtvoSrNLtMS5f6KEZEZkkRJk3SWEBMp5REHWCE7bhI+UcRVx262ZGu
         f2rP1T3HIu/sLW0jWzaMJXZYM2DwQLPXzXnxZr/IrntRTb6barDbQfFozIbyRizlZGNB
         lFdTif41xhyE8p0ESsrx3W3uYY1YcQ/5lxJy1trE7lE2JrUyWR8DMnfVnhxbIxAC4zR+
         SWrIeNvxtsLcg5X5WQIEJBAg6TiB1LQsZKx54jfGX1R6K1ExWveuQqaLgd/dTwBrybaO
         bo0y8lDIIQFP9oyzgVIdtxOOnFBsyeV95alMCFQDY4HQzK2Nxq/qgQrnpKvZfelxOaS+
         fqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606823; x=1765211623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyef+WiezFSjoN3MHaQMwEyGi2XeionlLLph0yiVFQA=;
        b=ZFscgQpDzB+6Xy2sBTrmvb1vwoXI++nUkZ2knPCKZaFgwvo81jsZQTqJkSeV3hEJ/T
         RGe941e8RKglA6RsXkxGVnihj9TkGTpvHp/5VFHYgzsFg/609n4n0PrnibXEdv/1gfQQ
         PrCKRKpC/4XgTM7m31YCfL2cnB3CE6ItFLNqSgJn3jvJKjMsDcjiu6pGlIfci/XAJPh/
         JGI1Y9zYlE/1a4HVu0pH0pnQBn2nWJOz06etfmUXl0I1yOKng+hulwyiKnwDCBDxNbwR
         sTtwzqECouwHtZBptRbXDeWuGgSQ3EkSPDonxx2kVKuZBWF8obQQ1RVE7dotuSlORkck
         tdsg==
X-Forwarded-Encrypted: i=1; AJvYcCUzrxhbHepW2WVg4ujN8b0ufCPsU+kRT9Vo3kot5T68Uje/v75r+3s0q5B0gLAZhxpPvfc08I80YWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCE6t3n/XttKS+mBH2ejObOGktSC2dtJWGascjc4M+bUGAbUw
	vd5x7oa2Dqk5MJlxcTioDphmIZsTdiL3dtS2iq79r037mFBIbOwnaPeHCBW0TjF8CkRbEpf2KIW
	cRAmf8Q2hlo4PtaOZQVwS943NHRFEVjaqIpfBAaVPB0o2Iwjj4454JCJQPZ1S5o8=
X-Gm-Gg: ASbGnctSwzqMxsyDUNA1VxDX2jP8ZsN1D+TM1IbSDhV+QJncSFTN7M6oFDVa8YrrVZX
	NWSoSyHemU7fyETQGRKE9dlQv+AVaeBMsIJAQ5GO2xHms6rzG20AjHauWxDetsO3coA2JjL80bg
	hWt08xgANAQcIKC9BsjAtL56lZtvvCqNDBRfIE/Exzd9zL22PbByelG8ed9/26k9QYEtPoY6eyk
	WHp/2pOZxZJo14BIMxTPx2Jjahyp89i9eMACk9QC5qYn5arrr/6lMLJv0JGRjwLv0sH2jbQVWQz
	x0Ysb/0O6v4rY3dgOykplOtyS9Upl6PXdKH7I1ie4qufVdTyr+hWur/1IG7vHzaWAy6wvQBRpNU
	xtnLxluXIXmDhA5mTgqOFz60uQw+jggCQc9foje+mCw==
X-Received: by 2002:a17:903:f8b:b0:295:6d30:e26f with SMTP id d9443c01a7336-29b6becfe11mr399712495ad.22.1764606822666;
        Mon, 01 Dec 2025 08:33:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECm2G+ZzwuiAOERajnZ4LvV40yFzTeM81elAzS5lncjpc/qcg3mSpJH3AwBfzITqEiRManfA==
X-Received: by 2002:a17:903:f8b:b0:295:6d30:e26f with SMTP id d9443c01a7336-29b6becfe11mr399711865ad.22.1764606822038;
        Mon, 01 Dec 2025 08:33:42 -0800 (PST)
Received: from [192.168.1.5] ([49.204.108.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54915sm128371065ad.92.2025.12.01.08.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 08:33:41 -0800 (PST)
Message-ID: <ae8e5120-9e3b-4aad-83ce-32c93e24a566@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 22:03:35 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/12] i2c: qcom-geni: Use geni_se_resources_state()
 API in runtime PM functions
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
 <20251122050018.283669-11-praveen.talari@oss.qualcomm.com>
 <gwdb27mtmqrt7rt3g5bzae4a3soquy7lwtw6zbjjhj42v3oyrq@qf22i7davz3o>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <gwdb27mtmqrt7rt3g5bzae4a3soquy7lwtw6zbjjhj42v3oyrq@qf22i7davz3o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEzNCBTYWx0ZWRfX/Lvf1g6OJ+v6
 WEvzhXHnwD7ZT6PN3g+jMnn4n2dHI+o/7yRw8YluS2vBu+X4DSV6OGFbcdN0YWw0tK8AZ0xP3GG
 R0Lf9qRUg5nlFe+9BetCGcZpRx0EAlGCxuAG9YAftMvCM4WVYuc7rfs2jV/9N4jy61WT9p9m+V/
 iuioFP8mVdIJTWD9s/6gvrpG4jIwwzNbYgpGsX2CXk7T4k5UHd98aXmLlAkbAcYuPA73Sw+vGuC
 CPFFvN28qtStmvHzLe9hAHbCaDnH7z6ml7nfHzmcWvGXCVBT31jrW8iDNPsSF04kZxomTl6HxPk
 aE35xngsmS2MAGSnz0W9NKwW0G+Sh4lQfvqla24ng5jzzuu87z2jzb+xp2DbZQaaHo8JZSkhllS
 1kQZ/zagkF3QcDVNOCx39IsgoqGXhw==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692dc368 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=PVN08cSn8zglVHm8Z6xkeQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n_5Q3kagYiSkGmCobM0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: FhtaBSH9fjtacCZOQgzOLGRlafjYZZCP
X-Proofpoint-GUID: FhtaBSH9fjtacCZOQgzOLGRlafjYZZCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010134

Hi Bjorn,

Thank you for review.

On 11/26/2025 9:08 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:16AM +0530, Praveen Talari wrote:
>> To manage GENI serial engine resources during runtime power management,
>> drivers currently need to call functions for ICC, clock, and
>> SE resource operations in both suspend and resume paths, resulting in
>> code duplication across drivers.
>>
>> The new geni_se_resources_state() helper API addresses this issue by
>> providing a streamlined method to enable or disable all resources
>> based on a boolean parameter, thereby eliminating redundancy across
>> drivers.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
>>   1 file changed, 5 insertions(+), 23 deletions(-)
> 
> Nice to see such stats, which I presume will also show up in the other
> SE drivers later as well.

Sure.

> 
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 790cbca2c22e..ea117a4667e0 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -1166,18 +1166,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>   
>>   	disable_irq(gi2c->irq);
>> -	ret = geni_se_resources_off(&gi2c->se);
>> +
>> +	ret = geni_se_resources_state(&gi2c->se, false);
> 
> As I said in the previous patch, there's no reason to "set state to
> false", it's clearer to just have an "on" and an "off" function.

Sure. Will review and update in next patch

Thanks,
Praveen

> 
> Regards,
> Bjorn
> 
>>   	if (ret) {
>>   		enable_irq(gi2c->irq);
>>   		return ret;
>> -
>> -	} else {
>> -		gi2c->suspended = 1;
>>   	}
>>   
>> -	clk_disable_unprepare(gi2c->core_clk);
>> -
>> -	return geni_icc_disable(&gi2c->se);
>> +	gi2c->suspended = 1;
>> +	return ret;
>>   }
>>   
>>   static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>> @@ -1185,28 +1182,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>>   	int ret;
>>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>   
>> -	ret = geni_icc_enable(&gi2c->se);
>> +	ret = geni_se_resources_state(&gi2c->se, true);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = clk_prepare_enable(gi2c->core_clk);
>> -	if (ret)
>> -		goto out_icc_disable;
>> -
>> -	ret = geni_se_resources_on(&gi2c->se);
>> -	if (ret)
>> -		goto out_clk_disable;
>> -
>>   	enable_irq(gi2c->irq);
>>   	gi2c->suspended = 0;
>>   
>> -	return 0;
>> -
>> -out_clk_disable:
>> -	clk_disable_unprepare(gi2c->core_clk);
>> -out_icc_disable:
>> -	geni_icc_disable(&gi2c->se);
>> -
>>   	return ret;
>>   }
>>   
>> -- 
>> 2.34.1
>>

