Return-Path: <linux-i2c+bounces-13809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFDCC0A646
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 11:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BA063AE5CE
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 10:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39E523AE9B;
	Sun, 26 Oct 2025 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fES4rZGG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710725D8F0;
	Sun, 26 Oct 2025 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761475968; cv=none; b=YlIVnT8VjIDBJ6lwVGeB070Ge2w/lp4Wg2sFyi2lu6bRfeVnOPfMjyEhDyt89U+ez8wbOspN6nvCrpJeJmnlmlVTFmLBo80t4Kd1p0xTlTkntFsoH0LlwjxDjEwb3keQoHzdRLiPo5bQZmadqLSHNn71sKcMoLvcUHnjPrGu18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761475968; c=relaxed/simple;
	bh=Myx3IGCamphYPWXcEBfxQfsVLyhzoLgCt8NgFsAp96U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXwxX1GXvic6tJLpq+t5nT2z06MpeUUgt1EDPw79tU/NnKLFNYDPOI1wJNG2Il3wv1flrPQfqwu5zapzev0EKwlb7XaTtUvOqw7LRXb+kuSJC5ePxBzS1z/IoOWT1zWcf8s+UVyJ6lIm3iXfSMwYoq48TL8TCH2HMaIh50NcY/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fES4rZGG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D63C4CEE7;
	Sun, 26 Oct 2025 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761475966;
	bh=Myx3IGCamphYPWXcEBfxQfsVLyhzoLgCt8NgFsAp96U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fES4rZGG+FZOBRajJprd7YK5Bm+wBfJYcMP54xp2Lq5aTnSSFbLWo03wwKEovL2Op
	 e32KQuERPDNob0CWQSwEGKg6VYvBFCRdi5FoG3w5ZYiu+Sk/wOVe8Xv5+PAYyRgsQ8
	 4aWzVyuB464ZtaMt7Re8Wpl8Anas3hgbq6ZhQaAFFWI3Ige/Sc89XVxUn2qLWVhV7x
	 bQs/qJktF4RHwQepQ1k9WgreP0xPwG9ajvpZ2zgM2Ryvc12T07Ks2LW7yX6UmtCEK2
	 0IMSBOG48ztR4uqAi461cHgYJFI3uuhQ4GZ/c+lPQRF5nrkeHR9FL49VRmL7XxVLBN
	 BMwH3M4dwa8eA==
Message-ID: <8b0718a3-bf3f-4037-be2e-540ba1879405@kernel.org>
Date: Sun, 26 Oct 2025 11:52:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
 <4d6d737e-6e9d-4d33-8402-940947170872@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <4d6d737e-6e9d-4d33-8402-940947170872@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/25 10:38 AM, Igor Korotin wrote:
> Just checking if there’s any feedback or if it’s still pending review.
> Thanks!

One note, if taken through the I2C tree, this patch series will have a conflict
with [1] from the driver-core tree.

Igor, Wolfram: If you rather want to avoid the conflict, I can also take this
initial series through the driver-core tree.

Thanks,
Danilo

[1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/

