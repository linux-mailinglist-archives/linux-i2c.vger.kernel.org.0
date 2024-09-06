Return-Path: <linux-i2c+bounces-6317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C377496F4E3
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FDFF1F253A6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF6D1CDA31;
	Fri,  6 Sep 2024 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCc2uuLa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B11CB330
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627637; cv=none; b=g2GlwB9TVTbRTQVhO4IwkWJFrtn4MU49jm8gVP5h2kqUgR0EkK5sqBS8YdlL4VvbmHpq61DZGbzksdU/6zrmEb/z0GNOeQrp9/rb0ecAyyK7627079gA2XhU1gbiS/+jE4wrxYfKAfFec9fWGfUwra9Fu2zqxaht8AZGTHWBGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627637; c=relaxed/simple;
	bh=a3n6h+tmjlmVA4Afuyy01EvnM6vGCqk59VkMNlPDoxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKfimJG4VUjqsFB1DH8rGCBUoZhFuhS21IiEN/9HiXv1rOsSWHQ7UT6qy0NqQuiBhijbiSnfcyoCybV9ds+c/BtvnngQ5V/N0qHw3Lag4EySpDtCAlHKAKDKrOSANx+ScHyfzdCZ/X84SzGElRKsZGUOH3wPAI5GrotoRaRPc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCc2uuLa; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53658e2d828so137501e87.2
        for <linux-i2c@vger.kernel.org>; Fri, 06 Sep 2024 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725627634; x=1726232434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HldWfppnPmR7E3ewI2SdbP6fmafd7q2H7imYAtRaLo=;
        b=GCc2uuLa1lVY4mSDdkzNUD9eoBqS3S8LqAsSF9IjfTVrHsby10gmkQggMhho5X6NxV
         HoUTf10QmGnofQl/R+V98RLhFGEAO1y4hfGomvNLCqRNSzf6scn8AEJuDMXF0EvyiHIy
         lx/XJurbyttNVmnWDlCIy4Ia2Tif4ItRiVIORYbzFa0CQuupxGjzeuAxFMevhuSh4OGG
         Q+Y1+51ulq2EEzqMJ1GbJlAM6eYIgUDjRWPGA/pMc1MF1idyaVrYZ7VB6yPW1N4YJ/jD
         TQLThgFhR8IwlHPvxfTsZn2TiUYiirJKAWMMzdlLZx4q5ykDp0lgyCzVV6qX5y48/o/S
         yzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725627634; x=1726232434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HldWfppnPmR7E3ewI2SdbP6fmafd7q2H7imYAtRaLo=;
        b=s3EnXPlwDWvMSr49FbDGcYGIWeLlGuBp7fUZravAG3P363D46wI3F/L5Hu9gDorhvH
         zUilXWtUKTz7re3QyEALfQhEr5TibzyTB0h4FfbsP0vkELBVMvYyNKNHV7yvYCAK0kG/
         xBQP0PViM9Hwhr5xCn2PxD+Zni+R2eGAfWI3dAujQsO8ak2IHvWLNnS/AiMapVlEUWbK
         s6DuKHnn5+UTEgFp/WqxRHEbcTWIvAb6psFhPgsoztox0AebUcWlCjygJtpCoUFofale
         RRYjMEJoB9saDRWjv3uw/0L4hQpT0B5mjPH1Bizby4xG6lIeFhiEpvzxhWzsUKMaIjhN
         sHew==
X-Forwarded-Encrypted: i=1; AJvYcCVcbxje0ZKP0+L1+HEqCv3EcATP0FW28XzuO4AcGGK4qH6ybZEvq+GEbeTjxtD4ZolPmeRd+JGPSGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTEXDxhDJd0dmpWll23UqgdNmn6/ZR/HleAaQuD9o2wiPqPM0P
	kuZm1tAz+8cfPQMnaBBRB5jSfPsexBDZ520Fr3GzMyLnioBZd4JwsBNdMPvK3zc=
X-Google-Smtp-Source: AGHT+IEPgCZe7nIoVPCspseu508VwlLQFUeA/X0Be0jNtg/3vmAW2na6nGzOrDVGstjDu5h3e861tg==
X-Received: by 2002:a05:6512:3d1b:b0:536:55f2:2ad0 with SMTP id 2adb3069b0e04-53658814568mr887069e87.9.1725627634001;
        Fri, 06 Sep 2024 06:00:34 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53569ee732fsm624590e87.156.2024.09.06.06.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 06:00:33 -0700 (PDT)
Message-ID: <a27adb94-5280-4213-a532-0dcc907f80b7@linaro.org>
Date: Fri, 6 Sep 2024 16:00:32 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
 <ZtpqrANbJurWNOzV@radian> <5c58b41a-7fc7-456d-979c-edb8dbe4305d@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5c58b41a-7fc7-456d-979c-edb8dbe4305d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan, Richard,

On 9/6/24 15:19, Bryan O'Donoghue wrote:
> On 06/09/2024 03:36, Richard Acayan wrote:
>> On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
>>> Hi Richard,
>>>
>>> On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
>>>> This adds support for the camera subsystem on the Snapdragon 670.
>>>>
>>>> As of next-20240902, camss seems to be a bit broken, but the same series
>>>> works on stable (although it is much less reliable now that the CCI clock
>>>> frequency is not being assigned).
>>>
>>> I am not understanding this bit: is this series making it better
>>> or not? Can you please clarify what is broken, what is less
>>> reliable and what works?
>>
>> When applying this camss series and some camera sensor patches on
>> linux-next, the Pixel 3a seems to hang when camera capture starts.
>>
>> When applying the same patches on stable, the camera does not cause the
>> Pixel 3a to hang.
> 
> Right so -next isn't stable that's not exactly a revelation.
> 
> 
>> When these device tree properties from the previous series were removed:
>>
>> 			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
>> 			assigned-clock-rates = <37500000>;
>>
>> the CCI would sometimes fail to probe with the error:
> 
> Right, we don't have clk_set_rate in the cci driver.
> 
> Maybe just leave the assigned clock for this submission and we can do a
> sweep of fixes to CCI at a later stage including setting the clock
> instead of having it be assigned.

first of all it would be nice to confirm that the setting of a particular
clock frequency is actually needed.

Fortunately it's pretty trivial to check it in runtime with a temporary
modification in the board dts file, namely disable CAMSS in board dts file,
but keep CCI enabled, then simply scan the bus with a regular "i2cdetect"
tool in runtime.

If i2cdetect on the CCI bus works only for 37.5MHz clock frequency, then it
is needed, otherwise (and this is my expectation) it is not needed neither
in the dtsi files nor in the driver.

>>
>> 	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
>> 	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110
>>
>> On further testing, the rate can be set to 19.2 MHz, and there would be
>> no failure (or rather, it wouldn't happen often enough for me to witness
>> it).
> 
> That's expected 19.2 and 37.5 MHz are supported by CAMCC for your part.
>

I read it as the setting of 37.5MHz clock frequency is not needed, please
correct me.

--
Best wishes,
Vladimir

