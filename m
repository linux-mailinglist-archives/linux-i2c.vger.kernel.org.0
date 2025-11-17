Return-Path: <linux-i2c+bounces-14123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D3C664EC
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 22:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 10FFD3613CE
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 21:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B36325727;
	Mon, 17 Nov 2025 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODHmDjS4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6522820D1;
	Mon, 17 Nov 2025 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763415669; cv=none; b=pY0upfg/gtG+/UoTG5rLw1hqjfwX/SbFNKzO2OChPhMs76NBod5wPnUmjXvwsumQrAWpbHacGAZfBkFYgrNL36zdL1SJVH3Lu1cGTchRqfjauF318n/42N1QoWFkblQR913oe4Bohrhi8HzLlYTSQXa5Cd6GvwIC37v6vHLchXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763415669; c=relaxed/simple;
	bh=SyiBEWLIFr+AFw0nEn4fZcOaqc9VCpYMWxzhG7VHAhE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=KxR7IO/QxTCAg7OGJi60L+G0Gd2TjD3ylyjsC6amEwjFeGA7nuSoIqNP6d2bpdoy8RFMwY0hTgBPebkQomDs+pSJ+8MlbMc6SeBxGcYIzZ/ag5hv42aT9SeYx+gV+fdLC7aOcoJ3MRF6y90+X7eAN7inxq+sHscrOvU9HmKGnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODHmDjS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F1CC4AF09;
	Mon, 17 Nov 2025 21:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763415668;
	bh=SyiBEWLIFr+AFw0nEn4fZcOaqc9VCpYMWxzhG7VHAhE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=ODHmDjS4q/WHicWAUaJbB/15v/aREYN6AkeMERXBppZbfud8W+/oYNaqPjqiHqOjF
	 wt1yS01hE5UukFBaLJ4mrTdymAQI4C5z2o4/S2L4W3N972abmaBpIpBYv5tSfqKXjW
	 lEegG4nAaS8PKFb8BZVgUoCOo3Zs66ja/ovinopZGLPSHhafyzgVEMLv1QlEUgo8Jb
	 58mUJXBsjA/codJaq+W6pKsAAdSFAa0bG7t2ig74TD4FNC+fR4r5PKCHUgFfQ4l6eT
	 Q5Y23VUiYLZbneaRB5BxeKuW8hp2QFTOMP0ozU6m/J6HjeoCiG6o2bAOIYtqre+neK
	 fABZZiCSeboQw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 08:40:58 +1100
Message-Id: <DEBAOI46JIOO.B0TGI5HFLVJ2@kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
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
 <dingxiangfei2009@gmail.com>, "Markus Probst" <markus.probst@posteo.de>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20251116162104.171420-1-igor.korotin.linux@gmail.com>

(Cc: Markus)

On Mon Nov 17, 2025 at 3:21 AM AEDT, Igor Korotin wrote:

Applied to driver-core-testing, thanks!

> Igor Korotin (4):
>   rust: i2c: add basic I2C device and driver abstractions

    [ Remove unnecessary safety comment; fix rustdoc `Device` -> `I2cClient=
`.
      - Danilo ]

>   rust: i2c: add manual I2C device creation abstractions

    [ Remove unnecessary safety comment. - Danilo ]

>   samples: rust: add Rust I2C sample driver
>   samples: rust: add Rust I2C client registration sample

    [ * Remove dependency to I2C_CHARDEV, depend on I2C=3Dy.
      * Remove unnecessary impl Drop for SampleDriver.
      * Rename i2c::Registration, import Devres.
      * Fixup module description.
      * Add new source file to MAINTAINERS.
      - Danilo ]

