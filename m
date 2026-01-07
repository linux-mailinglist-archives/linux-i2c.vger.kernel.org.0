Return-Path: <linux-i2c+bounces-14980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D629BCFF222
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 18:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1254E3228FF2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 16:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32D396D01;
	Wed,  7 Jan 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sVG+Gvxz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF9396D0F
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767801132; cv=none; b=Q7sZ36X0SlrMWAlv5IazIV+BIKupvunpQxaIs1EikS7qg4GagbLjCwZtzL08g4ECdOD6YS57dCmH3uyU0kEyGuX6k14ptXPNkFj7mR0NI6JvRe6187zgJuUqDq6LFPV+2zfr7bHgYaQ5C43p1mgtDdByMz2pbCCuLLq5yoWqMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767801132; c=relaxed/simple;
	bh=WXZMe4HP3vNPReOPTMwzVrsjCdvjsyH5VjpRkjOfyhU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nc5NCJc48rb2F0z7Il+OA0U+Z0r1CwO++aymKSMefNBLGLU4tk0LBKLmyiMFZpSmmhiBXJN63ISyke5wKXj6H8EHEe8d6y2kSn8Arao3xkb51famMUQ/y50DR+/tK1uvo2zjKBljmxl5HdJqKlQxpW9JqpDLeygMk/nWftv9GWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sVG+Gvxz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3c4468d8so15773735e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767801120; x=1768405920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KzJooJr2ofQffqYH6J44S/NyT0tH1jNqXbKY2GqyAaM=;
        b=sVG+GvxzA/bIWQCZReXPeS1jCtipHwLFJ8H3+TTr7IHjtw9oscdftuiV7uHVLznSrt
         ZzbtUYvJiZ03Mf2u/b2ceb9RzILJgjR+prkpzAViQCrI25G/PNz9zCUZLE18eE+KTBl1
         NjBQDCD8M6YFO7oPZIsM4A++l3HnCICPOZ8DlgwUkjALAlVXlN71d4lm3VwGY7lfSKIw
         KvSemEGGw8aFqsvdu0U1ml42nsIUGG3Azl4CCSARJLj6rUzdXQrw92zFIe3AhqpukNi8
         LsShOMI+p8mAfOkMtMqHFEdBRngLc0FWko5NYzAg8WQn2jW9kRVKlJeljJsvRgJsafDZ
         Yb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767801120; x=1768405920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzJooJr2ofQffqYH6J44S/NyT0tH1jNqXbKY2GqyAaM=;
        b=ZMtOa6szM532w/Ms8r86wE5aIIlDF2cIcEQE7eFpYp1eUu9tcds8+1/7JPiwbo311h
         7Nx5FHOc/VP6JV/T+JAyl6hKrCWtg45fxLxLrX7Qbl/XW3NbWRWA7uEIAFuA5DhT6Vt5
         trfc8IDXYZltnHgOt9aBXEuOVje4yA+u7BxBoH1R00OqEJQBTX0eM395oAEIyGnNg6RE
         qX/TLvqpECV67yasfUPMivC+wbfR1Ai0PJvAbZdI9lxocSmcWtQ5jvnsfEJY0/9qRPZ+
         JTOPzRJ98yuG9eWtp4sO2Vt0ly6geXeGVg6L225tIe/aRNTwTEYAQjvBl99Rb4cGEuUf
         DBRA==
X-Forwarded-Encrypted: i=1; AJvYcCWt5VEcppUp7Fe45LFxZxyeBAZY0aE6uO/9gjJcfBlV5G1OHVduqbtSJIaXuZpeNtiSTcNgBP5QhmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrQXCUBASHNz25MIOO5rkQYGey4TJ35zs84ILDG3OwsnU788/l
	BbqtBL4gLgQaz1D3kD+Q7WzXPVpwYmmtlzh4FThjXRfTel0ue9GrDkfe/IPkWRskWLCZbculhSR
	1tkvjpy1/l3tfc5w0fg==
X-Google-Smtp-Source: AGHT+IGf7S57fwqtaG/Y63VwksZsm6MPDrdn5BaGxjtMY+WZa3f+qrbuzEydbLZth9rk78JW5kkgVrJK4VKyKM0=
X-Received: from wmbz13.prod.google.com ([2002:a05:600c:c08d:b0:479:3624:3472])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:82c3:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47d84b3463fmr32388425e9.18.1767801120462;
 Wed, 07 Jan 2026 07:52:00 -0800 (PST)
Date: Wed, 7 Jan 2026 15:51:59 +0000
In-Reply-To: <20260107103511.570525-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260107103511.570525-1-dakr@kernel.org>
Message-ID: <aV6BHw-Liv0SVAwO@google.com>
Subject: Re: [PATCH 0/6] Address race condition with Device::drvdata()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	igor.korotin.linux@gmail.com, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, wsa+renesas@sang-engineering.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 07, 2026 at 11:34:59AM +0100, Danilo Krummrich wrote:
> Currently, the driver's device private data is allocated and initialized
> from driver core code called from bus abstractions after the driver's
> probe() callback returned the corresponding initializer.
> 
> Similarly, the driver's device private data is dropped within the
> remove() callback of bus abstractions after calling the remove()
> callback of the corresponding driver.
> 
> However, commit 6f61a2637abe ("rust: device: introduce
> Device::drvdata()") introduced an accessor for the driver's device
> private data for a Device<Bound>, i.e. a device that is currently bound
> to a driver.
> 
> Obviously, this is in conflict with dropping the driver's device private
> data in remove(), since a device can not be considered to be fully
> unbound after remove() has finished:
> 
> We also have to consider registrations guarded by devres - such as IRQ
> or class device registrations - which are torn down after remove() in
> devres_release_all().
> 
> Thus, it can happen that, for instance, a class device or IRQ callback
> still calls Device::drvdata(), which then runs concurrently to remove()
> (which sets dev->driver_data to NULL and drops the driver's device
> private data), before devres_release_all() started to tear down the
> corresponding registration. This is because devres guarded registrations
> can, as expected, access the corresponding Device<Bound> that defines
> their scope.
> 
> In C it simply is the driver's responsibility to ensure that its device
> private data is freed after e.g. an IRQ registration is unregistered.
> 
> Typically, C drivers achieve this by allocating their device private data
> with e.g. devm_kzalloc() before doing anything else, i.e. before e.g.
> registering an IRQ with devm_request_threaded_irq(), relying on the
> reverse order cleanup of devres [1].
> 
> Technically, we could do something similar in Rust. However, the
> resulting code would be pretty messy:
> 
> In Rust we have to differentiate between allocated but uninitialized
> memory and initialized memory in the type system. Thus, we would need to
> somehow keep track of whether the driver's device private data object
> has been initialized (i.e. probe() was successful and returned a valid
> initializer for this memory) and conditionally call the destructor of
> the corresponding object when it is freed.
> 
> This is because we'd need to allocate and register the memory of the
> driver's device private data *before* it is initialized by the
> initializer returned by the driver's probe() callback, because the
> driver could already register devres guarded registrations within
> probe() outside of the driver's device private data initializer.
> 
> Luckily there is a much simpler solution: Instead of dropping the
> driver's device private data at the end of remove(), we just drop it
> after the device has been fully unbound, i.e. after all devres callbacks
> have been processed.
> 
> For this, we introduce a new post_unbind() callback private to the
> driver-core, i.e. the callback is neither exposed to drivers, nor to bus
> abstractions.
> 
> This way, the driver-core code can simply continue to conditionally
> allocate the memory for the driver's device private data when the
> driver's initializer is returned from probe() - no change needed - and
> drop it when the driver-core code receives the post_unbind() callback.
> 
> --
> 
> Dependency wise we need a common Driver trait that describes the layout of a
> specific driver structure, such as struct pci_driver or struct platform_driver.
> Additional to this specific driver type (which was previously the associated
> type RegType of the RegistrationOps) it provides the offset to the embedded
> struct device_driver and the type of the driver's device private data.
> 
> This patch series contains two additional dependencies:
> 
>   (1) A fix for i2c::Driver::shutdown() to not free the driver's device
>       private data at all, which otherwise causes the exact same bug, and
>       is not necessary in the first place anyways.
> 
>   (2) Add the auxiliary::Driver::unbind() callback. Strictly speaking,
>       this is not a dependency, but without this patch the main fix of this
>       series leaves the remove() callback of the auxiliary bus
>       abstraction with either dead code or quite some code removed;
>       code that we would otherwise add back immediately afterwards.
> 
> --
> 
> [1] In fact, the cleanup ordering of devres is a separate challenge in
>     Rust, since it is technically unsound to rely on the driver to pick
>     the correct order. I am already working on a solution for this;
>     luckily this also has some synergies with optimizing the required
>     synchronize_rcu() calls required by the Rust Devres container
>     structure down to exactly one per driver unbind.

I don't think these are really separate problems. And I think this may
be the wrong fix.

If a &Device<Bound> lets you access a given value, then we must not
destroy that value until after the last &Device<Bound> has expired.

A &Device<Bound> lets you access the driver private data. And a
&Device<Bound> lets you access the contents of a Devres<T>.

Thus, the last &Device<Bound> must expire before we destroy driver
private data or values inside of Devres<T>. Etc.

What are sources of &Device<Bound> today?

* Most driver callbacks.
* IRQ callbacks.
* Workqueue callbacks. (In the future.)
* I think that's it ...?

Thus, we must call free_irq() before we destroy *the first* Devres<T>
resource or the driver private data.

Thus, we must ensure that driver callbacks are somehow synchronized to
exit before we destroy *the first* Devres<T> resource or the driver
private data.

One thing is that this means that using a Devres<_> container and
callback as the mechanism for calling free_irq() is not possible.

I'm thinking that we may need two domains of callbacks:

1. devm_early_*
2. DEVICE IS NOW CONSIDERED UNBOUND - there must no longer be any &Device<Bound> left
3. free driver private data
4. devm_*

And devm_early_*() would be a new set of callbacks where we can run
things such as free_irq(). It would use a separate DevresEarly<_>
container, for which &Device<Bound> does *not* let you peek inside. And
the usual Devres<_> is cleaned up in step 4, where it is legal to peek
inside given a &Device<Bound>.

We could potentially revoke Devres<_> containers during devm_early_*,
but actually destroy their contents in devm_*. This gives you a clean
mechanism to replace the per-Devres<_> synchronize_rcu() calls with a
single one. (By declaring step 2 must last at least one rcu grace
period.)

Not sure whether remove() should run before or after step (2). If it
runs before, then it does not need to be synchronized with other device
callbacks and can free the driver private data. If it runs after (2),
then we can't destroy driver private data in remove().

Alice

