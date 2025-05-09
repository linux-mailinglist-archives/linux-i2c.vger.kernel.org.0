Return-Path: <linux-i2c+bounces-10914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C318AB1303
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 14:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C88341BC5FE9
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 12:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268CE274674;
	Fri,  9 May 2025 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRU+vAUp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24192343AB;
	Fri,  9 May 2025 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792546; cv=none; b=N73qgcf4mmb7cHhmHm8dLjRb/nyR347YbWfBuwRd9t+XUaDYD68adlnUUdzN71ycSBvZPFxT11QQBS92b+Fio3BSXH4FJf3t8bB3FYUQfGLD/wTcik82NGcW6F0CpLPhxBH74Sgp/9xn5OD5k9Sxzd4Cxi7b87Co+LvLmpSVxzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792546; c=relaxed/simple;
	bh=NBf7Ep11r8LuZNqvK0OZpYXHgzwBOWYJ9LT4b/29VAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCLmmNafaemT98B/faKQTts5QE1jR8USfqgunS7kcvBradZb57+iu3dwGcH0z8xyZtO2jrSmRGO4mDiT/IoH5ZV2101kmC++icKpLoHVbhwmmInzUxT6YF0wn0YyETuSWSjCJKxpYp2PCJfFvCVp5CdR3+cgYXJffHhDDoS7AgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRU+vAUp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96946C4CEE4;
	Fri,  9 May 2025 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746792545;
	bh=NBf7Ep11r8LuZNqvK0OZpYXHgzwBOWYJ9LT4b/29VAM=;
	h=Date:From:To:Cc:Subject:From;
	b=hRU+vAUpjNWR6HXOnMhV50yURXCS5ni7G7i+hIyRYaFay5YVAn2W7rzPzsjTuHSCy
	 HGrdmG54uAdmSmJ4tspfiEYVx+pWeO8RQ7dtSqP90bCir6JvZP1XasThBd3JGmpp5Y
	 xBobYICKtxWJ/XP6SC/BASnW74ELcEwkuchDYcf2COztJ0pesYrHf6HJOu9ndAObQN
	 mOddgEJ4x2xTkafgc3gJLpIoKGh830mzjf5rawLh0IO1jy01GsgFFGmElu4GrQp++8
	 oNfid83sc8MeGtSFc2tRafIjb9AMMenirW3MtFvlRZEXMQ9NG7cLOLNy7A8K4i+Wly
	 4yznKqAJ+L7fQ==
Date: Fri, 9 May 2025 14:09:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.15-rc6
Message-ID: <xpvrz2zt7jm7k56vu6txgyorg73yrfag2omwyqbkpqdkxyoikl@rh5wcugtqwhf>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Two patches in this pull request. The first one updates the
MAINTAINERS file to remove Seth from the ISMT entry. His email
bounces, and he no longer works at Intel. I had a chat with him
before he left, and he did not intend to continue in the role.

The second patch is a minor fix, barely worth a Fixes tag, but
we decided to include it since it addresses a warning introduced
in the latest merge window. We preferred to keep the patch and
its fix in the same release cycle.

That said, I hope to see you soon, and in the meantime I wish
you a great weekend.

Andi

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.15-rc6

for you to fetch changes up to 10aba126bc86904e2f5afeaa26354e877a593c95:

  MAINTAINERS: Remove entry for Seth Heasley (2025-05-08 12:08:56 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.15-rc6

- omap: use correct function to read from device tree
- MAINTAINERS: remove Seth from ISMT maintainership

----------------------------------------------------------------
Andi Shyti (1):
      MAINTAINERS: Remove entry for Seth Heasley

Johan Hovold (1):
      i2c: omap: fix deprecated of_property_read_bool() use

 MAINTAINERS                   | 1 -
 drivers/i2c/busses/i2c-omap.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

