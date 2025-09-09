Return-Path: <linux-i2c+bounces-12815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC73B50567
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 20:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ACEE18902DE
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 18:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2383F302CAB;
	Tue,  9 Sep 2025 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ew3nmQK1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7856301475;
	Tue,  9 Sep 2025 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442859; cv=none; b=RnvAf5S6tqu8u3Y7l40J4W41qIA10uFJ1JUjgsP/MwbTZPl93hzKwQEd/eEAW0vlNU0WsCytcC3odeoNsQsCWe5JJtv638CEj9PEoPXWBEAXamYlJIt+ZCoerx8bI6uQ6kJF3lpr+GhbS0rBG78FZoHvIVR5ovBN7GIlBRbnqS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442859; c=relaxed/simple;
	bh=Zscg0JZYmn8IQ7K+hb9jZyF7fgqB+o7UtHBllaqMPy0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qZ4wRum1lPgCdhxesHiQ++TaZz6OXTi8MltBSNYrteywNSv7mCUX4/c/xiUqSsaRHOWR2GB9sDjmigC/GGI+/pYfJqGGHqJam++ylXptDij5yOrvh+XUOFQtZhDl8EMunrdtAzRJ0xF+yVmpLiKQwr5LnUOKJhxLMAmsAj1cVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ew3nmQK1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F79C4CEF4;
	Tue,  9 Sep 2025 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757442859;
	bh=Zscg0JZYmn8IQ7K+hb9jZyF7fgqB+o7UtHBllaqMPy0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ew3nmQK1UitUBgEjoStInD9vKhUjx21D98FPiopMIXKQ6N+B+eePDfmnyGBvc6Suk
	 doVFB5uGXByZAdSo4iwjTfUPM2q2CWYluj2/7Rbn0VM5uQPQFpe0Y+JTyQr8OYSGnS
	 QHVRlhYla6WMM71/ZDoiPtmh9I3sUdq6gAE7nHxK1PEUqfYQ4bo2rAIdCCKo9bupe+
	 m13CF1Hfwq6SUbAykBfjjaNE4l1V9YEME2mtqpOR8hk+bYSVS+CgLA+E2UL6WP5oBE
	 5DcKbHZQiQjF8bUwyMX3rH/v5PWiSMu7IFGBzKVRaq7+1GJ/IzblFs4tXPtUdIvoyA
	 2Lw1bkUnDvByQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 20:34:12 +0200
Message-Id: <DCOHHWQDKJCL.1CKT9HCBZXNNN@kernel.org>
Subject: Re: [PATCH v4 3/3] samples: rust: add Rust I2C sample driver
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Alex Hung" <alex.hung@amd.com>, "Tamir Duberstein"
 <tamird@gmail.com>, "Xiangfei Ding" <dingxiangfei2009@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820152347.1815097-1-igor.korotin.linux@gmail.com>
 <C5AFA553-6EB1-453E-B396-DD19139E7228@collabora.com>
 <dd798632-1865-464d-8a02-f8d9e20a16b6@gmail.com>
In-Reply-To: <dd798632-1865-464d-8a02-f8d9e20a16b6@gmail.com>

On Tue Sep 9, 2025 at 7:55 PM CEST, Igor Korotin wrote:
> On 8/27/2025 8:38 PM, Daniel Almeida wrote:
>>> +#[pin_data]
>>> +struct DriverModule {
>>> +    #[pin]
>>> +    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
>>> +    _reg: i2c::Registration,
>>> +}
>>=20
>> I was expecting this to be ARef of something, most likely I2cClient?

This is the Registration of an I2C device, just like auxiliary::Registratio=
n or
faux::Registration. There is no point in reference counting the registratio=
n
object.

You can't have an ARef<I2cClient> here either because you want to manage th=
e
lifetime of the I2cClient to be registered in the system, i.e.
i2c_new_client_device() and i2c_unregister_device().

>> This is where my knowledge of i2c drivers start to fall short, but other=
s will
>> probably chime in :)
>
> You're right to mention this. This rust_driver_i2c is not the standard=20
> way of handling I2C devices.

It is indeed the normal way of handling this. This Registration object
represents the lifetime of calling i2c_new_client_device() e.g. from a plat=
form
device probe (as Igor also mentions below) and calling i2c_unregister_devic=
e()
e.g. from platform device remove.

The ARef<I2cClient> can be obtained from the subsequent bus callback from t=
he
I2C bus.

In fact, you could add a method to i2c::Registration to provide you with an
ARef<I2cClient> if that's ever needed.

But the i2c::Registration itself simply manages the lifetime for the I2C de=
vice
being registered in the system.

> The idea was suggested by Danilo in the=20
> review of Patch v2: this driver merges an I2C driver sample with manual=
=20
> I2C device creation. The module creates a new I2cClient in its init=20
> function, and this new I2cClient is then probed by the SampleDriver.
>
> In a normal driver it should be different. For example, let=E2=80=99s say=
=20
> there=E2=80=99s a platform device =E2=80=94 the probe function for this p=
latform device=20
> would create an I2cClient, and an appropriate I2C driver would then=20
> probe it.
> Thanks for the review.
>
> Best Regards
> Igor


