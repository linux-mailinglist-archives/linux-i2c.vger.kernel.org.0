Return-Path: <linux-i2c+bounces-12762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 987DAB4890B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 11:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FF4C7A3F28
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 09:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD022F28E5;
	Mon,  8 Sep 2025 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wo59aM0q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB12E92B4
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324999; cv=none; b=eONHOgUQBwS/kuYyrvyKokCT9ND5J01/uOQTyramVS4eZyZxXL6/Gg7v5VTbK7wRDCk542mIVmNx575jy/xR0bU/ez9mSqRx6e86XTQPaexjk953YDAMh1WU2NOvsv9XDbgA7Rw5hcRVpwukOanWoF86wJrPM9AfLxGtSDbYBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324999; c=relaxed/simple;
	bh=/1qeyyrYEEifT3QeM8Q+fXPgtyXCmu+JFWWL/hFWG90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+he5jEOUuumZrrTc1dA/KaNtu3xc9WC67PIC1nWKbaT6fdAA5rVY17iWZ3M+jG1CLQsFXzvghrBrWrortjByEeMs/tkkOqd6U7Nz7JrD+iZHIK6sQjW6bFGrbCX8yu2vdWMDD6tRybcMn+y0Ysbm7gdqTavSWg42i5RGboOKp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo59aM0q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58890IpN020026
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 09:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lD6KEG3zwEbdfYQAGN1f+cGXwCANVO3gniDOdrVcexg=; b=Wo59aM0qVggtWo45
	OryuIuaLthROh7vzp7ABJDOVBTbdnTH4LypIyCpBja0d0eWvlm8ynTKJyEvKm5y6
	EPBIvGGMcTdakg3EsMsDJ8QC3cw1bF9+Rx3Vmc7pE5xogHvfdla0mPVn8vnU8m+A
	rxZE1M/yZ9hOzn1MAllTUtGYMujI7VMDId8WSFYgVGpG9qsSmB+u2WYNQ2eU7lz0
	wAAoeEPL4JUVippz1QcFzC/kyZvejSVl8E7/6DVJZhD/41ntvnirXGiAaSpjxU5K
	sospCPmYw2HcNNt8fPkye+0b/bQXNPd8PwJQHy1C0Je4NQcSP9L37ilbasB2AncH
	m+nQ0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0m4st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 09:49:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b613a54072so867011cf.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 02:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324996; x=1757929796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD6KEG3zwEbdfYQAGN1f+cGXwCANVO3gniDOdrVcexg=;
        b=NCXop6YsyiWLpk53RfA2VYL5Cp+enatecSqLv2FYiCRrz+zmAB7OBFGG6/MGc/bdNX
         oSGCaiEckWValyC9GR3XKehZsTCZdDR34tBj00N/8uH4Cx6Y5eMifU4AIuZ90ds//UAe
         z+vRtrP/O7tBuK4G+hitY2c4USNkihDrbaUbkstBEqhmSngxD/f13DR3JEzFdEzVJndc
         ZT0HX8zx+k9hAKdlwETjW3IhSm/gzmkuruYsEC+xkjOOCePkifsqv7V5DmRXrICISDfu
         PceLktUTz1unKZgXAKxAZTe5RZu0KCoh9MPmEF4Nql8SKlKFCR9eOjT9MLdKCefipXG6
         Pifg==
X-Forwarded-Encrypted: i=1; AJvYcCWTJFHRoY9qxr0mJfWydffQsG3u970UlkCJIH+DRlzlShWzB+FP7cdaK3eRlTxTTJFHu4EEHsHRlZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc624ksdMNanZMXePslr/jZ2hFUISPSR87/FIRwSXaDQTOVhRS
	gjUFyOsdH9ZKjbFUs+p870aUDPso+X324OHKrsHrzYkhdls9p5Crp2cicJMJpnKXk1TPNGMHKGd
	AFUmjcvgBruwuLnq8DNLpxy4Jpqo21u/koUtBwGt3IgLEoUCfx4GiIrXMtO6XAIM=
X-Gm-Gg: ASbGncvhzNouBxFZLpLl5GSyhPHwtcMGfAXabkWxi5G0B6Wd33RfIhOOvgY+HXwcU6y
	pj7RfftURpSgkRPApePopkZ9iXkZPAi0MTE46h01i0VfQekUt07eeGcvfQ6mj5f/niG0UjLD3vV
	8p2Jzzdyk+xB66dnpqEIQfe4XLlWP7OpIXXNx43C7lAbvHiKyQnWdiMoaayl3VM27+7szueUPLb
	Bqp9gAEbxpEC4QBZsX80SsoDwfky4AlKL5KBf482BsA/OAotUCdgndVZsyBE0iXrb1UMHh3POwU
	ayd/qNI7G03ZXRPB2Z0Y8xc8xy34g85sTmq+JugOYSidayOWYTw8pzMVwn3N/OBfHwdkhTzg9di
	44Auuh7fMsiGoU1RwhP5v7A==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr54659861cf.4.1757324995633;
        Mon, 08 Sep 2025 02:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Nr1cvJLpayhWkgcnt8UH3czXMtnD+kOQ5FfN3g+uja3rrF4K07g61R9UqbF9Dwg7GRukAA==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr54659661cf.4.1757324994936;
        Mon, 08 Sep 2025 02:49:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046f2dda22sm1231244666b.40.2025.09.08.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 02:49:54 -0700 (PDT)
Message-ID: <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 11:49:52 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aL6X-RiCyPVbHlYN@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8X2feQ1UEKCO-r296gPtUjH9xe2ML71k
X-Proofpoint-GUID: 8X2feQ1UEKCO-r296gPtUjH9xe2ML71k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXw5dmNnPUaWXl
 iQ6SZVPajYAazWNdMmfgfMEcUQOiFwcmA+auVflGdzuzyoZQVpQXf8W/L58xqlqNOOi4XGHar4Z
 dPo39uDgVjYRWKUjMYHmhpJBIf9rpdRHCPfXHd6tMw+kv1+RqdAqPNHtwxu7PmwzQSqDY7+98kx
 WE/XGoCWv6uUUT3uXN1+fGWAclhcdPo9zb80FDJz3wZfw/zj9oNpw5IBqN6/cYpYmsSEWxK4cf1
 UlUbfybFQxFm+k9hj5xUUZT+sX5snjJgB+UqJ8+i7/KJZ2tt0GZGupDuppU0j2H/KzUHu/ieNfq
 f9aXbUiJH3IqQ0siQfZ1xEuglhsxGl1qVeUQOgCw3Ad9/QWiv0CX5xOK+G1vnpaFLaHJO/Qd5m5
 M1KEKg2O
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bea6c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1skEbHYOOoY0r-gFCEEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/8/25 10:46 AM, Stephan Gerhold wrote:
> On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
>> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
>>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The CCI clock has voltage requirements, which need to be described
>>>> through an OPP table.
>>>>
>>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
>>>> (which is a value common across all SoCs), since it's not possible to
>>>> reach the required timings with the default 19.2 MHz rate.
>>>>
>>>> Address both issues by introducing an OPP table and using it to vote
>>>> for the faster rate.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Using an OPP table for a single static rate that remains the same over
>>> the whole lifetime of the driver feels like overkill to me. Couldn't you
>>> just put the "required-opps" directly into the device node so that it is
>>> automatically applied when the device goes in/out of runtime suspend?
>>>
>>> And since you need to make DT additions anyway, couldn't you just use
>>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
>>> use that for e.g. USB clocks as well.
>>
>> This is futureproofing, in case someone invents FastMode++ with a higher
>> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
>> clock which would (marginally) decrease power consumption
>>
> 
> If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
> then I would expect a separate entry for 19.2 MHz in the OPP table of
> PATCH 5/5? The DT is unrelated to what functionality you implement in
> the driver, and that would make the OPP table look less useless. :-)

The frequency plan for 8280 does not recommend any rate != 37.5 MHz

For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
(yes, thirty) MHz, sourced from CAM_PLL8 for $reasons

Konrad

