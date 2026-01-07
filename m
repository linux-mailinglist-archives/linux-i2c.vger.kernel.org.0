Return-Path: <linux-i2c+bounces-14982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B84CFF094
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 18:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E813174312
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 17:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CA4348447;
	Wed,  7 Jan 2026 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWRXAf6v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663343A0B08;
	Wed,  7 Jan 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804028; cv=none; b=kPEJHBKt37hRI6/C79A5/VI9XvSNYHo8SvT81NFpIVt+zPpj+eqo4/wgmkd5esS1bwQ/KYQL5HBFjG8ZvG8e8RlWvfC0scUtEoRdJsCMMs2cZMgNH4YpTNykUa1e3kp1U3qpbrVtfAZl1hMWt1PLL0vRcusTWPSYvhbgou2oZBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804028; c=relaxed/simple;
	bh=z3POv5J4x+meLVYbsQCf7mB/6gWPZ96vXCB8Job/Vvs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=axs/PjgMijKadLf9YG8M733ZFbJO7ro6viyxvbIiZfGtXbWNO+Dxo+M3gLpSoD7FvrxrzLOdGz5HiVrlCqra6wDgLZ8n6OkMwZXxuOvGBJQPpts+XmgxcfhQFaH7IlGMBPsh6AzGPztHLIEB4LVe7+yVyi98OxNQMGA5OYJ230o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWRXAf6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99E7C4CEF1;
	Wed,  7 Jan 2026 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767804026;
	bh=z3POv5J4x+meLVYbsQCf7mB/6gWPZ96vXCB8Job/Vvs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=eWRXAf6v4PEvZFPNQ9MSIq4mhg/lKsxd/ojHLmtL2/9VcVDlrbVbiA6snO1GiXnbT
	 /iNW0LDo1Dz0qk+FFbvfyzNtvX+elFdZITVNrrTvhKVyf/LVuWfqkhsfVQnnYPtiU0
	 Vnb4F482tZaEa6J/nyNruw4kS+S4lRntIo1DLkfvW7STpDVoBqQARyTGc7zWnmdrb1
	 o7+QJUM2BvERsQ9+vZbgeOxEiE1VL1Uyg3meBjb3sebKBGMokS+eLWqd2MIVUC4D0C
	 r/1djN+F3ERXtW3oDP2zqj/ApnebxGZ4HqbnDJX7zrf/gMIL7w8/WtL7SVbyuy07tb
	 ptDO8D4095e0A==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 17:40:20 +0100
Message-Id: <DFII83QY76O0.2PKZ73WCTVGPR@kernel.org>
Subject: Re: [PATCH 0/6] Address race condition with Device::drvdata()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <igor.korotin.linux@gmail.com>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <bhelgaas@google.com>,
 <kwilczynski@kernel.org>, <wsa+renesas@sang-engineering.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107103511.570525-1-dakr@kernel.org>
 <aV6BHw-Liv0SVAwO@google.com>
In-Reply-To: <aV6BHw-Liv0SVAwO@google.com>

On Wed Jan 7, 2026 at 4:51 PM CET, Alice Ryhl wrote:
> If a &Device<Bound> lets you access a given value, then we must not
> destroy that value until after the last &Device<Bound> has expired.
>
> A &Device<Bound> lets you access the driver private data. And a
> &Device<Bound> lets you access the contents of a Devres<T>.
>
> Thus, the last &Device<Bound> must expire before we destroy driver
> private data or values inside of Devres<T>. Etc.

Yes, the last &Device<Bound> must expire before we destroy the device priva=
te
data. This is exactly what is achieved by this patch. The device private da=
ta is
destroyed after all devres callbacks have been processed, which guarantees =
that
there can't be any contexts left that provide a &Device<Bound>.

As for the values inside of a Devres<T>, this is exactly what I refer to in=
 my
paragraph above talking about the unsoundness of the devres cleanup orderin=
g in
Rust.

I also mention that I'm already working on a solution and it is in fact pre=
tty
close to the solution you propose below, i.e. a generic mechanism to suppor=
t
multiple devres domains (which I also see advantages for in C code).

As mentioned, this will also help with getting the required synchronize_rcu=
()
calls down to exactly one per device unbind.

Technically, we could utilize such a devres domain for dropping the device
private data, but there is no need to have a separate domain just for this,=
 we
already have a distinct place for dropping and freeing the device private d=
ata
after the device has been fully unbound, which is much simpler than a separ=
ate
devres domain.

Now, you may argue we don't need a separate devres domain, and that we coul=
d use
the non-early devres domain. However, this would have the following implica=
tion:

In the destructor of the device private data, drivers could still try to us=
e
device resources stored in the device private data through try_access(), wh=
ich
may or may not succeed depending on whether the corresponding Devres<T>
containers are part of the device private data initializer or whether they =
have
been allocated separately.

Or in other words it would leave room for drivers to abuse this behavior.

Therefore, the desired order is:

  1. Driver::unbind() (A place for drivers to tear down the device;
     registrations are up - unless explicitly revoked by the driver (this i=
s a
     semantic choice) - and device resources are accessible.)

  2. devm_early_* (Drop all devres guarded registrations.)

  3. No more &Device<Bound> left.

  4. devm_* (Drop all device resources.)

  5. No more device resources left.

  6. Drop and free device private data. (try_access() will never succeed in=
 the
     destructor of the device private data.

- Danilo

