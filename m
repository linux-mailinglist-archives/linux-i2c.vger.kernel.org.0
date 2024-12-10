Return-Path: <linux-i2c+bounces-8420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FE9EB402
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 134CB28628B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 14:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068A61C3F27;
	Tue, 10 Dec 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCvLeCmt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58AA1C3F02;
	Tue, 10 Dec 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842289; cv=none; b=KtKNB+iZZ9R9mWJEwDdswtlITqFDs0hGjXrCqcROzJr+ew2PjMd4ykwOKC0F/xgFdTPNE0MknjIy3pPdD8CtcVP7ZLhD372Y9avms8yBssHlnHugXYkWPIZJGK+VVGan1xiNlIiM03vZJ/vM9ywsUFJCupNjx5NaLESNSCc9X7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842289; c=relaxed/simple;
	bh=ZUAvi1jN1qmXUBxFgEozQgzSpVFDQiySdNEYR7SDDF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDYh0n0KQhDb4XEUKrXFcDi2GO4MbH5PxpHPN2MKw5zzz/trW3+r5m4EHXCQ67cgchdasvbOEsA0+0CXP2q2M9E/Ls/Q/kVObTe+KrnZPID+LyLZnyhkJP9L1kcidFimPSzkLwubnZ01rHU1JnG3Xn6ooSuwXkDcMLWkVREMiTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCvLeCmt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEC9C4CED6;
	Tue, 10 Dec 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733842289;
	bh=ZUAvi1jN1qmXUBxFgEozQgzSpVFDQiySdNEYR7SDDF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCvLeCmtXhosE1EdBQVuEz3PNugZIdGnoFin0EL+HTummL17Q5U3Nl6bijRf5Mknt
	 1x6+G3UUkto9N4ilgePbEI484Bse7KAYKxjv1CRdyzbHJaWr0lJIAkhNDNCJxwSSVw
	 Q4XK1V2x/L45aRa/89wdIoXTnukwLcOjooEDuyWzV2fypJU+a4s/zb+DuBthFilPXW
	 Us13Z0j9oNT60yv6/6PfMlSjVt0KHFIbFRLMe7YRA93dWehWtEbl1E8MzX8P6lba4D
	 lIeU15moEP2/qUTuq4Ez6T9/5vdb9cvGqxkcv380cIBdVVN3CFy0AcaGhSdntyZjHB
	 aoRbpC3LhC6NA==
Date: Tue, 10 Dec 2024 15:51:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Riabchun <ferr.lambarginio@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pnx: Fix timeout in wait functions
Message-ID: <6vxpcoqf3npp46cajdsvrhaoiarprhfoyzb7k6qj32dwwot6ad@udg5sq3o3klh>
References: <20241206231937.86408-1-ferr.lambarginio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206231937.86408-1-ferr.lambarginio@gmail.com>

Hi Vladimir,

On Sat, Dec 07, 2024 at 12:19:34AM +0100, Vladimir Riabchun wrote:
> Since commit f63b94be6942 ("i2c: pnx: Fix potential deadlock warning
> from del_timer_sync() call in isr") jiffies are stored in
> i2c_pnx_algo_data.timeout, but wait_timeout and wait_reset are still
> using it as milliseconds. Convert jiffies back to milliseconds to wait
> for the expected amount of time.
> 
> Fixes: f63b94be6942 ("i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr")
> Signed-off-by: Vladimir Riabchun <ferr.lambarginio@gmail.com>

good catch! Merged to i2c/i2c-host-fixes.

Thanks,
Andi

