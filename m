Return-Path: <linux-i2c+bounces-3002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227128A8A01
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 19:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5AA285E39
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 17:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2ED17278A;
	Wed, 17 Apr 2024 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNhHx0Xq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AEB171670
	for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713373820; cv=none; b=TUtxAYvvHWpsIqGjpBJ7jS1bu7Q4AxKS3kGeWWacgfdcZ6WOygXZnKDte+xpkArcshjJr5fzczY6r113Db66isM6SFbtiPA994PlFcdIPdgLwfafpBcevTzd1luZ4OoOuFjdDTBqSOu++LAJ+CpPHfuz9gthzlZu5x+79p75oaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713373820; c=relaxed/simple;
	bh=LCvGS9UepmCWHpQ88fEQa2EXKGS1vIm8XTR6gb5r0BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nmmho9LTG09psHoJ1BPRQQR9pEp5qxI7D3zkD0OcTnwW9J2m1k5QivmPhsDKWcR45l/v6i0MKaV49vELxWPCV1KYHmx9fi2R3Y7w6wKuVMol4Be8ouvXYbvaB4+vVKmfzUptsqcD4/3SCGE4nIeqCs7O7023J/mpk0vADC1fWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNhHx0Xq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e3c3aa8938so37499925ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 17 Apr 2024 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713373816; x=1713978616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FUzDJY7t9H7U+uIUYVqmIVsezT70evHGuhSl2xA7NDc=;
        b=QNhHx0XqzfVjZGdzlMCDPQjopN0MGC2KLPWqURrUWR4CRW2JLLLDgpxmznzGbJQydm
         QE6eL/fxw7jh/4q8Y9vU9YeF3CvK3ZoO4zA+G6/rLYR6vsx4dyOPgd+gQuoO4GMiRNds
         TTwB2oSbCU2yPs0R2u13yzLhtMyoCP4/l2FRMbLFSkaT5tHvRmIK0h+jrg5B4fnIbYFJ
         rf5O5jqa8tQGOE34ZAPzTdHr/TyQdL1bFGgSMsKTX2OIPV2qc5BKveI9L6Ax7hyv9wFt
         ws6wjX8qs4OoIPqGDKoITGmqaLFPG5PVd3XQ4mYg4q/Wz//tx5niAhNe1PMERiJ+g3aF
         xBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713373816; x=1713978616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUzDJY7t9H7U+uIUYVqmIVsezT70evHGuhSl2xA7NDc=;
        b=k4bRJ9yxvcEZqXhbDZjzr8pWdCODqFJvdvKrCSm3uFOO7Hl7dqiZpQ4dpcus4Fs4N/
         Gv3yOhzOh84OHIOdT5edeFl7XdCKnfpMQev4tP/OuFSUmwThfR72/AB26h5d4nKsty05
         2PxAtD0W6sa3++izLqI1X4Nep6wzUi2oRF9QPCTNn2Dx154xGLfrAqzZuTIWvn+u6IpB
         21ITrOsgBRpcHPI7D6NnvCA0qpvro/u9ikadTK2M6GsQk4yV0aKS3CV1hOaOo2a3ZRQY
         l13PwHbGqRvjRr617NhUwhIXXh++AideFKlGOmBbkMz2XyD+om49JguG2+PElbQnbntj
         SQMw==
X-Forwarded-Encrypted: i=1; AJvYcCVCToU0MLlbY460I3h4Ey+fMF510wZwYEAkls0cKqCft6PU5r+cLmBfR5YkcCj6dgrkbqqI4EvOC9wYbEgehKJgjKg7MDaZ9ckw
X-Gm-Message-State: AOJu0Yy59HC7zj7Agsejuummly1odiLUvvLk5wPUUJqofiyJ0tSbR4zt
	d6+1TyzJ+bafq1cvUj7LX2ygOrPSC5BSwMcQ3i8zlyX+NzrBesz2oXCwEgbPx24=
X-Google-Smtp-Source: AGHT+IH5PV2K/cfOZAuGQxOdypxVU3UbAHnIhIC9mRywjS+TQPh9qv3pbXlB2e33qDT/TIHIqPM7cw==
X-Received: by 2002:a17:902:f7d5:b0:1dd:bf6a:2b97 with SMTP id h21-20020a170902f7d500b001ddbf6a2b97mr62194plw.60.1713373816426;
        Wed, 17 Apr 2024 10:10:16 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.151])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902650b00b001e509d4d6ddsm12046145plk.1.2024.04.17.10.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 10:10:15 -0700 (PDT)
Message-ID: <294f9048-9756-4d8d-b770-ebaaa4023c54@linaro.org>
Date: Wed, 17 Apr 2024 19:10:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
 <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
 <8a8a8e8b-8256-4d33-a39b-9e3cbc4ccff2@arm.com>
 <4e762eb1-864e-4bb5-ab5d-debeac19c8fa@linaro.org>
 <Zh/Tmarryr4TzHIA@shell.armlinux.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zh/Tmarryr4TzHIA@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2024 15:50, Russell King (Oracle) wrote:
> On Wed, Apr 17, 2024 at 03:29:26PM +0200, Krzysztof Kozlowski wrote:
>> On 16/04/2024 12:41, Suzuki K Poulose wrote:
>>> + Greg
>>>
>>>
>>> Hi Krzysztof,
>>>
>>> On 30/03/2024 18:00, Krzysztof Kozlowski wrote:
>>>> On 30/03/2024 18:58, Krzysztof Kozlowski wrote:
>>>>>
>>>>> On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
>>>>>> Merging
>>>>>> =======
>>>>>> All further patches depend on the first amba patch, therefore please ack
>>>>>> and this should go via one tree.
>>>>>>
>>>>>> Description
>>>>>> ===========
>>>>>> Modules registering driver with amba_driver_register() often forget to
>>>>>> set .owner field.
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied, thanks!
>>>>>
>>>>> [01/19] amba: store owner from modules with amba_driver_register()
>>>>>          (no commit info)
>>>>
>>>> Patchset applied here:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/log/?h=for-v6.10/module-owner-amba
>>>
>>> How do you plan to push this ? Given this affects most of the drivers/, 
>>> do you plan to send this to Greg ? We have changes in the coresight
>>> tree that would conflict with this "tag" ( I haven't merged them yet, 
>>> but is in my local queue). I want to make sure we can avoid the
>>> conflicts. I am happy to merge this to my local tree and base the
>>> changes on this, if this is going in for v6.10 and all are in agreement.
>>
>> I pushed it to arm-linux patches but it hasn't been picked up.
>>
>> I propose you take entire set then.
> 
> You are again being, IMHO, abrasive with your attitude. So far, every
> interaction with you has been abrasive and bordering on abusive.
> 
> You haven't asked me whether I will take them. I will - just not at the
> moment because 

Thanks for confirming, I wanted to ping you because there was no feedback.

Can you provide stable tag for coresight tree?

Best regards,
Krzysztof


