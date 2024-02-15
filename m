Return-Path: <linux-i2c+bounces-1768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C9F856DCF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 20:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE2111F271D3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 19:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F2713A25C;
	Thu, 15 Feb 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifH4v4Cu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562E13A249;
	Thu, 15 Feb 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708025672; cv=none; b=aZsJ/079jAjk1UOnBjat8Z0RXZkDfat4NjujjUy85z9HuGrFjxByosWCywiWHSPaPQ6hymzoTenY/4pnRi8rTPD/0egCKw8FoQcqpUWBWHzSjeleSJrCITQrJVewWBUhN+HqMVN1pmV14WXwe2dpriY1fO5W7v4kxbscFTdMRaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708025672; c=relaxed/simple;
	bh=0xDmjRzOIFe1GDF6uU0h8F9gRo4dQvRi6OpVT2WbXoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1JA68yFOaRm57Lzum42/gT4aV3uccznYMpx1+ZQDdalq5PrVUrBZl22oUaIIAQO2hHeo+xPfVfM9ffhJrxDIwkUvBhszk2PKwTUuuvX8auumKQeed6/BUKecILep88OWrJkuTjF4jpvIdVzp+nIUNNUFJftEMuduRy6NsTxZWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifH4v4Cu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56592C433C7;
	Thu, 15 Feb 2024 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708025672;
	bh=0xDmjRzOIFe1GDF6uU0h8F9gRo4dQvRi6OpVT2WbXoc=;
	h=Date:From:To:Cc:Subject:From;
	b=ifH4v4CuOKoHeSu/KbrmZyJJSKHAp0/ypLuYrTQ+s8V5B6NVQVLvvWxUVhT6xqNBH
	 5ETEDqAFSrjnQHN4872ksk1llIV7eJW+v0GFPvZpn/vGLzqzES2UdzN8HzsgzGRD8e
	 r1moDpqIxtzllc0aruFZhGFDnLYUi+E7hqhEuoytzf0t0/Ipr0PFktEfbwurq04cJ3
	 lmidBin+tzBTqhjzuK34M1EH+qDaph3XZJ7DT0tlsnBtjFsjg3XuuXJagZnLrDvsGA
	 pSo5zNZjV4pLSZTtOX+T9KeiKJ4ow/8QlEp67JFYKOf42kSKOl/XFaHBLJLLI8zyDl
	 e4iTc4+1wpBhg==
Date: Thu, 15 Feb 2024 20:34:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host fixes for v6.8-rc5
Message-ID: <6utwghfmlmpaasdtoel5faalrrnfhyg3iupeditg4w7bgd7g35@cxplq2kipgfb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

This week, I'm submitting three fixes: two address hardware
issues with the i801 and qcom-gen devices, and the third resolves
a compilation error that occurs when including both pasemi and
apple i2c in compile tests on PowerPC.

Thanks,
Andi

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.8-rc5

for you to fetch changes up to eb9f7f654f251b57db310eab90bbae5876898ae3:

  i2c: i801: Fix block process call transactions (2024-02-14 22:15:38 +0100)

----------------------------------------------------------------
Three fixes are included here. Two are strictly hardware-related
for the i801 and qcom-geni devices. Meanwhile, a fix from Arnd
addresses a compilation error encountered during compile test on
powerpc.

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: pasemi: split driver into two separate modules

Jean Delvare (1):
      i2c: i801: Fix block process call transactions

Viken Dadhaniya (1):
      i2c: i2c-qcom-geni: Correct I2C TRE sequence

 drivers/i2c/busses/Makefile          |  6 ++----
 drivers/i2c/busses/i2c-i801.c        |  4 ++--
 drivers/i2c/busses/i2c-pasemi-core.c |  6 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c   | 14 +++++++-------
 4 files changed, 17 insertions(+), 13 deletions(-)

