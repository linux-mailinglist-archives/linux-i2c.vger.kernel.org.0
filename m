Return-Path: <linux-i2c+bounces-13808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24809C0A640
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 11:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DF4C189E6B3
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 10:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63C1225401;
	Sun, 26 Oct 2025 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBjUFIJQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA2D2F85B;
	Sun, 26 Oct 2025 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761475784; cv=none; b=BIN94twXO65AVZflf8ZQmAfMSw8SSWhPZFhnDLaxI/4znHsaZHxP81lnvo5k3EDSuiOM/4KMFi4rCXxWhqIl9gbjVKH3oYwMjIaQoHYXgX9j4Ch/8y+q6auRN6djUQGrWf7tZqEg1CH11LBn3X3wJeLaSpxBqpakJWLwRem4HJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761475784; c=relaxed/simple;
	bh=wI4qfVEsQApVSo5mdvn5NBuryN/DTWyuTxTIrAbSyqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpFdDJpX8nvAmtwlDjlVL8UUjFjiQCIUa/FY2BxJsloVrCkohpT6EaMeOK3O2v5qSM+VYjX7Sr/m6xa8FQ2ReoA7rkh0HF6A0mwByyXhqiqXVhdmA2MJJScHFnXQ/8xwvdAtIVw6RLilG0sz+vGSDz4nZ31ytSzSVafZJ3Vndqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBjUFIJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F7EC4CEE7;
	Sun, 26 Oct 2025 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761475784;
	bh=wI4qfVEsQApVSo5mdvn5NBuryN/DTWyuTxTIrAbSyqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YBjUFIJQ+DVmXb9MPM3Qhss9hWusG76a8ldUrIg1DeJAcHwCEcfbgQ0dk9D/dp9qK
	 JeBw6xVQ3r1YfL6EqQZmgqGV/+IAq5dwrxxbaudK6YOwWzXJrRfQbEfg+gZvmNtd5r
	 73GuKfcGr64DPXZaEI1fQ4IA+DjhRY1kVgvxjSb/4dTv4Cd8oMNgXOVlUVfop8dwFS
	 g8OU0Si2kLFrcILpESZDPB2bZd7e61HQA5Yu0ReIGPc0odfZ/rCcKviKzGjb+zWSIA
	 wWOr6/X/iCAVwqHzlwP3R82cn+dn3k3bQ4abM0WyJPeVrUNIrcvP41ZMKvkfR5xt9r
	 8oCipI0v9IL1A==
Message-ID: <5a5dee53-6807-422e-ab88-e10f2a8703f9@kernel.org>
Date: Sun, 26 Oct 2025 11:49:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] rust: i2c: add basic I2C device and driver
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
 <20251005102328.41899-1-igor.korotin.linux@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251005102328.41899-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/5/25 12:23 PM, Igor Korotin wrote:
> Implement the core abstractions needed for I2C drivers, including:
> 
> * `i2c::Driver` — the trait drivers must implement, including `probe`
> 
> * `i2c::I2cClient` — a safe wrapper around `struct i2c_client`
> 
> * `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
>   generic `driver::Registration` machinery
> 
> * `i2c::DeviceId` — a `RawDeviceIdIndex` implementation for I2C device IDs
> 
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

