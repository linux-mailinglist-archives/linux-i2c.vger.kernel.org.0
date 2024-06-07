Return-Path: <linux-i2c+bounces-3896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D858FFC65
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 08:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E8731C26B7C
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 06:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B336114F129;
	Fri,  7 Jun 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaKJInBY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F745024
	for <linux-i2c@vger.kernel.org>; Fri,  7 Jun 2024 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742776; cv=none; b=XwPwpc/urIXJQ3gPWwhEdmXUUcMR5eqfpwY5EfZ3vohcn/MaNEE3THCD1ozgXwa6M8EQFaucBoLafHq644uQkNWLh9lpCtWzCGc4Ht1+pzjop96xxdqHcvpKPJGfcoTuMp5i19CODDAz9RgGmboqBuINKgO2fk0Cdva3ir0+Kqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742776; c=relaxed/simple;
	bh=HNv9Qs6Djj31IvEPg/GplsTToM3nXwpGglo7o2V/O9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5ow/idC1sBTLv/s28T8afeSVf2KxNULuhdFAGj0HqBDg62GjvbFyVN/ytgU+j9iqDjBDeS2TA5nosF6KlD655tkz6mSwmdcwx3lCSF8i4xlSfiJwgqiL1DyJQLPlr1e0dXZhOr06stu+lKo6ZW47EN9keINAXbNfEor/LhxmrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaKJInBY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35ef1e928c9so2081828f8f.3
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jun 2024 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717742773; x=1718347573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TgM4htnI+X4TgZ0Tu9HzazlKE8pD1poXdLHXcMZJBPc=;
        b=UaKJInBYYWxXHohcjMhISgk1f6KTYS7P4Xalxg2DtBadWjo71AQtojLL/RRAYfSDA2
         lpE3uBTIwVFiAvi1bikYZ4iA11thjPcAZ+aDc70M+gkWLB4LZbXpEjoJtRf3NXY9zY+I
         W3aQkhBlR1AiFnwhM85zLAkBlH3G73jDDm27HszcsxrXjEMDa/+Wcn9APiriYYercT2S
         29F+IODozj/R3tBF6bN30YvtKxcEXcZMWL2v2ckrIWrIBYvjwdgHsPxSd/ewr5Fa33Pd
         1ezL3+2cMXZrTdVN5/DmWvzpZSNZDYxADyrgK93LFc5uNNpyZSJ6w3FKxHvnS69KRhKk
         lN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717742773; x=1718347573;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgM4htnI+X4TgZ0Tu9HzazlKE8pD1poXdLHXcMZJBPc=;
        b=r2iMNFXrulch/Oqzl1dYAsnQabSvOYbI29FwxIeniBxVWdlnJg8c76GfcYJLpql+je
         ybGQouwO7mmVyxqM/QMUTo0+2ErcNK1Mx0dW+DvLcSRaycOjrd6dRr1maEbtYqWFuISM
         dN1O3Nsz504ISEYiPtAdZESsYG8OJBw4zprjy+9ylSLUtVv37zAgro3wDh5Xyo0k51Vr
         pa2OByHwRs36eLYRxNi6EPAa3o0o9bHuN1VX5eGqZ7xIAgjWQEF7om2Gbj06rcPhHyAK
         mLFSNgr9WeFekKN3PoNB9ZsAbNBBshBoOZjNjP8QjCCDM83KbjGP3k8ba8ZjK0txOIAw
         VBAw==
X-Gm-Message-State: AOJu0YyP8vp2+6WAzz5r5ap7BtqliCwMi0E53r2pw+VUyYtvmOEmN32K
	UHgIHdcKqzZN9zMHe2P1UugljZII/VKgqKnG8+MFY/R/us02EtrDGhpZqD2klqc5aAP8SbccEz8
	2hQNWLA==
X-Google-Smtp-Source: AGHT+IH9OxWfO16xiy/w9qCKD6ug6UJ5lS56XXORWzx+b1YzITZIZNI7kcB6tLngBoMN30NxoBzegg==
X-Received: by 2002:adf:fd08:0:b0:34e:93c1:7979 with SMTP id ffacd0b85a97d-35efed5d77dmr1461398f8f.38.1717742772977;
        Thu, 06 Jun 2024 23:46:12 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42160a19ae5sm30662635e9.18.2024.06.06.23.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:46:12 -0700 (PDT)
Message-ID: <31a9060a-aef3-4b1a-8db8-ada5e57833cc@linaro.org>
Date: Fri, 7 Jun 2024 08:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
To: Eddie James <eajames@linux.ibm.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, peda@axentia.se,
 p.zabel@pengutronix.de
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240311041412.3858710-1-chris.packham@alliedtelesis.co.nz>
 <a8f8aefa-9013-4ede-adce-0f585d3e528f@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a8f8aefa-9013-4ede-adce-0f585d3e528f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2024 23:58, Eddie James wrote:
> 
> On 3/10/24 23:14, Chris Packham wrote:
>> Some hardware designs with multiple PCA954x devices use a reset GPIO
>> connected to all the muxes. Support this configuration by making use of
>> the reset controller framework which can deal with the shared reset
>> GPIOs. Fall back to the old GPIO descriptor method if the reset
>> controller framework is not enabled.
> 
> 
> Hello Chris, Krzysztof,
> 
> 
> This change makes it so that the reset subsystem reset doesn't behave in 
> the same way as the fallback gpio reset. The gpio, as part of acquiring 
> it, gets set high, and then set low in the mux driver. So, the device 
> reset is toggled. In the case of the reset subsystem option, the reset 
> is only de-asserted (so the device is taken out of reset).
> 
> 
> I'm interested in preserving the previous behavior but with the shared 
> reset line. This can't be done just by doing "assert" first because the 
> shared reset subsystem doesn't allow that. So the reset-gpio driver 
> would have to implement the reset operation - no problem. However, how 
> to specify the wait time for the reset-gpio driver here? Something like 
> the simple reset driver maybe? Or a function call from the reset 
> consumer driver to specify the wait time for that reset?

You can check my slides from EOSS/OSSNA this year:
https://ossna2024.sched.com/event/1aPvr?iframe=no
maybe links to original work will help you.

Best regards,
Krzysztof


