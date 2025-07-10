Return-Path: <linux-i2c+bounces-11903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B5B00587
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 16:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9C81697DB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 14:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F8B26FD99;
	Thu, 10 Jul 2025 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRIDZqHe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6BB8494;
	Thu, 10 Jul 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158778; cv=none; b=TufyShAV02Ua7pURE+OcrdcBTsbVxcl2EHCs2Os4uhQOvOZdbJ1MYwwfTY+/GMosXq2Q69RQBa7v/LV9XlUcpmBORdzPus4/7v2T+mgMNW3nGYybF+KuJCjdlotCVHDpl8IbETLU2FUf/j29kgHpbPpo1sqwJ5bQ7eGQREyft08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158778; c=relaxed/simple;
	bh=brhr14jY/gN0Lk6V2R7qKb/J2aIEWY8RBJhBb19zIuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pt7eor07K5T0w7Nu1kSxBEhlU3n4FGyubBpiYhMC/N+q6WrYMM7kX55PKcjYuLaYRoitJ78eNDISR0AUYAcc20ihRkg+X8sPWpoULcA2gS3nUkDk/6sSef1aC93HypO/PNDfFi0LDKObIsu+5tXtK1piloE2sn3OIeSPpq1iaKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRIDZqHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B9CC4CEE3;
	Thu, 10 Jul 2025 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752158777;
	bh=brhr14jY/gN0Lk6V2R7qKb/J2aIEWY8RBJhBb19zIuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JRIDZqHeeaMXqfsYZtBekh/YtBJmJ7IsdZ+AzfClQuk+TlLMZWRCICqMBg89nh7BC
	 1i4sx4Y4n2Gb2tXuSPhijmFTotDfp5y7LK1aaRx3I8Mq7CCo2gGLuqWAhnvDgpsi9e
	 onGiylNArc14s2pb7PafYjN30x1VIxcmOZqJwWUdSaefz7KsYeSNCGYnGNHYB/mP7Z
	 jnsAeUHB9TW0AcypF5HpR6F0k+dZnf9hys+VNptHtnbQibL51bh9HHaVsZAo+pwkqM
	 6gH+3kcUMtjih1hxdoQ+Ori1ZzBIbDBjMj2MsyCHa1UpXkesW1+k8H6wjczcmoQIlM
	 kcXpI2Gu2opyg==
Message-ID: <a726b9ae-dfe0-48b7-9290-ed81fded7cd1@kernel.org>
Date: Thu, 10 Jul 2025 16:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver
 abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>
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
 <dd850b46-1e9f-4812-a356-41ae6fd0ce59@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <dd850b46-1e9f-4812-a356-41ae6fd0ce59@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/25 4:04 PM, Igor Korotin wrote:
> On 7/4/25 21:16, Danilo Krummrich wrote:
>>> +
>>> +        0
>>> +    }
>>> +
>>> +    extern "C" fn remove_callback(pdev: *mut bindings::i2c_client) {
>>> +        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
>>> +        let ptr = unsafe { bindings::i2c_get_clientdata(pdev) }.cast();
>>> +
>>> +        // SAFETY: `remove_callback` is only ever called after a successful call to
>>> +        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
>>> +        // `KBox<T>` pointer created through `KBox::into_foreign`.
>>> +        let _ = unsafe { KBox::<T>::from_foreign(ptr) };
>>
>> I like to do that as well, but I usually get asked to use drop() instead, let's
>> do that here as well. :)
>>
> 
> Danilo, could you, please, explain this one a little bit more? I see the
> same pattern for all the implemented subsystems so far: auxiliary,
> platform, pci.
> If this pattern for these subsystems is to be changed, then I'm fine.

Yes, this is because I wrote those and wasn't caught not using drop(), but `let
_ = ...` instead. :)

It was already changed by [1], which you want to rebase onto, the changes are in
driver-core-next.

[1] https://lore.kernel.org/r/20250621195118.124245-8-dakr@kernel.org

