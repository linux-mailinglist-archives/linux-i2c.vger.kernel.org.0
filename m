Return-Path: <linux-i2c+bounces-12895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF0B53D3F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 22:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3E1AA6348
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 20:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85132D1F6B;
	Thu, 11 Sep 2025 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAGg7oco"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719BD27815B;
	Thu, 11 Sep 2025 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757623593; cv=none; b=A57kENbMfEUxGr2eg0BBBe+8m28G5E4O98bSeTeHgUrvz1Yfbz+SqVHvoCr0SaPn1xyb58pWaoluwHdDUXvhzgKptnGygq7lX3zgsUcmQXGx8eTsK2NAIzfsSIORRyI3PapSLFGJkedepmsWEQwWS7B5FR50NU6tejBvUBOnDwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757623593; c=relaxed/simple;
	bh=FDVsLPvFCZn3mFoZlnMxuCM29yOEw+dWElg/JjBhpjE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=TosNw36n9ycUdBSsDuJh3r+3y+2bOHuLeNiQy/7YYgacMpdDGR6N7CcSrs/9kANA8Av/UeqLMiVKOwvzqABJ+0vReifJOrVqqAF7MhxymO5OqLiue2QX31HTUDXjgXlGMRM0XA92aPHDoZ46lKJg1K3WuSFzo1tm9629eL80h+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAGg7oco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB1EC4CEF0;
	Thu, 11 Sep 2025 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757623593;
	bh=FDVsLPvFCZn3mFoZlnMxuCM29yOEw+dWElg/JjBhpjE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=BAGg7oco2daxLPPYifOeEcYlXL4bIK4vbyI5LUvmdWP1oE1ZeZlmqcGoOw+tlzZZo
	 l2EwBYW66pyJIKLAOk4uWbCQSLlOo/xTH577SQcI0PjHghvhYUDrnJKFlyLbY7sS26
	 L+2+/9UEZB0JXsyzHAvHI385GW9eP/DgFdShJtqkDCS7NRqv6vBmASqq1/6ZCqnsYj
	 2QdPjXK26P8/RQu99cdbt0l/eqYwAPMwnPaDz/bwlqtNh7Idh7iHnxC44ez0U6Wbcu
	 6Qnbji0wALUBy9OWpQ6hx2gJpqbCd4H6UtePRUfPzHuFm8IyFOROv0NnprLFDamgSu
	 xTixZZ3/NoRaw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 22:46:27 +0200
Message-Id: <DCQ9K980YX1W.HZIQI6S5MST9@kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/3] samples: rust: add Rust I2C sample driver
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
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911155048.97364-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250911155048.97364-1-igor.korotin.linux@gmail.com>

On Thu Sep 11, 2025 at 5:50 PM CEST, Igor Korotin wrote:
> +// NOTE: The code below is expanded macro module_i2c_driver. It is not u=
sed here
> +//       because we need to manually create an I2C client in `init()`. T=
he macro
> +//       hides `init()`, so to demo client creation on adapter SAMPLE_I2=
C_ADAPTER_INDEX
> +//       we expand it by hand.
> +type Ops<T> =3D kernel::i2c::Adapter<T>;

Not a huge fan of this type alias, but up to you. :)

> +#[pin_data]
> +struct DriverModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
> +    _reg: i2c::Registration,
> +}
> +
> +impl kernel::InPlaceModule for DriverModule {
> +    fn init(
> +        module: &'static kernel::ThisModule,
> +    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
> +        kernel::try_pin_init!(Self {
> +            _reg <- {
> +                let adapter =3D i2c::I2cAdapter::<Normal>::get(SAMPLE_I2=
C_ADAPTER_INDEX)?;

Just i2c::I2cAdapter::get() is fine.

> +
> +                i2c::Registration::new(adapter.as_ref(), &BOARD_INFO)

Does i2c_new_client_device() grab a reference count of the adapter? If not,=
 you
have to store an ARef<I2cAdapter> within your i2c::Registration as well.

> +            },
> +            _driver <- kernel::driver::Registration::new(<Self as kernel=
::ModuleMetadata>::NAME,module,),
> +        })
> +    }
> +}

