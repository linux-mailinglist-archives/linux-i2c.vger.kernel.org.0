Return-Path: <linux-i2c+bounces-13590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0CBE40E9
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 17:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE633A6471
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 14:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B683469E4;
	Thu, 16 Oct 2025 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HiN9j2zB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2096E345752
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626753; cv=none; b=FRsP3D5cudg4cU5OobdErTbhZSEs1vD4nt+GUPikyTpyxtqyNgwhf5ZzPWaLcoObmF65abN4y14SlnuV7bTa6ZB2HWufn6r/OIlok8EbiChDCPZsbDqocAl68AzuTMqqLlBvdG4GhKty6CespSXupzV6R929ITcf5M0LIC45xeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626753; c=relaxed/simple;
	bh=aqoyK5b4pV8L0+QOWtOd8nJmahq+LYPH19Z5q3W5EyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INp8cjqFN+yZy+qrNbBjVB5Db0oKOIZWwKG1sthwMT+RZ8bnZNT9LVz1L6V0albwTogxgZhH6J1T9StWHpX+J3EdKuBM1iVMmzlw1oHoLMsXLK/6CuRGe2Y8fO5zmDdOI6zkXU134k8QhNYutCLFyHJi/6VqJgMDN5CWV82x1Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HiN9j2zB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5903e6fc386so126221e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 07:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760626748; x=1761231548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3SCwf4QRuIuRCKS4d3mSdP9dIfExgcs4ZcKTP0uVC8=;
        b=HiN9j2zBvYHcpFFU4vMtcBGHlVjh7Vj+59BH7QPNBwJGin4FqNBswoK36npdq/VaKt
         rnq6kDvIe/NC0Dc9jpagBwMtWCNIWDa+4w0MJojA5OLwXjx3jIHIVNPSH5QQLV4RzsDe
         IpRjhlpZL3p61MD+2YcbI7gjZOTKebWJFK80f9eiarq/mB5eVL60LPYCcKKYQkIrsaPI
         xYzzc6Ey4u0CAYtHN+viHWzv8Iiw+oFrad0oglv4xOmkRQIt31AJ7Z50GAtOyE0a4eDo
         sCd2NLlOLz6ou+auLKJVUxLJFhzDipgBytREaEucrLxRzXM0OpceYtoeHtw/Kibr3q5p
         HPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626748; x=1761231548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3SCwf4QRuIuRCKS4d3mSdP9dIfExgcs4ZcKTP0uVC8=;
        b=OeA7UWeDdFlTGK8M1k9skZGGbjGD4gMNy8zawgS4Wlv31cxu8JI/QSP++iAKH5B27e
         FlanRZ8wNUT1TmJZmL01g+fI7yOQtuCWXmGkG5+JZiq7LxQ4AZw0injmir6K8WALYLg7
         bAxbOLDIK8KxexpCGGWbNAlSAy0EQytJv5m1Vp9SQSs/sJXwqw70LKf5ez+i/10s729O
         4Fnw0GWUfskS8rR7/iYYMuYO1czisFEf1RiHgFLyXcVgO4+1Fgd3+0jLc4vq1hMmJmyZ
         19qHMdxymSyXLOT1CyxEChkD76wXBJcGFk/ZAp9R3GlkvwxtdDkwbH3YVGHTyG2f9poh
         j/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvWIcHH23PWJ1QzDokxICV4MoHX6zESc9tdGsNuhE/VsaSFTletG1mG67/Bu9CLQMBLzioPLfBduI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9qVoq1Xmt8si85qx6tpvkEh2n+LTIgS+s4/SeztYSfU+C1MZ
	YxKVh3TUTBzj49edvq5PqV/Bjpb5VhFGFPYGD9ddhY9a5PQMnXwB1pslNPNjYXVXsbE=
X-Gm-Gg: ASbGnctfSxTUmFd6kRnuYmg4hBO75ssykGFiXoZQwpI2XxvqAtyP4N2KjyJ0sASP0W+
	8AjyFLXa3rgunSvtbwbWXIYuu1bp8J+JFHg+WkD4RqTpjfoOd0u/hcx/rMFT9tFie+Spkd+du0U
	lsipCwZTIR+S6HNNZev1mBv37UqlqRkRMnQz3Jn3fmyl2gR+/01uCBnLslBSrssRbv+hTfHlV+T
	hc47db7+iU7E2P/6tl5iQ962keO8lvW2vTn1ei6ISYm0jkoccOcsg4J+n7OlyC9cFYGEkp6uYP5
	HoYnvlV7sQE1POfFyRL7rYMqyEUlt7C/I+CMHkO+F8PFQx6uYOhGt4EJDizG6Asxw4jFJ3U7KAf
	IG5xM3ZkefYE6rLz25Fz4+VQ+39qFLiq1xZtQnskaLwlwlCTnxE8f5RF96HMK3IgXYmZCeJW/eu
	KfEy0whf6Xnowz+WLEEu66DNKMeFv7bcfgP2QrlB3dftZoqxCmq2mqgSjcHjnqBrDyx7SsQA==
X-Google-Smtp-Source: AGHT+IGdNDgtmwm6+LARkC9Pg+AOicIgMi7tFiszGJ9W+MAY//8AYywpy9+uYECJSeW8kXaGcH2ugw==
X-Received: by 2002:a05:6512:2398:b0:55f:433b:e766 with SMTP id 2adb3069b0e04-591d874d51fmr56008e87.7.1760626746704;
        Thu, 16 Oct 2025 07:59:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908820d20bsm7161649e87.54.2025.10.16.07.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 07:59:06 -0700 (PDT)
Message-ID: <628b0080-9977-4230-85ca-8685562e3fa6@linaro.org>
Date: Thu, 16 Oct 2025 17:59:04 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
Content-Language: ru-RU
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 15:22, Loic Poulain wrote:
> On Thu, Oct 16, 2025 at 1:50 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>> index ee08dbbddf88..09b29ba383f1 100644
>>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>>>>>      return (!strcmp(clock->name, vfe_name) ||
>>>>>              !strcmp(clock->name, vfe_lite_name) ||
>>>>>              !strcmp(clock->name, "vfe_lite") ||
>>>>> -           !strcmp(clock->name, "camnoc_axi"));
>>>>> +           !strcmp(clock->name, "camnoc_axi") ||
>>>>> +           !strcmp(clock->name, "camnoc_rt_axi"));
>>>>
>>>> Just use camnoc_axi for both. Look at your bindings - why do you keep
>>>> different names for same signal?
>>>
>>> I think the correct question to ask is:
>>>
>>> Is camnoc_axi going to represent the other (NRT) clock in this
>>> setting?
>>>
>>> Konrad
>>
>> I'm - perhaps naively - assuming this clock really is required ... and
>> that both will be needed concurrently.
> 
> AFAIU, the NRT clock is not in use for the capture part, and only
> required for the offline processing engine (IPE, OPE), which will
> likely be described as a separated node.
> 

Does it mean the clock handling should be removed from QCM2290 or
X1E80100 VFEx resources? Has it been tested/verified?

-- 
Best wishes,
Vladimir

