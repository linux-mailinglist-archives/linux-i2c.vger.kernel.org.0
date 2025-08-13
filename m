Return-Path: <linux-i2c+bounces-12262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB83B2471F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 12:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D245E173CFD
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 10:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B78E2F1FDF;
	Wed, 13 Aug 2025 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2uKbA6R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C857221277;
	Wed, 13 Aug 2025 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080667; cv=none; b=D/dub9ZEOogcfTosoyn+qP/8uZGWd7zcq4it0exL22s83+YxILjiXyNTiGoicPCEdLgg2J80NY6l4paTjyvMTUSKxEQF0evLfN9GQyiTan949UoVoV+h2smpZW6n8H7RoZIc5caJ4z4xhqW/NeCfrV0wv8XQZw5r8ju706fB6XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080667; c=relaxed/simple;
	bh=FJ/VBakO+nFumVlvWzR7mU1CQJoygXVl0eaOsOqiRMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7qOgYPLjGWc/2Sq6vhFsWXIRRW/JszKjf+KTJ0HDuVnElbJ1cKUkb5CE8fMPLnilx+kZ0cFO5WMvEseVbKB50tlPJ+1xR78nhOBHFSsOc8h8ckGUY90XKKQIuU84FMIq2/v5A1knklQ5tr0VcxOHQ4WODw7dUQ14t+xwClMHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2uKbA6R; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b783d851e6so5462371f8f.0;
        Wed, 13 Aug 2025 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755080664; x=1755685464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBvMcb9A/AFLPKQ8t4bKDq8tGZPD9sVSSm5Hx/aM1sg=;
        b=A2uKbA6RD1A+E4P5pytMYN3Mkpj6t+co1bk/7AtNTOnAE3+ee0+1tFOfvRNYAuxDpw
         m2QwPYt3nosLeRV3BVzkgnUGshbSHQh+KDkLo4r5l6NjpJbDQALOeogn6q3TrBvMSNWH
         b6rLiMy8m3TJT20mOq/TxgEz1AYGvk5wBafPP8PhnAYJ2xfSJCCDXS+M/8NBuTWF8kIH
         EoouizoWS+i42TTSL7GisvInTD0IYVdLBabn4oKNxK/YszAlQuOQSznl8o405+K1TmIP
         INqa+JbcEhx7yTS3RSyV1GcMfqr5Ejp9VFIM6xURSbNs1BZPXj9eS/Ra4BOpOw/MzN63
         PZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755080664; x=1755685464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBvMcb9A/AFLPKQ8t4bKDq8tGZPD9sVSSm5Hx/aM1sg=;
        b=pkE3s7Q385FX/7tmvDPKRGW886VtQoxpnPDnjnp88z0I9nf7RiN0X7LQYTrEwnVG/A
         gjuNVtG0NsgiRGIuGmpYoZ4JZExPkMAJQTMJyP87V2zyJC487Sw3P8s2fJxzyLaZnKRk
         wQM3kGPIZRnx+0QmflCoF2yM4jY4iXe8h+rS17L08c4QkwkQnZrdY/yeNL1kyJbgNwuw
         k5Erx6nedwhLGSQt8MQ8cZ0/A5HrW8xxIOsV5fikwkTdE/9PJc2Q3ooZCmJT9p60z7zr
         kJoBTSmHZdhe41lVtDRfyRt3hvLiDzZZ4/iE1o40njYm0MZ9LLLQLVXfKKi1Z9tlYUTr
         Crdw==
X-Forwarded-Encrypted: i=1; AJvYcCUaT9/Th0AywJ2xsBgY8NzUY+rz8bHeX71u6DqeW8Q3gdWdW6c58rIXtlwvoPwapEE9PfASWjVg@vger.kernel.org, AJvYcCVUVyav7a+pW9vnMOVE0Sw6wqJffX2lE056VeLQcAqOEMd0Om+EPgQbSlD1Mp1guSFzs2Cc+2ayYOZuMm0C@vger.kernel.org, AJvYcCXQMAHILqgkvj4iznvp4vu3lvI77elMQ4MvUqSftUuQzCqon2mMxlzf/jdzLCWB5iesRGkUm7suNUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyucP2to++QGEHAfKiMEd0tkizxMiDgkscYFU187Rs9DwGjjmBO
	PtFiVeL6znxf/1r7BYhn9jOq9mY9CYGpRXaqzdSYU1npXxKq869b5fCW
X-Gm-Gg: ASbGnctiDtTcx6UcEE6WV1pw9RJI4/zdLsdDVCG8ocIoYEqf1NGeL+j981U2AfNPugR
	dhKOmQeGOkKTVnZD5W6gK0TExlCdAC5n6pJj0CIkUiB23gig8md99v2XLFO1VTqOB5NtRfHAt9U
	MeldGETt7Ah5HRtZSXnKBrax/vpEKko7nikIXd3ZAja0f5DzGN9/tgoaK5lkAjalZ8PH50UdxUO
	2QbJMQbKmo6Vtr02uqIlmNFyiN4r+VdKNNswwHi5Zi+n692DtObEO4p7kV8Ih4QhRTsEjVVRsh2
	U9gXtgfETjSo+Sby7WZoSLPej0KzVQyRTu48pr8jriFI9jAbDfEJ981yel2bvsrH6JajuaB1BA9
	qBckAuN9bzGOCcuZ3YC1I0+8PDN75ugCqWqwTSBbNIYw+oEYuPbAPxduyH542JEU=
X-Google-Smtp-Source: AGHT+IEJHjTQQo8npkV7yU/QWSo8+r2RnFWIg51TLG4KaWGQtT16a4oEJjJRn79a5sY1UbdD0pjCsw==
X-Received: by 2002:a05:6000:2006:b0:3b7:8880:184a with SMTP id ffacd0b85a97d-3b917f42040mr1913827f8f.54.1755080663628;
        Wed, 13 Aug 2025 03:24:23 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm47351880f8f.27.2025.08.13.03.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:24:23 -0700 (PDT)
Message-ID: <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
Date: Wed, 13 Aug 2025 12:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aJpP5eABTYnQRV82@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 11. 22:17 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
>> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
>> and modify the i2c_init_recovery() function to call that if specified
>> instead of the generic i2c_gpio_init_recovery() function.
>>
>> This allows controller drivers to skip calling the generic code by
>> implementing a dummy callback function, or alternatively to run a
>> fine tuned custom implementation.
>>
>> This is needed for the 'i2c-pxa' driver in order to be able to fix
>> a long standing bug for which the fix will be implemented in a
> 
>> followup patch.
> 
> "...next change."

Ok.

> 
> ...
> 
> The first traditional question is why the generic recovery is not working.


The details are in the driver specific patches. Should I write it all down here too?

> 
> ...
> 
>> -	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
>> +	if (bri->init_recovery) {
>> +		ret = bri->init_recovery(adap);
>> +		if (ret)
>> +			return ret;
> 
>> +	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
>>  		return -EPROBE_DEFER;
>> +	}
> 
> If the above stays, I think we would drop the last and always have
> init_recovery to be assigned.
> 

In that case we would have something like this:

    if (!bri->init_recovery)
        bri->init_recovery = i2c_gpio_init_recovery;

    ret = bri->init_recovery(adap);
    if (ret)
        return ret;

Since the callback is used only once, and within the same fuction where it is
assigned, I don't really see the advantage of the assignment. Although it
definitely looks cleaner as far as error handling is concerned.

Originally, I have used the following solution:

    if (bri->init_recovery)
        ret = bri->init_recovery(adap);
    else
        ret = i2c_gpio_init_recovery(adap);

    if (ret)
        return ret;

However the existing code ignores errors from i2c_gpio_init_recovery() except
EPROBE_DEFER, so I changed this to the code proposed in the patch in order to
keep the existing behaviour.

Regards,
Gabor


