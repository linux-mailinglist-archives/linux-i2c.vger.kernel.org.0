Return-Path: <linux-i2c+bounces-4969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9346F930449
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 09:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34BDF1F226C3
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414BF3AC2B;
	Sat, 13 Jul 2024 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUjYSrb/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6228689;
	Sat, 13 Jul 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720856327; cv=none; b=OBDL27fhqEdexqiFKxaik+f+Ed89Tp5rYN9aBS1UA9dARMAJ2KhUKCVv7UI7lwtXHcJXAWD9+UKPfUpu32JrlbvSFlDGSAsDxe6f21vIswom2HZ22ywtQlSxUWUMfacq5A7uOhyrDAV8GiGLoV95UZKr/dMN/avT5mRcOEqZm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720856327; c=relaxed/simple;
	bh=b3qZup8tC7AcRV250LTAVM9HeDL72SmI2A+S9+twZ1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXhV10cS1HLxsFWu7AoGUx5SYGSiRwspPEFVB+tVs3cNsqI906zlTYgjaKSmeqJZ/blPD9S1JyxPlABwx6QyHePMDkn0qBaue1xBrbAAJK4SuhUXIMu16ceKDf4LFMhmt4VaX3DXT/PH3SjoD326GGa0drH32m4PGW460W3Bysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUjYSrb/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94D7C32781;
	Sat, 13 Jul 2024 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720856326;
	bh=b3qZup8tC7AcRV250LTAVM9HeDL72SmI2A+S9+twZ1I=;
	h=Date:From:To:Cc:Subject:From;
	b=QUjYSrb/Mey7bmU5mIFaWhQj5dMbZzigFyfS8uyVqp6Ri2uIB6t96Vyo7UIvOegPN
	 hgYBw/O9wlQu/A3JzPVgrTytVw8RGVfZRuBMRpzbDz5oItu9CUrEA7l2DHHrtT7bvE
	 K8DR6exuUnFiqUHNDWZFkivh0Wd/yc9M4zKF6JGl9fiUftdUZFLASGAEp1FnzUd75s
	 Zn0YaFQi2pEqEBCklwOpDOe+LPEY3UUuLnkwmkbcZpU9S8qGvGftcOOQzW9Q94fSQf
	 zZnaZnJDWe9tCxJ0tk288gPHd5K5gypa88yjeeiisxHmd5C8j9hTmDX5wz+AOlMiOv
	 DIwRBeHMzbgUQ==
Date: Sat, 13 Jul 2024 09:38:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.10-rc8
Message-ID: <jxy6dh7o3adkh7bdwakiukrlnb3i3gakl3txx3eijvybdnj2qg@irq36xe2cdwn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Three fixes from you in this pull request, you definitely don't
need an introduction to them :-)

Thanks,
Andi

The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.10-rc8

for you to fetch changes up to ea5ea84c9d3570dc06e8fc5ee2273eaa584aa3ac:

  i2c: rcar: ensure Gen3+ reset does not disturb local targets (2024-07-12 01:45:08 +0200)

----------------------------------------------------------------
This tag includes three fixes for the Renesas R-Car driver:

 1. Ensures the device is in a known state after probing.
 2. Allows clearing the NO_RXDMA flag after a reset.
 3. Forces a reset before any transfer on Gen3+ platforms to
    prevent disruption of the configuration during parallel
    transfers.

----------------------------------------------------------------
Wolfram Sang (3):
      i2c: rcar: bring hardware to known state when probing
      i2c: rcar: clear NO_RXDMA flag after resetting
      i2c: rcar: ensure Gen3+ reset does not disturb local targets

 drivers/i2c/busses/i2c-rcar.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

