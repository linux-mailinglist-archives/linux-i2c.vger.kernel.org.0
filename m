Return-Path: <linux-i2c+bounces-12039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE60B12260
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 18:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC0D1CC3C65
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 16:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250612EE96D;
	Fri, 25 Jul 2025 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkrBy771"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA181F462D;
	Fri, 25 Jul 2025 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462522; cv=none; b=eKa+LLswzFkUKYxgc5VYaVziWGqxYtA8c0Rj+yRG3ph5XwNpIFvXPaQ9MwuLnLQ/ayhu4mGfsHEuCOCZNz5JzqkPdkEaSpUYKlS4cTigMvMDFm8pNtgQkG10noM1axt8pZI91+sZ2MVCkXS84rNesq8qe4uh3bTqX8bffp3TXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462522; c=relaxed/simple;
	bh=toN6jesenxmP3K42T/age7Y7FSIrv6mc/0kCiwf9N9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k+MNjL8jGlpR9U/fA1rgNS3mlRteIpx0j8wcKxEgZD+ceX2Ay3rDT46WSD68faRHKReZNnRJxM3GP4piez6uSWaQ1MEBGrpGsrlthm7vflQbew/Lq79YSPm2R8Gturm1dgLFVAh/QLlL+e5P9nbYc/D/X+l/FQmebvbuDwv4TQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkrBy771; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AE8C4CEF4;
	Fri, 25 Jul 2025 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753462522;
	bh=toN6jesenxmP3K42T/age7Y7FSIrv6mc/0kCiwf9N9o=;
	h=Date:From:To:Cc:Subject:From;
	b=lkrBy7719N/7KsA2qsX3CpH6EhfheRB6+jqaJgXemf8L2jPmHM2TUWAvvQmYErONb
	 iQss3sApXVlGCLnfzHwCTvdJJz618wlUkp7u8uS0XzVsizj6WU3Bc2imWnxXgGsvok
	 9LampGHOZWUYaCTZ9A9W9KHnevxTMD4ukN71bvgii+RUw4vpf6jEo+QrjR8ZFrItAc
	 iHCWO5bYva2KTiuMpx/FAwY/8PgFPtz4fC3VEpKx3nN18LhehABb3mownThiDH2Qpg
	 /EtiuuoyQXXjlYj/CHq7B2p6yy7+k8A5kpSVON7PZQOOGp6Yeq8BXEyV16AhRPguLI
	 +/kT/4hQ2UZdw==
Date: Fri, 25 Jul 2025 18:55:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc8
Message-ID: <ql4g7pi5fk2zedld3d4oq43iqk75pgqvshpmu7awj4et4tf6pg@q4z22o2icwip>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Here is last week's pull request. No new fixes have been sent
over the past few days.

Everything is rebased on top of rc7.

See you later for the merge window pull request.

Thanks,
Andi

The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc8

for you to fetch changes up to a7982a14b3012527a9583d12525cd0dc9f8d8934:

  i2c: qup: jump out of the loop in case of timeout (2025-07-24 00:38:01 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.16-rc8

qup: avoid potential hang when waiting for bus idle
tegra: improve ACPI reset error handling
virtio: use interruptible wait to prevent hang during transfer

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Fix reset error handling with ACPI

Viresh Kumar (1):
      i2c: virtio: Avoid hang by using interruptible completion wait

Yang Xiwen (1):
      i2c: qup: jump out of the loop in case of timeout

 drivers/i2c/busses/i2c-qup.c    |  4 +++-
 drivers/i2c/busses/i2c-tegra.c  | 24 +-----------------------
 drivers/i2c/busses/i2c-virtio.c | 15 ++++++++-------
 3 files changed, 12 insertions(+), 31 deletions(-)

