Return-Path: <linux-i2c+bounces-12893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3EB53D15
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 22:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6BB14889C2
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 20:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3172868BD;
	Thu, 11 Sep 2025 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1pjQzEM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B6277CAE;
	Thu, 11 Sep 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757622232; cv=none; b=m4D3wovXWzEDn91DSoupOyxXdSKYXLmduZpdkZ+nRVm/zlOu73+1FTlGntvRv6Safuojzxe06bJi+OzCuZjNLERL98Q88fWQ2NQSo17qWhSxzUIzdqScy7ZmRo7Z5JsjRKXp35Uqc6UitTXEaBudp+JvWXuZfYUeUIIVwHlp9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757622232; c=relaxed/simple;
	bh=PyFbXxgLfiqZCSLfzMA8KQbt6qVlJRGfha6ahnEDLzc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bDgX+k81w1YZpaEefL0ZkBHaELe848KhVJ2La7RxX4eQP9RvmQgnlQdU13SzTWgH3wVMrz/ArRIYvSh0ienT+iFrD3kghqi6iE4skS/Tti2NE3wr6c0DoLS8KkA5/Y0ZiWjL7DrjIjdfPLVtYnCHGsrAcgisVCM1EEA51TQ66V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1pjQzEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C58CC4CEF0;
	Thu, 11 Sep 2025 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757622232;
	bh=PyFbXxgLfiqZCSLfzMA8KQbt6qVlJRGfha6ahnEDLzc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=b1pjQzEMy2yEfO5xhEZKNCYYNn+84YT8n0FCmz6PXtf3xEglmx7H+FLN0zacJzkRU
	 naXiqIwi53P7z5Z/3BbgTsyDXabHUZs2kg9bu16HxhKdrj5tUbOomsPbK44jMK42aJ
	 a8joJ1C2NycPdbF0n0ZTEWAs0mdTUhRo8MTWh3yEyF2zurrQ/ytAiAXlXo5xbUwHsB
	 KL15QX8/fTP632TChmLFtllwl1b1WJmKG9PoOeFGBUJG2YFy9i/hGKIGD+V6NaACj3
	 RvmUyT5EutXQxjMPqJYGJd79lDaOJqi0uG8unke6g3Es23zGrCmphRy0nTl3I7h6Sc
	 digylkavGJLFg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 22:23:46 +0200
Message-Id: <DCQ92VZ22KOU.14L0I1QBKBT29@kernel.org>
Subject: Re: [PATCH v5 1/3] rust: i2c: add basic I2C device and driver
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
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911154936.97118-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250911154936.97118-1-igor.korotin.linux@gmail.com>

On Thu Sep 11, 2025 at 5:49 PM CEST, Igor Korotin wrote:
> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported by t=
he driver.
> +    // TODO: Use `associated_type_defaults` once stabilized:
> +    //
> +    // ```
> +    // type IdInfo: 'static =3D ();
> +    // ```
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of OF device ids supported by the driver.
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of ACPI device ids supported by the driver.
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// I2C driver probe.
> +    ///
> +    /// Called when a new i2c client is added or discovered.
> +    /// Implementers should attempt to initialize the client here.
> +    fn probe(
> +        dev: &I2cClient<device::Core>,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>>;
> +
> +    /// I2C driver shutdown
> +    ///
> +    /// Called when

Seems like you did forget to actually finish the comment.

> +    fn shutdown(dev: &I2cClient<device::Core>) {

You should also provide a Pin<&Self> argument.

> +        let _ =3D dev;
> +    }

Can you please also add an unbind() method analogous to PCI, platform, etc.=
? It
avoids that people have to use try_access() for accessing device resources =
on
remove().

