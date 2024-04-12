Return-Path: <linux-i2c+bounces-2924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE138A3678
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 21:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46A21F258FB
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 19:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8150914F9F5;
	Fri, 12 Apr 2024 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GahFOO0K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C873446BD;
	Fri, 12 Apr 2024 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712951232; cv=none; b=VcO4H6zgZxrxba9AHVY45ANND+WQhhAfqSqXpIz7fGMfJsyu0NftT62UxDEDuFmrU9p+Ng+a0S1+Wjf/QTcGC4vQaRhOigFZEMv+vM5Mhi+ekMi5uFDxMgFhR1LYPug9ljfF1kqjt/fnNG9CmuwFvMwc98NCnSqxmm9JSu5zvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712951232; c=relaxed/simple;
	bh=CfsPH7NNwB3Rm4gIvUDyGKYjaZUDiprjWdsWosYSfIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzoGNktK/3lqpIZp+msW5ZuMuRc9lekBU9+vQ7Zf3Yn8/RXk/Sr8hVarUxZoUrbvk+SZDFKtjWeZjPXhzoDyagLTvbFjGQH3Ld/TFvNapSnH5pu00xokBND0t+6XIiWiNstSqxaF9/yvQ8vXqKnJTVJiFTLeRucpUV5Cc7Q4cnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GahFOO0K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF0EC113CC;
	Fri, 12 Apr 2024 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712951231;
	bh=CfsPH7NNwB3Rm4gIvUDyGKYjaZUDiprjWdsWosYSfIs=;
	h=Date:From:To:Cc:Subject:From;
	b=GahFOO0KNuU4CxKtAN2Nd3UdZvRaruKqYiwn97i1SOpl+cMoM8bryCFMxIV2t3cjp
	 bh764RrVFmL+A3Gh9EgiMGIHBq2RPj3qIMFPUSTo1EeY1HkhNUsPecxKi6rhhA/ZvV
	 x//aH6QfEvrkzpbqS2h5EQd6hJG+FGy/RzPexW5VVsUdb8bEyVf9JhlmHJR+Yi/YqV
	 jKOJGzrOxmEIa0zD1KG0chqHnlbxi1FjKbMiFVTeybwYhZk7yBOdxz+JGQb7GxfCZl
	 Hp7dr1lO3MFerBwHKBhu1ciF39aGeLGH32UKSPH95xp/driOj+thpx1hBWKegFOqzJ
	 yps29T5OsXk7A==
Date: Fri, 12 Apr 2024 21:47:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.9-rc4
Message-ID: <7z65zupqngw4i4mzgablb37osz3gwz6767og5t4b32o4o3joqy@ypkuxdgilibd>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

In this pull request there is only the path update in the
MAINTAINER file for the pnx driver from Lukas.

Thanks,
Andi

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.9-rc4

for you to fetch changes up to 3731629ddb80ae5f52cb95d7321bccfb138cab7f:

  MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT (2024-04-12 11:27:39 +0200)

----------------------------------------------------------------
No real fixes here, only one path updated in the MAINTAINERS
file.

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

