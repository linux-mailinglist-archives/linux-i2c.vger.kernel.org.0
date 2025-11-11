Return-Path: <linux-i2c+bounces-14041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C71C4C3DD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 113C74E4FB0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 08:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE4728469A;
	Tue, 11 Nov 2025 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5mgYZ+N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89DC10F1;
	Tue, 11 Nov 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848314; cv=none; b=SM+2FC8WSzznAWfMnv+YL1BW044WNAlF6bKPoplezlvs3/MMlqaASGoicIKsSSt+xNY6EiqniCxpUdOdu9YsIk+9Ajgoiq7X2YCnkDr1kDb84IsSlOdifw9SqP3Dr2sY4hgSNMsdjcIhROO9lucB8HrrJ/6gwrXPJ82Mks0yarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848314; c=relaxed/simple;
	bh=rT13Qd3wPD3hwkFAZ+QVMLiQWrWulfjRb9NLf1Aw1kE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=HevRxiXsuYWsNsNSikeoQR8I5ZOtajbtf86YsPDyJb3784bjniaLw5Jd7LTatBAW6MRRZzFdFfKfE5NsqfHw1y8RS1Jyx8LiMhYiwZRkEYCpYHnOqrAWP1qwCnjTHyPgnBLb4GjfHsWi6gAcGThqqQ/uidNonfSMbqMAGLM7V08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5mgYZ+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E715C19421;
	Tue, 11 Nov 2025 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762848313;
	bh=rT13Qd3wPD3hwkFAZ+QVMLiQWrWulfjRb9NLf1Aw1kE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=f5mgYZ+NfbPntvyRAw35u0Fy//u3B1C3abGBOM4eYv+ppdnDnAv/IxHXVNQmhW8I0
	 sqVoNceXWiMxqDp2+OuSqhoVkk9FYiJKk8BkTINnl/LMo2Sj7PpEsWjYQqCFCTXqtD
	 HMKKHudgqn+yzS2GDEjzbUprQkWCe1zlbpxk6iBL3rzbxI+FRiBbcd69eX834ox4am
	 kmHdnXMhO7ubiOodt1w/KKxWRIzIkV4dxCDGMEDw1QuNi8lRUu0/dT+ybl2bm4Yqxm
	 7Q4cka43X7rUFsRii9GYHvbGEaL9R9kvaDVM2j6p0eBRzjPD/Fum0/QQjZvMXM4PMm
	 EI8VFx6aWIDvQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 19:05:00 +1100
Message-Id: <DE5PKHFJTNZK.1C7KAX24AP55Y@kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 0/4] rust: i2c: Add basic I2C driver abstractions
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
In-Reply-To: <20251110112437.50405-1-igor.korotin.linux@gmail.com>

On Mon Nov 10, 2025 at 10:24 PM AEDT, Igor Korotin wrote:
> v7:
>  - Rebase and update `i2c::Driver::probe` function based on patch=20
>    series [1].

Can you please rebase onto driver-core-next from [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core=
.git/log/?h=3Ddriver-core-next

There are a few more nits I'd usually fix up on apply, but since you have t=
o
resend anyways, please find a few comments on the patches.

