Return-Path: <linux-i2c+bounces-5625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A759C959F65
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA4681C21FFA
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFF81B1D45;
	Wed, 21 Aug 2024 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikDpp1az"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F031AF4F1;
	Wed, 21 Aug 2024 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249508; cv=none; b=SzqT9tM9AyjI4FctDhnstAqNIaBKjstt3I3vFjhcc74r2HNVP7bwIhMeMD3q2T1JG6/tIwdyWkIJMT3p1b1AlKHPV8eyt1UUEBwS/zgxkz56pMqjWWozjDOJwPqCOa2BRFOjDLmtjlPhQ0Db49vGp2e4nJGPhUkvQXJR7oXSyWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249508; c=relaxed/simple;
	bh=7iRi+u+qEYkvpoAf4u2XQya761z80cxicHypRpMEydI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hp00AiVPfH/50IaU4lk7F/OqJSsuh24bDwiR0LAEA4tWcshooORxApL3boVxdYw7H76Go+ufEY1VT2sbFNkH0vqs4OCd4TMz00V6hwQqHzmn9xiav7y0OR9n45A+0VbYu0/2bKyNYoErU322isXwsm0ig56hZ4xsDlLGHrTgKao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikDpp1az; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4C3C32781;
	Wed, 21 Aug 2024 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724249507;
	bh=7iRi+u+qEYkvpoAf4u2XQya761z80cxicHypRpMEydI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikDpp1azlcGzZLHol1C7KZxJlKTVD7slAxaetpmAW7j5RkfGc+PdgZEPGcKJ+YnLB
	 dlSzPpoJ593aSdlrtO51TKCNVMDw+HojhcNln5wzVVKHFzWGgW95BzA0wj82EsorTK
	 fBnsM28Bu2WXxiHTl+TYGPwaHpj0+FK06fPeq/wePDTPq6stDbh7wOlWvLjbf8wC5Z
	 D9pAJQK18wDYv0m4jy8yEaHItY4y7sH/gyEG/dsPW/0VZV7BKRXelFzICyk4U8qgsT
	 xOqaYGmj41ko6naWlANcFYBKSronduzQ+QJfAmYHRQELsfTSc/zGfFamPCfJvngXfx
	 jhsi1ONdHwlAQ==
Date: Wed, 21 Aug 2024 16:11:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com, Borislav Petkov <bp@alien8.de>, 
	Kim Phillips <kim.phillips@amd.com>, grom@black.fi.intel.com, 
	84c04d074b1778886a1af1062a4ca9d9afd72306@black.fi.intel.com, Mon@black.fi.intel.com, Sep@black.fi.intel.com, 
	17@black.fi.intel.com, 2001@black.fi.intel.com
Subject: Re: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <kwan4cnf4dkwdirddkcixs265jisegjn6drkpv3ydlz4zpiswe@ih4x3h4c3ghs>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

All merged to i2c/i2c-host.

Thanks,
Andi

On Mon, Aug 19, 2024 at 09:45:06PM GMT, Andy Shevchenko wrote:
> This is the subset of the patches [1] that should not affect any
> functionality. Here is the unification of ID tables, a couple of
> function prototypes, and other small cleanups.
> 
> In any case this is Cc'ed to AMD who reported a problem in [1]
> presumably in the patch that is *not* included here.
> 
> Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]
> 
> v3:
> - fixed one more rebase issue in patch 5 (LKP)
> 
> v2:
> - fixed rebase issue in patch 5 (LKP)
> 
> Andy Shevchenko (7):
>   i2c: designware: Replace a while-loop by for-loop
>   i2c: designware: Let PCI core to take care about interrupt vectors
>   i2c: designware: Add missing 'c' into PCI IDs variable name
>   i2c: designware: Unify terminator in device ID tables
>   i2c: designware: Always provide device ID tables
>   i2c: designware: Drop return value from i2c_dw_acpi_configure()
>   i2c: designware: Drop return value from dw_i2c_of_configure()
> 
>  drivers/i2c/busses/i2c-designware-common.c  |  4 +-
>  drivers/i2c/busses/i2c-designware-core.h    |  4 +-
>  drivers/i2c/busses/i2c-designware-pcidrv.c  | 22 ++----
>  drivers/i2c/busses/i2c-designware-platdrv.c | 76 +++++++++------------
>  4 files changed, 44 insertions(+), 62 deletions(-)
> 
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

