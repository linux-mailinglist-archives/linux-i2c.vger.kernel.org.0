Return-Path: <linux-i2c+bounces-11865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5DAFB63C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 16:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0457B172C57
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 14:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8AA2C1798;
	Mon,  7 Jul 2025 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSWylTnQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706D81724;
	Mon,  7 Jul 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751899170; cv=none; b=JLcQ2M1UE2yH7u5n/qNeZMdSlyNY2GanwFwJYO1hEFpOi0RPfTgx3wVl8xpRY8L9H8Ofg49cgCwdyyctzdDrnw78cL8YVj+tAZNZO9ZE6DiL6o4aWzmKmb6s/XGo3x71zJwA1KqGQNCRLIA8Z4YVVJN7uQZ6ecGQH+fd/YCcFwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751899170; c=relaxed/simple;
	bh=4eYOHHUs3yvdAM0l6wT72s9g3/4rtU1j05xlxZwX9UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZ9b9f7PtQ4IAHRVY0ctPvo7P2qLOkfCcbMDJrLRcO02sBTlIszSc2NKQCriqvn6iYNAOSk46fWiuIf4c4Mq2FZTS6V6mky8wh1Da7ufETQ6dT1CaAoYFqniqHVP5yANikPFZ80XbUDyDNj2xFbttCUsN8BObEJlCUWE+K/VZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSWylTnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E71C4CEE3;
	Mon,  7 Jul 2025 14:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751899169;
	bh=4eYOHHUs3yvdAM0l6wT72s9g3/4rtU1j05xlxZwX9UU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SSWylTnQcOOjyrZlUpjfMgWuR2rUdKWxCo1Skzo9hjssxv4+SVlyr1dCrZe1TX2yl
	 3zCCjWoyDn+BsW7LK7HJUKKJdhHAJc/EA8prxS7dRUSFK0a4Nl/ot/BCtq0cmoQEzX
	 DxscVWDPucf0SJqUZsicRicqcaLJ8L5hLCyaGcRDXiw8ZsmC9uxaTOSpdctXlgifAd
	 ehunIrsI9gY8eOpFo/fQLAG5/b29xnO0yxPl7CC+UoFCqaohbdB/69ZmCi9n/bfrN+
	 9oRj1YZtqceRewu17f2RzhvU9I23VnTYQ0uEnDzyTMm26jLobRZ9IrMfQMrNS0lcId
	 uh0D4CBCVVnJA==
Message-ID: <7390bc96-0049-4f8a-899e-64fe2105fa8d@kernel.org>
Date: Mon, 7 Jul 2025 16:39:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: i2c: add manual I2C device creation
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
 <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
 <aGgxfNh-sgkJls_h@cassiopeiae>
 <954a40a4-2f5a-4ef8-84ea-3d2ba2c85cfe@gmail.com> <aGu3O8QzboCQiKSL@pollux>
 <0ae470c0-49c3-4ee9-913c-19e58a505b13@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <0ae470c0-49c3-4ee9-913c-19e58a505b13@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 4:31 PM, Igor Korotin wrote:
> On 7/7/25 13:02, Danilo Krummrich wrote:
>> On Mon, Jul 07, 2025 at 12:20:15PM +0100, Igor Korotin wrote:
>>>
>>>
>>> On 7/4/25 20:54, Danilo Krummrich wrote:
>>>> On Fri, Jul 04, 2025 at 04:39:12PM +0100, Igor Korotin wrote:
>>>>> -pub struct Device<Ctx: device::DeviceContext = device::Normal>(
>>>>> +pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
>>>>>       Opaque<bindings::i2c_client>,
>>>>>       PhantomData<Ctx>,
>>>>> +    PhantomData<State>,
>>>>>   );
>>>>
>>>> I see what you're doing here, but I think you're thinking this way too
>>>> complicated.
>>>>
>>>> I recommend not to reuse the Device type to register a new I2C client device,
>>>> it's adding too much complexity without any real value.
>>>>
>>>> You also don't want the DeviceContext types for a device registration, since the
>>>> registration will never have any other DeviceContext than device::Normal (see
>>>> also my comment on the sample module).
>>>>
>>>> DeviceContext types are only useful for &Device (i.e. references) given out for
>>>> a specific scope, such as probe(), remove(), etc.
>>>>
>>>> The only thing you really want to do is to register a new I2C client device, get
>>>> a i2c::Registration instance and call i2c_unregister_device() when the
>>>> i2c::Registration is dropped.
>>>>
>>>> This is exactly the same use-case as we have in the auxiliary bus. I highly
>>>> recommend looking at what auxiliary::Registration does [1].
>>>>
>>>> Also note that if you want a reference to the device in the i2c::Registration,
>>>> you can also add a i2c::Registration::device() method that returns an
>>>> &i2c::Device, which through into() you can obtain an ARef<i2c::Device> from.
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299
>>>
>>> I took a quick look at the auxiliary Registration abstraction and I see
>>> that it is not applicable for I2C subsystem. The issue here is that I2C
>>> C code doesn't provide with an API that can registers an I2C client from
>>> already existing `struct i2c_client`.
>>
>> I don't see why the following wouldn't work:
>>
>> 	struct Registration(NonNull<bindings::i2c_client>);
>>
>> 	impl Registration {
>> 	   pub fn new(adp: &I2cAdapterRef, info: &I2cBoardInfo) -> Result<Self> {
>> 	      // SAFETY: [...]
>> 	      let cli = unsafe { bindings::i2c_new_client_device(adp.as_raw(), info.as_raw()) };
>> 	
>> 	      // Handle ERR_PTR()
>> 	
>> 	      Self(NonNull::new(cli))
>> 	   }
>> 	}
>> 	
>> 	impl Drop for Registration {
>> 	   fn drop(&mut self) {
>> 	      // SAFETY: [...]
>> 	      unsafe { bindings::i2c_unregister_device(self.as_ptr()) };
>> 	   }
>> 	}
>>
>> And in you sample driver you can still the exactly the same as you did before:
>>
>> 	struct SampleDriver {
>> 	   _reg: i2c::Registration,
>> 	}
>> 	
>> 	impl kernel::Module for SampleDriver {
>> 	    fn init(_module: &'static ThisModule) -> Result<Self> {
>> 	        let adapter = i2c::I2cAdapterRef::get(0).ok_or(EINVAL)?;
>> 	
>> 	        let reg = i2c::Registration::new(&adapter, &BOARD_INFO)?;
>> 	
>> 	        Ok(Self { _reg: reg })
>> 	    }
>> 	}
>>
> 
> Ok, I think I've caught the idea. In general I worried that if one has
> link to an i2c::Device which is a transparent representation of `struct
> i2c_client` he could somehow cast that `i2c::Device` to
> `Registration(NonNull<bindings::i2c_client>)`. After some experiments, I
> found out that this is not possible due to scope of the
> `i2c::Device::as_raw()`. So the simple NonNull implementation is as safe
> as my "super-puper secured" DeviceOwned implementation.

Well, with unsafe and raw pointer casts you can basically break anything,
including this design. Don't worry about it. The important part is that the
design does not allow "illegal" operations while sticking to safe code.

