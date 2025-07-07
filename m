Return-Path: <linux-i2c+bounces-11864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6039AFB631
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 16:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04BAC1895AF4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 14:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB26E2E1C61;
	Mon,  7 Jul 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY85rR5t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD972E11D6;
	Mon,  7 Jul 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898850; cv=none; b=lPgZSTNiJUlE4Fi44Gba6SanA/WcaOnxVsVNZbQ3U/XTHUZNFMZXGB5wsNPSidElC7BlTVdcL77gxpcyU4rxgAsQOTasnw7coouO2UuMC1MtlWhpW6QFUFRsk35TpRC9s2zygGygqLJ7In3KyJrI0Agpwe6PbFtSwJuCMkPK1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898850; c=relaxed/simple;
	bh=XqAdyY1Lsj/1Tyt0lFga2IXnnzqd94XvtRHL/gtf9kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iACjm1xHkVFQ7np4okrec4OaxvVMQzbywdQ88uMo37jz3VQ87/Powg1wbTHI8aWPg3GIg/m0JLsY4TlW1LipCE5rJfM2mXdEXL7q9AVilzzgMcS1184QidKrQCfTlNkQqGoye504nf1P8hfXlO53rwyGdD4CRUda+vmMN0V0RsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY85rR5t; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453608ed113so35636075e9.0;
        Mon, 07 Jul 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751898847; x=1752503647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pUnpX1P/g0fthzxnXBY5ainr9edvbgssHZPwN6SPvQ=;
        b=KY85rR5t28rykeYQv0xixxU8d47YnTNdIICXm8vWL/L1wakCZiZEdpDLI74PZwKGGg
         gmC5c46VHRmnnS8rvkEtuZMbEJ+WoJ/FEaCGehOIYzyQ55gbEWH4AK1uzR5ZL8lXc3bN
         gDuGCQQephOOTYk7W5ZK2fQeRTx+oSjY/9zPzenWhjOnF53CN2rhC6pbKylBC3sRv0Vw
         09CrkNRMzDjHGShiaMA2chWq2PYrhnkiqCiku/IKhlx/AKKa4A6UrXFXz4QmiyYQanyf
         u6CR5SjX1o4cEwPKspy29pVJDFXSFHMkGNZWRywSEUYU77CiOTOEt3CxoYYrPkvD8rpY
         C+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751898847; x=1752503647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pUnpX1P/g0fthzxnXBY5ainr9edvbgssHZPwN6SPvQ=;
        b=lqN+9vHNe+MJXucA+EVWomZUvE84gw5y1uuZUVuFTcAUsmGE9b01fnM3PBOEXBl0bG
         7dRKMDqr7vYjOObgJ1zymqCmVIm13WAL+jhOpId5E8rU6ublrcmXdCGt3CgYwQSwgcA8
         y+jbnBbAVDnkARbt69tm2H2S56xYqhcCnSzkEGblcGBHgLBBfyk1lWg2iJLtyRWiXvMc
         cIzcimb3t/R4YLf5w25en87EU1AlQibvsrUf9Rdw0qxmFg233/qAD10eUF0YFwU5ANCv
         q5rxM/fJfuyWjQ0Ky1mqEj7SG9Ab36ETiBVHET89k/Wz6EoFeZdZ098c34N/2LyxH0Nb
         b20w==
X-Forwarded-Encrypted: i=1; AJvYcCUWP9fTr6Zl7z1pmir4spmElvC7YMaXWA3ZAS7aownoXTzxPiLuIYb8R5ubgytC1Dua3kXahfqC96tsLcj6urA=@vger.kernel.org, AJvYcCVGPYjtdf6Uu/fVEYcbQuQwgKiqX3XO+7elcBPev35h280Z5VXTm+VwQwNzoWWnEiI2NDHac9QVX7oftswb@vger.kernel.org, AJvYcCWRSbLAvhUdf9SW2pvuSkKLOi6okC73879QTKrhus2a7knoiEkPbo8psUq3Aycj5fxV7Z6g8If/GS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BFhNDDEOw2HiTGCv+NRnKOS7JRgmkx3TDXD3+Wwk6nuyS6mm
	5ys5rgLHe66dXlx0FiICfKSawwdkubRHd11k8+YtYuG7ydb2Qj4hfTkl
X-Gm-Gg: ASbGnctghGDKvvCmJxJXh8kDAai/3G5fm6OjxguUaQUMHLF7W/RG6bNw4N6hEHk3IQm
	lRpzHvHIrUMRKjpVou61c6VWK7Civx6m0zoDu3Ag639lc4CeHZdJ1balIjNFzFe8dPfJq8g1Mbi
	m7u8qMEEiEOsw2pSajOrUgg/5EhzClcMpLOy5s6cYBqHgnbtZqTfmXCjskjt1BMcxfzOTkYs2K8
	v2WV/EKSBUeubSmpNB/eyV99F19ORvtxoPQ5zt3jeHMXFrVIL513nUOgcmIO9q5iktOg/XGWIDx
	iVBHgSvXNyzF47IKSd4yEtwC3bKTE5bfSjO+YucJL83M8iuBkLvioKZi+SXaO0ejFpe52/KpIv8
	wwCY=
X-Google-Smtp-Source: AGHT+IHoDMY8wbul5is1dz7DmZViTlbVxhnNBIfc3rpUO+h3Y9Iw0U8xnv997VFlA99JKUxfNJpPhg==
X-Received: by 2002:a05:600c:6745:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-454b3069f2cmr113934215e9.6.1751898846040;
        Mon, 07 Jul 2025 07:34:06 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a998a47dsm140081935e9.18.2025.07.07.07.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 07:34:04 -0700 (PDT)
Message-ID: <0ae470c0-49c3-4ee9-913c-19e58a505b13@gmail.com>
Date: Mon, 7 Jul 2025 15:31:49 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: i2c: add manual I2C device creation
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
 <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
 <aGgxfNh-sgkJls_h@cassiopeiae>
 <954a40a4-2f5a-4ef8-84ea-3d2ba2c85cfe@gmail.com> <aGu3O8QzboCQiKSL@pollux>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aGu3O8QzboCQiKSL@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/25 13:02, Danilo Krummrich wrote:
> On Mon, Jul 07, 2025 at 12:20:15PM +0100, Igor Korotin wrote:
>>
>>
>> On 7/4/25 20:54, Danilo Krummrich wrote:
>>> On Fri, Jul 04, 2025 at 04:39:12PM +0100, Igor Korotin wrote:
>>>> -pub struct Device<Ctx: device::DeviceContext = device::Normal>(
>>>> +pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
>>>>      Opaque<bindings::i2c_client>,
>>>>      PhantomData<Ctx>,
>>>> +    PhantomData<State>,
>>>>  );
>>>
>>> I see what you're doing here, but I think you're thinking this way too
>>> complicated.
>>>
>>> I recommend not to reuse the Device type to register a new I2C client device,
>>> it's adding too much complexity without any real value.
>>>
>>> You also don't want the DeviceContext types for a device registration, since the
>>> registration will never have any other DeviceContext than device::Normal (see
>>> also my comment on the sample module).
>>>
>>> DeviceContext types are only useful for &Device (i.e. references) given out for
>>> a specific scope, such as probe(), remove(), etc.
>>>
>>> The only thing you really want to do is to register a new I2C client device, get
>>> a i2c::Registration instance and call i2c_unregister_device() when the
>>> i2c::Registration is dropped.
>>>
>>> This is exactly the same use-case as we have in the auxiliary bus. I highly
>>> recommend looking at what auxiliary::Registration does [1].
>>>
>>> Also note that if you want a reference to the device in the i2c::Registration,
>>> you can also add a i2c::Registration::device() method that returns an
>>> &i2c::Device, which through into() you can obtain an ARef<i2c::Device> from.
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299
>>
>> I took a quick look at the auxiliary Registration abstraction and I see
>> that it is not applicable for I2C subsystem. The issue here is that I2C
>> C code doesn't provide with an API that can registers an I2C client from
>> already existing `struct i2c_client`.
> 
> I don't see why the following wouldn't work:
> 
> 	struct Registration(NonNull<bindings::i2c_client>);
> 
> 	impl Registration {
> 	   pub fn new(adp: &I2cAdapterRef, info: &I2cBoardInfo) -> Result<Self> {
> 	      // SAFETY: [...]
> 	      let cli = unsafe { bindings::i2c_new_client_device(adp.as_raw(), info.as_raw()) };
> 	
> 	      // Handle ERR_PTR()
> 	
> 	      Self(NonNull::new(cli))
> 	   }
> 	}
> 	
> 	impl Drop for Registration {
> 	   fn drop(&mut self) {
> 	      // SAFETY: [...]
> 	      unsafe { bindings::i2c_unregister_device(self.as_ptr()) };
> 	   }
> 	}
> 
> And in you sample driver you can still the exactly the same as you did before:
> 
> 	struct SampleDriver {
> 	   _reg: i2c::Registration,
> 	}
> 	
> 	impl kernel::Module for SampleDriver {
> 	    fn init(_module: &'static ThisModule) -> Result<Self> {
> 	        let adapter = i2c::I2cAdapterRef::get(0).ok_or(EINVAL)?;
> 	
> 	        let reg = i2c::Registration::new(&adapter, &BOARD_INFO)?;
> 	
> 	        Ok(Self { _reg: reg })
> 	    }
> 	}
> 

Ok, I think I've caught the idea. In general I worried that if one has
link to an i2c::Device which is a transparent representation of `struct
i2c_client` he could somehow cast that `i2c::Device` to
`Registration(NonNull<bindings::i2c_client>)`. After some experiments, I
found out that this is not possible due to scope of the
`i2c::Device::as_raw()`. So the simple NonNull implementation is as safe
as my "super-puper secured" DeviceOwned implementation.
Thanks
Igor

