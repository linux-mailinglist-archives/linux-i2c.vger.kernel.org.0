Return-Path: <linux-i2c+bounces-14978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC84CFE7E4
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 16:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B279303D302
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 15:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF939358D0D;
	Wed,  7 Jan 2026 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A5kagVQs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88111FCFEF;
	Wed,  7 Jan 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797677; cv=none; b=RhNUpq51iKnsdcgk9BdkDP2WZZP7qUw2y55dUqLOcn7Lg52Y1R7mg5O4JFK1EfJnw9vMmQ6OgWwfS6R6ywlxhLnCXCOkoGTQofhlu8Whz9ICXvSPRXd1nnyHNRt5L+VHrTPpx+flFH8LOYutPJ0JBLL9pamAc5M+R9v134pApFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797677; c=relaxed/simple;
	bh=La1Ofz75igES1mD4H+w4Olr6hpKXBWajprRoIocdnKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnKOD1YkT6tVf2b2WC8hGNftyfhlQK3/bXKsqOpuJ4K1T4CvPf6j6rQWfxpLXejTAqMyjSYkA/d8c+RcnhAv2hKkhsqHWD368y9q0yxk4rkUVyqZfZDtqFzDmQaEFOB73rUryEPQNb6PRKrTI9u8EiolGLlu+Q4l55hRGD9HjtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A5kagVQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63B0C4CEF1;
	Wed,  7 Jan 2026 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767797676;
	bh=La1Ofz75igES1mD4H+w4Olr6hpKXBWajprRoIocdnKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5kagVQsfQjktM2jOxow627RsQCMrT7nPXX4PljEpkJUSVZ0wCLUWZENM4TtQDBwK
	 Ux//WNT61PGrW9GHyzRtszEAPCCrb6TDJYZ0cg6RKLSj1bG5Lcy4lcUAuGAlMQpeVd
	 z35yBK2xyu0o/3FC0Ff9sS1amSiPTYpOUGbJztS4=
Date: Wed, 7 Jan 2026 15:54:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, igor.korotin.linux@gmail.com, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, david.m.ertman@intel.com, ira.weiny@intel.com,
	leon@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org,
	wsa+renesas@sang-engineering.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 6/6] rust: driver: drop device private data post unbind
Message-ID: <2026010701-rearview-retriever-3268@gregkh>
References: <20260107103511.570525-1-dakr@kernel.org>
 <20260107103511.570525-7-dakr@kernel.org>
 <2026010741-wiry-trophy-46ec@gregkh>
 <DFIDCAL68R7N.8SYKSAF0JO4C@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFIDCAL68R7N.8SYKSAF0JO4C@kernel.org>

On Wed, Jan 07, 2026 at 01:50:43PM +0100, Danilo Krummrich wrote:
> On Wed Jan 7, 2026 at 1:22 PM CET, Greg KH wrote:
> > On Wed, Jan 07, 2026 at 11:35:05AM +0100, Danilo Krummrich wrote:
> >> @@ -548,6 +548,10 @@ static DEVICE_ATTR_RW(state_synced);
> >>  static void device_unbind_cleanup(struct device *dev)
> >>  {
> >>  	devres_release_all(dev);
> >> +#ifdef CONFIG_RUST
> >
> > Nit, let's not put #ifdef in .c files, the overhead of an empty pointer
> > for all drivers is not a big deal.
> 
> I agree, I mainly did it to make it clear that, as by now, this is only used by
> Rust driver-core code. However, ...
> 
> >> +	if (dev->driver->p_cb.post_unbind)
> >> +		dev->driver->p_cb.post_unbind(dev);
> >> +#endif
> 
> <snip>
> 
> >> +	struct {
> >> +		/*
> >> +		 * Called after remove() and after all devres entries have been
> >> +		 * processed.
> >> +		 */
> >> +		void (*post_unbind)(struct device *dev);
> >
> > post_unbind_rust_only()?
> 
> ...this works as well. We can always rename it, in case we start using it in C
> too.
> 
> So, I'm fine with either. :)

I say name it with "rust_" and take out the #ifdef, that makes it
simpler/easier to understand.

> >> -impl<T: RegistrationOps> Registration<T> {
> >> +impl<T: RegistrationOps + 'static> Registration<T> {
> >> +    extern "C" fn post_unbind_callback(dev: *mut bindings::device) {
> >> +        // SAFETY: The driver core only ever calls the post unbind callback with a valid pointer to
> >> +        // a `struct device`.
> >> +        //
> >> +        // INVARIANT: `dev` is valid for the duration of the `post_unbind_callback()`.
> >> +        let dev = unsafe { &*dev.cast::<device::Device<device::CoreInternal>>() };
> >> +
> >> +        // `remove()` and all devres callbacks have been completed at this point, hence drop the
> >> +        // driver's device private data.
> >> +        //
> >> +        // SAFETY: By the safety requirements of the `Driver` trait, `T::DriverData` is the
> >> +        // driver's device private data.
> >> +        drop(unsafe { dev.drvdata_obtain::<T::DriverData>() });
> >
> > I don't mind this, but why don't we also do this for all C drivers?
> 
> What exactly do you mean? Manage the lifetime of the device private data
> commonly in driver-core code?
> 
> > Just null out the pointer at this point in time so that no one can touch
> > it, just like you are doing here (in a way.)
> 
> I think device_unbind_cleanup() already calls dev_set_drvdata(dev, NULL) [1], so
> technically we do not have to do it necessarily in Device::drvdata_obtain() as
> well.
> 
> However, with Device::drvdata_obtain() we take back ownership of the
> Pin<KBox<T>> stored in dev->driver_data, so it makes sense to null out the
> pointer at exactly this point in time.

Ok, no objection from me.

thanks,

greg k-h

