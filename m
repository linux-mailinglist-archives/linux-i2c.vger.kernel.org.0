Return-Path: <linux-i2c+bounces-12811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E8B504C4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 19:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5CD1C623D4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 17:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD5435AAB5;
	Tue,  9 Sep 2025 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtYf2la3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620F217F24;
	Tue,  9 Sep 2025 17:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440557; cv=none; b=snuZkoTpWpHJw7mCAONvew5eeZKoYyBlkha+1OYNftBX1dhkAjB+PCorhbf+yhWifXqtFHN6uusuT0jGaUFxwNFzZohmD2dGaJw63YZ3XuVyQj7PIVf2jvwfP9VgZ+XY3Jck7YF3IHPe0hipv4af6aFw6bfYMOsqFR93U2N11VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440557; c=relaxed/simple;
	bh=BVBEsORO39DBfv+RRC75V8C1Dvo9csHrCZZUO71/0vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3dZU7QGbdWudUIrnprvatdRrJzyARMeNjDDLKls1jfOsWmsAtL9/1T9NQ0jZb5saMZd+fkdUo8UG+qQ04cgDtfKTNYd0UxGIFJPJ+TN7jfG8cLs04XvSjdugHca/EtYrSiOB7vPhEGqdlVWzEq+sWOnaSFt+oKbtR7434jYPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtYf2la3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso36161785e9.2;
        Tue, 09 Sep 2025 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757440554; x=1758045354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9nDfIl/l6iHLo8Oz8Dn+nn8jZqjdVgr+FtxH8Y6tyA=;
        b=mtYf2la3n2P14OdnW5Kfq3oK630poqQve0g9X0cNJNW/EPLYaLjWp1k7Pb3uUF2Dyz
         HmxnFCojqUkhkaTrX0TuuX6zmmOFcxt7+s2luy+tDF7D3tOz+7BcdXmqok3sJ6h3eiAr
         gRIrpLodcGDbSsvU52iUDlgCsZGiy4ivV2dHDCSLKEK30RwOJkpixCOS05C1k7CTz7ab
         5IcGskv/alvblrlBvP+OrA77DpDrPGcN5UK020FrKRi/xhHKoDiG+EblnMcTlSKPvksJ
         S8ZIjZ/dcwEBg6FksGL+Z9qsRKkcXnFduJBDQosPH02tDSVN2LNx5eYzQKjRFXCGaQg8
         gBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440554; x=1758045354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9nDfIl/l6iHLo8Oz8Dn+nn8jZqjdVgr+FtxH8Y6tyA=;
        b=en5/5lWwtkCJ3oA7SmxRzE6xoYsEvb0x/LiYKRprfR1jCoB/qwEtC+b1qm4jqIPmT2
         4dxRhIFr97RMH0liSF4tOA2Qg+uOCgI5Uahum9hfF+VkShQ+1Sf+BiqRNjB5JKayDvTO
         b7rn0GCY0g9B1yKetA7OwABSned9pqXfM8Zb/pz5sVw8J3L/ugf4981tC0lz/zqd7qKJ
         TNeMSvm5a4Fhw6mwzblObXBdq90dytEKpqo27L1pjO0ya4NFmOFjxxU7efkAhEz6Brwq
         r5LPvCB4zqh4ey+a4XZ5RjdDmvOGYTQfV1yQQUoRxsl4OilkZetwq5vYoG+Bzax9IeML
         fdzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3pGeujGiMccGT5JrDOhawPG0yMooubyicw9M9xPZ1sO7UKVFH66Z0f5fcVv+7T6Y10uuPiW/KXh8=@vger.kernel.org, AJvYcCUqerkEGNQIosOO1M7P9oILaY+YrOOl6XfnkInCxSm1I57wjVgDh5E0paouaPOU9HRw+W1J/xlupH2SMr9OKA8=@vger.kernel.org, AJvYcCX+UCyYH4DeSPS6nPGVF+7wdFK0qL+p2xMZCIC9ODWLj3lnh2Ug7MNYpvHUyDs6PKcYkOgo8cHex9L1ebu3@vger.kernel.org
X-Gm-Message-State: AOJu0YyZL6SoCJHw4hdpqel3/EEgs2aWbhy9Xot8boZ3ekUt9fb/WuLM
	J8u9Z3f/JJqZNsAsngYT44aQ45y3+tvYS2jnALSBxctJvjX6YBJcYznu
X-Gm-Gg: ASbGncuzyydI0SHM6DxzDPOQLg53yYfM+iBElqi82WZZurM2oZ4+8viJIbMUdFy+lyg
	KcJEEIxNgZs0RnODXtdPFJrRdLpZ0q3x5nmQeLaqZcmmpFjURv7BBoSbOSJUUsHYfyeRV8GXwSJ
	cnPYMTT4BEs4FbI3jdTObAzJTvGh1XQ7/81pevrM53QFh+RMAOLs5+0BTVdyKnMs9gKj1Jq6O9J
	JQky/HCtsEmREC+5PRodKu9qxLhkizptn7MTIrIMoHQcpSb4A1KxQo8QII06XCLWmWpv8AOLJ9n
	NevNPvgGHfMEH10mjgplxekD3i+0+g/K26V1403uhg03Itr8AJfLw0QaMrln9RQPNE0RZ+7CC1f
	Q8flvXf4/cuJN0WO/sWHXw2oi5u9rCbZcMNBGV6o7q65FLtxMCr/DpeLlArHrX3leBdWWVW5Cai
	pEzA+PwYM+kSc=
X-Google-Smtp-Source: AGHT+IGV/GHoY04y+/Das71QmmMDLujTA+vHr5fO2/qiWyMTjPcXoCeVL5/Jt518smF23v3FXF6xEg==
X-Received: by 2002:a05:600c:46d0:b0:45d:d96e:6176 with SMTP id 5b1f17b1804b1-45ddded62d8mr108159525e9.25.1757440553983;
        Tue, 09 Sep 2025 10:55:53 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1b:2400:28bc:5a7:3bb6:8f22? ([2a01:4b00:bd1b:2400:28bc:5a7:3bb6:8f22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df56ea1c6sm16034435e9.15.2025.09.09.10.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:55:53 -0700 (PDT)
Message-ID: <dd798632-1865-464d-8a02-f8d9e20a16b6@gmail.com>
Date: Tue, 9 Sep 2025 18:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] samples: rust: add Rust I2C sample driver
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820152347.1815097-1-igor.korotin.linux@gmail.com>
 <C5AFA553-6EB1-453E-B396-DD19139E7228@collabora.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <C5AFA553-6EB1-453E-B396-DD19139E7228@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Daniel

On 8/27/2025 8:38 PM, Daniel Almeida wrote:
>> +    }
>> +}
>> +
>> +impl Drop for SampleDriver {
>> +    fn drop(&mut self) {
>> +        dev_dbg!(self.pdev.as_ref(), "Remove Rust I2C driver sample.\n");
>> +    }
>> +}
>> +
>> +// NOTE: The code below is expanded macro module_i2c_driver. It is not used here
>> +//       because we need to manually create an I2C client in `init()`. The macro
>> +//       hides `init()`, so to demo client creation on adapter SAMPLE_I2C_ADAPTER_INDEX
>> +//       we expand it by hand.
>> +type Ops<T> = kernel::i2c::Adapter<T>;
> 
> I am not sure I understand. How is a type alias related to module_i2c_driver at
> all?
> 
> Do all drivers need to introduce the alias above?
> 
>> +
>> +#[pin_data]
>> +struct DriverModule {
>> +    #[pin]
>> +    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
>> +    _reg: i2c::Registration,
>> +}
> 
> I was expecting this to be ARef of something, most likely I2cClient?
> 
> This is where my knowledge of i2c drivers start to fall short, but others will
> probably chime in :)

You're right to mention this. This rust_driver_i2c is not the standard 
way of handling I2C devices. The idea was suggested by Danilo in the 
review of Patch v2: this driver merges an I2C driver sample with manual 
I2C device creation. The module creates a new I2cClient in its init 
function, and this new I2cClient is then probed by the SampleDriver.

In a normal driver it should be different. For example, let’s say 
there’s a platform device — the probe function for this platform device 
would create an I2cClient, and an appropriate I2C driver would then 
probe it.
Thanks for the review.

Best Regards
Igor

