Return-Path: <linux-i2c+bounces-6315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D109296F420
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 14:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D70E1F25247
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 12:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928E31CC8AF;
	Fri,  6 Sep 2024 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vs9z3/VQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8631CB14E
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625149; cv=none; b=HMTB7zPBI4U6xuhoyvXTFalO/xEGidE/G08xecPB3vxjYbyDEVN/xr5hQnAnIvCpkXFsjKv1pA9YhrqU6nx+PUHjae3S5M3S+eLPvNUX3UnrJaIvRlUYm4v/fdF2cCeOXucdmZpaYVnDzrBZZbzlAvVN68yi4cuPrpJTT5ZezJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625149; c=relaxed/simple;
	bh=HqOSDRzaUnhGRLIxiVCdBa6LDvnvu4v5GyRQUYJsm/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoXtVoyfYZGvfXphqFEVHWQqVWiNtWAdHu18IkDuG9OdFg7MxpJrMTVBR/Dsm1AtIdPVVQjDf7xdW/hpj1QO2bJaxu48KwamPzI7l6FrZiJznyZP+UyQHbXCdeZ7NodvjgQCmpoz+mJ0tjEz5+hNgQ43daSQO1xJj4IVR8lwnT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vs9z3/VQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365aa568ceso500543e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 06 Sep 2024 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725625146; x=1726229946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZnagyoqEY/AkJWYldk9pxOfEXujNgZibP5iAapvYX0=;
        b=vs9z3/VQWSG+WBTY9jfLRmKAy1vxB3i/pq/dugye5DTrHoHdP8afzUbnF/7nVdGPtG
         4FQT6T4TQ+U7cXqUalUxnk0K5u63OWwvIH9eTjxteO9O059pGtfCae0iG3P9M6KCb2EH
         LBdhxyPkxRmcK3aak/g3Sxu9yGuSiJQN9Kgo1EwMuD+Lu+FoZDBp58q4u/p2fqgRGTCK
         vBTyUaiWP6X804KARU8LiOpw4GFnb61ikgVK1FDT7w/JHviwDktHCiLjOVpv2TrIo0aa
         PfgUWc99xTIo/ffMZbdCpu6Ry49ouGD9hinnG9Xj2Ia4DoBLtQuo366Tkg1tFxwIM1ma
         22sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725625146; x=1726229946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZnagyoqEY/AkJWYldk9pxOfEXujNgZibP5iAapvYX0=;
        b=W4h84eS6OTku8/VkXEr5oykx6n9HEwUrPQ8htlwtypfw8Zgjy0Qu6/eUk88Rt80H0n
         et4QwrLcu9TrlBoK+njR2WB2CvBcBylkKYDKadVqLZEeDwHfDSm99QjmvkPIYwt7gpQK
         HB//ZBtAPzISF52cWmEm4i42zDBXo9MpHzovbhddn6vVjigqDCtdT5eVPnoTo90DUS6N
         1XmQBKfQanRpNN2I6shldKyrPJetUvtL/RMdiMV+vqhqCUhw0gVQ32bPfOSEQXaDBYa8
         +0pOxtmZZLWXl1fIK2EVTmEsgHsbAKobiQ+KJyYcVAXkiYY8Xop+gstx7ozFAiLG66d0
         JlqA==
X-Forwarded-Encrypted: i=1; AJvYcCUyayY5QXWGGvnlWgFFlD3TtScX0PwgYI7i+AE4WLcu/2/QrphB2KPFp94NgY1XQ3ge3EHB48azi6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnsgWNSkW8KaPdTxkgOK3SsaVGZOLDmQ2Z2Fjkp7XO5gz6MJp
	wKdmbWSYRAUj79ST1BJ0SQ5SdPVMAD/Cj6/VB/IKfebinqBaPo7vNd78Wrn9U50=
X-Google-Smtp-Source: AGHT+IG74zIVOWX6bQluN94U4nrkIyRLMi3pWfBQY/TtSYoHYIc0SP1Bhu1/uDRSooGa/P5qsj690Q==
X-Received: by 2002:a05:6512:3e02:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-536587b54efmr2266960e87.26.1725625145620;
        Fri, 06 Sep 2024 05:19:05 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a83ed05c9sm117085866b.114.2024.09.06.05.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 05:19:05 -0700 (PDT)
Message-ID: <5c58b41a-7fc7-456d-979c-edb8dbe4305d@linaro.org>
Date: Fri, 6 Sep 2024 13:19:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
To: Richard Acayan <mailingradian@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
 <ZtpqrANbJurWNOzV@radian>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZtpqrANbJurWNOzV@radian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2024 03:36, Richard Acayan wrote:
> On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
>> Hi Richard,
>>
>> On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
>>> This adds support for the camera subsystem on the Snapdragon 670.
>>>
>>> As of next-20240902, camss seems to be a bit broken, but the same series
>>> works on stable (although it is much less reliable now that the CCI clock
>>> frequency is not being assigned).
>>
>> I am not understanding this bit: is this series making it better
>> or not? Can you please clarify what is broken, what is less
>> reliable and what works?
> 
> When applying this camss series and some camera sensor patches on
> linux-next, the Pixel 3a seems to hang when camera capture starts.
> 
> When applying the same patches on stable, the camera does not cause the
> Pixel 3a to hang.

Right so -next isn't stable that's not exactly a revelation.


> When these device tree properties from the previous series were removed:
> 
> 			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
> 			assigned-clock-rates = <37500000>;
> 
> the CCI would sometimes fail to probe with the error:

Right, we don't have clk_set_rate in the cci driver.

Maybe just leave the assigned clock for this submission and we can do a 
sweep of fixes to CCI at a later stage including setting the clock 
instead of having it be assigned.

> 
> 	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
> 	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110
> 
> On further testing, the rate can be set to 19.2 MHz, and there would be
> no failure (or rather, it wouldn't happen often enough for me to witness
> it).

That's expected 19.2 and 37.5 MHz are supported by CAMCC for your part.

---
bod

