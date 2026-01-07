Return-Path: <linux-i2c+bounces-14969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F2CFDC83
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 13:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FA6C3025FBE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 12:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6F431A55F;
	Wed,  7 Jan 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flAh5htV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF51B142D;
	Wed,  7 Jan 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790250; cv=none; b=i5DrCRxt8Il0v5VmBqsb2MGrrUtlLy647341MtNDpSfL9cyqgYchZndylwREz9UqZcU/vDh+XyFxekkdsu4ocYribpKcY+bln5I5K7lgQ+54zuuWe0FtmsOv4vm3NgBNInEjzM0rIDcf6xJ1oyuE/e2dwUOvPoU/PFeWTWbbt6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790250; c=relaxed/simple;
	bh=LrCttn75laUEARHSY9uq0348C+BZ/PrAY/VxWiFQf3A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BVPCxC4leQvDoebsFeJJCF7OIQNhEXLMGs3b+H0XMdKGaR11z45nqujvXwMIYcDYBlcKB5yo2cnEOOIv40vXgea/1QzIWLzmJBDTOL4NhaP9nVfZquHhYpouvkkmqz4Xjf1vKCngaeyep+V+j+jW/LLl46Jqpr/3FjS8kHZ7+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flAh5htV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5529BC4CEF7;
	Wed,  7 Jan 2026 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790249;
	bh=LrCttn75laUEARHSY9uq0348C+BZ/PrAY/VxWiFQf3A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=flAh5htVM+Oo/T088+PXWkGHVSz/y4TJwNObPO/WKTea44Th3Dt+UvslGsW1x9Chu
	 z/8XcS7JsRu7w8jHqQXoYR5xrLZqPDWeLVZjd/0dnDNqraJ/d665w8F4ZO1wyH5IUP
	 2uIKLGP5c5N2wgqWjS9+C2x9xcv0y7rafy/HY55UnKjb15I1MX5HTxRtg0i8Ae5gkl
	 Wo4ymcxkAkOuEaJvjrnySs4w5UpM9ucJbBD6NKdbW8TZ4Sb2BuYRrAncWqgbkDvlgR
	 MTNydXt7Hd1wka3czmXVpO/dEyjKySSkvjfXt/i+UkGp0YWY3FCKExWc3Au1m8G+cF
	 I3YtVmKGAp5Rw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 13:50:43 +0100
Message-Id: <DFIDCAL68R7N.8SYKSAF0JO4C@kernel.org>
Subject: Re: [PATCH 6/6] rust: driver: drop device private data post unbind
Cc: <rafael@kernel.org>, <igor.korotin.linux@gmail.com>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <bhelgaas@google.com>, <kwilczynski@kernel.org>,
 <wsa+renesas@sang-engineering.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-i2c@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107103511.570525-1-dakr@kernel.org>
 <20260107103511.570525-7-dakr@kernel.org>
 <2026010741-wiry-trophy-46ec@gregkh>
In-Reply-To: <2026010741-wiry-trophy-46ec@gregkh>

On Wed Jan 7, 2026 at 1:22 PM CET, Greg KH wrote:
> On Wed, Jan 07, 2026 at 11:35:05AM +0100, Danilo Krummrich wrote:
>> @@ -548,6 +548,10 @@ static DEVICE_ATTR_RW(state_synced);
>>  static void device_unbind_cleanup(struct device *dev)
>>  {
>>  	devres_release_all(dev);
>> +#ifdef CONFIG_RUST
>
> Nit, let's not put #ifdef in .c files, the overhead of an empty pointer
> for all drivers is not a big deal.

I agree, I mainly did it to make it clear that, as by now, this is only use=
d by
Rust driver-core code. However, ...

>> +	if (dev->driver->p_cb.post_unbind)
>> +		dev->driver->p_cb.post_unbind(dev);
>> +#endif

<snip>

>> +	struct {
>> +		/*
>> +		 * Called after remove() and after all devres entries have been
>> +		 * processed.
>> +		 */
>> +		void (*post_unbind)(struct device *dev);
>
> post_unbind_rust_only()?

...this works as well. We can always rename it, in case we start using it i=
n C
too.

So, I'm fine with either. :)

>> -impl<T: RegistrationOps> Registration<T> {
>> +impl<T: RegistrationOps + 'static> Registration<T> {
>> +    extern "C" fn post_unbind_callback(dev: *mut bindings::device) {
>> +        // SAFETY: The driver core only ever calls the post unbind call=
back with a valid pointer to
>> +        // a `struct device`.
>> +        //
>> +        // INVARIANT: `dev` is valid for the duration of the `post_unbi=
nd_callback()`.
>> +        let dev =3D unsafe { &*dev.cast::<device::Device<device::CoreIn=
ternal>>() };
>> +
>> +        // `remove()` and all devres callbacks have been completed at t=
his point, hence drop the
>> +        // driver's device private data.
>> +        //
>> +        // SAFETY: By the safety requirements of the `Driver` trait, `T=
::DriverData` is the
>> +        // driver's device private data.
>> +        drop(unsafe { dev.drvdata_obtain::<T::DriverData>() });
>
> I don't mind this, but why don't we also do this for all C drivers?

What exactly do you mean? Manage the lifetime of the device private data
commonly in driver-core code?

> Just null out the pointer at this point in time so that no one can touch
> it, just like you are doing here (in a way.)

I think device_unbind_cleanup() already calls dev_set_drvdata(dev, NULL) [1=
], so
technically we do not have to do it necessarily in Device::drvdata_obtain()=
 as
well.

However, with Device::drvdata_obtain() we take back ownership of the
Pin<KBox<T>> stored in dev->driver_data, so it makes sense to null out the
pointer at exactly this point in time.

[1] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/dd.c#L55=
5

