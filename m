Return-Path: <linux-i2c+bounces-11936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00496B04851
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 22:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E8B4A5520
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 20:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FE822FF37;
	Mon, 14 Jul 2025 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1AcJyKf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11417A2EB;
	Mon, 14 Jul 2025 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524349; cv=none; b=K8pwz5bpId/Y3WD3IqvcceryviE9htTx+czpyF/Vtqw/eZELqc1LLJC2YNHY4jNf2wrWfKLkyvkUxrTfmmU3KRtISK1HwilWFl2xrzAWCUxhZ2/B6KwXWCpYH87qw2Eu3GGq7rp56hrBKTG0IbWMQmkIN9ulKvtIRX+5fDBe2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524349; c=relaxed/simple;
	bh=7bJfXVAhNRnVzDM7xUbPcaTe/6YZcIdGFerGICjVRco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhTDihBN/fufiXpu65uWPV2J15GrahJ55MalEEUVEIgils8In/y1nlIEapyX4azsNmt40e2bteQ2I4rpL2woFprOv7liFmk79CTg805LRR6vySOIH5Ywv0RMcEujiw8B1qjJipcuuWSEwFBeA+qrZ105IMsoL07Rg490lXf7ZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1AcJyKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61184C4CEED;
	Mon, 14 Jul 2025 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524348;
	bh=7bJfXVAhNRnVzDM7xUbPcaTe/6YZcIdGFerGICjVRco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1AcJyKfZwI3rEwGrXwsM2UiVBkBgFFyrz6w6qOvkx1BXwD1NPSZ+Gj/cGvCxL8hn
	 /ouGqxN/jWX5w5CM7YPK7Hv1rCrnztH29yPGeBBTbcZHzrJV2lwKHgLfKkCSmveApz
	 VkCXuYnW3pMOkYOplDU46goYl3w7r9Xb2EH8p5qqGr1ohERPb4nRq3hAYmWD2g8Inn
	 v4JUEHLHSa4z7BKUkSX2mmFJ5Imk+27dxDuGY9MFjpUqn7HyoycJVAd8aRlZl2gOoL
	 i19gOkeXf12/tkhZ82M/gMPv87uJcfxP9TP3geCBbY39Ft9C31FrtcXe8j+x5KGZNa
	 KLbez3gIBE3hA==
Date: Mon, 14 Jul 2025 22:19:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andriy.shevchenko@linux.intel.com, digetx@gmail.com, 
	jonathanh@nvidia.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, p.zabel@pengutronix.de, 
	thierry.reding@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 0/3] i2c: tegra: Improve reset and DMA operations
Message-ID: <23rb6h5dumcgwrjclos6lax7udhlgyr56eym3jxcuuy5tmczaf@jyhwo6b56rkk>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131206.2316-1-akhilrajeev@nvidia.com>

Hi Akhil,

with the changes we agreed afterwards...

> Akhil R (3):
>   i2c: tegra: Fix reset error handling with ACPI

... merged to i2c/i2c-host-fixes

>   i2c: tegra: Use internal reset when reset property is not available
>   i2c: tegra: Remove dma_sync_*() calls

mergedt to i2c/i2c-host-next.

Thanks,
Andi

