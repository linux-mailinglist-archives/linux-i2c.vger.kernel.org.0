Return-Path: <linux-i2c+bounces-5552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E891F9575A3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BF681C21122
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A440B158D91;
	Mon, 19 Aug 2024 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5fg8eqq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBCC158A12;
	Mon, 19 Aug 2024 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724099279; cv=none; b=bbUU2CO6AkA6zonIcYVdg4DWk8y+4DquAHMnTvd3KzvH+nqR1ujaiQHTFhp+4608Y/ddWZuqjFGMzLBUKE1JuawiBkXVgOmevN5SManJr/1MyKVNX+yP9lNVpgnGskauN+LhtqELoEgZXiV1dJfAFIe6ZyratB52WLG8AfAdvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724099279; c=relaxed/simple;
	bh=hkdP2GdNshTzHc3DAs8jcpJNPRv0DVJXjPeaIrwoyUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJBaCG53lUyEPuRFOMMFeXsxmFGpYGmtbPMR1YJYPFlk9tAu8YolCYzaqJO0lc8ldmY8ukaUJxTcY0xkcHLKJTDWB4tslh8ZBJpWabidqctE/3knDHocFcvim71j3YpPxo+/kAgNZcLSG1ICShk+GC1TUDtb9PxrXaPtvJOTgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5fg8eqq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB7BC32782;
	Mon, 19 Aug 2024 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724099277;
	bh=hkdP2GdNshTzHc3DAs8jcpJNPRv0DVJXjPeaIrwoyUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5fg8eqqm+ztsMYvr3EnmmsxqsDkxw+aSZQKvs9KdJvwtxp9XkM71x6qDgP106WNA
	 dDzo2UQDuqsiS/cBbdTVhic3vYMqVbSEwfLGAGMiIbQ/kuzHVjcK+cqf2d5bR+TEY2
	 jWoTYI6+lYFiHgHQ+4rnTFYpAo8Y/0R1LsW3ni0oiRnLz1aiGhHOIEt4TEORu9s8cY
	 3kgH5TRXPhuFAspT15FisUN2933agtFamVlA9LiOQlyJwzNc8/cYQcCFfgh9J8zWC2
	 yXcwHYI3lxKCDxoPQPOyBte1ukk83sO2vjoThYSQ/ALkcLJcYvfCAL6PFtPEaUZvQI
	 QKsHDRBzwnTCA==
Date: Mon, 19 Aug 2024 22:27:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com, Borislav Petkov <bp@alien8.de>, 
	Kim Phillips <kim.phillips@amd.com>, grom@black.fi.intel.com, 
	84c04d074b1778886a1af1062a4ca9d9afd72306@black.fi.intel.com, Mon@black.fi.intel.com, Sep@black.fi.intel.com, 
	17@black.fi.intel.com, 2001@black.fi.intel.com
Subject: Re: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <gf7ozugbibdy7mqqqa2hu5yd6dhikijwdfzbfwifazijsjc7yi@2dxxxscfkjxs>
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

It all applies neatly on my branch and it's all reviewed by me.
I will keep it for a few more days so that others have a chance
to review this series as well.

Thanks,
Andi

