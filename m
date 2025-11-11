Return-Path: <linux-i2c+bounces-14045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B783BC4C60C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A643E18C3D13
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 08:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3872957B6;
	Tue, 11 Nov 2025 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlQQ1i6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639ABA944;
	Tue, 11 Nov 2025 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762849263; cv=none; b=lILtGyTxahSV/s+3Q47jIi6z3gL7jMUIliL2KAeQmE7UoArFgpZjw/Pl3k4K4WKGAQmM0Yi+Iz7sAF9X7QzM0mPBuTiP4l/iP4J/V02zr1NDd1DHWCmzKL52pIhjhd7UyUB9NEWWVLto2WCehfpP/zsEStEq7HOZgnzUU8WXyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762849263; c=relaxed/simple;
	bh=Weu3f3v6jreQW7azhbCbvwSDVTC98LwzGnEO0u3QKdU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=PfU8dTR5waHMu1elaEcnm9Ika4mG9V/c6hqB2gmFutu/AZMy5gPT/NUra/x7ss84fDKjisyR8knnCyTB31EmhN58DJg7uBrBOCXsgl4jg9RkavZ02KBwHMV8/fyEFPyuKgWKP4DrbgMi1qxSx2dxG8Juc880Fk/oiCGEKp+2Js4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlQQ1i6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E875C4CEF7;
	Tue, 11 Nov 2025 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762849263;
	bh=Weu3f3v6jreQW7azhbCbvwSDVTC98LwzGnEO0u3QKdU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=jlQQ1i6zfiGDI5W/1u3tIfzGr3DodBbuR9ldkMwuJzo0aeQ6mxAU/kPoXtMstZkrN
	 IvvKtef/y0OTntMdHrdEqXdAnfe8MPfZ+rIdNK/I0V31GcV7pA7KZHfArNo3e7ev6D
	 vREGaDy/g/8jbSBDXU9smsjbH14ON49f9fBhDeBoqakpFKBS51nntGFpvK5gjCke4N
	 8zlDG4+lHEW9sboUazg3GfMBt67fa+yIc3QZ1d+MQaml1mbQDIoF6zEaIzNkqETs7G
	 HRYDe+xkgQHwpgO+MShfnhRznkSFImomWwJZQuVyo5Nur95ptntbeL4Te6zjLRCxBs
	 ERx6l+wxEBjLw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 19:20:48 +1100
Message-Id: <DE5PWKX730XK.Q5WZS3DLYXE7@kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 4/4] samples: rust: add Rust I2C client registration
 sample
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
References: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
 <20251110113125.51785-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20251110113125.51785-1-igor.korotin.linux@gmail.com>

On Mon Nov 10, 2025 at 10:31 PM AEDT, Igor Korotin wrote:
> +impl platform::Driver for SampleDriver {
> +    type IdInfo =3D ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D Some(&OF_TA=
BLE);
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Some(&A=
CPI_TABLE);
> +
> +    fn probe(
> +        pdev: &platform::Device<device::Core>,
> +        _info: Option<&Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error> {
> +        pin_init::pin_init_scope(move || {

We probably don't need pin_init_scope() here.

> +            dev_info!(
> +                pdev.as_ref(),
> +                "Probe Rust I2C Client registration sample.\n"
> +            );
> +
> +            Ok(kernel::try_pin_init!( Self {
> +                parent_dev: pdev.into(),
> +
> +                idev <- {
> +                    let adapter =3D i2c::I2cAdapter::get(SAMPLE_I2C_ADAP=
TER_INDEX)?;
> +
> +                    i2c::Registration::new(&adapter, &BOARD_INFO, pdev.a=
s_ref())
> +                }
> +            }))
> +        })
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for SampleDriver {
> +    fn drop(self: Pin<&mut Self>) {
> +        dev_info!(
> +            self.parent_dev.as_ref(),
> +            "Remove Rust Platform driver for I2C Client registration sam=
ple.\n"
> +        );
> +    }

Let's use unbind() here as well.

(Yes, the existing samples need to be updated. :)

