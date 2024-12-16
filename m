Return-Path: <linux-i2c+bounces-8548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DA9F3940
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130CC16A703
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA17B207DE5;
	Mon, 16 Dec 2024 18:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCrfdr7V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04737207658;
	Mon, 16 Dec 2024 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374899; cv=none; b=Y76GqdNd7XP8hQh48ROirQsEA8t6n2dfqU37Wt7TpJ62PA3FxZUVLt/DJC7VTTmEi+nUouAYALMAvbtJDHk5DNmZvUQU30z4kRcvZaSiwqufwnQmRvFzpojWUNrM1nsA/c71Ya/Odjhosr8s5oO3RvPsoVwPV2/VwbPzVmNpoYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374899; c=relaxed/simple;
	bh=kmEYNF71/7++qPgLBRe0qCZQCXLr12g/b3oiSdt3p/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n0XKNorp77Sly6bvQ3ai7lnhGanc7zf73zjiSZCufPn8uLXp1YjbnGVKinFfCzO+ODiqXMjhnWJWL/lzIlZhc8M6BL2Ne1xTLTRNo31Te/+qV0popT1VtorfWwbCD7GFuxmu1EOMQqsTdGApfmQiebW/N5PjzawCttVnGntGZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCrfdr7V; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd17f2312bso3095141a12.0;
        Mon, 16 Dec 2024 10:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734374897; x=1734979697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GUU/XypxaduzqMjt/wtaQMQLw5fmlBNHttBG958fM88=;
        b=SCrfdr7VsbNpHdS8t6BSRrPgHN+6H3zWGSAIPdghHyV3Lt5VKA1Q0ElBTy3q+b/+cU
         PrZY0pt7p74TlJNlMky4vQ+0DNav5uPmwZVIRZ8Q+E9gOTXm9Wj/Mztl3QpcXMOWlTLY
         VzQDof/yL68yUdEPyxEfILkxtUevWHsU+9hEz5TAgxHbj9RaUG57RIcTo2JNwT8jK7Vl
         W4aYZL4x5r6jYC9qLyFgYy//6JqajUhGCzS7oitScVwWaDrag9X/541bhNF/B8GyXTfO
         cAuTZSki6FvoRkqI2j5fT+Sp/IUMT+xGAu21bg8UpE4tvfvCyYXNa0FmOyDMEfUgQX/0
         PwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374897; x=1734979697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUU/XypxaduzqMjt/wtaQMQLw5fmlBNHttBG958fM88=;
        b=bpAJgktlXY33h9+KtbadekXWxLByoY6sg81SUdMax4+aDfc3GdCLRyOtYcMTyZIAQ6
         MZvyzm0oMWzwCpGgF6NzQxaDRl4NeF2AY3NnFrrqKq/Pax3SWLJ5zseYB3XM/ek1ZOgE
         Gjr9Vg+yDtr3PC+ANkGFccjmhw8S2uzmi22Jed9NAY1WnnGeJJlfmXvI8y+Hz64xTd1n
         knS5gpbF9FoZzU73yhig+7Jo+2Ke2NJpTvGwMHAeB/6ouZGre6WNdLIHU3O4nsIO5A39
         vroXG4SQ/Zeu6bJduQbqYF2DH8KVu4/M7d0tK7h+MdN0QkyNXK2cWZxYEtYLUppMRR0E
         hO9w==
X-Forwarded-Encrypted: i=1; AJvYcCUKvcLH5cVW6t5iAES5CHI9S+LumhDkv2QCmRMDZP9V/DSGFqES9nQo3lw5c++L57MewdR2xNEO497J@vger.kernel.org, AJvYcCUNgwd1uwbDgwQNZ8QKyDkyC+JL33/Z+/+fCxEsvqXWhRyIj0BT7z9nw6gh1mexG2cMLQ+RULe7647XajQ=@vger.kernel.org, AJvYcCV6cgWjIpBr1sP3OANYNYFHkTH6WD8rW5RmhYuPEi82ixecWoQZ1IN3kPhxqjyw/oo8L2x5VIUjjneZ@vger.kernel.org, AJvYcCVuTCeILj/8wHSfhUqkTgk2CdOoO9GlXfo2AChvNM5s8f//i2+wSXxL4Oj2rXmR/3uET93Yo7pSlZkrmC3g@vger.kernel.org, AJvYcCWxz8erpn2RWZk9hyH4YVlmWN3m1o7II/nCqGrwdo4f/bsB5ClNCv3SztPgXooIycWvcuymPuscpGSg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1IwFhwc1uJGgARZ5NZYPC5tKz8MDQxzD5gPrJ8GWkj4PdxdOd
	ifgvaN80+u8jM9eHs++DMfp7lc3x0N/l9GUt+LWnpPbQm4xEupcP
X-Gm-Gg: ASbGncsQD9qwRPkEaPQYhTpjphS6ptFT1q/WZQWoQF921Xs9z/VbTbcXP3jgyyqlX7j
	KcrjHd1PPF61hECO0c1W8MzV8NOgJjaVdhPhtKcfS3xlFnJJb5ppOWGJirL9eF59Iufr9IX8x+E
	sCQh2d6lH1kd++rHCj53dzqEB6g2Qs3Xkd1Y2kOhkjyg4Qxibn/tsd/5oK52Lz6vHy1VCuXh2cG
	SSeOCRemYEDLjm4paPrOJtI9TmJzZVO9iRnV+iNz5mQGaBDX0aPCYTPt4ThJPt76UimrdGTJg9J
	05cYF81c69ZGGGZzBUnFR4+zxBKrlg==
X-Google-Smtp-Source: AGHT+IFjQgGzXMt3UDx2US4yIi+IDTITId8IwO9BLtbyFBWANvRg/nW81MMDSaOHXQlVmHcHYluZ1w==
X-Received: by 2002:a17:90b:2e4f:b0:2ee:f687:6ad5 with SMTP id 98e67ed59e1d1-2f2d7d6d692mr891327a91.2.1734374897329;
        Mon, 16 Dec 2024 10:48:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142c2b1f6sm8453029a91.0.2024.12.16.10.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 10:48:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c64bb634-46d4-486a-8743-699775326058@roeck-us.net>
Date: Mon, 16 Dec 2024 10:48:14 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Intel CRPS PSU
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241216175044.4144442-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/24 09:50, Ninad Palsule wrote:
> Hello,
> 
> Please review the patchset for Intel CRPS185 driver.
> V2:
> ---
>    - Incorporated review comments by Guenter Roeck
>    - Incorporated review comments by Krzysztof Kozlowski
> 

That is not a useful change log. Please describe what you changed, not who
asked for it.

Guenter

> Ninad Palsule (4):
>    hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
>    hwmon: (pmbus/crps) Add Intel CRPS185 power supply
>    dt-bindings: hwmon: intel,crps185: Add to trivial
>    ARM: dts: aspeed: system1: Use crps PSU driver
> 
>   .../devicetree/bindings/trivial-devices.yaml  |  2 +
>   Documentation/hwmon/crps.rst                  | 97 +++++++++++++++++++
>   Documentation/hwmon/index.rst                 |  1 +
>   MAINTAINERS                                   |  7 ++
>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |  8 +-
>   drivers/hwmon/pmbus/Kconfig                   |  9 ++
>   drivers/hwmon/pmbus/Makefile                  |  1 +
>   drivers/hwmon/pmbus/crps.c                    | 79 +++++++++++++++
>   drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
>   9 files changed, 211 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/hwmon/crps.rst
>   create mode 100644 drivers/hwmon/pmbus/crps.c
> 


