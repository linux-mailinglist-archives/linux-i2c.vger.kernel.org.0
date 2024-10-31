Return-Path: <linux-i2c+bounces-7681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 885789B7A24
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 13:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 240F6B2485E
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 12:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BDA19C57E;
	Thu, 31 Oct 2024 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aX9P9aSx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF319C57C
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730375991; cv=none; b=kRI4zpjk1lJC4QDOMPPKc4tuiRGL9d0p3LY/HvwQBAhUzLoebo9uIq0CCLBiNrucGPYXX3sB4hOI/t5QW+9wvsZ1s0gYu87DMLTHEVoGt+zniPG6TRQFfL6Dmsx/Aod6AHUrE0yINlh3RTA/3rNqLoVMfwPUeq0Oc5/cSAwn5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730375991; c=relaxed/simple;
	bh=iK/xdl5TEMJC8zzGdUkSmByIVGGyGuPcv58w7uMiZ0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSSThgyPvqDfAUvm3+a3JJduVa2W5THJi0yrSwQsoQwXFpQv9bePJkOyRdLTjRPJKAcqMWcJIACukc4Tg/6avO35nYrQVsZX0QmHSQ/ly+kWBH3cU0uJB0srsISTpqpgnrycPbSrVyOsoHXJ81ryKdXR81xa7d1Rn/RpxS890zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aX9P9aSx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f0802bf1so101827e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730375987; x=1730980787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZDHiI2bQmYIGIWgV0FNXS5KpNYpFDI1iWLEjkxYejQ=;
        b=aX9P9aSxbXYKOlGcQ8/yJq0n1YtwW5sBSXseMlYgoJo0O1a9rL/HT02M5oaKcpQZJN
         wboBUDD3X+zyMwNE59925+eBB6J//vvhvrYemMu6byOtY74n+y37xR2MW81fU1W+6us0
         cGrIzynsAiS0Wh+4A4fhz9kRX6q6pz2GnSiXdQwmSORVvqtf+wSm8ArZIXKipecdCA1R
         XgzDMLJPc6gzzOJAYW92AsS0b+xvcdawHGbD1X7jxk6hQ7FOWCeAI0OUIyCywPmM5ujz
         yiwCM2xcqSTU/iI4qRXp4gdhCF/8h3lBwvw8RDFzqySKEAsAAM4O2ZpNXSqhBnOgnwIn
         42kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730375987; x=1730980787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZDHiI2bQmYIGIWgV0FNXS5KpNYpFDI1iWLEjkxYejQ=;
        b=vyZN7lH2NiBOu835IDQAiJshcqI/H62N4UtxUF3Taf4a2Anvuq6Q/bfcAPOnqvtxNz
         FI5+fHmzVJ/GrZ7VPCL1ZDbJTwoSyWWXL4APHGZmlPdtMIPylGC25UOdkZjPf3Go0sNd
         H60bn1J7OxWVwBbxm5tqDqxUZE1lLgG8nD5hNpDIHn/Bi1PhWGS0izlMlZGm9gdBV9Ev
         npAJvmmW9xMdwmK+dYzLyheW8H4oGN2RZi3EM2l0x3hy+NWdH9LO5bGzWTArefEKSROD
         mfn733rAydupqULk+2PhDpXuASofOXj+YJGgBLi9y/U/m1ekwzJIdEWorWW0cbphpEER
         kf4A==
X-Forwarded-Encrypted: i=1; AJvYcCWcXIbkJ4SEDVmodRgr7XUbj/pYYGxKMS1T2hlO6spIrtYSHMqThbgigYN/UtBVVofjv2d97sC+BD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDE7jejj+Yl9Z374NLVFim76+iRYr+icBPAAwwf22z4g37iUcx
	CrcfOttfLBa2cEUmMm2FT8GRZ89kiZgqbN+qGwqYaahz4Wjve+gNmrFszPlBBM8=
X-Google-Smtp-Source: AGHT+IHj7Xs5nkmiifWpaojGq05sh/McD6Tj0j++Q+ojG1Exl9FTwAuminrKv0akgHFaBZ50hA1W/Q==
X-Received: by 2002:a05:6512:1386:b0:539:f67b:b859 with SMTP id 2adb3069b0e04-53b348cb00fmr3249913e87.4.1730375987313;
        Thu, 31 Oct 2024 04:59:47 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc305sm174599e87.227.2024.10.31.04.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 04:59:47 -0700 (PDT)
Message-ID: <e1c55403-55ee-4742-b7e6-8f0a4387ce9e@linaro.org>
Date: Thu, 31 Oct 2024 13:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, loic.poulain@linaro.org,
 rfoss@kernel.org, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
 <rql2u5k3esavdmpdzgo4l4up4ir7yjpdzc3qlmsvjvqalqzvjc@xspprcohlout>
 <f06dea2e-893b-4de5-89a3-e25af56afb31@linaro.org>
 <7f5amyf7ljvtfjyksfe7cad25wu7qdg4e45mdite6bdxx63ge5@ov37ohc7qtai>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <7f5amyf7ljvtfjyksfe7cad25wu7qdg4e45mdite6bdxx63ge5@ov37ohc7qtai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andi,

On 10/31/24 13:41, Andi Shyti wrote:
> Hi Vladimir,
> 
> On Thu, Oct 31, 2024 at 01:13:24PM +0200, Vladimir Zapolskiy wrote:
>> Hi Andi,
>>
>> On 10/31/24 12:44, Andi Shyti wrote:
>>> Hi Jiapeng,
>>>
>>> On Tue, Oct 29, 2024 at 10:09:31AM +0800, Jiapeng Chong wrote:
>>>> Variable ret is not effectively used, so delete it.
>>>>
>>>> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
>>>>
>>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
>>>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>>>
>>> thanks for your patch! Applied to i2c/i2c-host
>>>
>>> Thanks,
>>> Andi
>>>
>>
>> FWIW I've noticed that my Reviewed-by tag was added to the accepted change,
>> while it was the conditional one... Actually I don't know how to be aware
>> of such nuances, if only b4 tool is used, likely there is no way for it.
> 
> I thought the change that made your r-b conditional was the
> Fixes tag, right? That is added. Have I missed anything?

ah, no, it was about the copy-pasted commit message, which mentions a much
more popular 'ret' local variable.

> (I noticed later the v3, but it's basically identical to the one
> I pushed).
> 

Well, I believe my concern about a commit message has quite low significance,
so let it be kept as is, the most essential code change part is untouched.

>> Hopefully I'm not too picky with it.
> 
> Absolutely not! Please, keep pinging me if you see anything I
> might have missed.

Thank you!

--
Best wishes,
Vladmir


