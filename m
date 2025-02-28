Return-Path: <linux-i2c+bounces-9643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B1A49964
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 13:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46E03B7D03
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 12:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ED926A1B8;
	Fri, 28 Feb 2025 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fid5K1TT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A826738F;
	Fri, 28 Feb 2025 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746136; cv=none; b=ghQjlw9xSZvyatI7VgQuqxOzRSO7nXieCSyzvQeTThQ2o3RBsLaKkkIr5P74m9aU4QODvTAMcn6VEaZYi+4KPQt7aMiYyLhWglfWJp0MlALXcT0OUul3W+88Hqju1kAVqgrmILow/8VgrMRCRNwMFVHa2KrRcVWJbu5+kqacYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746136; c=relaxed/simple;
	bh=0m5SRDx+Umfm4dSy++eYAHb527inu2WKRLUwsZjsf9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/SW4+7wWKmJJKMhjymMnHojPv3DMhZYsuM28k00ZcNPHVqkQ5p+PSAGDT+Nz/f2sNxQJbIPCnv48AXgdq3Wi6y9eXEE1JO7h2Rl8cAcmxkDF/XCLKDSPs5AkLGOhMyrp0iyIT8bUdm2tTImJvldrHqIklAEOVFxq6p55h2GZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fid5K1TT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C89C4CED6;
	Fri, 28 Feb 2025 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740746135;
	bh=0m5SRDx+Umfm4dSy++eYAHb527inu2WKRLUwsZjsf9E=;
	h=Date:From:To:Cc:Subject:From;
	b=Fid5K1TT96Tqnjq5wa+HJEyvtF4UZdSzHcFaENq27D1uCuUNTvCmPzO1zsUB0VlYx
	 f0fpEW+xj6TE34h4v/Izwe7cvcZIl0yzLP4685lQgZXv9wDqkwTTPm1gYhIv7hrvcU
	 c+p6FE/74VWL6HslB4VFT0igYs/867qmYWR69eyllncqsGlqb2PS6h0xeGp1gIS3G7
	 Ntre3TUl/bmrSh1C7Tlvv033Rw6DfbLhvapuPjCGCUjOUvKSVegbsTs1iRibwgmVll
	 idjFFLVgVJOIIC+6Z2NksythQt2cz2+rsRoAJfz4Y0FVkvcxky11n32ONoIsU7hbTR
	 omULsXumB7G7g==
Date: Fri, 28 Feb 2025 13:35:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.14-rc5
Message-ID: <de3dc6brdsrje7p2lnahsgymlmivmzsgocfb3mt2wwvvml3tla@jyo4qtxkoi2n>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

three fixes for this week, all hardware-specific. I'm glad to
have received support from reviewers and maintainers in ensuring
the correctness of the hardware interaction.

I wish you a great weekend,
Andi

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.14-rc5

for you to fetch changes up to 9f3c507cb44498067c980674139bcad56e582ee6:

  i2c: amd-asf: Fix EOI register write to enable successive interrupts (2025-02-26 23:28:41 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.14-rc5

- npcm fixes interrupt initialization sequence.
- ls2x fixes frequency setting.
- amd-asf re-enables interrupts properly at irq handler's exit.

----------------------------------------------------------------
Binbin Zhou (1):
      i2c: ls2x: Fix frequency division register access

Shyam Sundar S K (1):
      i2c: amd-asf: Fix EOI register write to enable successive interrupts

Tyrone Ting (1):
      i2c: npcm: disable interrupt enable bit before devm_request_irq

 drivers/i2c/busses/i2c-amd-asf-plat.c |  1 +
 drivers/i2c/busses/i2c-ls2x.c         | 16 ++++++++++++----
 drivers/i2c/busses/i2c-npcm7xx.c      |  7 +++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

