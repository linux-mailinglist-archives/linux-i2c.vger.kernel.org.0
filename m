Return-Path: <linux-i2c+bounces-15070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B320AD13952
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5E3831EA6AE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0255C2DCBF4;
	Mon, 12 Jan 2026 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LoELtewe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37572C0F84;
	Mon, 12 Jan 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230241; cv=none; b=hJ1MvtIUtS7Vamo1IWJF+XznOD/mVhoYWbp+GKyATB1yZ0fMcRJru5aFLkHqyfqLCKjWmf2eyVZ+ynrLgSYDJupKKUDenkthTTXZllwhNogEs9vgFkZKIAWKfsxlig0pTq7MCqWnB4t8EBRVM/1xjXpyHQSPMIoUC3SardeHMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230241; c=relaxed/simple;
	bh=l3wU/YltdXyjGvYTGpFOtQTbsPS+I6Qr9b5BgtqGHvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xli+jOJ/83v+2gXMma5U/EeJv5y9sbvwnkA9br9oo5mRoNW2pcItLNes/o6d5yJklKiurX8oFrDGCh1wzs9a0+2dx7dGa7G73Tnw+CjEy7+BK0FPlvwUN/e1G1Wir8LDd9mQr+5+qVrI1c9+CUnzQUdQQMBfXjeB882RdvTqVT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LoELtewe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C865FC16AAE;
	Mon, 12 Jan 2026 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768230241;
	bh=l3wU/YltdXyjGvYTGpFOtQTbsPS+I6Qr9b5BgtqGHvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoELtewetAbgrLkflbxok9h01WXupfznF1esL15DKDKhWZM2GC54MUfd3lKi/kBtM
	 WNQLqvFTR7OvAi+m6cECsLjnrkdCn96hOqqVUoK3a9Po9OL+p7AsEdRRU8JVtZiFmL
	 KGmbvUUrgIKEswueJLWYGefM5aSK81Ns/sRpDP+A=
Date: Mon, 12 Jan 2026 16:03:58 +0100
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
Message-ID: <2026011231-kitten-stainable-7206@gregkh>
References: <20260107103511.570525-1-dakr@kernel.org>
 <20260107103511.570525-7-dakr@kernel.org>
 <2026010741-wiry-trophy-46ec@gregkh>
 <DFIDCAL68R7N.8SYKSAF0JO4C@kernel.org>
 <2026010701-rearview-retriever-3268@gregkh>
 <DFMOIU3FC48L.17P3TCF92CEZZ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFMOIU3FC48L.17P3TCF92CEZZ@kernel.org>

On Mon, Jan 12, 2026 at 03:27:08PM +0100, Danilo Krummrich wrote:
> On Wed Jan 7, 2026 at 3:54 PM CET, Greg KH wrote:
> > I say name it with "rust_" and take out the #ifdef, that makes it
> > simpler/easier to understand.
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 2d9871503614..bea8da5f8a3a 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -548,10 +548,8 @@ static DEVICE_ATTR_RW(state_synced);
>  static void device_unbind_cleanup(struct device *dev)
>  {
>         devres_release_all(dev);
> -#ifdef CONFIG_RUST
> -       if (dev->driver->p_cb.post_unbind)
> -               dev->driver->p_cb.post_unbind(dev);
> -#endif
> +       if (dev->driver->p_cb.post_unbind_rust)
> +               dev->driver->p_cb.post_unbind_rust(dev);
>         arch_teardown_dma_ops(dev);
>         kfree(dev->dma_range_map);
>         dev->dma_range_map = NULL;
> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> index 51a9ebdd8a2d..bbc67ec513ed 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -121,15 +121,13 @@ struct device_driver {
>         void (*coredump) (struct device *dev);
> 
>         struct driver_private *p;
> -#ifdef CONFIG_RUST
>         struct {
>                 /*
>                  * Called after remove() and after all devres entries have been
> -                * processed.
> +                * processed. This is a Rust only callback.
>                  */
> -               void (*post_unbind)(struct device *dev);
> +               void (*post_unbind_rust)(struct device *dev);
>         } p_cb;
> -#endif
>  };
> 
> 
> diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> index 6e32376d4c7c..26095d7bd0d9 100644
> --- a/rust/kernel/driver.rs
> +++ b/rust/kernel/driver.rs
> @@ -207,7 +207,7 @@ fn callbacks_attach(drv: &Opaque<T::DriverType>) {
>          let base = base.cast::<bindings::device_driver>();
> 
>          // SAFETY: It is safe to set the fields of `struct device_driver` on initialization.
> -        unsafe { (*base).p_cb.post_unbind = Some(Self::post_unbind_callback) };
> +        unsafe { (*base).p_cb.post_unbind_rust = Some(Self::post_unbind_callback) };
>      }
> 
>      /// Creates a new instance of the registration object.

Looks good to me, thanks!


