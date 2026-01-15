Return-Path: <linux-i2c+bounces-15198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CACD26C6B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 18:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C520312E708
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 17:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983C23BFE2A;
	Thu, 15 Jan 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fnz4slaN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B786334;
	Thu, 15 Jan 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498079; cv=none; b=CUFXmgYAsadmMJK3yM3akwbIpsRvm2a5bnrBe71lI5kOtFYEd7cwb7XROq0Qn8zsm9Zkn6C/XnNR/fv7EkDQhk7ra+vYCu14kMMV43cKIFG2+MKys8hw06MfOXY8NnPznxIH95c7l103wfYjk8M6Ab6rVuOvJMM7cPO2c5yUXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498079; c=relaxed/simple;
	bh=2MIxhTeTIkXtgqp/3M7z+E6nNAcvyJ9x84R2tHJBSbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZEGPWDeUBJ8PCpsPQlphKHvXEydPPVoNFHavSCWLU+uR0H1ujx+eIFjE1+HlhJGJeC/gCs0Vrdtc/XQxT8D8Z6et1DXKd+TVeTSffIc3do9djX4Zn6vMQN211++Ro0Wfqwnv7BeMryaaHzsTV+ZVOtKYy6aSz05XDPHQKq5GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fnz4slaN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890D5C16AAE;
	Thu, 15 Jan 2026 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498079;
	bh=2MIxhTeTIkXtgqp/3M7z+E6nNAcvyJ9x84R2tHJBSbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fnz4slaNncwzsOL1HnSWqhi2J1NbxCzRXFh1bSgRjlr1MM38bqv7Kihmz5zdsjKqg
	 vFfHzWQP2JLWXh2/7eMrqxRw1O7Z1l09H0IDsGnZV/mliOJh62PZepZutTgfzCgA40
	 u09r5PMn5hzFiuHDnc4CDx14XPPbeJ8nDV5jbK9iEi1QfIs3m5IlvzdGykTqmJZDoi
	 AMafsQNw7KS+IltfZBi+lVnWr9quxXa+Fe/SePrbxBvVOYJcWFWuu2HOSLM9njt2MW
	 pHqDe34ps1d+6q2R9nFny+Pxxzn/AML06VOnt3qOJEXHGCMklepIe2ubamdFjZiO7X
	 ogsiNL1zHXYwQ==
Date: Thu, 15 Jan 2026 18:27:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: remove unused rst
Message-ID: <aWkjiXG4UPiPyVkw@zenone.zhora.eu>
References: <20251217081601.93856-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217081601.93856-1-kanie@linux.alibaba.com>

Hi Guixin,

On Wed, Dec 17, 2025 at 04:16:01PM +0800, Guixin Liu wrote:
> Since commit 56344e241c54 ("i2c: tegra: Fix reset error handling with
> ACPI") replace reset_control_reset() with device_reset(), the rst
> is no longer used, remove it.
> 
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>

merged to i2c/i2c-host.

Thanks,
Andi

