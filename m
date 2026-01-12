Return-Path: <linux-i2c+bounces-15072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D0D13CE6
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D7343024D72
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7186E362156;
	Mon, 12 Jan 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6ynwmkl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312A2322B7F;
	Mon, 12 Jan 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232858; cv=none; b=vC08wZWiUyvzqtptZVU5e12ThQlzACJrSW5GDu8a6RERIsHrnMWrOSKlr4/aWW7qxMRVqHPAOpj6THsfW5oNrU9KbyeYoOxTpUPSwE2TMHKP81+18/jDMU1pL1El3CumWozXz2TfD0s1ZKlOzaHM//ynbImrmn4oif7bvSkzVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232858; c=relaxed/simple;
	bh=bJREwxXbcrH/YGIWEMocIbkIa9r3pbvOUP7xP2PbaS0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UJCmzenGMxp+ZsCShT3WRAou4Yo/34PTIKnqFeVrqvBDh5sHJGuPhRA8QckGgmOWEKbbpZmMX2AoL2NvHyABEFFG1ziXaOVPD8HcM2dlzjge+GocezRBp0oKlxD7qlU/Bc0ZLOSBHYbXH/9p2h1VfljKaB1bvgoNMCpoz2Qopls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6ynwmkl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65A6C16AAE;
	Mon, 12 Jan 2026 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232857;
	bh=bJREwxXbcrH/YGIWEMocIbkIa9r3pbvOUP7xP2PbaS0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=I6ynwmklDaOgk7Qsb8h4QcAkboCulj5JfjQAEFYpjMdc21v7aEHtDQ0aimloeZIP+
	 VfnrUdQwkSF8iOdsR+JV4CQnpUPcz62w+LqJO7gsIPn0GqinAgmHFeasOcrxerd9Aw
	 yNZSnjhUokT8N2Y279efbZ7iLz92YnZ3FMWTUN74mFrp4a5LEJaXUjRLaVmlHJtrXz
	 k8UiLujPJS/jHQEebyw5frUyaG4FcbGWdsfdf07421ECM97fOZTOySugHCo1gO+0N3
	 spf//9SrTafrvQdVqtSXdQXdlCFSIY5d7CjKhjsYYejlRhX1s3Z3QyhAxKTDGd8anu
	 gaHYw7ZvK6qmg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 16:47:31 +0100
Message-Id: <DFMQ8E2A5J7F.1IBBTOX9E1R1G@kernel.org>
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
 <aV6BHw-Liv0SVAwO@google.com> <DFII83QY76O0.2PKZ73WCTVGPR@kernel.org>
 <aWUUkvdKsRVJqfE2@google.com>
In-Reply-To: <aWUUkvdKsRVJqfE2@google.com>

On Mon Jan 12, 2026 at 4:34 PM CET, Alice Ryhl wrote:
> On Wed, Jan 07, 2026 at 05:40:20PM +0100, Danilo Krummrich wrote:
>> On Wed Jan 7, 2026 at 4:51 PM CET, Alice Ryhl wrote:
>> > If a &Device<Bound> lets you access a given value, then we must not
>> > destroy that value until after the last &Device<Bound> has expired.
>> >
>> > A &Device<Bound> lets you access the driver private data. And a
>> > &Device<Bound> lets you access the contents of a Devres<T>.
>> >
>> > Thus, the last &Device<Bound> must expire before we destroy driver
>> > private data or values inside of Devres<T>. Etc.
>>=20
>> Yes, the last &Device<Bound> must expire before we destroy the device pr=
ivate
>> data. This is exactly what is achieved by this patch. The device private=
 data is
>> destroyed after all devres callbacks have been processed, which guarante=
es that
>> there can't be any contexts left that provide a &Device<Bound>.
>>=20
>> As for the values inside of a Devres<T>, this is exactly what I refer to=
 in my
>> paragraph above talking about the unsoundness of the devres cleanup orde=
ring in
>> Rust.
>>=20
>> I also mention that I'm already working on a solution and it is in fact =
pretty
>> close to the solution you propose below, i.e. a generic mechanism to sup=
port
>> multiple devres domains (which I also see advantages for in C code).
>>=20
>> As mentioned, this will also help with getting the required synchronize_=
rcu()
>> calls down to exactly one per device unbind.
>>=20
>> Technically, we could utilize such a devres domain for dropping the devi=
ce
>> private data, but there is no need to have a separate domain just for th=
is, we
>> already have a distinct place for dropping and freeing the device privat=
e data
>> after the device has been fully unbound, which is much simpler than a se=
parate
>> devres domain.
>>=20
>> Now, you may argue we don't need a separate devres domain, and that we c=
ould use
>> the non-early devres domain. However, this would have the following impl=
ication:
>>=20
>> In the destructor of the device private data, drivers could still try to=
 use
>> device resources stored in the device private data through try_access(),=
 which
>> may or may not succeed depending on whether the corresponding Devres<T>
>> containers are part of the device private data initializer or whether th=
ey have
>> been allocated separately.
>>=20
>> Or in other words it would leave room for drivers to abuse this behavior=
.
>>=20
>> Therefore, the desired order is:
>>=20
>>   1. Driver::unbind() (A place for drivers to tear down the device;
>>      registrations are up - unless explicitly revoked by the driver (thi=
s is a
>>      semantic choice) - and device resources are accessible.)
>>=20
>>   2. devm_early_* (Drop all devres guarded registrations.)
>>=20
>>   3. No more &Device<Bound> left.
>>=20
>>   4. devm_* (Drop all device resources.)
>>=20
>>   5. No more device resources left.
>>=20
>>   6. Drop and free device private data. (try_access() will never succeed=
 in the
>>      destructor of the device private data.
>
> so your private data is just the first devres resource ;)

Correct, that would work as well. However, I have a paragraph in the cover
letter explaining why this implementation is not desirable, i.e. more error
prone implementation and more explicit handling required by bus code.

> Ok. I'm worried that when you fix Devres, you have to undo changes you
> made here. But I guess that's not the end of the world (and maybe you
> don't have to).

For the reasons above this will remain as is even with the Devres rework. W=
ith a
separate devres stage it would become less error prone and we could also av=
oid
bus code involvement, but it would still be more complicated than a simple
callback.

> Concept SGTM. I have not yet reviewed patches in details, but
>
> Acked-by: Alice Ryhl <aliceryhl@google.com>

Thanks for taking a look! :)

