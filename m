Return-Path: <linux-i2c+bounces-919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AD81A7D6
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 21:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263E51C22679
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 20:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E314A48CD8;
	Wed, 20 Dec 2023 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp9DpEkA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F048CC9
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e384cd6ebso150624e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 12:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703105890; x=1703710690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfWRcBNnXkvtAZ9WAVlGhNrjDGGe9Vg7TqJhFKHVdjM=;
        b=mp9DpEkAEmv0iokt8JCnNdaW8Qn5aap+olHnbJ3X3GGkmY8j1yfTaxjtpT6ugPJpUN
         WlRq75j474rwpQ93KCFMrScZAgev3nAPqDL5dBfNDtX/xtUQ/H42f5U72LUQlFfxHs3U
         wBDda+/UTk0lv3TzCL/SSKFFJUQGURhe4/91HBC2EHKL6nd9CCaD6HziiJeT/JxlXLaz
         xRwhy4M1+bXq3nFOgLgN+c3JH9qT3F+PSX1AKvNmomVgN3gmm/0Hdb7zQmopUE0uZ82k
         LCSWC2cC9gEocPOixXgIahsMJfmMYutW4XBMnMZeuR4IfA+UJDbjKH+45WWHwjxHmx67
         XLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703105890; x=1703710690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfWRcBNnXkvtAZ9WAVlGhNrjDGGe9Vg7TqJhFKHVdjM=;
        b=mTqfG/jXWdQAcjdiMQGNTwMZe9jv9L8GFlyRlPoxyrR0FYbAtH1k669h+c2h7dx7Jx
         Go3P58NDFgKtiTnJjqEIr4EvxhmJ7GqcYwZuUxjC8PHVcZ6Bapx1uzlVt38dVe+4fprX
         lIjenZGS0dEos9yLRJZtQhs2XhJLnMyZp9yChtu7cFRsU1GBeaEt+oCkbwUdRP0+C1D9
         vuNw4NR3VQP2DfpS761dBB3r3JUWWtA2NCjIkWo3dZt6rrKd0vaRWsp5tJa2jvzRCMzF
         SOKsKGpdXpNdkp/D+LRW1ecuyNhDS1Hyf/KB+019fWXPaYz/WEnGq0aKYN5LIByQIiHE
         oBoA==
X-Gm-Message-State: AOJu0Yzk5PTGtFNPIYlgPg0gaoxM7oaeqweniOi7Qc6RvVv2KcYjJmwv
	v/UAyyRtIRYRlfvtvlsTyqg=
X-Google-Smtp-Source: AGHT+IF9cOBtYcS0hJyT2Al9cmUIMP/yKstgj78r6cX7f7SsHBjFXHyBm7T7NxqPDlaS0aZ/au1yoQ==
X-Received: by 2002:a05:6512:15a2:b0:50e:2ce9:fe75 with SMTP id bp34-20020a05651215a200b0050e2ce9fe75mr3093703lfb.73.1703105889853;
        Wed, 20 Dec 2023 12:58:09 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0e1:2b00:cc8d:2472:9da4:1ff3? (dynamic-2a01-0c23-c0e1-2b00-cc8d-2472-9da4-1ff3.c23.pool.telefonica.de. [2a01:c23:c0e1:2b00:cc8d:2472:9da4:1ff3])
        by smtp.googlemail.com with ESMTPSA id df23-20020a05640230b700b00553533738f0sm255979edb.57.2023.12.20.12.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 12:58:08 -0800 (PST)
Message-ID: <20bf2d9b-4f36-4279-ace9-8b1bbc6286fb@gmail.com>
Date: Wed, 20 Dec 2023 21:58:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mux: reg: Remove class-based device auto-detection
 support
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>
References: <69f19443-f2ca-4158-9d25-160db55bfb57@gmail.com>
 <ZYNSZ+OJ5wEJwoCz@shikoro>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZYNSZ+OJ5wEJwoCz@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 21:45, Wolfram Sang wrote:
> On Wed, Nov 08, 2023 at 07:38:07AM +0100, Heiner Kallweit wrote:
>> Legacy class-based device auto-detection shouldn't be used in new code.
>> Therefore remove support in i2c-mux-reg as long as we don't have a
>> user of this feature yet.
>>
>> Link: https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Applied to for-next, thanks!
> 
> I guess i2c-mux-gpio is more difficult because it has users already?
> 
Right. i801 has a special handling for certain Asus server models with
> 8 memory slots where the smbus to the SPD eeproms is gpio-muxed.
I2C_CLASS_HWMON is passed to the child adapters to probe for DIMM
thermal sensors.

For getting rid of the class-based probing we have to:
- Extend i2c_register_spd() for use on muxed smbus segments.
  Then i2c_register_spd() instantiates at24 to handle the SPD eeprom (for DDR3)
- at24 then checks the SPD for an advertised thermal sensor, and instantiates
  jc42 to handle the thermal sensor -> a patch for this has been submitted

The extension of i2c_register_spd() needs some more thoughts.


