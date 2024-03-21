Return-Path: <linux-i2c+bounces-2474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533678861D1
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 21:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8AB31F22EB0
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 20:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0F9135A7C;
	Thu, 21 Mar 2024 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeH0qeRN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824F135A73;
	Thu, 21 Mar 2024 20:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711053724; cv=none; b=tjgtbDBk/pcsLAphpX8mZAp8q07RLbyQ2CyJPQNAjDwB7m50YT0AhBJ6rZ50Q2hGB4W0VIMZU67IVonIyOCl9qt0WgSbEEA/MCWq4U6JgNtiOtZ2OPaRh2ZhdGlJYoRdc7JLm3Yyr05/jwDB071OTj1EhKX01m6xwLM5s+Vtf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711053724; c=relaxed/simple;
	bh=NmpziW9BRh/m71deL6UzzTXuJp7VGLzKgaq9xo9Yzbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bp7gKLsiFmMnHpwTBxHAPsflcVQVDcyK1QY5U0PFgxKBNgtmnF3ALuF8VLT2qnKPQuVacwNddVR5pk1603gT3t1hIRfBZ5JOFT/goNBWp5lPjfp4ndBO7fyFDTsDhmI1C3qesw9hefk+V/El87usHuGtWeiY12mtNiUAZKhhe80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeH0qeRN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1361BC43390;
	Thu, 21 Mar 2024 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711053723;
	bh=NmpziW9BRh/m71deL6UzzTXuJp7VGLzKgaq9xo9Yzbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeH0qeRNoMsQMC7cu3nTrqYjVsxi6LfXUoPiyFtb3XMkIhZt0a+TNbA/7CIWJiSN4
	 8dvFUxuTLnwxK4sj491kzgSDs8qmu1UPEL964/t2z31Fd4IVJwmT++8cnvrFxZyoVv
	 pLrTjMFKMqHrWvbiVKsvznaFkPyOv8KMSZhgIRtvFuTyVoSHts6GgI55w4g5Jsxk2y
	 75bUMPxELRPdxLLIqikAqhOU+XrF923jyD3F+HA6k0aOY3I3VWiG1C6w2tB1SUvdZw
	 0Bfnyy/aH6xMqhb2wONhyFwq5XobdIay+rTlBH0Po4Ml6Q6HN8sot8GyX70u1/+YG9
	 bZrePSUV/K4Cg==
Date: Thu, 21 Mar 2024 21:41:59 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Fix a refactoring that broke a touchpad on
 Lenovo P1
Message-ID: <hanmsf4vklzy6u2a3bcqiqjwnjimwfxuk64vte6h5avjtowku4@wvcmu3ifb7bo>
References: <20240321141919.26844-1-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321141919.26844-1-mlevitsk@redhat.com>

Hi Maxim,

On Thu, Mar 21, 2024 at 10:19:19AM -0400, Maxim Levitsky wrote:
> Commit 857cc04cdf50 ("i2c: i801: Add helper i801_get_block_len")
> introduced a slight functional change: the status variable is now
> overwritten with the length of an SMBUS tranasaction,
> even in case of success.
> 
> This breaks the touchpad on at least my Lenovo P1:
> 
> rmi4_physical rmi4-00: Read PDT entry at 0x00e9 failed, code: -6.
> rmi4_physical rmi4-00: RMI initial reset failed! Continuing in spite of this.
> rmi4_physical rmi4-00: Read PDT entry at 0x00e9 failed, code: -6.
> rmi4_physical rmi4-00: IRQ counting failed with code -6.
> 
> Fixes: 857cc04cdf50 ("i2c: i801: Add helper i801_get_block_len")
> 

next time please drop this blank line here.

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1
      commit: a5894bc48f64caa86dbea1744d067c925303c5fc

