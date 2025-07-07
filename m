Return-Path: <linux-i2c+bounces-11863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8774AFB2CC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 14:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7EFE3AE4DF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12184298CDA;
	Mon,  7 Jul 2025 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDKAXIhz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7C1FCF41;
	Mon,  7 Jul 2025 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889730; cv=none; b=KLWq6xUFzOTh17hKwE97K2y3YQ/H3v5SevUXbgXm4tXyFkhSqlLiBF+Kf9cgNRz8cCu/GxGIrKU5sO01qZBiFTNsu9N2Eb0WHzAcqgfX+jBrZl0m/W6VRdrQapfz4blJfcqW8mndguaQc+YmROvA7L0xFsPS/llP6VkyvmlAV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889730; c=relaxed/simple;
	bh=kVFoEUGp2UNblRLb6XHbJyewGsxkZT1YXp1RdETPjgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaGLz6/eu34iuabuAWJFb2N2p4ukNDEvsVsEMcqAIPn32zIyMFX4uaZ/kDL2tLWr5tONGyF6dzmiTmPVws61xrF6njzAh55psMJa+X8yCgqyEn2HJAC8Fz/1s8BwWHmB+8NuM776z+SlaIe3XQpFaq3ZR9h8A/2tspcjWdsZHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDKAXIhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C767C4CEE3;
	Mon,  7 Jul 2025 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751889730;
	bh=kVFoEUGp2UNblRLb6XHbJyewGsxkZT1YXp1RdETPjgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDKAXIhzKK8nhyJsT1ghan+q23bZK33/gYBQZL9JnKbtsq8KKMS+FrxY1bLcWYHD/
	 z80rAiXnLR53tqaCiw/W2KhnhQY8bB7nnstEZr1P6Ve5i6oYF4I4OTTK/6Q3grAVsC
	 E/Mm1Sbintz3rLtIO7ZOmG5edqv4KkUrASMdIZEbiJNbx3d+iF3v5GeTegBeiFJRGs
	 Jtu1ucNnrHR4t1eETXsFnRY6dc121wka+ovWmiU4x/BGpKM65+0aSJS53ARECgDD61
	 I83/3HkMrradwCjf9AwlMhMonNPswOpgLuLevANe+LCWLrjB/olbCdMQLiWNMeulIG
	 PxNotJYXYv4uw==
Date: Mon, 7 Jul 2025 14:02:03 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>, Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/4] rust: i2c: add manual I2C device creation
 abstractions
Message-ID: <aGu3O8QzboCQiKSL@pollux>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
 <aGgxfNh-sgkJls_h@cassiopeiae>
 <954a40a4-2f5a-4ef8-84ea-3d2ba2c85cfe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <954a40a4-2f5a-4ef8-84ea-3d2ba2c85cfe@gmail.com>

On Mon, Jul 07, 2025 at 12:20:15PM +0100, Igor Korotin wrote:
> 
> 
> On 7/4/25 20:54, Danilo Krummrich wrote:
> > On Fri, Jul 04, 2025 at 04:39:12PM +0100, Igor Korotin wrote:
> >> -pub struct Device<Ctx: device::DeviceContext = device::Normal>(
> >> +pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
> >>      Opaque<bindings::i2c_client>,
> >>      PhantomData<Ctx>,
> >> +    PhantomData<State>,
> >>  );
> > 
> > I see what you're doing here, but I think you're thinking this way too
> > complicated.
> > 
> > I recommend not to reuse the Device type to register a new I2C client device,
> > it's adding too much complexity without any real value.
> > 
> > You also don't want the DeviceContext types for a device registration, since the
> > registration will never have any other DeviceContext than device::Normal (see
> > also my comment on the sample module).
> > 
> > DeviceContext types are only useful for &Device (i.e. references) given out for
> > a specific scope, such as probe(), remove(), etc.
> > 
> > The only thing you really want to do is to register a new I2C client device, get
> > a i2c::Registration instance and call i2c_unregister_device() when the
> > i2c::Registration is dropped.
> > 
> > This is exactly the same use-case as we have in the auxiliary bus. I highly
> > recommend looking at what auxiliary::Registration does [1].
> > 
> > Also note that if you want a reference to the device in the i2c::Registration,
> > you can also add a i2c::Registration::device() method that returns an
> > &i2c::Device, which through into() you can obtain an ARef<i2c::Device> from.
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299
> 
> I took a quick look at the auxiliary Registration abstraction and I see
> that it is not applicable for I2C subsystem. The issue here is that I2C
> C code doesn't provide with an API that can registers an I2C client from
> already existing `struct i2c_client`.

I don't see why the following wouldn't work:

	struct Registration(NonNull<bindings::i2c_client>);

	impl Registration {
	   pub fn new(adp: &I2cAdapterRef, info: &I2cBoardInfo) -> Result<Self> {
	      // SAFETY: [...]
	      let cli = unsafe { bindings::i2c_new_client_device(adp.as_raw(), info.as_raw()) };
	
	      // Handle ERR_PTR()
	
	      Self(NonNull::new(cli))
	   }
	}
	
	impl Drop for Registration {
	   fn drop(&mut self) {
	      // SAFETY: [...]
	      unsafe { bindings::i2c_unregister_device(self.as_ptr()) };
	   }
	}

And in you sample driver you can still the exactly the same as you did before:

	struct SampleDriver {
	   _reg: i2c::Registration,
	}
	
	impl kernel::Module for SampleDriver {
	    fn init(_module: &'static ThisModule) -> Result<Self> {
	        let adapter = i2c::I2cAdapterRef::get(0).ok_or(EINVAL)?;
	
	        let reg = i2c::Registration::new(&adapter, &BOARD_INFO)?;
	
	        Ok(Self { _reg: reg })
	    }
	}

Note that you can also combine you two sample drivers into one by doing the
above *and* register a and I2C driver that probes against your device
registration. :)

