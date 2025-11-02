Return-Path: <linux-i2c+bounces-13945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE314C29463
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 19:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 928C54E336B
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 18:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC553239E81;
	Sun,  2 Nov 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1Vb2X85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5233E214210;
	Sun,  2 Nov 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106528; cv=none; b=abtS1/Kw2qSBJPwQqq842vM3qPNJyGw4T+04KJcRXsrjOHYt3f5K+7IG+i1Yo8zxR+iTmyX8zlcfCch08SxDgGXo8+k/FJ46uQ1Y9TvSKYeYBve/qAaL1rfJgnb0tHOvjfzk0FOUE8KO3JP/z1pb3iilC0tfSDaV3WPdsWF0Ewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106528; c=relaxed/simple;
	bh=4gIPtJsfD1XgT7Ae6+RlrfvJUzVyHyS27YURP6HOnzY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Iz6A7VYpAcw/fYfylJmSlbzq5IZ53BtmJfVi9C5EoId3fFNkVfPcU4X11QBx96OPugxlakkLWNMn/pUK9B12l/zX7uKmKv8+mLnspPUQt8iEiouHJ92jkYXU6ZNI1U1YMGh6dF5RshbxBCTH7ynPbZdGoa4PdtwZ3x4PgTEOT6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1Vb2X85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9C1C4CEF7;
	Sun,  2 Nov 2025 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106528;
	bh=4gIPtJsfD1XgT7Ae6+RlrfvJUzVyHyS27YURP6HOnzY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=p1Vb2X85yQJrZdfORQKtYM4TLphDPgsdVpSpjkWj7E8nzlTihAPiE0CmbO9aOirfS
	 cy8g7vyg8GKS6dxqtYvU++A/shDn3/pBWmxuwZoROZkKBd/IzjjiCWMuCjn6P4rmNh
	 1Litn7rwkm5S8e/ftm48dnlYccbVb4jG4u+Wp4o2X64mcO9On9c/MkPnujEXOIBpN4
	 j3MU2jCgPB6iBrRuo/hJ3P4mkeDUYXrKPbPD62O8IahBxOPuc5BX25RYrNLz4qN3Qp
	 gHmH13q0mLM8DVvZelkPU1xSgzSy0v5kXwWPCDW4cKsA7SXdwvrgBUq6CnJ6E8Or2V
	 vON5VtB8zpENw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Nov 2025 19:02:02 +0100
Message-Id: <DDYEMP51XH3M.2XLXW0BRQVQVV@kernel.org>
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
 <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
 <860306dd-b3b1-4eeb-b8b1-d09f2f7e028d@gmail.com>
In-Reply-To: <860306dd-b3b1-4eeb-b8b1-d09f2f7e028d@gmail.com>

On Sun Nov 2, 2025 at 6:45 PM CET, Igor Korotin wrote:
> Hello Danilo
>
> On 10/27/2025 10:00 PM, Danilo Krummrich wrote:
>> It's called from other drivers (e.g. DRM drivers [1] or network drivers =
[2])
>> that are bound to some bus device themselves, e.g. a platform device or =
a PCI
>> device.
>>=20
>> This is the device that we can give to i2c:Registration::new() and use f=
or the
>> internal call to devres.
>
> After the recent change where i2c::Registration::new() returns impl=20
> PinInit<Devres<Self>, Error> instead of Result<Self>, I=E2=80=99m unsure =
how to=20
> adapt the Rust I2C sample driver. The sample doesn=E2=80=99t have a paren=
t=20
> device available.

Indeed, and that's a good thing that this doesn't work now. :)

I think the best course of action is to make the sample driver closer to a =
real
driver.

For this you can do what the debugfs sample (samples/rust/rust_debugfs.rs) =
does
and use a platform driver with either ACPI

	kernel::acpi_device_table!(
	    ACPI_TABLE,
	    MODULE_ACPI_TABLE,
	    <RustDebugFs as platform::Driver>::IdInfo,
	    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), ())]
	);

or OF

	kernel::of_device_table!(
	    OF_TABLE,
	    MODULE_OF_TABLE,
	    <SampleDriver as platform::Driver>::IdInfo,
	    [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
	);

and then create an i2c::Registration from platform::Driver::probe().

- Danilo

