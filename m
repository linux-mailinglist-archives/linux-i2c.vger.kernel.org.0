Return-Path: <linux-i2c+bounces-5349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DCD950FE9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 00:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7C71F25D2D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 22:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B391AB538;
	Tue, 13 Aug 2024 22:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOMAkSU5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E31AB512;
	Tue, 13 Aug 2024 22:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723589602; cv=none; b=ckdFHyPOf5y0rMkGteZjwip11AWv1GIgJ3cIuFqHqX4NYdkCQuxKLWCvZjCYUIW7D29wqH+SJi3o4fP07PdjH5Bd5DHTISGOQ3tIhlwrt9GbyIDubJ+wBE1J/hF8V4/6qoh+NfkSdOEe4Be+N9Qfzcp6nML/5tysBfMaFNXoMr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723589602; c=relaxed/simple;
	bh=f2ndbcAsRTxeYJ0IcGTtOzzOPEzBx+PuBraPZxuFils=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRaVk3w9a96rve51JPmhI0HOt26EBbwxwg4+QnrfxMEzaLXpxvqenVPm1N35DqspPMYqUEVXeHHVXKzHZwP4qyXx249DdR+uq2uHsfO6X0/mO20Y5xc/j24sXgWDJdOCIQbcf0EbhwO4tjAAIRAcRvJK1HyFGzbWO/xENTdcmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOMAkSU5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FB4C32782;
	Tue, 13 Aug 2024 22:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723589601;
	bh=f2ndbcAsRTxeYJ0IcGTtOzzOPEzBx+PuBraPZxuFils=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOMAkSU57MQ2FCsjDEOlzH8ODW+iIWMozrZaSMxXJce9rppN6H/Irign/jQ0cWIvS
	 InbbtXZKngHXIRwexNBcv0QW9cKyYjlfkIyUPn6cnLjWCLSq8ygkleT2TWqiXHZ0nZ
	 hDlphOW5WZ1ypRkyder6u/V2HMtT1TXxdBg13hNybQPzishg/9vWNqZE7WR8lvLDpV
	 XqK1T1JGs4xjy6L0Y6ZKtLU/h+g+Bf5lGi6jj2U/uqj38nylUs2P8vQ4iQx8/kFrKI
	 Pwvumjrqg7DrANMk1n8NL+EbnlM54jsXkFtRwvBRle6kqKUO+z1fUaCNsz5UlXP6VT
	 iaCT3VtepK0rQ==
Date: Tue, 13 Aug 2024 23:53:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, Michael van der Westhuizen <rmikey@meta.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <ry4kzh4vr573ymutpjz5sgzmhosn3ekm3jatjy4yfyfm32eqit@cmp376je7viy>
References: <20240813161254.3509409-1-leitao@debian.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813161254.3509409-1-leitao@debian.org>

Hi Breno,

You don't need to resend the patch. Because the changes are only
in the commit log, I can take care of them.

First of all, we need to fix the title to be:

"i2c: tegra: Do not mark ACPI devices as irq safe"

On Tue, Aug 13, 2024 at 09:12:53AM GMT, Breno Leitao wrote:
> On ACPI machines, the tegra i2c module encounters an issue due to a
> mutex being called inside a spinlock. This leads to the following bug:
> 
> 	BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
> 	in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name: kssif0010
> 	preempt_count: 0, expected: 0
> 	RCU nest depth: 0, expected: 0
> 	irq event stamp: 0
> 
> 	Call trace:
> 	__might_sleep
> 	__mutex_lock_common
> 	mutex_lock_nested
> 	acpi_subsys_runtime_resume
> 	rpm_resume
> 	tegra_i2c_xfer

We can keep the trace as:

	BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
	...

	Call trace:
	__might_sleep
	__mutex_lock_common
	mutex_lock_nested
	acpi_subsys_runtime_resume
	rpm_resume
	tegra_i2c_xfer

> The problem arises because during __pm_runtime_resume(), the spinlock
> &dev->power.lock is acquired before rpm_resume() is called. Later,
> rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> mutexes, triggering the error.
> 
> To address this issue, devices on ACPI are now marked as not IRQ-safe,
> considering the dependency of acpi_subsys_runtime_resume() on mutexes.
> 
> Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
> Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

I haven't seen Andy explicitly tagging this patch. Andy, can we
keep it? Or have I missed it.

Besides, you also need:

Fixes: ede2299f7101 ("i2c: tegra: Support atomic transfers")
Cc: <stable@vger.kernel.org> # v5.6+

Can you please check whether this is right?

This patch won't apply, though, as far as 5.6 so you should
expect to provide some support for the stable backport.

Andi

