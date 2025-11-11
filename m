Return-Path: <linux-i2c+bounces-14042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 562F3C4C488
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88869188D666
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 08:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730D92E6CA4;
	Tue, 11 Nov 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxNLP5Mf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E182D739F;
	Tue, 11 Nov 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848625; cv=none; b=gjykOTnWlXD3osql1WNVClVrEHskYRD/+YXpODiDEZLhJfaClSpC1M1yCy7GEv2alXQqh/TR1i5W8n9XdI4NgU0a9spLBcGbL6BL7j6yNDsXdiisG3lTrQq6ox9Yd7lHG1E2P1Be5ggSgB6cjhk7/pTUuF4FdxWYWvfpG89KXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848625; c=relaxed/simple;
	bh=sWTxdL4lBbQUdBJuAklN56JpGxeefEAbflXdWVXq13s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=A1Nun2Nq2BJsIuFHAu5G1yqAz9khyVSUULcuHYpBaGFdHuDaRDByBCPKgZOqYcsEZ+nSgxbQFAfMhE6IiKEMfIu7wi30P7AxZPgAQCR4ngHhep7VMyTQmIYcxkkAz6YeQhVp0qnXAmcgbUXlFsktL+a/oToPVoeOHimW1ydFL3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxNLP5Mf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8366DC4CEF7;
	Tue, 11 Nov 2025 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762848625;
	bh=sWTxdL4lBbQUdBJuAklN56JpGxeefEAbflXdWVXq13s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YxNLP5Mf1GjfEZE6MoVs4wKwSgWoMUsroTcvgH28rAqVZjJPgQ8aJTyNDtxIDakmN
	 k/FNbCJPtgG/Ddg38hSJtoLLzpASDlkUC5hATK6/wV1JAeYMlBONipROPasU9xAurn
	 mSyICwv4GUQjEb7ql7LH+jUvF8h5nzLJr0kDwgra/GrjLV4FEjlTs4jL/ENIvPQVdW
	 YwhLW3oZLSIUdRvgJ9bSPf0hk+quI0JyH8gdm/DfTGFapVKaojsJjjc4YUefIqx5Ax
	 Vp51ziror3aGzXIfJMeM98EKzzNAPTaOz0JUaHWCyw9TUxlu9S3ffXRFcxWeQpdz6u
	 p+gway3Jh6BYA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 19:10:11 +1100
Message-Id: <DE5POG7G08QG.LT9YJCA0IN11@kernel.org>
Subject: Re: [PATCH v7 1/4] rust: i2c: add basic I2C device and driver
 abstractions
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Wedson Almeida Filho" <wedsonaf@gmail.com>, "Alex Hung"
 <alex.hung@amd.com>, "Tamir Duberstein" <tamird@gmail.com>, "Xiangfei Ding"
 <dingxiangfei2009@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-i2c@vger.kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
 <20251110112507.50525-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20251110112507.50525-1-igor.korotin.linux@gmail.com>

On Mon Nov 10, 2025 at 10:25 PM AEDT, Igor Korotin wrote:
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> new file mode 100644
> index 000000000000..41ef7c65c555
> --- /dev/null
> +++ b/rust/kernel/i2c.rs
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! I2C Driver subsystem
> +
> +// I2C Driver abstractions.
> +use crate::{
> +    acpi, container_of, device,
> +    device_id::{RawDeviceId, RawDeviceIdIndex},
> +    driver,
> +    error::*,
> +    of,
> +    prelude::*,
> +    types::{AlwaysRefCounted, Opaque},
> +};
> +
> +use core::{marker::PhantomData, ptr::NonNull};

Please use kernel "vertical style" [1].

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Please also run ./scripts/checkpatch.pl on all patches, there are a few war=
nings
to address.

> +
> +/// An I2C device id table.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::i2c_device_id);
> +
> +impl DeviceId {
> +    const I2C_NAME_SIZE: usize =3D 20;
> +
> +    /// Create a new device id from an I2C 'id' string.
> +    #[inline(always)]
> +    pub const fn new(id: &'static CStr) -> Self {
> +        build_assert!(
> +            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
> +            "ID exceeds 20 bytes"
> +        );
> +        let src =3D id.as_bytes_with_nul();
> +        // Replace with `bindings::acpi_device_id::default()` once stabi=
lized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c: bindings::i2c_device_id =3D unsafe { core::mem::zer=
oed() };

You can use pin_init::zeroed() for this.

> +        let mut i =3D 0;
> +        while i < src.len() {
> +            i2c.name[i] =3D src[i];
> +            i +=3D 1;
> +        }
> +
> +        Self(i2c)
> +    }
> +}

