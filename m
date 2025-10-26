Return-Path: <linux-i2c+bounces-13806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E6C0A634
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 11:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04943ACF10
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 10:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96995225401;
	Sun, 26 Oct 2025 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShkJQzGm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49A2F85B;
	Sun, 26 Oct 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761475696; cv=none; b=HEnz94+mnxfkuHtlnZiASqmO3Z71deP1MIPEIyeLzcy3oA9hPCwo+QLN3SVj0bkhGOOHb8cX6q5W5Qc/hA1UnYygdJFoV2UQut3oNT6pItkUpIF28CQdV53+xeLIW+WTi6FweLdFD/jER8XXqkHjDz9mfy0ugXatw6RyHycuXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761475696; c=relaxed/simple;
	bh=fDttF0m9GDxXFFjCnEic/oOuNMcKGw9uS8RizfkXAP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6MCL9IF8szdSakTsuR0tBhyBennoHEm7JROK3R/8LBACqYr856imskC4w+Q0ESEmKtX9DJZ4Il1Ua8dwHCuC0+8WX6Kk7ytJ1NIyr+A8eaYrh7Fw5HnUgKIOcFcejGeKrtPJTzb3OGuEkV6ZeegVDyC93lpTzTJH7hsjIYYx7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShkJQzGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BCBC4CEE7;
	Sun, 26 Oct 2025 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761475695;
	bh=fDttF0m9GDxXFFjCnEic/oOuNMcKGw9uS8RizfkXAP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ShkJQzGmAIBWk0AKReM/aOAhXKIVTIgyRfDnidVF7dqMjMsJaBdtzHaCY7O9LCCUn
	 5xU/dZG8ltjQfNbEgqdLkpafYY5GcsvzoTn4pTWZmQr3Rpz8LMF0wkhn+Koys8Yyfi
	 63bKgLtrWp1WZpexdCG/vh7mmGpTzkUgYdweTJvaEsgVCDSyBKkN9u1KZQ0OgSETO7
	 S6QdmXRFCJHWUdzSjIWWVw+Bz44dG8Y1RJRCZ344RtqdRXZtU65sl0ZrmHFb521Mgk
	 xeWChFrZxcvJTj9WfFvF4yVKqtTeEMiXAirdNS+E/BLAFZqbIljHC32+KUMEJG0jw8
	 9ILlOq98lq/5Q==
Message-ID: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
Date: Sun, 26 Oct 2025 11:48:10 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: i2c: add manual I2C device creation
 abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
 <20251005102340.41917-1-igor.korotin.linux@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251005102340.41917-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/25 12:23 PM, Igor Korotin wrote:
> +impl Registration {
> +    /// The C `i2c_new_client_device` function wrapper for manual I2C client creation.
> +    pub fn new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
> +        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
> +        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new` checks for NULL.
> +        let raw_dev = from_err_ptr(unsafe {
> +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
> +        })?;
> +
> +        let dev_ptr = NonNull::new(raw_dev).ok_or(ENODEV)?;
> +
> +        Ok(Self(dev_ptr))
> +    }
> +}

I wonder if we want to ensure that a Registration can't out-live the driver that
registers the I2C client device.

This should only ever be called by drivers bound to more complex devices, so if
the parent driver is unbound I don't think I2C client device registered by this
driver should be able to survive.

Hence, I think Registration::new() should return
impl PinInit<Devres<Self>, Error> instead.

