Return-Path: <linux-i2c+bounces-1946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C886155B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 16:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18FE31C23747
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 15:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D5D81ADF;
	Fri, 23 Feb 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTWOJknj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24DC7AE45;
	Fri, 23 Feb 2024 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708701439; cv=none; b=jAnxuUBerDfYldL09+SVQV9wV28GiNPgWQkb3bURaKxDOjKkvTjqGDIyRqkH5V3ovYXny2/IshYLgDqM8ooMWmXkOA+4Y435wsgHznYmZmQEOsjsTw9XCV5wX7ehAB9oLE1Z4iS7Tf3flD7Jfx50W/BYD2SmASV30W5biG7qIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708701439; c=relaxed/simple;
	bh=OV1fSw39yRcqVKZ2KQKzAQRhjYBZ7zpGKGfHCvDO4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amDC+MlnIm+XyvC/e2HZYNBj+Itj6CdOpTqemJ7WHYJ51P2Mf6SA1KfnIxMcBfjLOLoEzMYgOzMCsh1LN6EKYlL6ENoKInJRp37vOVoVNLlPQHiyVBSH6d7x15FBja0GrmlIpipHG0xKuq2WHuStLFP/HHFJlBdTB2qyzuCWmKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTWOJknj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF072C433F1;
	Fri, 23 Feb 2024 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708701438;
	bh=OV1fSw39yRcqVKZ2KQKzAQRhjYBZ7zpGKGfHCvDO4b0=;
	h=Date:From:To:Cc:Subject:From;
	b=TTWOJknjoVLYywSERHNKUPukDJoLHL34cJ2sF+qvRpDIZ+ToTEpxjl08OOqYMGYko
	 PHZQ/8c5pTnw2NTlVhPSKFRyf2HHr8nLswbbrfo20UkiiDQ/zlugmU/Vc+zHHbZ2MJ
	 j1LiSNAQXaMnsEdZ2qMWngvtvmFaIpaGafVFlHhBsUjGELrcyKAjHsL+Q0NBoIVAiB
	 Ib6StbZyt9IdL2j7m+y32PxCDcRf4g5FfEahXe/kogA3Wcgxi+BqqPxLeMHX3I7VzC
	 3FdFr+gsc9prtEMBZziQj8Q48BmpzZgD7WKKO0xgE5fBrPzy5UO3FedyX/AHRv5NfP
	 69WCrtS38D6WA==
Date: Fri, 23 Feb 2024 16:17:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] i2c-host fixes for v6.8-rc6
Message-ID: <faucbv2cbz3q73il5x3j2zeak2nvavjjoq32ipo62lpy7tomjj@7fomrhip3pwu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

In this pull request a last-minute fix for which I received
positive tests from the testbot.

Thanks!
Andi

The following changes since commit eb9f7f654f251b57db310eab90bbae5876898ae3:

  i2c: i801: Fix block process call transactions (2024-02-14 22:15:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.8-rc6

for you to fetch changes up to cf8281b1aeab93a03c87033a741075c39ace80d4:

  i2c: imx: when being a target, mark the last read as processed (2024-02-22 09:02:16 +0100)

----------------------------------------------------------------
One fix in i2c-imx marks the last read as 'processed' to ensure
proper indexing of the transfers.

----------------------------------------------------------------
Corey Minyard (1):
      i2c: imx: when being a target, mark the last read as processed

 drivers/i2c/busses/i2c-imx.c | 5 +++++
 1 file changed, 5 insertions(+)

