Return-Path: <linux-i2c+bounces-11841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261CAF9B61
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 21:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0D135A686D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 19:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25219207E03;
	Fri,  4 Jul 2025 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNV3r66o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107F20ED;
	Fri,  4 Jul 2025 19:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658883; cv=none; b=OJFNAkfEgIO+/CvAQhw53xnRA5EZD092UU4w7WnkBre1lsn+O7H0PhdF9g2anmybAAkJkO4NvLmmzRpWctO5rbLshrWV5tfzBNCg3j/zTMMx6mJAQwGsMdvSqbk+Aefsf80hKoZyY0m4Z0MeF5/wxsHfMwYtVBsXd0Q+JVX3DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658883; c=relaxed/simple;
	bh=s7U7qyBLUL5BDR4GTAY51LdYayf6TDmHVnDdpE1qlJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgplrHTwWciaU4phMVcjoQmwbgblVJouIbrQ8xsWSfbtQDW21jWPTu2FtF2Iw0EPINwGqH9m4y85Z1+trJZHx6WLjv+/te2qqH9fMHBvVygKG9WhyhpHXAPbeiolpvzrHzz8pk/bBTt+D3rBEZswGvDJ5xYqHpGxPw6B32dwpCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNV3r66o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2ACC4CEE3;
	Fri,  4 Jul 2025 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751658883;
	bh=s7U7qyBLUL5BDR4GTAY51LdYayf6TDmHVnDdpE1qlJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNV3r66oF3swXeOHxfSifBKL6RwPgAVBfzFoj9HFE67v5sg1Z8a1Ac0SXshLhLV1f
	 3B6qORGtSxNXwc01JBc6MOrwiC9kDdArXEw2uC0xhW8YqVdkOz81QOBZ2XJnZN+PAv
	 KE6OvEtrmUYzsgFpvLaLgVRezDOA7NzuQ0fOFUnzqHS8U3XrUlKT/khuR3RgEq56nK
	 CCNkVCf8uOVJF9zfT4C8/DTLsHkhEjZ7cij3mubuvv96LE/cgMbUkejb1E0qI+MwMa
	 6vWkWSH+gwdScBaM40kZDU7RF0LrTo3nfu3AcZjJxofMNPjXLZhNIXtXv69ohexNhv
	 9pwz4L04ekoPw==
Date: Fri, 4 Jul 2025 21:54:36 +0200
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
Message-ID: <aGgxfNh-sgkJls_h@cassiopeiae>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704153912.1197034-1-igor.korotin.linux@gmail.com>

On Fri, Jul 04, 2025 at 04:39:12PM +0100, Igor Korotin wrote:
> -pub struct Device<Ctx: device::DeviceContext = device::Normal>(
> +pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
>      Opaque<bindings::i2c_client>,
>      PhantomData<Ctx>,
> +    PhantomData<State>,
>  );

I see what you're doing here, but I think you're thinking this way too
complicated.

I recommend not to reuse the Device type to register a new I2C client device,
it's adding too much complexity without any real value.

You also don't want the DeviceContext types for a device registration, since the
registration will never have any other DeviceContext than device::Normal (see
also my comment on the sample module).

DeviceContext types are only useful for &Device (i.e. references) given out for
a specific scope, such as probe(), remove(), etc.

The only thing you really want to do is to register a new I2C client device, get
a i2c::Registration instance and call i2c_unregister_device() when the
i2c::Registration is dropped.

This is exactly the same use-case as we have in the auxiliary bus. I highly
recommend looking at what auxiliary::Registration does [1].

Also note that if you want a reference to the device in the i2c::Registration,
you can also add a i2c::Registration::device() method that returns an
&i2c::Device, which through into() you can obtain an ARef<i2c::Device> from.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299

