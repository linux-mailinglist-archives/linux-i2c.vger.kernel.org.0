Return-Path: <linux-i2c+bounces-11842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F8AF9B64
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 21:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D73A16543B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 19:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466D921638A;
	Fri,  4 Jul 2025 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvbmNusF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F9126C02;
	Fri,  4 Jul 2025 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751659146; cv=none; b=pl31h0kUFBFNqKwkDTVcSvpZjhLyeQEW1H0RlFK3c45+q8JIgpLIqnj6rqqRAgVkHCRr9mpomRfR8hTjYx2Nfe7lVBOofiaY1txAalsfHv5BrCsq5XBgtkCcEp3WAbzLAXotZHubecFUE/jldiBf7jAp3GINUBgMA8lLicFJoEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751659146; c=relaxed/simple;
	bh=dKbJAI3BHAMAbf0xVL9PLg4+u56Z1g0q7w16b+ioMtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRd9PL0f4Qiu+TsET/F4CPRsMoOZY4s+/lMAa3gkrdatJeQaCNDstKc36JXdVapvWPbOQ6L6aKun51nl8/4Phrpb2klm4kfojO5xeJLlOVj7oIBh/dhVUxYDx+c/8/13Q+w9ETJIV0LQk+g4WxklScioLtHXIFjZEuUHxA8RulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvbmNusF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E97DC4CEEF;
	Fri,  4 Jul 2025 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751659145;
	bh=dKbJAI3BHAMAbf0xVL9PLg4+u56Z1g0q7w16b+ioMtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvbmNusFPr0qIlRvM0gxygYR+hT7oSBSmMrtwr5/3A8vGj8aSEuPFyqEuDCaoyBmu
	 Pz/SOthle/bJ4zFc/fdGs5jsboBvAwxuTIZeh4uVeTCAMLslqtLEUun2LRdat3nNKl
	 fSZqR4tgwk4W9wreq2BOozkvoEwI2LzMnrXgvQKkxO9Xj3ciJ+nf3TQMioZB7T/xuq
	 2TYk34skpd1coA42nr8Lk6eyMOeRphhz2PPCZ66dBktE78jsIxnNGPnPvmDTA5Qpm7
	 xDmBjPQZu+vZGm5BZs1oaFeSqXY+OSErdFhWJFlFEXt+SxnUXY1Z7Daofks80jpUU5
	 Vn+MyPUw3TElg==
Date: Fri, 4 Jul 2025 21:58:59 +0200
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
Subject: Re: [PATCH v2 4/4] samples: rust: add Rust manual I2C device
 creation sample
Message-ID: <aGgyg5SEHU7-G70W@cassiopeiae>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704154345.1198721-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704154345.1198721-1-igor.korotin.linux@gmail.com>

On Fri, Jul 04, 2025 at 04:43:41PM +0100, Igor Korotin wrote:
> +struct SampleDriver {
> +    _owned: i2c::DeviceOwned<Core>,
> +}
> +
> +const BOARD_INFO: i2c::I2cBoardInfo = i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), 0x30);
> +
> +impl kernel::Module for SampleDriver {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        pr_debug!("Probe Rust I2C device sample.\n");
> +
> +        let adapter = i2c::I2cAdapterRef::get(0).ok_or(EINVAL)?;
> +
> +        let device = i2c::DeviceOwned::<Core>::new(&adapter, &BOARD_INFO).ok_or(EINVAL)?;

This can't be device::Core, since the scope of device is not limited to I2C bus
callback. Also, device::Core dereferences to device::Bound, and device is also
not limited to scope where it can be guaranteed that the device is actually
bound.

It could be device::Normal, but as mentioned in the other thread, you're
thinking this too complicated. You really want t simple i2c::Registration type,
just like auxiliary::Registration. Please take a look at that instead.

> +        Ok(Self { _owned: device })
> +    }
> +}

