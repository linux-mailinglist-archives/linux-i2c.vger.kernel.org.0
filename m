Return-Path: <linux-i2c+bounces-8351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6589E5B61
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 17:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71B1161E31
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADFC21D585;
	Thu,  5 Dec 2024 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGeMbJqD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5E2F29;
	Thu,  5 Dec 2024 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416041; cv=none; b=cD2TiT4ka/fk+FKV1ctcQLwX5+ZNzDVDDf7XvWMGGziGgZlGhqQ4o/m7WpNxBhndLTUMsU4aMqfnfTddlHTxCN1YClRabJ5iGBW1okT4uqqJhtwpeh7bgWjytWHqg8o9ZJ50NcE7/OHVz0Wdf2x9P2LLkxVeYTRyCEAFbb76oks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416041; c=relaxed/simple;
	bh=KIKU7vNg+z/Wt1u6A5HZLGcWAsp5tnmkpoh9k7jl7fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl5U1QPimNv0IQVXUgQm90c1K5tCh8ZS2GSeKelaJDIf5ecENraxhyrw/0mqCR5acY2b7j9Bf0KLzCCfujeMk9nWWjtZ23OepGwjKY8DEjRuieYY1b5HyFsnXxL++F20/KVOhtr/ekoSbLtcGQUctIDJmJytxf2R9VZICShTGlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGeMbJqD; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso933574a12.1;
        Thu, 05 Dec 2024 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733416038; x=1734020838; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmVy9retQhH8au80HraGWl14e7NomlL+OC1Ht0/e3l4=;
        b=kGeMbJqDvgaIwdf5xmi43ddHftwlzjgB655O/f8tR9kzPoR0d+9oV1kCR4CVy+iB6I
         XSMlWrZ+e1I9zmmcqOvVU3UZJTEixj3h4DvLTBC0Ie+AWnSbZbNqWmo2k/mBjQa9RGVa
         QNRX8S15tDB4pedUIvk8EVAO08cVHoC/GQ/B/GQOCH+nGCa8DQzCePH+YLRh/JPh0tOw
         3QsaAq7H9KjHwxhqasJHPImi4xSU02u3GYDhkUUJTxbc3nPNSuPXbsMEMvzspl5BYUhm
         6kVP6+xY3k59LuOzhDY4Om9YDf4gLtsqMqLbjrBdHpRE0ht1keTL+BCl5nHghxqp0zJw
         DOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416038; x=1734020838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmVy9retQhH8au80HraGWl14e7NomlL+OC1Ht0/e3l4=;
        b=qqkurgkZmSzCEKVDZGOKl9uR8H6XfH4EuYeLvqm/2RCj11lpXh/8KaReSOUBhNZLfd
         ZUPoChdz3FUpvZy7OUVxyD/uaKzGFVqsr3VcfPzULUT6dKKkIqwIhT+lBHEuk3W2tTbt
         3guLIkm84+HS1L8Jiu9zutwmbEfOYnVFiUAOofx1DMVJ8VPCqbPeDsBGJqwRA2uZpk0J
         /swg93GxpeQSV2D8kaeLDezthsqs3Olamm5CnhPavJkMph1xEJgqffrq8ge+ZztsvsXq
         v61m2ajRRqheVnO6diJAhw3x6iKCIrvZmbiM50lzCqE3cnONLZUPpdGGnWufhS1NdN4K
         WNhw==
X-Forwarded-Encrypted: i=1; AJvYcCV0AXk0MOJnEg4oqXRHoZVYJ+wO8+udqHUm2vM4JSgiPd0J8TvUYnnoJE07aAnEYIZzSDUilrWsZlwD+Q==@vger.kernel.org, AJvYcCWk6murul07BFPZkoPfPdHI20iu0YwlRrlKE2yq8s/mG41bGthFVaUP5Z0JoU+G8R3VslAHlnmJ65E8@vger.kernel.org
X-Gm-Message-State: AOJu0YxeyeJ8i2HvGcbYdtOls/D5THJWWYwjrHCui6mUl15WUEU3Sf/R
	JVKOppwSct8msZd5R/ZsXBKubtsD3/bx+2SBumIVnNyHkLu0fdyR
X-Gm-Gg: ASbGncsRMMlP9G5fHJ4aHXswEWeqzq5VPeFwARFeM+/mTcDZxIDD6ZGd2NDGqQzJ6gY
	mO8zbVnXjBYd2OwMvoAQQd80Ji+q8kCmZHHDqikTPVIPvtdhST88oHx09lYHs/yIM300WahFQSI
	NtrTx+33BaeEqHF4MWO3CbB4ocKC2W7go4HGaZWWcq1u/P/hnCqhA912oiyeHTRlHV08Sn7NgL1
	rnpypa5TZkPmY3kefuntbqqd07KeN7x9EPP3y/Un5AdN1nN0QH4vfiSYCTXK2U=
X-Google-Smtp-Source: AGHT+IEfMtihQO9z97g/N9babHIuzjUsUU5ANaygqGEoAOe77AI6HGqvZzZIxjE45atU0Z9Uubajrg==
X-Received: by 2002:a05:6a21:78a0:b0:1db:e8dc:4ae1 with SMTP id adf61e73a8af0-1e1653b996amr13655152637.17.1733416037557;
        Thu, 05 Dec 2024 08:27:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2a90317sm1429268b3a.113.2024.12.05.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:27:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Dec 2024 08:27:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	George Joseph <george.joseph@fairview5.com>,
	Juerg Haefliger <juergh@proton.me>,
	Riku Voipio <riku.voipio@iki.fi>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Zev Weiss <zev@bewilderbeest.net>,
	Eric Tremblay <etremblay@distech-controls.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Potin Lai <potin.lai.pt@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konstantin Aladyshev <aladyshev22@gmail.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Eddie James <eajames@linux.ibm.com>,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] hwmon: Initialize i2c_device_id structures by name
Message-ID: <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>
References: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>

On Thu, Dec 05, 2024 at 04:28:33PM +0100, Uwe Kleine-König wrote:
> I intend to change the definition of struct i2c_device_id to look as
> follows:
> 
>         struct i2c_device_id {
>                char name[I2C_NAME_SIZE];
>                /* Data private to the driver */
>                union {
>                        kernel_ulong_t driver_data;
>                        const void *driver_data_ptr;
>                };
>         };
> 
> That the initializers for these structures also work with this new
> definition, they must use named members.
> 
> The motivation for that change is to be able to drop many casts from
> pointer to kernel_ulong_t. So once the definition is updated,
> initializers that today use:
> 
> 	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
> 
> can be changed to
> 
>         { .name = "adp4000", .driver_data_ptr = &pmbus_info_one },
> 

How about introducing a macro for that instead, similar to I3C_DEVICE() ?
That would enable hiding the data field definition completely from drivers.

> and some more casts when the driver data is used can be dropped, too.
> (e.g.
> 
> 	-       device_info = (struct pmbus_device_info *)i2c_match_id(pmbus_id, client)->driver_data;
> 	+       device_info = i2c_match_id(pmbus_id, client)->driver_data_ptr;

That code could (should ?) probably use i2c_get_match_data() even today
to avoid the type cast. It would also be nice to have a similar API
function returning ->driver_data as kernel_ulong_t to be able to avoid
dereferencing ->driver_data directly if the value is not used as pointer.

This way ->driver_data and its use could be made internal to the I2C code,
with dereferencing completely handled in the I2C core.

Thanks,
Guenter

