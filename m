Return-Path: <linux-i2c+bounces-13807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B197C0A63A
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 11:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB2EE349F01
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 10:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A982525291B;
	Sun, 26 Oct 2025 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dE23jkMB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9F2F85B;
	Sun, 26 Oct 2025 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761475701; cv=none; b=k51lyUWOG/75V068hmB1775FMp1kEfOa879Sb+hY8haf6radA9zm1tEQcq5bagjGqTsKyzQAzstnXTPC9hE9u0vEPs6gTTxKPmL/5PSdsREFGI2AC6wkm15GMRZRQPYV+7nYeYABNr6QG4u15nfbo9W3qO6m03/yt6BiiAtKLHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761475701; c=relaxed/simple;
	bh=51HlKW+ZFCrEFSeczksxIV+w9jpJzpji2mlFCaHqMUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcTBExct+zLuUgAQuI+afPEWpX0OaCtx2iyjGE64NDpSP8mzqOounEcjfqJpqjvEvDdo4rmwit7EJo4exkvJtkrjHRtLuKiNOJAn8JdWg44wsh0kYAsUi6pzm7oEUrQOEHWwjRDK5lVyUFzhNcuGqsba084kggKmR9bk2SRJGx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dE23jkMB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13799C4CEE7;
	Sun, 26 Oct 2025 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761475700;
	bh=51HlKW+ZFCrEFSeczksxIV+w9jpJzpji2mlFCaHqMUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dE23jkMBl67+ZoPf4HtHw2ZsG5Qxp9BhNb4qyHTES3I/VkhCrNfjOU7Fk+CF2+owV
	 uAtZdjQyCKaeoYh9bbraN5yVyhGh0as4dMfINpx9QMfSJDyk/BVZvCSpKNqgYtyuAQ
	 nJvOYpom5TiVa37yp3g2JUIoLhVtEvIzILQIKpe+SYMupYFxzK3MtNsFTEAt4+1YLg
	 lO5eSokFciR6ClGmvixWUWYS+oJ4ryWS0VXOAHTbQQudWriIEF83BPiksOhX2G4Qfs
	 H/NFovSlrBqvWEDtbOZL36bgANZ5O87Oz386HP3gCIptZfTIsb776fGL4KOOycXQ9Z
	 YAuG/sXNcgqcQ==
Message-ID: <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
Date: Sun, 26 Oct 2025 11:48:16 +0100
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251005102348.41935-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/25 12:23 PM, Igor Korotin wrote:
> +impl Drop for SampleDriver {
> +    fn drop(&mut self) {
> +        dev_info!(self.idev.as_ref(), "Remove Rust I2C driver sample.\n");
> +    }
> +}

NIT: Please use the i2c::Driver::unbind() callback instead.

