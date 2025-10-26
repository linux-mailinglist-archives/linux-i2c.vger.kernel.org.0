Return-Path: <linux-i2c+bounces-13814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ADCC0ACEE
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 16:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FFA54ED555
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 15:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5430B21FF55;
	Sun, 26 Oct 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/8mAImp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6721FFC59;
	Sun, 26 Oct 2025 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761493409; cv=none; b=cWtCHu6BrI5x88WJ4yZj1BF0WBCyom4J8iKe3iLJSgiawB0djUHjxzEvFiTMwm8vWEylvOEwlcosSGifePjH7n9WVXy3PeqU6D95QkxR/5ZqmDtQJq8u2/jNN7AzP+HR2lImZPfyav9fQP9EI9EsoN1gJeZDlZ974G1RlM1koRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761493409; c=relaxed/simple;
	bh=c2wOyixprC79BMJyFeHfMwft/0lI4fCuCaPGNq/axFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoC3d6HuvpQbJPrE3LQLGNo1cuFA9R/bEyxEUqfF6gfmxRbQFXGkqwSGsYxIwQ47jENvm8VjAxbqLIsTXC3Cr7IZ6GJoQY+oTi/6KDDVKZkounLyQCFdWZD1zmbLTw+fkVTA37sSm4Nk0i+uTTiZJgj+3DDOTZdY8sDodog8AdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/8mAImp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B157BC4CEE7;
	Sun, 26 Oct 2025 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761493408;
	bh=c2wOyixprC79BMJyFeHfMwft/0lI4fCuCaPGNq/axFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/8mAImpjANY00gRVd4uEMZngbqOOcPiAt7ltO+gPkbfpL+kSfNzcJ+sFp0NeZiXa
	 Rj6dq1r361kcuDa37KO+cF/LTvTBsIxz2eov+mGa5wgZXx6T0sK/l46VkdgZkwxxtl
	 dLEhAMeAxmq4NC88l2w62/Vu0NbyBZrlh5vyemdc2YXGlsCK16xc/m//P6l9y3S5gW
	 Jb+AOQkPyxliTKyMTSmAfiZEKRlbFWZ2VbQzeQeyQmz/kv7l1eMZqeeTShjyS5CRxC
	 hQesnPfEE6Hl1nmnyrGSMVNOhgwlHdKennPzUwmwzz/SdnKyx+S+HvV7am8nO2KXL/
	 opiG9ZEyfinvw==
Message-ID: <2d9a8196-8d66-4238-a807-b1ff9fd84519@kernel.org>
Date: Sun, 26 Oct 2025 16:43:22 +0100
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <72e286cb-7517-494d-a8ed-769b5fb8baee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/25 3:06 PM, Igor Korotin wrote:
> Hello Danilo
> 
> On 10/26/2025 10:48 AM, Danilo Krummrich wrote:
>> On 10/5/25 12:23 PM, Igor Korotin wrote:
>>> +impl Drop for SampleDriver {
>>> +    fn drop(&mut self) {
>>> +        dev_info!(self.idev.as_ref(), "Remove Rust I2C driver sample.\n");
>>> +    }
>>> +}
>>
>> NIT: Please use the i2c::Driver::unbind() callback instead.
> 
> Thanks for the feedback.
> I’ll move this into the i2c::Driver::unbind() callback.
> 
> Should I send v7?

For such a minor thing I can usually do it when applying the patch, but given
that for the other patch the change is a bit more significant, I'd say please
send a v7.

