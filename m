Return-Path: <linux-i2c+bounces-2320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84329877AE2
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 07:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BC53B20C10
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 06:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E928101EC;
	Mon, 11 Mar 2024 06:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xcVJtJUJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829C101C6
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710138336; cv=none; b=gy9iBWfVpj51RnGm0Ap7g9qw/lipneNfvGsXjyvJf0F65JGWD8u+LwwmIt9Ar4+TLbXZ9glZFH/G3eq6Rh9SnktIme69UEqxs5Zj7XBdS6p1M2bxm/oBhWeYgy5qUaWPnoJiXpL1Ye9z1roQs8xfCHHeo9G9cduiBH79yRxfqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710138336; c=relaxed/simple;
	bh=oORWwd9/pNfbg+SL2P5rWdApuXADnOiE87mL21mH1Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7QYr/ttirg0fcsRxR+cHfe9aEa3vrSqaIN1pD1jw/PzFDx0DJer/eStUM+0xS2iivRLhZP9bv8CP852PA9zGOGZA7UW5cNZvU0y5qE52zvZToiE85gKpsz9/2HsGoUbCOOOuHBEyzQ0CmbB0koOLwNdFMU3ZNZqOIAxeOstQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xcVJtJUJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56759dc7ea6so5027352a12.1
        for <linux-i2c@vger.kernel.org>; Sun, 10 Mar 2024 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710138333; x=1710743133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h5TULcaa4ZXu8CTo6nXooIAnI54QJKcr4hbjkmuM1Mg=;
        b=xcVJtJUJH8LWXCMl1PCg0BZTbbC24cyaJRQjzWEilTxxZ7abq0CQfgKk/LtSLVs6Bg
         APiLGXlbSa8Mt5ZYVwMvIvLfBYw5WdQMpneFQgWFhO8F9PHebktg1maatCL5T/EtvLkl
         g+DZZ2m4khkDINNMuKFLdPs9ZUqliQKNhcIMKGlqJ31MBL/9PH/aEzL7pMe0XM+RVWF/
         6AuIuUd4QsIZxL1mww5LkWcrmoqX04oH/oipqDLRgoszgTMYDTvoPUdnf4kWZnFrrMuX
         TiWJdZVLC9rFShH15DNDmONLgfgXO7w7AOuRL9RlOfl+iBt/HLjX6G/P8As0giNGalrx
         Z6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710138333; x=1710743133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5TULcaa4ZXu8CTo6nXooIAnI54QJKcr4hbjkmuM1Mg=;
        b=B9XEouMptuA6UBvW5z25OxC8C+NVHFR6k0blBoQ5oj6t2XOWSwCg7brPXruRCRM6Bs
         iz8vD1wHW1WDVkfuaaYurC4LePsfNtRUt/HlOYYSJAb+zF+8VbNyTD2WVSlhyESSEET3
         oDdXVRYHvztRDZTStK3O3fWSU/tW86+3raYs3Xn2eQ2m0IhleGpIWmvEf5Uktrem2e6O
         7J4UUCtSzQpuQ0ilSqOUGluGj43K7hzZxum1Yavmjd4vZ10k+8XYsX+bzyPC6Lt+RCdC
         Zwc0etpc2uVs0LKoIw7G9ByM9D4MdASxZZzAHr2YkzpG4PEew1luyz//lc57SyyY9H40
         DC2w==
X-Gm-Message-State: AOJu0Yz73VMZZwUlanQ3oAWO6DcRBHb2WAc3b5IC0sh0MMGyzO24sptM
	xIQ/hbiss7Y5GIHcSBJqgdI6bEuwXIYeUuNm7ytD0B6YYDBPl7sOEOImDHB62Xs=
X-Google-Smtp-Source: AGHT+IFcXwS90/bSIdV+m+i42FNV6Z75I0TuwTzCdK94SmkEuirQ1/P7A5jMYsjFubIV9KdTupRzPQ==
X-Received: by 2002:a50:f689:0:b0:567:6a66:d103 with SMTP id d9-20020a50f689000000b005676a66d103mr3946948edn.0.1710138332752;
        Sun, 10 Mar 2024 23:25:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id e12-20020a056402104c00b005686037bc12sm510919edu.29.2024.03.10.23.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 23:25:32 -0700 (PDT)
Message-ID: <6785b149-a2bc-44ea-aec3-8477222d338b@linaro.org>
Date: Mon, 11 Mar 2024 07:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, peda@axentia.se,
 p.zabel@pengutronix.de
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240311041412.3858710-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240311041412.3858710-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2024 05:14, Chris Packham wrote:
> Some hardware designs with multiple PCA954x devices use a reset GPIO
> connected to all the muxes. Support this configuration by making use of
> the reset controller framework which can deal with the shared reset
> GPIOs. Fall back to the old GPIO descriptor method if the reset
> controller framework is not enabled.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     This patch goes on top of Krzysztof's series adding the GPIO based reset
>     controller[1] which will be in linux-6.9. With this I'm able to
>     correctly describe my hardware platform in the DTS and have the resets
>     appropriately controlled.
>     
>     [1] - https://lore.kernel.org/all/20240129115216.96479-1-krzysztof.kozlowski@linaro.org/
> 

Where is the changelog? It was v3 or v4 already? Where are the tags?

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


