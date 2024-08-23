Return-Path: <linux-i2c+bounces-5707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9A95C293
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 02:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 710A51C22069
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 00:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C98111A1;
	Fri, 23 Aug 2024 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1TPkt5m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3FCC2FC;
	Fri, 23 Aug 2024 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724373963; cv=none; b=EauJAJDXIsBx5df1FwUSnxz2Xr3JUTHmcjNup+L3+ck1b0FtWGIdetdo1WS1W8jXDFvywfq+8sOorRNWbjeft5ZcX1gKoJqcUaE68Zopm3IJU5Dxz+fQvPuvASH593HwMSXkA3o1YT/hNs0AVHy1um5Ti+NSEoxNlvKHzCu2goI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724373963; c=relaxed/simple;
	bh=fnZBUB96igyMIbXpv/ZMYmsJZ5S05wAISgC14EO7dvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXdcfOHfJy1pu8Ai3SREiEe6VI04OqtjSvvfKsMO9k7adSjfg4bMq+e+lEsEIsXj9SNYpn8zMFP1QcLcldncpraOj72vTYTCSyCCAvcPLv5aLKAXlCfpAIPrxpo4QQuy8vqBOb0zlZONj0Q77i4BYnwU6R2Na7dXY6P6Yfq8zkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1TPkt5m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D506CC32782;
	Fri, 23 Aug 2024 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724373963;
	bh=fnZBUB96igyMIbXpv/ZMYmsJZ5S05wAISgC14EO7dvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a1TPkt5mcqVTFyJbTA1R8g4a7HYS1iuVTGrLxlyL9Rj+8Rf8ZPycMgMjVdOf1E1lC
	 ReYPYnRKIjetSYH4btGeRNrRfzrh4xnSaa2Pvl7vI+WIoBA5T+ow65M4P6QhSBUuVn
	 mN3DavOAYhXqDvJsV0y7N5R23uo1AJCBbYxommrZCVatnz0fQmLg00/Cm/WZyr/60z
	 zfEj53780BtHA7cb5uX5tKn8fROCDPYaiTM0lMf/Px64yDTdqRqC5CJdhvHcyUnwQF
	 6+zQPGF1aiSPLJHv9qVhO25b5uHDS30vGImg0Op0i+jE8GaCxGNZIiqSNbisBw0HF3
	 1B3Kw5Pwa4iow==
Date: Fri, 23 Aug 2024 02:45:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com, 
	Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>
Subject: Re: [PATCH v1 0/5] i2c: designware: Cleanups (part 2)
Message-ID: <oo2wbjxoe5acqeamjmnngnu2n4e2fsmclepnwvra4hmc5nn64l@q7rnxilvtebu>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Thu, Aug 22, 2024 at 08:58:36PM GMT, Andy Shevchenko wrote:
> This is the subset of the patches [1] that should not affect any
> functionality. Here are:
> - consolidation of FW parsing and configuring code 
> - some function renaming / dropping
> - switching to export namespace
> 
> In any case this is Cc'ed to AMD who reported a problem in [1]
> presumably in the patch that is *not* included here.
> 
> Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]
> 
> Andy Shevchenko (5):
>   i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
>   i2c: designware: Consolidate firmware parsing and configuring code
>   i2c: designware: Unify the firmware type checks
>   i2c: designware: Move exports to I2C_DW namespaces
>   i2c: designware: Remove ->disable() callback

I merged these patches in i2c/i2c-host. Normally I leave patches
a bit longer in the list, but they have been reviewed and
discussed.

If there will come some observations from others, we are in time
to change them.

Thanks,
Andi

