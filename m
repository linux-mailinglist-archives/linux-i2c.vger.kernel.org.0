Return-Path: <linux-i2c+bounces-12760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CAB48767
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F093B12DB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545E72EA75A;
	Mon,  8 Sep 2025 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey5CPwr7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE12E3B19
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321040; cv=none; b=pjY51Mom+sGyaxyT68NZ5CoaudpWCcaFZOt6XIFtkUr+h/rvKPaQVi153ICQDCDALREZZulR1aMyVB8TtjMESTZyEAdPKSErOsPeRRGiWc0eX4jx1760zs6v0YyXCI1/aFqSAP68sZoMbw+w8yn0Herw9Z4nxoewF1/ez7AaMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321040; c=relaxed/simple;
	bh=YfZn2EbbDDr/m6xEKnUctK8uxT5iQKRoZlYMUFHprBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfppEU2PwVQCAhwoW5s2TQ3Lp6ShIPtIkX1DNaoPyZ/V+4LIykDv+WtTSY/iVjFsBQHqRhX/w370hOnVmOk7oQXbPjfuQy+vT2bioc6BYTd0LFCmZiyLMi/JtqAliSAOhndSFdJhJhLKlJKfiTzEJLxfVWxkSsOFQhQ86k7k7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey5CPwr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5880UW5C012487
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 08:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YXirHZWAcnAup5Mc4KJofofilhQ2FKmIuVp3xsUIzA=; b=ey5CPwr7eQrwsouc
	vU7LaGnKCa7xBSyusIZ52gHEXE6fPg0RnOshIaYeRCHGD31mp47OsA4s/fMgb0D4
	49xIqo+1uEO/8+tfNgqSodjX0ZmiyZSFNWR5fapcuOxCMTXxfYCb4vLGoBF+1ZiH
	5S35Pd2I8l7xD7wDkkpfN+k8jItAgHINHf9ElQVg8wL/FRxuISkb+9/qTWfwPhNJ
	QAt0z89l41jUzBHlYxB4wdBocZwFhtJX5CSm84hdBpEEqldVn5pBqLuoGQrJzUOR
	bw+pXOTn800Uras79HSIpuX5PHznFBd5i7XuA8wbHdRhGo/192zqjPOR9ZcqCSgJ
	sU3C9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uxeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 08:43:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-721b84d7bb4so3766096d6.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321037; x=1757925837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YXirHZWAcnAup5Mc4KJofofilhQ2FKmIuVp3xsUIzA=;
        b=O1qXt634ff1SEduXX7CjVpNwf4MefhDymBkJ4lAZMZf2L8sIMQmrIsVaZUSaz6H1Sl
         dZDXDFLFXuLPrMLbVYyzGpIXacFKHNNLC8+2AKWZPC0Cle2Dx7fFBWK712vqFTceDr8J
         1rhYIf0TJXB7VKSjmtXX032FPTq90RCvnms1TYolLtN9MfYIjrBwBTOgAaY1L3sly47L
         uDUQLS4L3JCP6ZdWt0B8Xqy36Iy6/Mwi/OGOSOhhSSzKY+7m3qf8C2jmPA7ziKLcXjZM
         xhzC+02Yfvwsi3gcHB8YfYdGEiX98Er7OPxBnW884kR9PGdeaAk2h5Lmm4+2bd8b9SrX
         vTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYoUwG4623zsL4H2mza9nKCofC9xC3Bw/gjoryJo0/q4pzIaoquoujSzsVYD/96q+Yv/xXbV/KYQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jI4C3/r/zK46D/tqjVbJc5igf34W5CS/tAnjZbSgflVbU03f
	bx+aAuuduOPXZp9G6lEgzjPzmCu6p08ssN0X/LOuxUU2wEYhyg5inOwoAdWMUBoiVGjfDPgvCtp
	6ew3Qj3bhQaOr9vaMDqr+NlR2Id7e67BqvP7k0qsX/iHMncpFWndmZv/2WKTB6sI=
X-Gm-Gg: ASbGncsk9YPBNC3hnmztuBVT9EAkrPGGLChMqf+9D5gnZffCg/XkEZOIddVFrdBSH0I
	AAMLy7yw4IARCjCEqE7zdZ9eUTNw66+KptZivNeP0rPIRQ6AF0O3HB6TGLxWPh9TLRQKqWwpypg
	DgaPTE5coVA46KEvRsIKUaHTBlWhcM7Ms4FZ1xRKEIPI8T/fg0CsOucmClNyAVd2i3vTI9UEITi
	dNEEbyy+lAV0UJx5r8iI25sQbSlOsgJMgqrcepZoB9HMVtOx86IahkICVMZw7x+lebgAr8k0/ZM
	QzxAk6nWEj0Fi3zVOCWHXT5VozZVtd7qprGsuqGqGaY4344Sf67hDeSwkx6wm9eHm2Wf00u4aqO
	UNO6AnU7EVF6bB6HVeVTiSA==
X-Received: by 2002:a05:6214:411b:b0:738:2797:92c7 with SMTP id 6a1803df08f44-73944a0c619mr46426426d6.7.1757321035204;
        Mon, 08 Sep 2025 01:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFppsM+5VIrAF9EEkJhMHSuYD3hi4y4xvCofPF7mq5yRs8Lm4MTOnPqOA+MY9ePWLQNhh81ig==
X-Received: by 2002:a05:6214:411b:b0:738:2797:92c7 with SMTP id 6a1803df08f44-73944a0c619mr46425896d6.7.1757321033937;
        Mon, 08 Sep 2025 01:43:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6222f293a31sm5874197a12.12.2025.09.08.01.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:43:53 -0700 (PDT)
Message-ID: <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aL6Vp-3er71AJPJd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be974d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eeKOm84Awb0PVD3MLwsA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 1y35OAjY6Un_QRJ00fW0NAuiTvvsXDaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX3I3/FMIk6EXQ
 bl6Dqr0iNEaG68Y1/URnT3B6JAot4WntgLluNmCIRhxZ5wzDVsKB6ZdbXcDp3GC8z/g/pw9gtpR
 0Zwdam9Aa4wVFrZLfJgS3z5uv8d1DpwbR7dhrttDQe7S1OL4h4BvbSm8H+nZoHoiMOF1OLZ0PNR
 kb/J6M7CIV5OOYHonFMS/90oLPAwJylV+zt/B8p2239d2/oyaaMWC18BkACPoftKZWhB3ESqCiu
 7Km9fajk2pc0xU5c+atgGKJ3YUQRT8UqgDrupbACmKurSW7Pxc3ZfZgAn90Yf14OFKFGwZdEXb/
 6dNTm4WNZ69pdEEFD15iYeXHh6mnhD1Crj+YRDyqhP9Pu0pMdADYMQsbAQ2RbgYYwROMxRcpwFJ
 gJxLlfXz
X-Proofpoint-ORIG-GUID: 1y35OAjY6Un_QRJ00fW0NAuiTvvsXDaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/8/25 10:36 AM, Stephan Gerhold wrote:
> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The CCI clock has voltage requirements, which need to be described
>> through an OPP table.
>>
>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
>> (which is a value common across all SoCs), since it's not possible to
>> reach the required timings with the default 19.2 MHz rate.
>>
>> Address both issues by introducing an OPP table and using it to vote
>> for the faster rate.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Using an OPP table for a single static rate that remains the same over
> the whole lifetime of the driver feels like overkill to me. Couldn't you
> just put the "required-opps" directly into the device node so that it is
> automatically applied when the device goes in/out of runtime suspend?
> 
> And since you need to make DT additions anyway, couldn't you just use
> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
> use that for e.g. USB clocks as well.

This is futureproofing, in case someone invents FastMode++ with a higher
dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
clock which would (marginally) decrease power consumption

Konrad

