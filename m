Return-Path: <linux-i2c+bounces-13839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB2C119AC
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 23:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 979F15608D3
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 22:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0626E32C937;
	Mon, 27 Oct 2025 22:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdjZ3Ggc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64132C925;
	Mon, 27 Oct 2025 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602431; cv=none; b=FeUrs5IqDQ1hGGXHU1kY4cT3mlVJNZ+9sDYuY6bLaTabydHLNvHyWP/Sy+QOeqakqfvJb3KDc4TRxtkxix139YS5hJ8PQipA1nbTkH0TV5mr4rSjMj+uwy9TMxp2/RMgUHx79Z6Qb4G6sJYMclaeTjJAZRs0CAXHm8gyRK/YHqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602431; c=relaxed/simple;
	bh=2CG2sdH1uEtc/DzHc2Ti8XT84i7jKhQoCiv14jIO3rI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=caZYabPjdzlL2wIRkPLM/vvDad+q/p9kIsvOE7YpHfqbMocA0wtVUvbx85bZfl0rQIwM3rsKd+D/tBbQ2V/xeQW0H/8VBPPFzaDbu8o90Pa3I32OGXRvzkYXsYauqnU+PRQDylf8rx3kl7oonVmA4SLP7eZrOwRAJMlF6y+ESsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdjZ3Ggc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4A3C4CEFB;
	Mon, 27 Oct 2025 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761602431;
	bh=2CG2sdH1uEtc/DzHc2Ti8XT84i7jKhQoCiv14jIO3rI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IdjZ3GgcSXS/ZEd0llaf4KGm87NrUGzsyQ8qnYJNKjieo4brRL9MoFZlVKM5ToX/a
	 ak8Q1lv/xhtvVgPhluPpwbSYIK9vtQYpuWX604Xmv1Vem0+2FFEBDaBxfIOz1YREpZ
	 znhFzQqoNH3ihmiP3GIdb6eHZG+YsTlDnIaMg4KRvyB7UftH96q9Wdlghb0H932lPz
	 pzPjRX4W7ZJrA6DSZVYHV/lqXhgWNnAf+8K5yIZ4LU3ddOBZxvdhOr69JY+c2xdDtV
	 ODlw2DvKIBTwIxN8QowYSKljjlyzH6l6oPzDSkIoyqqBQEwcexku+O2A/D8NJLvWcx
	 DzUVugakRW61A==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 23:00:25 +0100
Message-Id: <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Subject: Re: [PATCH v6 2/3] rust: i2c: Add basic I2C driver abstractions
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
References: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
 <20251026184143.280797-1-igor.korotin.linux@gmail.com>
 <4568187f-ab63-4c86-b327-90720ad20ac9@kernel.org>
 <30fbb191-5300-45e9-93d3-8b2ef5cf18ef@gmail.com>
In-Reply-To: <30fbb191-5300-45e9-93d3-8b2ef5cf18ef@gmail.com>

On Mon Oct 27, 2025 at 9:27 PM CET, Igor Korotin wrote:
> On 10/26/2025 7:20 PM, Danilo Krummrich wrote:
>> This is an API that should be used by drivers operating complicated devi=
ces
>> (DRM, NET, etc.) where there is no point in keeping an i2c::Registration=
 alive
>> after the driver that registered the I2C client has been unbound itself.
>>=20
>> For instance, a GPU driver may call this in probe() to register an I2C d=
evice
>> for some redriver, repeater, multiplexer, etc. So, it makes no sense to =
allow a
>> corresponding i2c::Registration to still exist beyond the GPU driver bei=
ng unbound.
>>=20
>> Hence, besides not really being necessary for safety reasons, it still s=
eems
>> reasonable to enforce this for semantic reasons.
>
> I might be misunderstanding your point, but as I see it, Devres cannot=20
> apply here
> because we can't bind it to i2c_adapter.

Yes, you do misunderstand.

I'm not saying to use the I2C adapter device for this, that makes no sense.=
 In
fact, it wouldn't even work, because the underlying device can not be guara=
nteed
to be in a bound state.

> There's no guarantee that driver
> owns it. Registration can't be bound to i2c_client, cause it's kind of=20
> chicken and egg situation.

I'm also not saying to use the the I2C client, which indeed makes even less
sense (and wouldn't work for the same reason mentioned above).

Think of the bigger picture, i.e. where is i2c:Registration::new() called f=
rom?

It's called from other drivers (e.g. DRM drivers [1] or network drivers [2]=
)
that are bound to some bus device themselves, e.g. a platform device or a P=
CI
device.

This is the device that we can give to i2c:Registration::new() and use for =
the
internal call to devres.

With that we ensure that the i2c:Registration will be dropped, when the dri=
ver
that originally called i2c:Registration::new() is unbound; it makes no sens=
e to
allow a driver to keep an i2c:Registration alive when it is unbound.

In fact, quite some C drivers are already doing exactly this by hand. For
instance, see [3]. Four lines after [3], raa215300_rtc_unregister_device() =
is
registered with devm_add_action_or_reset(), which calls i2c_unregister_devi=
ce().

Having that said, I'm a bit curious now: What is your use-case for
i2c:Registration?

[1] https://elixir.bootlin.com/linux/v6.17.5/source/drivers/gpu/drm/xe/xe_i=
2c.c#L72
[2] https://elixir.bootlin.com/linux/v6.17.5/source/drivers/net/ethernet/in=
tel/igb/igb_hwmon.c#L201
[3] https://elixir.bootlin.com/linux/v6.17.5/source/drivers/regulator/raa21=
5300.c#L160

