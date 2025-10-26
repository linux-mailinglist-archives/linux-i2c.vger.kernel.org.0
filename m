Return-Path: <linux-i2c+bounces-13816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C7C0AD00
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 16:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0658189D3D9
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 15:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAEB207A0B;
	Sun, 26 Oct 2025 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUDkIQ9f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC71C862D;
	Sun, 26 Oct 2025 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761494157; cv=none; b=dEvBp/T9u2ePshmhmgiUaknaLnAu6TFBn3iUBQHJ3SjoXO81Um3iewazX+XVswH0GnVI7MwrhE/GcJhSrzHngXVKuiw5htqgrFeALcAZa+pxbky4m63sfxPKzPC6N/3S187LmvLidJ4zfc+7zLSyN5PXfSkt0x+uPaUeWKqokl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761494157; c=relaxed/simple;
	bh=+KJV3T7U4q4scaSgOMGLj6Dcmej5i/SZt/F+HnIo4wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBtklL1xfT/YlrxNDViSn76G22CgX1hgVj+6kgnP/hnSfwSQMB+IYbT9arxDlAlmZMPi39TxhTKbph2YsVWOWaBrmwvH1pIb3fTm7mjjOLgOdCXJlEYUtCtwGidI7ST8M5YkPDytjvzgnaLH3oqsLRcyNyc1O8yDeCZiQiDj9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUDkIQ9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3389FC4CEE7;
	Sun, 26 Oct 2025 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761494157;
	bh=+KJV3T7U4q4scaSgOMGLj6Dcmej5i/SZt/F+HnIo4wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UUDkIQ9fUx7yB6THfSU6sNRJMSh4ROWirMd8RANSG93xtaCepJfORfnQwDNnIN681
	 /qqrppOdCFghA+x5EeWeW9WPA9hPjwNIhacgK7TRcX9tUkJdOEFEEhNoFb1sL8pMc9
	 ogvdhk200hII1wT6P8olR7vACnE714sDJrD02s36sscb3T2U+DwAdZ89W6kyg4BzSS
	 v4DofCunyI7fKblAIPwv1fom1ZMLSiJKJLf71Kk4ZVKfi7bdDJWDEeS1x7pLSnzn+p
	 0NsY1ry3LK6TaYBQA2Q1HIpA71KgB+oCPBRVFToDdgd2tWPrHu7v1mgxrm45IvMr2d
	 RMhB/We42N0hg==
Message-ID: <104b4f2f-56c7-4e92-8b22-1987673ba262@kernel.org>
Date: Sun, 26 Oct 2025 16:55:51 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] samples: rust: add Rust I2C sample driver
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
 <20251005102348.41935-1-igor.korotin.linux@gmail.com>
 <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
 <72e286cb-7517-494d-a8ed-769b5fb8baee@gmail.com>
 <2d9a8196-8d66-4238-a807-b1ff9fd84519@kernel.org>
 <0d8cd0ef-01bd-4996-a146-404a677ad935@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <0d8cd0ef-01bd-4996-a146-404a677ad935@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/25 4:50 PM, Igor Korotin wrote:
> Just for the clarification: by "the change for the other patch" you mean rebase
> and update this patch series based on [1], right?

Yes, plus the i2c:Registration change.
> [1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/



