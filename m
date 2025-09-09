Return-Path: <linux-i2c+bounces-12809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03408B50451
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 19:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E971016B488
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 17:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8DA32BF32;
	Tue,  9 Sep 2025 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWebY2Fe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575831CA56;
	Tue,  9 Sep 2025 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438349; cv=none; b=dMiIlxomCiwkuWfaPhSeSvhDjTL895sjehayMgeKsoUpt2LbyCHtovoOafYhjaGZB2ZLdXiEvDNKwTdZSCAvCnm7z/Tg/rrT8Hz9cSFPbOJ4zSpVq+d+vw1TflLisn0YdNNk1xJBig3VdFUz7YS4OPFhD6dNgf5ny29HNBk9hN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438349; c=relaxed/simple;
	bh=bWWnGj0S+MEzFaJeOUMbJYLA0erOC190FHMhWP/fRWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ngw2Jzc2QqZERGzL7F/yRE5R+dAngWbQJWxv+D1lXId+qbzc/nPKgoD+hDbDrd0ymwpI4zrimN5256EKexZsKNQzHf4P4G85ibLvBEDg+rgMrhjFUJSYJ8XGnIeCaTS96Us9pww5oQxmwvYcL6pU+vX/YIMXtSK+VReiE8GZV5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWebY2Fe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so4245997f8f.3;
        Tue, 09 Sep 2025 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438346; x=1758043146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l25EVoDFKNwGSM0isuq3f17bD+L6S3kSkSJqwpB+hRo=;
        b=YWebY2FeTqtVOK4t5jwPcOlcGun3gKKPOATXRC9UpxkFlCr7lrm3zK0oxeyCU+xR8c
         2FuUgSZ/1JllfNpLaWb20YCvA5Q0pXaMnOalCV83FuXZy1TCz9ej+Uoo0bNei4nH4PFI
         cGehrzkwRSKViaZaeqULNXGb2/IOaYCKFk+htuB/Z4NFtlD45wa493cHz3rPHFhAT8ks
         BOK+CNWNIzap0xe8CuB9j6f7DmDiFzCDHgbBZrEfUdMTqn+NXlVb5d5pGlYGcO5BnkZC
         vJmgubudWvOeP6h7DxvUg6xx/EqL1QSrhIH7WJNALG/JcEgHd9UDGQzU7ZOx+WBul+Rw
         4PtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438346; x=1758043146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l25EVoDFKNwGSM0isuq3f17bD+L6S3kSkSJqwpB+hRo=;
        b=tYCchG3wrppE9T88yxgCztnNUqV7J/zaogbm0bI+CZfglXhIMppduEanTMCCJfwOAF
         6s5F2oMelIgi2GabFES2OoVU+G5TdgOpRZ5y4EyHk5znLkKtr4+nXIpQrHZb6hcoqgLc
         LVjlVAE65gvaB2MS1/0XT02nuyR4MV6AEcVFOD2nZ4z982fwy/iHc1k3u373+MC5uodC
         scSSXz/X4p4myK2KVNUMD/6EnKyLgUckkvO2R6fkeDiNq8QJcccPNyoZKFOmQ4InKAI3
         oJjjA/tnQ3WEqdYUVoIRyh232jlxoSjxuVB7GUlVG0lJ5uYJOa7gzaqcaE2J59zRRlA/
         DtpA==
X-Forwarded-Encrypted: i=1; AJvYcCUMt6NLtszRFandMbWcuQzKUJlNAqX5tfXFu5akNu54ZUsKEJmAyoL6YTx4Lbom85/wRuBW9Hx0RkE=@vger.kernel.org, AJvYcCVM/YhUFl9gkn3A7Ngp0Fltq52VI4Id7S1Yrl7fdT5OBVHhiKufMdC6OL4kHfvanUZK0FfX5obq0/GnTX+O@vger.kernel.org, AJvYcCWWgScgc9P1Z8sdOKHRiSi4OD2wC8QYTnxczvhfArjVBBATNaYl4TO+Xm4G4WSy0bUWRtYpoctkE9wGFaIEYJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeWzO3RQ3ell/hzmG8pQwhZ48E7W+CECkCT80FcRZ40BL0rc0H
	jDvstgrjshY0WMbGSg74A6yCYi3cwkxH+haFNvKc4jyPF47P2uYl7vMo
X-Gm-Gg: ASbGncsuZI/L4mWfFskabgITwLzQDMkotdK5jeU70WBTayR7z2Xgfpt0Qv+iPuPLZ6t
	ttYQEjN2ta7DF/S4tpW9O9ekYu0LPGncy6XVqE3/mDck6rrVjGkFKTWCBvIVP/O9HpODvlvd8nk
	2fRwk3bKgsVDdqdDYYIKrSFQFGjvqR6cS1ZK2EJJi9tc29mQsz9ZAG8Gkw1yTPyYWRndcoK9WKJ
	cBrHCRpqEfOFAosn6nsycYk1YI8uza/zrAhHSb+rUIzWzBXD6csUA9HTuAosIw0+fNs9N6OLKfQ
	jmHjL/oDASRhf+3fLKbq+UEulRxT51e2SSNzjtymRoJTtUsyzLGsKaNd733inDzyF2AFvclFAJ5
	ve5VztYiFG4mgOJ1ZWKYFHLLPEzUoJupKf4uo5FgmZ9baXyW2DGA1ntiF5zoAKi0oWAVO832zsg
	4kTVbpvD6xlUk=
X-Google-Smtp-Source: AGHT+IEzEqgCQjkt5PCDth2nN24b5YqmS9WtwgMI6DUL7TT1tAavecUGpN2Gj2qC/kSXsDgYKU0Lcg==
X-Received: by 2002:a05:6000:178b:b0:3e3:24c3:6d85 with SMTP id ffacd0b85a97d-3e6428cd370mr9905453f8f.22.1757438345455;
        Tue, 09 Sep 2025 10:19:05 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1b:2400:28bc:5a7:3bb6:8f22? ([2a01:4b00:bd1b:2400:28bc:5a7:3bb6:8f22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224eb27sm3401552f8f.62.2025.09.09.10.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:19:04 -0700 (PDT)
Message-ID: <655ca23c-1fe6-498a-80b8-1b75044d9db3@gmail.com>
Date: Tue, 9 Sep 2025 18:19:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: i2c: add basic I2C device and driver
 abstractions
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
 <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
 <CB269793-D165-4D22-95E5-F978C1ECC79E@collabora.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <CB269793-D165-4D22-95E5-F978C1ECC79E@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel

On 8/27/2025 7:37 PM, Daniel Almeida wrote:
>> +
>> +        let i2c_table = match T::I2C_ID_TABLE {
>> +            Some(table) => table.as_ptr(),
>> +            None => core::ptr::null(),
>> +        };
>> +
>> +        let of_table = match T::OF_ID_TABLE {
>> +            Some(table) => table.as_ptr(),
>> +            None => core::ptr::null(),
>> +        };
>> +
>> +        let acpi_table = match T::ACPI_ID_TABLE {
>> +            Some(table) => table.as_ptr(),
>> +            None => core::ptr::null(),
>> +        };
>> +
>> +        // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
>> +        unsafe {
>> +            (*idrv.get()).driver.name = name.as_char_ptr();
>> +            (*idrv.get()).probe = Some(Self::probe_callback);
>> +            (*idrv.get()).remove = Some(Self::remove_callback);
>> +            (*idrv.get()).shutdown = Some(Self::shutdown_callback);
>> +            (*idrv.get()).id_table = i2c_table;
>> +            (*idrv.get()).driver.of_match_table = of_table;
>> +            (*idrv.get()).driver.acpi_match_table = acpi_table;
>> +        }
>> +
>> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
>> +        to_result(unsafe { bindings::i2c_register_driver(module.0, idrv.get()) })
>> +    }
>> +
>> +    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
>> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
>> +        unsafe { bindings::i2c_del_driver(idrv.get()) }
>> +    }
>> +}
>> +
>> +impl<T: Driver + 'static> Adapter<T> {
>> +    extern "C" fn probe_callback(idev: *mut bindings::i2c_client) -> kernel::ffi::c_int {
>> +        // SAFETY: The I2C bus only ever calls the probe callback with a valid pointer to a
>> +        // `struct i2c_client`.
>> +        //
>> +        // INVARIANT: `idev` is valid for the duration of `probe_callback()`.
>> +        let idev = unsafe { &*idev.cast::<I2cClient<device::CoreInternal>>() };
>> +
>> +        let info =
>> +            Self::i2c_id_info(idev).or_else(|| <Self as driver::Adapter>::id_info(idev.as_ref()));
> 
> I wonder if these should be private member functions?
> 
>> +
>> +        from_result(|| {
>> +            let data = T::probe(idev, info)?;
>> +
>> +            idev.as_ref().set_drvdata(data);
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    extern "C" fn remove_callback(idev: *mut bindings::i2c_client) {
>> +        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
>> +        let idev = unsafe { &*idev.cast::<I2cClient<device::CoreInternal>>() };
> 
>> +
>> +        // SAFETY: `remove_callback` is only ever called after a successful call to
>> +        // `probe_callback`, hence it's guaranteed that `I2cClient::set_drvdata()` has been called
>> +        // and stored a `Pin<KBox<T>>`.
>> +        drop(unsafe { idev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() });
>> +    }
>> +
>> +    extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
>> +        // SAFETY: `shutdown_callback` is only ever called for a valid `idev`
>> +        let idev = unsafe { &*idev.cast::<I2cClient<device::Core>>() };
>> +
>> +        T::shutdown(idev);
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
>> +    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
> 
> Again, perhaps a private member function? I’m trying to simplify the syntax here.

Can you, please, kindly clarify what do you mean? If a function is not 
pub/pub(crate),
it is a private function.

Thanks,
Igor

