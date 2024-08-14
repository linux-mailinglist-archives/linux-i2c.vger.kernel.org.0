Return-Path: <linux-i2c+bounces-5413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 530659525B5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 00:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10231282528
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 22:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C31149C77;
	Wed, 14 Aug 2024 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWwZD+Dm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40E12C484;
	Wed, 14 Aug 2024 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723674629; cv=none; b=VRxRDPlKxCqesb8Jy5m7PxUhUL/sR3Hb7gQdz1UXdWCiHE4DHTHBJpAZ+hx+FlmUhF3ZJDLE53dC/rpEvlCKhbCN16p4Blg0H3Fx5TX5FT4qpILf3W6/2N+kF/xfZE7kr7d7BexuEnJO4ThPWs82QQlslLvChlud7txMdHhjOIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723674629; c=relaxed/simple;
	bh=zIRR5kO0Q7dFKJoZCQvn9Enuj7/yY/QIz0vMkD+rVks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPVnHJqJGYTWKPIUVxWxu0MUnsYcuyiWOaxkHT0ZP9UC8dOY/WlwCDId/ium3PfJYYJOdaMGzBHNH47qH66Dyiav3BgD/wvziNMnDtALQ0o8kOtnVjXTlfnVaL/mY6pQot/H7RDrwHkMG65zOEKlcTeXUBk+GT7aUrbI+H4ozU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWwZD+Dm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2EAC116B1;
	Wed, 14 Aug 2024 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723674629;
	bh=zIRR5kO0Q7dFKJoZCQvn9Enuj7/yY/QIz0vMkD+rVks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWwZD+DmVEnbP4p11X5y73Vf9NycJk+Ed4sT0tjI4AT+M/d+l/lSb71gpV0ow9oqS
	 qM+JHKe3Sca2m3o66ACWeOKDOl/rVO4h+56+ncs4R/90isNX8GskUmGC1+nagiFZsG
	 oLBP7IMwN6uEULYGzdCtrMVtCMW3l4+P/W8AZNrjlp+PCV+gaaJpt8dhzi4PnRRDgj
	 MiM+ckX5LYqklcIRIQNb54bSDV2eLR8eH+HgHDJK+6yvwLcMO4rIwxcpy3dafMrKKn
	 VkoYakDgmVldlUi77M2Oan9o4adGd78roAeZb4mMu0bHlGA5bdn3dOn9ad4Y9RR8jo
	 NZTxzN4QURNxw==
Date: Wed, 14 Aug 2024 23:30:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, Michael van der Westhuizen <rmikey@meta.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <zx4zvuswifa2renbqw6rtz3zvevvidddc2rzdqzvxacjz76722@kblniz5oz7e4>
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
> 
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

merged to i2c/i2c-host-fixes.

Thanks,
Andi

