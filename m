Return-Path: <linux-i2c+bounces-9528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29707A40207
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 22:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3925619C7A74
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 21:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BEE20897E;
	Fri, 21 Feb 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRxGw1JP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A21FBCA9;
	Fri, 21 Feb 2025 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173387; cv=none; b=Ts/Z9KHH03ZBlrioG9grHDi2FO7iDUUyhuuyWoMRlaHa7wsDCwoN0+NnymtNLFSON5PAJPTarKa4GIxCeHqkNNlq6NQitvXYXsCnSzd4i5afBiMZ/3axGpwcyqmffIFTQgC+b3EbVEBWkm73aICxlCg3XMhhEWZvXZZbjePe8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173387; c=relaxed/simple;
	bh=d0Kl53/UmSp5u4PcR8A4BjErdR3+4HmF3gWGleEZBQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjWPHk161meTYD73KMtn+0ly2MYXXUxYJOatewnNaOIZKM3ozKb76uPjlDCq4Hf9Y1Z25pCxQw3QMdmGPlgj5rLrqM8hCtSTpCdRe5aWY/+XIEeBhlB4CvHoeohS/M8NEBPj3+uFdAMFRffsFyCB6le/UuNUBEjizyZGX6U38sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRxGw1JP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so4277975a91.3;
        Fri, 21 Feb 2025 13:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740173385; x=1740778185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fQmPAKP6y0Diw9vIq2SHly0ius/go++BHIapWGHVeHo=;
        b=QRxGw1JPeSBF8jaFihaLi8284XxaHwBjJBrT9lR+4fzueWS4VU1f4oRHBDMj9ydOZ3
         BpODK5TeAYjIgICg384H+MjJ9CjXnyBIh2eDBRuKYNX2f47m9fzwrg51OyptPMTHaJA+
         ov7WfkBqAFrVqgwzB0Z/1HemaYlVEYDajEggIrBHdna0wJhz7RE6Eoikuibud09CAgvP
         ciQWY0muymndMzUq1cKY4k/jD7JvtwLv80P0NMxZd2WWPZ7xTFVj8Ozosr7i4euSX6X2
         AS1hT/5C0YywVYzbsP776Lekfvj5xObWFtX8nR+GTAkfBju+hYBnIztF8hYTz5q3W/2Y
         cxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173385; x=1740778185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQmPAKP6y0Diw9vIq2SHly0ius/go++BHIapWGHVeHo=;
        b=A7fsv0X9UeZgqnTSZC3GqlUsHMdL58mfCIPYQlWGlwIjumXOg/nIZTo5V87tVPOh9B
         G92HnQMVLrN16Fo9upYZ0k0/6Y75rfC2DdSBFb0sjVPj0P+Yj8ub6AvUjWA2WS8FuUny
         aCQw8L7ZBhng3HfOFBqTd964MyA8l6GRNsx4/8BZmA6rFUjRejxiA7SGRglMSqR4DwPp
         OeFwyCEacR0Dg5iHXm6IjDMJH8MgTHzYMi8tGQfYN9GwtKW4jmNmR67vLke9/FzrkKQk
         NrVTOhTprz0Od2FWlMSqP4oTzUi8UpMj3WOlne4aTlizo3Jd+8w2LlGCB7Um4wsKvK6w
         oBXw==
X-Forwarded-Encrypted: i=1; AJvYcCWG6ODbP1hSo5oT91eYhRecEoOIncn88RAoiDA0GouHczBm45QZH93WZavTAJ42eJmr4eGZrhGQNfU=@vger.kernel.org, AJvYcCWItmfPZUCUNgxoF5GJE/0IvcXBYnSohOHIuWGqpoOuj4/ttvtaoPvoCCe9CZqHKvF7ktk1b+DXJt/dP7o7@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQDRFXR9NVeRI+5Hc+F5JnW8GoPLHVSFMXjFM2/3Hgp5q1sfu
	8RyK4HyEENM2/O1XcO1HRe7IPyOFKPsXyV4uCTMrNNJbB+Vd31PO
X-Gm-Gg: ASbGnctOezCSXt8rj55c42IauuWZGuv7c+EmFn340ndEmjHEXMHuLZ26nmpr5Ozs1UP
	MBKbSrCbFMcJXF/n/ve8Tfl7PG06sDCuAJaCfZKGT3Dy+VNXmKuY8elYdHXOsdBrFwqugGzkdEy
	CoIjhvg9LrWgccup4DUwnJiaIW6xx+akOkdGpCtCUpWK1LAkYBRuf2Lc9ubenO7Roniwx//bkkw
	Q8IdkWHzq2dm7HvSSJOqPfgryMEwekmdZ3uJxkCrGAHGRY2Y8BzQeBTG6i0J1QnbxZh3+ZLrUU+
	tIRkf6kQjvCjlskT2rFwjTUee4se4D8SKJoTXjrYe2l62f+re3G0ZycYuf06ITciQ5ApowxY7JY
	=
X-Google-Smtp-Source: AGHT+IG1IJyDAWvir4F6Kx4VbJTTD+O3Psqnmpykrgjo/IFSWSWqUvb74AFc06xiVgLZfMKfBmIfZg==
X-Received: by 2002:a17:90b:1b50:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2fce7b262acmr7565282a91.28.1740173385102;
        Fri, 21 Feb 2025 13:29:45 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb10fb21sm1890007a91.39.2025.02.21.13.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 13:29:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <13fbaedc-cf7c-4a95-b4f0-5572ad1e3f76@roeck-us.net>
Date: Fri, 21 Feb 2025 13:29:42 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "i2c: core: Allocate temp client on the stack in
 i2c_detect"
To: Arnd Bergmann <arnd@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250221205449.3838714-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250221205449.3838714-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/25 12:54, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> struct i2c_client is way too large to be put on the kernel stack, and depending
> on the kernel configuration, this can exceed the compile-time warning limit:
> 
> drivers/i2c/i2c-core-base.c:1420:12: error: stack frame size (1040) exceeds limit (1024) in 'i2c_do_add_adapter' [-Werror,-Wframe-larger-than]
>   1420 | static int i2c_do_add_adapter(struct i2c_driver *driver,
>        |            ^
> 
> The current version is the result of a cleanup patch that does not appear
> to be a requirement for anything else, so address the problem through a
> simple revert.
> 
> Fixes: 735668f8e5c9 ("i2c: core: Allocate temp client on the stack in i2c_detect")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


