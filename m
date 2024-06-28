Return-Path: <linux-i2c+bounces-4460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5D91BC08
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9193AB21650
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB978153BD7;
	Fri, 28 Jun 2024 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL5hi7+D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D5153561;
	Fri, 28 Jun 2024 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568755; cv=none; b=cZ3Pev9/MJxT82Z5j8HQLDXcND7jscv8hjRB6LGwkyMTyyJ7Hd0v+Zl/pIJjpo5YF030cCZbdG31JbyTXxQCXgMa/X7ZK5UG20zoK01++9IuLYyk7SOVH0LSOvwQj0vbupGPSF0pKjjUbrKMnKhEZ5+Cm5JX+qpXDO9Ue4PZfec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568755; c=relaxed/simple;
	bh=QVKhCfYfeNUH52VsmRhkQmesdrNRb+Wa8cQp+EHzPIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcqmOukVc3U45CEDrsCIk730ZQJ9DxAOvNVn/RblqFMorPAiO+RDcdshlQ03lEowvGsjukv6nnXtgktCmV5SujQlJW0Di6gYcl07K3v273pIl6mhcnK9R6C/r4tRPzgSwJWjIKjt+8MBAHhvgxLloqOZClnwf4Puyv+4E4o7MmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL5hi7+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5584EC32781;
	Fri, 28 Jun 2024 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719568755;
	bh=QVKhCfYfeNUH52VsmRhkQmesdrNRb+Wa8cQp+EHzPIU=;
	h=Date:From:To:Cc:Subject:From;
	b=KL5hi7+DVmbAKVSNlQFMItMnSKgvaz/47ys2KsFuAyCH9JhMlgZvuIJ/K6TU5stMV
	 /anIY60TjEGMbSchASh79z3FWZm/yFqqr39wyOX2irQHsfvVJvQVFWknBtUVoDNys4
	 70MCPF8f5B31LWEtx+BgVd6vg4XS3nFYZGluvUjYctL4HB2nlKABjHnFAxg2W06QUH
	 yrSH9XobmRGoUEZP/TQ9NcbyFY6KNeFOQ2DLLCOgoRci1QLbIFcgNMOPRswWz0HY8d
	 YqcIvgFbQHQOqQbf8Q25huwNK7W/4sVwl/h6IAGAuTE7Lr+AaeJehgsI7Pkjn9T+l7
	 Hl8FpEapURUpA==
Date: Fri, 28 Jun 2024 11:59:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: i2c-host-fixes for v6.10-rc6
Message-ID: <a6byafqkslh6wjsgfotnv3ibkax7gpuvlalf5bgtzc46imy6uu@6b2fsl4d4hh2>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

thanks for pinging me on Arnd's patch. You'll find it in this
pull request.

Thanks,
Andi

The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.10-rc6

for you to fetch changes up to 103458874baca0bbc8ae0b66d50201d5faa8c17b:

  i2c: viai2c: turn common code into a proper module (2024-06-26 16:07:21 +0200)

----------------------------------------------------------------
Fixed a build error following the major refactoring involving the
VIA-I2C modules. Originally, the code was split to group together
parts that would be used by different drivers. This caused build
issues when two modules linked to the same code.

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: viai2c: turn common code into a proper module

 drivers/i2c/busses/Makefile             |   6 ++----
 drivers/i2c/busses/i2c-viai2c-common.c  |  71 +++++++++--------------------------------------------------------------
 drivers/i2c/busses/i2c-viai2c-common.h  |   2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c     |  36 ++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 113 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------
 5 files changed, 139 insertions(+), 89 deletions(-)

