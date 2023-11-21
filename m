Return-Path: <linux-i2c+bounces-368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A90C7F2E66
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 14:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6947A1C2182A
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 13:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4014E3986D;
	Tue, 21 Nov 2023 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2aH3nfN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5D6D45
	for <linux-i2c@vger.kernel.org>; Tue, 21 Nov 2023 05:34:35 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso756813966b.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Nov 2023 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573674; x=1701178474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WK+C2Y8Rt86x7zpHxQcNYl48dK8RCXicMXMq80fMJeI=;
        b=L2aH3nfNAfGfEFQF9Z/yXsxxAK1IuzSvkKSkEJCcDZoc2J3Jae9v7L8My5svU7EYpW
         4IGlSbiuQXhBUhtGu/Gyp80AR0o8KS8I7X0u4+bmWtj4SA9Sj2geTjUvmSL29ys+xa7T
         pNpPe9VwL8gcNjQ1r6n5DdTZTj2asgOWtcYOiyQ4T4FhLyVCHYBTr4rZUJK//EiudiqL
         Jbv8jdr4dlSA0QARcqSUzjdvqrC+SsyxpFnhrGUKFlVKe5keBc1X/K9wdS0FzuaO/Bzk
         IyXL4tMgiF8HCLKXwRzPSDTyjtgY9jT+82vovUgJYSLCQ/jOLCQWbZMPNGgQyGTVOv33
         734A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573674; x=1701178474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WK+C2Y8Rt86x7zpHxQcNYl48dK8RCXicMXMq80fMJeI=;
        b=ChvqM+63FaeDWq3M45/ZszPJk2Q6/8x81B/WQCz6/GCROCVtSav7hjsHkKwrBTDC8+
         rA95BZegIXDkk0RtAtxeGBEz2UJJ/+1xGSu8GlIvIm1ByxukB7XA5ryOnNwPJMKUb6qr
         r1TOq2xMrRvdPGLS9i+bs3iOW9Z7jb4pit2rimF+LnJ0SVmqSGo+Sdu8EEsQqSlIOV8e
         Ctwf/PnOZoeEPFHVtfGhEBkAnQYblNU4bF8hOsfFPYP52hJLK9iGroFs+JfdN8RacIxN
         ToXTOWo07mLBC8UNnpovmeADYumdKOUPnkzCYguE9aO2YcTyE9/PF6fwFdBm5iHImTkT
         0hEA==
X-Gm-Message-State: AOJu0Yy1I7t84Zmy0dEYzKTfHdWRbXe4XBaqySA+1D/02y5rbJm/BrdK
	wSZU8rd830iPVCOiT+oblA0=
X-Google-Smtp-Source: AGHT+IHQ8dKHYp+Ht4pLDHqzQiQOupryullii3ARZoApdnzW1Ug7aTyKZKBvLC8lU4md2NbA2Xop5g==
X-Received: by 2002:a17:907:20dc:b0:9e7:d1ab:e90b with SMTP id qq28-20020a17090720dc00b009e7d1abe90bmr7947089ejb.19.1700573673463;
        Tue, 21 Nov 2023 05:34:33 -0800 (PST)
Received: from ?IPV6:2a01:c23:c095:ed00:bc3d:5c69:4067:a24b? (dynamic-2a01-0c23-c095-ed00-bc3d-5c69-4067-a24b.c23.pool.telefonica.de. [2a01:c23:c095:ed00:bc3d:5c69:4067:a24b])
        by smtp.googlemail.com with ESMTPSA id fy11-20020a170906b7cb00b009fbce971196sm3515621ejb.111.2023.11.21.05.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 05:34:32 -0800 (PST)
Message-ID: <631925ab-c117-411c-a150-5ab2a4dc8fd7@gmail.com>
Date: Tue, 21 Nov 2023 13:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-i2c@vger.kernel.org
References: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
 <b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
 <20231114150001.6823e277@endymion.delvare>
 <37aa2c39-8192-42be-8021-a2147252f27b@gmail.com>
 <5f2ed562-319c-4439-a235-c1a01373c1fe@gmail.com>
 <20231119093902.739b4602@endymion.delvare>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231119093902.739b4602@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2023 09:39, Jean Delvare wrote:
> Hi Heiner,
> 
> On Wed, 15 Nov 2023 12:00:18 +0100, Heiner Kallweit wrote:
>> After thinking once more about it I think we have to do it from the
>> ee1004 driver for DDR4. For DDR3 from at24. Only this way we can read
>> the "temp sensor present" flag from SPD. E.g. for ee1004 the SPD EEPROM
>> may be switched to the second page and we have to switch it to the first
>> page first.
> 
> We indeed need to read the EEPROM data at some point. My initial
> thinking was to instantiate the at24 or ee1004 device first (from
> i2c-smbus), then read the value from the EEPROM and instantiate the
> jc42 device (still from i2c-smbus). This requires an internal read
> function. I think we already have that in at24, because it uses the
> nvmem framework, but ee1004 lacks it as far as I can see.
> 
I sent RFC patches for both, ee1004 and at24.

> But anyway, if you have another approach which works, that's equally
> fine with me.
> 
>> I'll send a RFC patch for this. Unfortunately I have no RAM with temp
>> sensor to test it.
> 
> Neither do I :-(
> 
I organized a DDR4 module with temp sensor and the ee1004 RFC patch
properly instantiated the temp sensor.
Surprisingly I found that my old DDR4 modules also have a temp sensor,
it's just not advertised in SPD.


