Return-Path: <linux-i2c+bounces-3811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1AF8FCF02
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 15:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98468284058
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81AA188CB6;
	Wed,  5 Jun 2024 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4STCr0b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6367F188CA4;
	Wed,  5 Jun 2024 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591734; cv=none; b=gxnLu33zMTsrHUke9FKgkio9xSdIIKpR2Pe1ofhOsdvGrGVP6gVc4c75Jhtp8F2PYowG6D7vOYuXF1cT127ZuUY98xHwW8/JRoeO4mVLQwYQzjTYoT7zy/2I4gWl9xnM6+yEYBgw8hIP61g/C1gdP03yaeUCrONVc541w34ql9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591734; c=relaxed/simple;
	bh=yy+Rt83glVimHAJ9L79Wxbxkzr75tLAHJvJiamRNvls=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/OwjiukjqFK5r+lYhQzQQl3SJAkuQjxrlWBasRvXHo31iVsqq1R0olopRB0C49BY5Pg/8ftJfNkxcrSKOo1H9zbVXTrhSrHGDw7QiefdfDD6uMlJ0s8Gh9SXZVc5t48CN6ens6n9c1XrmBuLoMMEO80485KbZYrnhvmL6EmGtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4STCr0b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F295EC3277B;
	Wed,  5 Jun 2024 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717591734;
	bh=yy+Rt83glVimHAJ9L79Wxbxkzr75tLAHJvJiamRNvls=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=c4STCr0blobrUxuNk+Q7iNAqoZY8xgN7Xcpy2KGXBbyn2o/WsmrJceLBYewsz/s5u
	 4gi3frDMYzWEjcApYPsPv6C1Q9FJoxkbFJrhq9+wqk8oD392l/Qy1cQVu1MDHzo9nS
	 Hhw39R+9CwSeuKhVorgCX+QT/kYPsyqCuYHizfCGCQsVTkJkQdO1FkJZRcmkU+d8uK
	 ZhaHdX/KoCHg7C7pl3rycQcXHKjJd6P8BSguqSNdptsGzqlyqSRAvpevort9ZF2yvY
	 P/G8J/z/flf2eaDEriFBfO1B7fYytpYViob5JIAtKyKJF6rsKmhIXJul3WmpcSdyRm
	 Otg/3NxNBTUUw==
Date: Wed, 5 Jun 2024 13:48:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc3
Message-ID: <xa6xj6rpt5uuyxq4psm26qs5ptjn3n2krpdhcevh2kv2tz6eft@4t2undxir6un>
References: <ZmARnWliAuHLbwOy@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmARnWliAuHLbwOy@shikoro>

Hi Wolfram,

On Wed, Jun 05, 2024 at 09:19:57AM +0200, Wolfram Sang wrote:
> The following changes since commit c3f38fa61af77b49866b006939479069cd451173:
> 
>   Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc3
> 
> for you to fetch changes up to c4aff1d1ec90d9596c71b6f06b0bfab40a36a34a:
> 
>   Merge tag 'i2c-host-6.10-pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-06-03 08:51:53 +0200)
> 
> ----------------------------------------------------------------
> This should have been my second pull request during the merge window but
> one dependency in the drm subsystem fell through the cracks and was only
> applied for rc2. Now, we can finally remove I2C_CLASS_SPD.
> 
> ----------------------------------------------------------------
> Christophe JAILLET (1):
>       i2c: synquacer: Remove a clk reference from struct synquacer_i2c
> 
> Heiner Kallweit (1):
>       i2c: Remove I2C_CLASS_SPD

I had these in my branches queued up for 6.11. As you are taking
care of them, I will then remove them from my branch.

I have a few fixes more for rc3, though that I'm planning to send
you tomorrow.

Thanks,
Andi

> Wolfram Sang (1):
>       Merge tag 'i2c-host-6.10-pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current
> 
>  drivers/i2c/busses/i2c-synquacer.c | 11 +++++------
>  include/linux/i2c.h                |  1 -
>  2 files changed, 5 insertions(+), 7 deletions(-)



