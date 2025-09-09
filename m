Return-Path: <linux-i2c+bounces-12798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C511FB4A588
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B2493A9794
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 08:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778B0253355;
	Tue,  9 Sep 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUVli2wr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9E251795
	for <linux-i2c@vger.kernel.org>; Tue,  9 Sep 2025 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407153; cv=none; b=W+g5esrGG5UyrN3SVr9RgbFU2D/kdODfGt2Ic8gX/4/mIWgO+f0ZsWbGzM26EkOpYKtQt1nOjNDmAh4SS0J1/BFkta7ZRDM+vqfDISJG4KdS2eGEa1DwO+7osNIc5Ncm/nU+689q33C+llzCDAcxdGyit973hQNnAc/GPS8Fh3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407153; c=relaxed/simple;
	bh=9x89MYAZJz0x+vKABEiiN6j8efnz+wNuTOK2EljyTs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a00ZUE4NO0qpfrTyLAE1M4M4xpaKECEEMr6IqBVa0Jfxs9/KPYuPQnDoyeNe9mo0p1H5F6vAc0JT62r0SO/uE/8ETBeAEYkK6KH0vInYbJc7NLpcyXQF7s1/88Tq67ccln50oG43mC/UTq2tKpsi5Ivdf0Tt+ektzHLRHK2AWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUVli2wr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SetG012381
	for <linux-i2c@vger.kernel.org>; Tue, 9 Sep 2025 08:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsL4naCSuZYadG1mnMalW2GA4pHt+PHpJI7P94ns/zE=; b=fUVli2wr20waZAWs
	+qfrr/MmV99cqUjx+DG4BK4pmP78Au0HO3E/J9wcXnfRS65pKEUuNMjb3F3bJdfM
	U8I3aIbv9a8ymXUXbt+jlPF1MWZPpi7RMtIx0v1hrH3HtguyhlIo8+TiZKxTgBNe
	9wjk/J/ouJQgw/UMAILAcqc8uFyp6Fp6PgGalCGZJLKQjEABP8BNt6bFWKSN8fJA
	288sWQgLJP1lcJCsOTp3QLuOt46L+N31rg1P+UeB0FJDEvYBpflkwRMh5OE+DisT
	uCwFKsk87jWdgrV1hylzeL4CwUneIjMA/9uICYdbTK+pu/HA1aoSBzj9x3YTl0I1
	G1r0DA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a7eqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 09 Sep 2025 08:39:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-720802c209dso7727826d6.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Sep 2025 01:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407149; x=1758011949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsL4naCSuZYadG1mnMalW2GA4pHt+PHpJI7P94ns/zE=;
        b=gF1QsVPzMoOIygmNF0wuHhuWEyESoLOClvz7a6EceZT5fEpQXQOKOgfh49kEq834ro
         y/tfUYc5wdWXs/4w7om51LbQfh6xRwFMYVotVjNMiTBxdGz/0xC62rRxI1dPLJCBOSlj
         a2a7Zuwszyz1F29bO6to7ViG5D80GipElYdzzOHJzJM0JW+VnWsiHHSVPkgmix1BhPKy
         MS/5vx7Kz6WWFEylGbruanzoR0IsldsNxAHWeQ1gjh7brZaaWy5V0joVdKZ28Y5LBdBa
         u9oQQza8qmLQI6FweXnkn7dIfbQpO5819SjBKrdYofn52hNAVEObS7lJAjFAzT4ZNTMU
         BL9g==
X-Forwarded-Encrypted: i=1; AJvYcCX1OzEIPmgsN3jdfVo/+NwosJ9rl7/G0TunnngQY/wLVaffOOophlIdBI2rmmxOcbaqXU8ymC9Barg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IbFXfQ2C2IveiQHvH7NTgT96HYKRXCoaoJRelSPGlKwmj8yh
	H0MIpCtR/6tru6zXVENt/B1ygpbxn35acstm2xunLfIQHqoY6YPkM6f77zhEUpQVp5wr+aTegz1
	PVcAoj0HFzAwp/WXMsOs0RqGhJloza0PNYiFn0RmCHxUsOSFTr1xyGskhtnuX3ES8WEur8U8=
X-Gm-Gg: ASbGnctXOSTgmPxHskJNG2atqmOnyvFpckFkSt8QYI+/rQ/VNc1VHwPNPM9+2uIyIi8
	At8NVznjFXxkr6EcuIRzBlZbvyaEJ/XS/hAu0JvCYa67iQmaXH+HX/HauLmI8umhNOhfP1xsnxv
	22vZLGHuCy+3GDxjQZDT8I1kl/dzY8ncBwh1gX9Kp5EqloOSArFsSCxTPwyFV2+g+P7nFg7miHk
	e97xK9X53LH2BaOSgSEraOcSXU3zFgArcgV3PD2zedboIz1YgirIW7i2FyF0prpV0Me1YvTR2c7
	gKCfErSnRevFR0TmURQVqwr2BUvRdboCyKWSpIRZYShaQThyi7smbGatNUgzGy0e68bj2jFbvHW
	UjfRgc+PnkgP2BYGHW6YA9g==
X-Received: by 2002:a05:6214:628:b0:736:261c:d636 with SMTP id 6a1803df08f44-738fc406159mr87757936d6.0.1757407149060;
        Tue, 09 Sep 2025 01:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYGwk8ZE59MI/Irv05zhk5fDouLJXaxh2LsAl6wlKuzaOHesC4R2VhSrJb0gbbgWFknhr1lg==
X-Received: by 2002:a05:6214:628:b0:736:261c:d636 with SMTP id 6a1803df08f44-738fc406159mr87757736d6.0.1757407148563;
        Tue, 09 Sep 2025 01:39:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfe9a0198sm866920a12.10.2025.09.09.01.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:39:08 -0700 (PDT)
Message-ID: <4fed1de1-fe02-4631-866e-80bbfd2ab455@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
 <aL6X-RiCyPVbHlYN@linaro.org>
 <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
 <aL6nZdJCKmnWcswB@linaro.org>
 <1899862b-530b-4a75-93fa-c70c90d98016@oss.qualcomm.com>
 <aL6rYq5gmX8CdeE-@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aL6rYq5gmX8CdeE-@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bfe7ae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Q5Xro-IcwC490qZTrIQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tiq3zCH0m12fqyL6tpDjxQnOSx9_nhKa
X-Proofpoint-ORIG-GUID: tiq3zCH0m12fqyL6tpDjxQnOSx9_nhKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX5b0eenyZybI3
 k6Y9om931Fek8iu2MebQeInGGbU8IQDpYTbXpxVbD9B3A4/vYBTe043nIw/azLpfJTmK1gDfJCb
 U4MTv4cBK7yVw4mPc3E0qop0+SBz6IojZGKjd7KPPg+2ZbGef8l/lfBDEtwIO9zM+/hkMvKPp/c
 4yAvuAeBhS/kzPpaMMSgycQeOYGSSaJuug9onV7ZIiApJTCTIcCSE670h1AYFZpHh+cA1TRjGWg
 jlzPgExQV/+b7HVhBArvaTQRkzNZd51vnKXW3C6yryfiX7CQFGjs8eL5ba1cTUmAMUP43YR3hmV
 o/LNwraqZVQ14aWCqhaiwNCEm4Q4+G6cdf90CWG0epLE8r5b8Ki5Fv0jk8lJ+25LflWA1OY0PWd
 usRrmMyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/8/25 12:09 PM, Stephan Gerhold wrote:
> On Mon, Sep 08, 2025 at 12:00:13PM +0200, Konrad Dybcio wrote:
>> On 9/8/25 11:57 AM, Stephan Gerhold wrote:
>>> On Mon, Sep 08, 2025 at 11:49:52AM +0200, Konrad Dybcio wrote:
>>>> On 9/8/25 10:46 AM, Stephan Gerhold wrote:
>>>>> On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
>>>>>> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
>>>>>>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> The CCI clock has voltage requirements, which need to be described
>>>>>>>> through an OPP table.
>>>>>>>>
>>>>>>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
>>>>>>>> (which is a value common across all SoCs), since it's not possible to
>>>>>>>> reach the required timings with the default 19.2 MHz rate.
>>>>>>>>
>>>>>>>> Address both issues by introducing an OPP table and using it to vote
>>>>>>>> for the faster rate.
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> Using an OPP table for a single static rate that remains the same over
>>>>>>> the whole lifetime of the driver feels like overkill to me. Couldn't you
>>>>>>> just put the "required-opps" directly into the device node so that it is
>>>>>>> automatically applied when the device goes in/out of runtime suspend?
>>>>>>>
>>>>>>> And since you need to make DT additions anyway, couldn't you just use
>>>>>>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
>>>>>>> use that for e.g. USB clocks as well.
>>>>>>
>>>>>> This is futureproofing, in case someone invents FastMode++ with a higher
>>>>>> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
>>>>>> clock which would (marginally) decrease power consumption
>>>>>>
>>>>>
>>>>> If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
>>>>> then I would expect a separate entry for 19.2 MHz in the OPP table of
>>>>> PATCH 5/5? The DT is unrelated to what functionality you implement in
>>>>> the driver, and that would make the OPP table look less useless. :-)
>>>>
>>>> The frequency plan for 8280 does not recommend any rate != 37.5 MHz
>>>>
>>>> For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
>>>> (yes, thirty) MHz, sourced from CAM_PLL8 for $reasons
>>>>
>>>
>>> The 37.5 MHz rate still exists on X1E I presume, or are you saying we
>>> need more changes to support those odd 30 MHz?
>>
>> Yes, any corner over lowsvs_d1 is 37.5, sourced from cam_pll0
>>
>>> Personally, I'm not fully convinced there is ever going to be a use case
>>> of someone using a "non-standard" frequency. Even if "FastMode++" is
>>> invented most devices will probably want to use it.
>>
>> Not really, there's no reason to make your i2c bus go fastfastfast if
>> the devices on the other end can't cope with it
>>
>>> And the voltage
>>> requirements we're currently talking about here like "low svs" during
>>> camera use cases are kind of negligible compared to others too.
>>
>> Again, this is an I2C controller that seems to be associated with
>> cameras.. No image data has to actually be processed for the
>> communications to take place and you can attach any odd device
>>
> 
> My point is: In the unlikely case that support for faster I2C speeds is
> added in newer SoCs, I think you'd just get a new "standard" base clock
> frequency, add a new cci_data struct with adjusted timings and everyone
> will use that (even for the lower I2C speeds). I doubt anyone will
> bother adjusting and validating this for just one "corner"/voltage level
> less. There are much more effective targets for power optimization than
> the few bytes of I2C communication. :-)

There are OEMs that customize some of the timings (e.g. Sony) and I would
expect SV efforts to at least cover the recommended frequency plan (which
like for x1e sometimes contains >1 frequency)..

That said, I do agree with you it's a rather niche/improbable corner of
the SoC to worry about.. But using required-opps in dt-bindings for
non-trivial hardware (CCI is a little bit more "fun" than the today's
state of the upstream driver makes it seem) simply feels like asking for
trouble (i.e. a ""real need"" for an opp table will probably come around
one day, so I don't think the additional 10 lines of code to support it
are that much of an issue either).

Konrad

