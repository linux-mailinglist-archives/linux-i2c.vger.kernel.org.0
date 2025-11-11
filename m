Return-Path: <linux-i2c+bounces-14044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3AC4C555
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F12434DD73
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168B730F7FE;
	Tue, 11 Nov 2025 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc/ebSvD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF430216D;
	Tue, 11 Nov 2025 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848995; cv=none; b=Q9avLzrw6DOVTvdVQq3SjGhEPE8lTIxEtaZcMImGwVeaTz0ytKulwk0PjZA2x1WceSZeK0igcuu/6GEl6Vx+1SzrLFeCfNzl16NDxy9hlH0hxpavBHkWfmH7KHLXzH1J8nk6qqQ5cfoOXkptOqmDLRVHMOZObUYWTT3aZ1k7vs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848995; c=relaxed/simple;
	bh=i/34ey75nSIkV0QR/NEIq1NPpiVet7wGRPFjErBWSbs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZOS/W178tPWNrxYEPMGnhnOTWBtP9oRjm7pjjfJHQD8DEGiY0ayOn/BqHQkiIxpIIMuBF7iVaQeJIMhXy4Lh9hMaF2MAa+pbZ+BXNbKUrl+kL1KYzogCNUIam9YdUVsjoqRnyXlTQ+KBFdEKuHPkOIGwge10pnpWBO+b09ewMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc/ebSvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8561C116D0;
	Tue, 11 Nov 2025 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762848995;
	bh=i/34ey75nSIkV0QR/NEIq1NPpiVet7wGRPFjErBWSbs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Fc/ebSvDY8kWOBKFeo6BsDbC8dZCT5vdIlaXYOU3mzV5ueYqmBar4DunSxTJlAKAI
	 xsJxXKib/1eSua2tprvTByaSRfaxpIPsCf6LAgKtzUiapKRGRda9gH3eM4+hEn1ElC
	 3l7DQQ7sQkeEKWCqmnQF9ROzVbMJ2CDqRNUexFMk4cWYYx0DfTSu7Oi++Z3z9zgKla
	 5xe1s1avHS2jciZHOxfqNkuwXkrvDJuKxI436qYv0X/TIq1YEuH7oM7tpj1+Bebu5l
	 9k7HZ9vAnAZmy2c0ACJCFPp1rZMaTmrkFNgQ7x9Ls7pj4uxD9FJi+LHfE7JWG0vGkV
	 PzAQ5X3vo0lLg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 19:16:22 +1100
Message-Id: <DE5PT6DIYAI0.3MCCCOLD67KVS@kernel.org>
Subject: Re: [PATCH v7 3/4] samples: rust: add Rust I2C sample driver
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
 <20251110113116.51743-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20251110113116.51743-1-igor.korotin.linux@gmail.com>

On Mon Nov 10, 2025 at 10:31 PM AEDT, Igor Korotin wrote:
> diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i=
2c.rs
> new file mode 100644
> index 000000000000..79d0055793d7
> --- /dev/null
> +++ b/samples/rust/rust_driver_i2c.rs
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust I2C driver sample.
> +
> +use kernel::{acpi, c_str, device::Core, i2c, of, prelude::*, types::ARef=
};
> +
> +struct SampleDriver {
> +    _idev: ARef<i2c::I2cClient>,
> +}

Let's just leave the struct empty if idev isn't used anyways. :)

