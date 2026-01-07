Return-Path: <linux-i2c+bounces-14968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7160CFDB15
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 13:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A694305481C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 12:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7B231AA80;
	Wed,  7 Jan 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m/eEQEIk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AF31A56C;
	Wed,  7 Jan 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788568; cv=none; b=DnW2PwONgROR4X7uvuScJvmp8CMXUv1tdaB/3UTGclQlfjn0awJUtX/g+sAqONayrs7dWLvKql2ICCdD9Hh6OReW4Di7IxyhBXiThOp868IkM8lT/g4uOkaTwBJVLyAlx/hXnNcbA8Cx1eDFCNn9skDJBqv0UZ+UgIhTQRkjknU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788568; c=relaxed/simple;
	bh=2wz8cf8crD1UXOpgkNkds4yjzWyJDvxV9FNfHAZ7L/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSVoQpXDNc4R17e/yCD0Q59/xz+Qh3YSvir1qk2D8MZZiTAjCu4Le7AeHYMcQgWwfCtaz9dNnDd45fa7ZW8D/JgRjoPAjVX+ZrEI6Q1StTv0f9eZH++7ashph+70geQo3ZW5W7MvAteWAXyFJmZjmWuIsxrifBh9IvwCredd6NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m/eEQEIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F8C4CEF7;
	Wed,  7 Jan 2026 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767788567;
	bh=2wz8cf8crD1UXOpgkNkds4yjzWyJDvxV9FNfHAZ7L/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/eEQEIkgULSHDPhdH3kgjBcjWc3w1ilYx/3tnhazTYE9GO+ICCseTorTbXgE9/o7
	 EE6TKPEe57iUWaPqb5sZfQV/v5Fr6sMuAC0wn6cobdNm2RWJprWOQN1WGVXZAGmUZ6
	 jOT6A6qj/I0rsJFqqeKIih+hfj+SI736FM5AfISI=
Date: Wed, 7 Jan 2026 13:22:44 +0100
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
Message-ID: <2026010741-wiry-trophy-46ec@gregkh>
References: <20260107103511.570525-1-dakr@kernel.org>
 <20260107103511.570525-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107103511.570525-7-dakr@kernel.org>

On Wed, Jan 07, 2026 at 11:35:05AM +0100, Danilo Krummrich wrote:
> @@ -548,6 +548,10 @@ static DEVICE_ATTR_RW(state_synced);
>  static void device_unbind_cleanup(struct device *dev)
>  {
>  	devres_release_all(dev);
> +#ifdef CONFIG_RUST

Nit, let's not put #ifdef in .c files, the overhead of an empty pointer
for all drivers is not a big deal.

> +	if (dev->driver->p_cb.post_unbind)
> +		dev->driver->p_cb.post_unbind(dev);
> +#endif
>  	arch_teardown_dma_ops(dev);
>  	kfree(dev->dma_range_map);
>  	dev->dma_range_map = NULL;
> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> index cd8e0f0a634b..51a9ebdd8a2d 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -85,6 +85,8 @@ enum probe_type {
>   *		uevent.
>   * @p:		Driver core's private data, no one other than the driver
>   *		core can touch this.
> + * @p_cb:	Callbacks private to the driver core; no one other than the
> + *		driver core is allowed to touch this.
>   *
>   * The device driver-model tracks all of the drivers known to the system.
>   * The main reason for this tracking is to enable the driver core to match
> @@ -119,6 +121,15 @@ struct device_driver {
>  	void (*coredump) (struct device *dev);
>  
>  	struct driver_private *p;
> +#ifdef CONFIG_RUST

Again, no #ifdef.

> +	struct {
> +		/*
> +		 * Called after remove() and after all devres entries have been
> +		 * processed.
> +		 */
> +		void (*post_unbind)(struct device *dev);

post_unbind_rust_only()?

> -impl<T: RegistrationOps> Registration<T> {
> +impl<T: RegistrationOps + 'static> Registration<T> {
> +    extern "C" fn post_unbind_callback(dev: *mut bindings::device) {
> +        // SAFETY: The driver core only ever calls the post unbind callback with a valid pointer to
> +        // a `struct device`.
> +        //
> +        // INVARIANT: `dev` is valid for the duration of the `post_unbind_callback()`.
> +        let dev = unsafe { &*dev.cast::<device::Device<device::CoreInternal>>() };
> +
> +        // `remove()` and all devres callbacks have been completed at this point, hence drop the
> +        // driver's device private data.
> +        //
> +        // SAFETY: By the safety requirements of the `Driver` trait, `T::DriverData` is the
> +        // driver's device private data.
> +        drop(unsafe { dev.drvdata_obtain::<T::DriverData>() });

I don't mind this, but why don't we also do this for all C drivers?
Just null out the pointer at this point in time so that no one can touch
it, just like you are doing here (in a way.)

thanks,

greg k-h

