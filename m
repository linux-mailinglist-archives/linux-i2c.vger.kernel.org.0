Return-Path: <linux-i2c+bounces-11618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A01AEA4B4
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83DD31887A9D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAAA2E7179;
	Thu, 26 Jun 2025 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMVBBBtn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F194A33;
	Thu, 26 Jun 2025 17:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960168; cv=none; b=t/8XNFc2nkqUrhLXM79bLeI81r5eiUa1vd2djpcTbTkZ2WiQInNW5yZsJcAO1ePlQBjoTbyfMlx+Ca5CVgd4Ir8fY4jGfeX0Yipgw8iFrouvz2CSiXDzTr3AgqxXIdEaykDqaTMrnWpN2A1WS05hqbtQy06BhKVB6TUKeCAZElk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960168; c=relaxed/simple;
	bh=pA/HumsEb3FbACANSoie7ksQi0PxTKJgmxzGlNGc7Zc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p1F+FASy5cHLJeHz1EosMjg0VxMFBvcSOqqi7exsy3r9tMCPywgoLwR8FprT6SytWGg4+xp7YtVK4/Ia28wUtWj8cQ/y7XL1LaJMRguFuphuzwPy9vpce0TLOdnBRGtCnirkOWdh/LTLD5m4h+4/h2SdAuHZZc5VX3jC95o6eGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMVBBBtn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a52874d593so1055725f8f.0;
        Thu, 26 Jun 2025 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960165; x=1751564965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGVko47bYwkqeRQ8uopxpBSob9deDBlIVisawEmMxXM=;
        b=VMVBBBtnPHFEgrJJMm+eduOEp7NtCc6faPsdqextLJ2hEYmBoiXZ9fvrONfWc3iG6E
         lyjC6WcgaoaFpfpQBGCMjrcWIRXmzPSGyFnp4wRoDnMP4diaR0UoCHwqtEVTrNwm7jx7
         7XxG4xRpC4MUB7rWyEqJ5Sw/Mqh1DjiQSUwjlojeQDATvZMFI2v2M50iNT/8alVWDhfS
         xJHm50Kfd7++b/+7BoiTwJPT/ym0Ca9hSX4zKXUYd9txcyvwDuCKXCxqDjQz+5jthUpY
         LqBkKViw/Wk4s5aCHebgd8KYVHB88UxCIC/KCdvY27mKRl1MMytC2ir2vO+6OVvYsL52
         +Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960165; x=1751564965;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGVko47bYwkqeRQ8uopxpBSob9deDBlIVisawEmMxXM=;
        b=Eh9hoIPpWUZFcQFkZfFyXE/yQwgp7d1hEdJaotN3fLsfXBpkd/PHfzRJuGmLay4yd5
         RY0d21WJGJ8CFMdKFfoCSlJMAy0889IH7b+Pg0nGlyOtyveY9m8y8F8jqDEFYAZzjQNW
         gu40ow/Yz1LmGBAzo0Ka4tC/5oQbynHSbs3J/qf/F2zcKk5L74JWz+CNiuaNQChpWlMK
         4ZXNxAqYC52m6Wm0KwRgXQ4EiajagAESCzmZ4XvNXtQ8vv9EKUtV1wynSJsdXcORSsni
         5kb5/dG0lptYh1c6gk9BrZ3dU0LNe02DFCCSF/qcp6DoZXV7W6uH+ZgFSjP/YRyRz4yN
         JMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8FkFxWHV5aULANrBe/Qx356Vq6wDFUhqZajN+8BYxHEyXJnFlD9ol/YNUCISjLH3XyNv8ZWywyP85uQR5h0Y=@vger.kernel.org, AJvYcCWYGuRb4K3G8GIDEh4jcPCxRPoEV+0FK3fM6HBK1IQlzWE9F/Qv+UAqnYZlJ3iiu68CwvHPPy0aFcQ=@vger.kernel.org, AJvYcCXrbhCTEw+4bx1xkLG7VFUN2YfLcDM+SGFZTU/aX/mkWWUt7nxhpRcvPqPyoOlXqUcHyTMQMC9/TKyX++V4@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHJ2GV4TS9AuZUGuonMiPsHIbQdhkkF4a6MbAZxeslD6o1pd+
	qmldOpGJJ1kGUZ29i1Ur9W+92m4mdyKfG4csxqXfcsegPZpPPNb+Cmqi
X-Gm-Gg: ASbGnct34fduGMJCIfzpTg5GvT5vjoywuvh209iPfL0hSO3FVWTes5cVeXry4ZJpHVx
	+qIF1ILuj342j56rljKis9SyPHdt6pcyl0iWU51kWrjErYXAnALOrjgrJ9F2y1/RPyRROnLNln+
	6okrP8prQ7dnXZ2wTRZ1PybvWtCwsclzz4uxbEhxkGT+AvJBNs9nsOAmWIE5dd7dRGp7576QgXx
	rO15Gad+jWVq7h2+O0ZaKVHLKWTznlGmg0JjkBbNJVbQYusBbjnnTLQVCgmCXglVNCJ1q2R3zjg
	+Vs7KGyEkL5M5jXlJdnh3OUKsgplsVLSXF7Y1/QOE/zR9vTsQjlHQ3XYBQHZa79ysv7RlMw=
X-Google-Smtp-Source: AGHT+IGMkg6j1sln3NzDGxo1GLe9xtRdjm3U/0ZlalidTdk2/enJr007E5WTmxKqgGIlcwekSqrSug==
X-Received: by 2002:a05:6000:2905:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a8fda34e30mr463230f8f.25.1750960164761;
        Thu, 26 Jun 2025 10:49:24 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e591d7sm495948f8f.67.2025.06.26.10.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:49:24 -0700 (PDT)
Message-ID: <ca7b2f6e-1195-4c6f-b45d-799496277b31@gmail.com>
Date: Thu, 26 Jun 2025 18:47:11 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] rust: Add basic I2C driver abstractions
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
References: <20250620150914.276272-1-igor.korotin.linux@gmail.com>
 <20250626173333.897333-1-igor.korotin.linux@gmail.com>
Content-Language: en-US
In-Reply-To: <20250626173333.897333-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/26/25 18:33, Igor Korotin wrote:
> This patch series introduces basic Rust I2C driver abstractions 
> and optional ACPI match-table support and provides a sample driver 
> demonstrating both OF and ACPI binding
> 
> Currently Rust I2C abstractions support only Open Firmware OF device 
> matching. This series splits the work into four patches so that the 
> core abstractions and sample driver can land immediately while ACPI 
> integration may be reviewed once the ACPI macros are upstream
> 
> Changes include
>  - core I2C abstractions `i2c::Device` `i2c::Driver` `i2c::Adapter` 
>    built on `struct i2c_client` and `struct i2c_driver`
>  - a standalone Rust sample driver exercising Legacy I2C ID and OF ID
>    matching
>  - optional ACPI ID-table support in the `i2c::Driver` abstraction
>  - ACPI-enabled sample driver showing `kernel::acpi_device_table!` 
>    usage
> 
> This separation lets maintainers review and merge the non-ACPI portions
> immediately while patches 3 and 4 both depending on the ACPI 
> infrastructure can be queued once the ACPI macros are upstream
> 
> Patch series:
> 
> 1 rust: i2c: add basic I2C device and driver abstractions
> 2 samples: rust: add I2C sample driver (OF only)
> 3 rust: i2c: support ACPI match-table in driver abstractions
> Depends-on: 20250620152425.285683-1-igor.korotin.linux@gmail.com
> 4 samples: rust: show ACPI ID-table in I2C sample driver
> Depends-on: 20250620152425.285683-1-igor.korotin.linux@gmail.com
> 
> Igor Korotin (4):
>   rust: i2c: add basic I2C device and driver abstractions
>   samples: rust: add Rust I2C sample driver
>   rust: i2c: ACPI ID-table support for I2C abstractions
>   samples: rust: show ACPI ID-table in I2C sample driver
> 
>  MAINTAINERS                     |   3 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/i2c.c              |  15 ++
>  rust/kernel/i2c.rs              | 386 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  samples/rust/Kconfig            |  11 +
>  samples/rust/Makefile           |   1 +
>  samples/rust/rust_driver_i2c.rs |  69 ++++++
>  9 files changed, 489 insertions(+)
>  create mode 100644 rust/helpers/i2c.c
>  create mode 100644 rust/kernel/i2c.rs
>  create mode 100644 samples/rust/rust_driver_i2c.rs
> 
> 
> base-commit: 63dafeb392139b893a73b6331f347613f0929702

Please ignore. Was sent by mistake.

Thanks
Igor

