Return-Path: <linux-i2c+bounces-11857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBCAFB13E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 12:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FC257A7DC3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 10:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8C2212F98;
	Mon,  7 Jul 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km4awH4v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B319D880;
	Mon,  7 Jul 2025 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884272; cv=none; b=uDErl+QAqBQikKIATBUuiIBvWi9gHJwt6JnNzm0DM7bLpWgXW5z9H51CSG/ujoPxgg6fbtusi0U3fYa2+Obl5huIm24cBRC5O4hjJ4pYKhyVz9pKNF1L2D5qzDAn9SK6KNQHClfhYjolWOZlVwDbse+v4b7X7g9ZGSZXd5FRZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884272; c=relaxed/simple;
	bh=3Uq6vAhMpflLvoZvet6S/WypbZukt/NCqmERYTe7GZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6qhX4QdD6UmOg1IFZfySID0ATrBqY9b409UXmhK53Df40aRCa2uhdXwEOAh2WR3GzYNBOqYgt5bJm38SRS7+e3a2qzJKSzJlq1tQsK+c31zkxdh76tuEcoGwW/QvLXoLPTKxAh/rrt7ULnzchYfkMezOg1Sya5VAfVbgxCLrH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km4awH4v; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1996919f8f.0;
        Mon, 07 Jul 2025 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751884268; x=1752489068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48ejRLL6cllL8JfuQoxN2XzqvfOsBKqKosBq40xObfw=;
        b=Km4awH4vVKmZeT+RLGGyN0dhPEYy68+7Hl0fH9pM0o7cj3COMeQoYziwrx4xTaX3r2
         wsvAri7ZP5fFrlPeTYF/7MgmI2D15SCXqWLxvqGoXdhWp3HU/X26jynqov1Sj30GwGjT
         V71vck8faDZ9gkVbpTl9ep0Em6XYywjXpdZ7CC0umALcnEfLIyQc4vUYu5ZARwJ9UdYZ
         zWO8ERXGxPissrNSh1Bhl0tL9oy5110ZNOv88qWTtjMkNYL+I/OAPQDeuR2j2IWJTDmu
         i4gsIIJVLQLL4p74PPc09HG72rxnv9vxv+AcfuQ1fvqYtYDqUBb/X1gGdSheJ/Zs2f2y
         6edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751884268; x=1752489068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48ejRLL6cllL8JfuQoxN2XzqvfOsBKqKosBq40xObfw=;
        b=PeQUlYGcWLMFYRGfjYl+RXE+jxpTBNBSf1QHwyoExqyY19qtPYck3ssh2eeemq4pf9
         QE0UNZbzC+tr21XvM7Xiilr+DVLMitanyKouO4csr7tanNnRj9ykJuRrjbs75JERp/x4
         ZWekLkCEWq9c1XLDiKvKUZajcAKLCFWlSVzCh7Wnd/9XyS8caFw+Wrqflr2IXua8/WnG
         72NnaVvHA0nZyWx2Hccv+C62pyLbZYcV1iSUZv8QxeOK36OdzHgadYLnAvGqhrzz6HNw
         O+UFUTNLCCYF16UloN9JVhBDcG6bE1hTEUUO8KRABmJpA4/4eGkprFw+bD/uAFbKLT4V
         5oVw==
X-Forwarded-Encrypted: i=1; AJvYcCVjHELZZsfvlXmtQu5j333beIzOLsCSyFjVAIuLVnmD4r0FkkPUeGtOj9TZbYl5xgcJkJVBk2tGsN0m/kUV@vger.kernel.org, AJvYcCVvoQbjGaso86IkWsbdOpU8w7z6Grgrgk8wUEmCTHzudKreQItXfG/l4uw/qK4odIfebzLPlJLtUX8lUVFC/OU=@vger.kernel.org, AJvYcCW5A8sUBKn4tE9ewlJ+A5ur4J7pRWFepW00Th8GAFC5ufINrCKQppnq8oemJaKmz3kbpsCH6ngUcQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyALrvX+uHEEibRG37urW2SJsEK/0xMwgIuu7aGuR278l63UipA
	qDen+O2ubBfoYnwOimQuKyk/9PDmfH2QwtWSocIOkQoOxVhOz2RDcGXa
X-Gm-Gg: ASbGncuHf4L9uKCUfU4AfH0E4T2V89IdYzIZ5TE9LXJ3wjThW4x6a2ezhlq8TfycJJ2
	tz23laWsno3iKPNAENH0Neh73H+jOmj8GDmh1d7zhDHlYwKRqfhVAOJU4mrFzQ0qhadvFhyeWct
	iEEYD6h4Oto/HZCTN4dpzqWvRnVJ6JjMh+L0VOOYNXHZu19kHzu1hFtJqG1hGW1d1eiwIarT0iL
	K8NH6jPoPH6QWOp/2ZK24MjZM59cecOwSkgQGYXmbKxqOxSW5VkmedHu4QroVJ6TNTGZKBrRc4O
	4NUZLvMIRAEIMsKHxbpqUzfu0+bpXvnsv5wRRykjmFds5WpzzFw88KRP0Jh9UsrePexGLCjBw/4
	8IvY=
X-Google-Smtp-Source: AGHT+IE5iUocervxUlFgxw5ZIHH63vQaJUrtXe6NqB2ZTDLKRXTN+r1OVJzPD1ifFj6+6JT2PM2tag==
X-Received: by 2002:a05:6000:4a0a:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3b495589716mr11377736f8f.23.1751884267669;
        Mon, 07 Jul 2025 03:31:07 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b188df09sm106090805e9.37.2025.07.07.03.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 03:31:07 -0700 (PDT)
Message-ID: <0ae92ad8-810f-4c10-a442-c403755cbab7@gmail.com>
Date: Mon, 7 Jul 2025 11:28:50 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver
 abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153657.1195687-1-igor.korotin.linux@gmail.com>
 <aGg2qkyrKBIPiSeE@cassiopeiae>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aGg2qkyrKBIPiSeE@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/4/25 21:16, Danilo Krummrich wrote:
> On Fri, Jul 04, 2025 at 04:36:57PM +0100, Igor Korotin wrote:
>> Implement the core abstractions needed for I2C drivers, including:
>>
>> * `i2c::Driver` — the trait drivers must implement, including `probe`
>>
>> * `i2c::Device` — a safe wrapper around `struct i2c_client`
>>
>> * `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
>>   generic `driver::Registration` machinery
>>
>> * `i2c::DeviceId` — a `RawDeviceId` implementation for I2C device IDs
>>
>> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
>> ---
>>  MAINTAINERS                     |   2 +
>>  rust/bindings/bindings_helper.h |   1 +
>>  rust/helpers/helpers.c          |   1 +
>>  rust/helpers/i2c.c              |  15 ++
>>  rust/kernel/i2c.rs              | 391 ++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs              |   2 +
>>  6 files changed, 412 insertions(+)
>>  create mode 100644 rust/helpers/i2c.c
>>  create mode 100644 rust/kernel/i2c.rs
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7f8ddeec3b17..688a0ff23e69 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11363,6 +11363,8 @@ F:	include/linux/i2c-smbus.h
>>  F:	include/linux/i2c.h
>>  F:	include/uapi/linux/i2c-*.h
>>  F:	include/uapi/linux/i2c.h
>> +F:	rust/helpers/i2c.c
>> +F:	rust/kernel/i2c.rs
> 
> Is this agreed with the maintainer?
> 
> There are multiple possible options, for instance:
> 
>   1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
>      Optionally, the author can be added as another maintainer or reviewer.
> 
>   2) Add a separate MAINTAINERS entry; patches still go through the same
>      subsystem tree.
> 
>   3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
>      tree (e.g. because the subsystem maintainers don't want to deal with it).
> 
> I usually recommend (1), which is what is proposes here, but that's of course up
> to you and the I2C maintainer.
> 
> @Wolfram: In case there's no agreement yet, what's your preference of
> maintainership for this?
> 

Oh, that makes sense - I didn’t realize I needed the current
maintainer’s sign-off to add new files under their MAINTAINERS entry.

As for being added as a reviewer or co-maintainer, I’m not yet confident
in my Rust skills. I’m learning Rust from scratch and, given my
extensive C-kernel background, I thought I’d start by contributing
something useful to the Rust side.

>> +    }
>> +
>> +    extern "C" fn shutdown_callback(pdev: *mut bindings::i2c_client) {
>> +        let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
>> +
>> +        T::shutdown(pdev);
>> +    }
>> +
>> +    /// The [`i2c::IdTable`] of the corresponding driver.
>> +    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
>> +        T::I2C_ID_TABLE
>> +    }
>> +
>> +    /// Returns the driver's private data from the matching entry in the [`i2c::IdTable`], if any.
>> +    ///
>> +    /// If this returns `None`, it means there is no match with an entry in the [`i2c::IdTable`].
>> +    fn i2c_id_info(dev: &Device) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
>> +        let table = Self::i2c_id_table()?;
>> +
>> +        // SAFETY:
>> +        // - `table` has static lifetime, hence it's valid for read,
>> +        // - `dev` is guaranteed to be valid while it's alive, and so is `pdev.as_ref().as_raw()`.
>> +        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
>> +
>> +        if raw_id.is_null() {
>> +            None
>> +        } else {
>> +            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
> 
> Nit: Missing ']', probably a copy-paste mistake from other busses.
> 
> 
> Yes? :)
> 

Yes, a lot of the code in this patch series is copy-paste of other
chunks of the existing Rust code because these parts are not part of
generic device/driver code.

I've made the same in ACPI patch series. I have already asked in that
patch series, if I need explicitly
mention that in the code or commit messages, I'm happy to do that.

>
> Just a note, this won't be needed in the future, I have patches in the
queue
> that let you use generic accessors from the generic Device type. [1]
>
> [1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/
>

>
> Just a heads-up, this trait will be split up. [2]
>
> [2]
https://lore.kernel.org/lkml/20250704041003.734033-2-fujita.tomonori@gmail.com/
>

>
> Better use from_result() here.
>

>
> I like to do that as well, but I usually get asked to use drop()
instead, let's
> do that here as well. :)
>

> 
> For now I think you have to ensure that I2C is built-in.
> 

Noted. Thanks for the review.

Best Regards
Igor



