Return-Path: <linux-i2c+bounces-6332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898C96F8F7
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 18:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C355C1C21649
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 16:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD271D1F6F;
	Fri,  6 Sep 2024 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apOz2uug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DAD374F1;
	Fri,  6 Sep 2024 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638585; cv=none; b=DSCE6nPvh+FZOYQxaE85Hxxy/+lEn+lVrjdVJY0IoSPcn9J0q18Ku+GQRKEYOsmesg/5nqllbEG8zcENKpuO/rKpYfme0zHczKos6omzyVmW5Cx5u52FKstPc/d6d4Rw3GTeE5u1IwD0luTft+DKa2g0PlMHRbM9yfGqThRPdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638585; c=relaxed/simple;
	bh=7fGOQwog3g/mDCj72pI0ZqmoA37xUY+mA00MIYSmcyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHML3r9FPveWK3d/wVqOalySGGLtlTGgkp7Z7x54vRHuwczRkftgCg/AVkVDZomez6nzWKupcSIDkg/80ck4yfoM798MOq2RjO8OkAkB2h8DXxGCwYQHJAvhBuir6+rF0ynzF5+ZlSNGUMdbC5cTh2ZwZBKCUKjnPbG6ywX+CTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apOz2uug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9733DC4CEC4;
	Fri,  6 Sep 2024 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725638585;
	bh=7fGOQwog3g/mDCj72pI0ZqmoA37xUY+mA00MIYSmcyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apOz2uug2ZA9MwvRcWALZgmjLkhT+7+bs3/IItERCNXkKlLK/Te4xIxUPTq+OyEZg
	 2lImtKo6UA7fCzkmnE+Z+zzYJUvVDJBDkxTD1gLrpufZa0hF13Fr6zvC78U314cKos
	 +eZe9s8I7CFYCRw6evzzrplamAMHDqEG8aojeR4za0EcAGj/4Fe4Ttwsk918OAbQnk
	 kMF5WvXIF5oQqVJPCm0t9OHDpAVUWhcO2UsLi6txDpwDweJlvDgLir0zU6zPLWoWF8
	 SlOTGMtADj23UZddGqSO48sH+kTTomB/KB+B8RqPXUrDg6JB2J4meFnICvOwUUIq4W
	 4XBHUwV1lxtnw==
Date: Fri, 6 Sep 2024 18:03:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <4xm4v5gq72klvg4xk4fzpyuui7hmmh63gdoflghwmo7pvid4ub@l22jnobt6n5j>
References: <20240906074731.3064-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906074731.3064-1-kimriver.liu@siengine.com>

Hi Kimriver,

On Fri, Sep 06, 2024 at 03:47:31PM GMT, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> 
> ---
> V5->V6: restore i2c_dw_is_master_idling() function checking
> V4->V5: delete master idling checking
> V3->V4:
>       1. update commit messages and add patch version and changelog
>       2. move print the error message in i2c_dw_xfer
> V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
> V1->V2: used standard words in function names and addressed review comments
> 
> link to V1:
> https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/

You've ignored all of Andy's reviews, and this is not acceptable.

You've submitted this patch three times today in a short period,
and Andy has responded to each one with the same comment, which
you continue to disregard.

You must follow up on the reviews. I will accept this patch for
now, but if you keep ignoring feedback, I will reject future
patches until you address all reviews from those taking their
time to review your changes.

Andi

