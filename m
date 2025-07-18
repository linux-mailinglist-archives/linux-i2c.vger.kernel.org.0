Return-Path: <linux-i2c+bounces-11967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81861B0A812
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 17:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EE163B64BB
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 15:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45CA2E54DD;
	Fri, 18 Jul 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnNlQPtK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE526ADD;
	Fri, 18 Jul 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752854392; cv=none; b=n0D7pz6+tSNAqB3gZkt240P7spmxpuUzx5JZTtx+JWERlvbryuF5cfWKMhlU54ykF2qimILPNYAcGbXnmIiMfXtk+MjNnM2asrhaG+EYbm31+m9z7LsDaLXl6m4Hecqt64aOOFxGn0QYqLt4g1z4P+tJ3mrw5UAYssOBpErOq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752854392; c=relaxed/simple;
	bh=P4hev8OlYY0l7LuAM/+Fw7Y+n28sL4Q39Z9vhY1xmq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCS8PHqiTpoQ8L3aGtJv8iHNbpJPGsqoLaJR7ZrVoQpjkXAQPuRfgJpz3+SSov8WKpUurQS1irn8YazclSzwBV7psCpbdrXlUBWhhIulEjX1w3JftSIwPsn41WWIPubjTr0RYIYi4k2U+JIDzVYvyu/hmVswbG0rKvN8mfTO4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnNlQPtK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A34C4CEEB;
	Fri, 18 Jul 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752854391;
	bh=P4hev8OlYY0l7LuAM/+Fw7Y+n28sL4Q39Z9vhY1xmq8=;
	h=Date:From:To:Cc:Subject:From;
	b=JnNlQPtKr5vNgAnqqAZn8qe9w+d0v2EGt8pYuY/QlPc6fWsrZMrXD8iDhm21GFU2j
	 WPfLgHwBqPQMULxAZIsLcU7XEz/NmjJa/LviMGiQzUmTx2BLc+xqpRll/iKf75ZD9F
	 xtr6HP18MPPMzEsUs2HgflhfKQLMpqRTFUWHFrQ7XYgSZPOaNxQF0fy7OmLRDF4P2Q
	 auzUrDbOPpclU7VKA5QD6OCx82Wqvs6tYEX/Mg4qccUNR4MUhTIxg0U2YXQazq2nfu
	 EuLgK9tApeASInxfXf2JqWQOA4jQ+Wlrz9c6zinkfNxMH8lkD/pEMkn9SCcj20o+7K
	 GE61pXqD4d9bg==
Date: Fri, 18 Jul 2025 17:59:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc7
Message-ID: <2lbfr4r4icozrhnh5vgitzc6dylnxvh7x6fkdytacsy3oncsfe@7usj2u6nbk45>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

in this pull request you have included also the previous week's
patches. Everything is rebased on top of rc6.

I wish you a great weekend,
Andi

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc7

for you to fetch changes up to c39101198e733cacb03fbaa6fcefa15b9c04361c:

  i2c: qup: jump out of the loop in case of timeout (2025-07-17 00:57:13 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.16-rc7

- omap: add missing error check and fix PM disable in probe
  failure path
- qup: avoid potential hang when waiting for bus idle
- stm32: unmap DMA buffer on xfer failure and fix device
  reference
- tegra: improve ACPI reset error handling
- virtio: use interruptible wait to prevent hang during transfer

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Fix reset error handling with ACPI

Christophe JAILLET (2):
      i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
      i2c: omap: Fix an error handling path in omap_i2c_probe()

Clément Le Goffic (2):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer

Viresh Kumar (1):
      i2c: virtio: Avoid hang by using interruptible completion wait

Yang Xiwen (1):
      i2c: qup: jump out of the loop in case of timeout

 drivers/i2c/busses/i2c-omap.c    |  7 +++++--
 drivers/i2c/busses/i2c-qup.c     |  4 +++-
 drivers/i2c/busses/i2c-stm32.c   |  8 +++-----
 drivers/i2c/busses/i2c-stm32f7.c | 24 +++++++++---------------
 drivers/i2c/busses/i2c-tegra.c   | 24 +-----------------------
 drivers/i2c/busses/i2c-virtio.c  | 15 ++++++++-------
 6 files changed, 29 insertions(+), 53 deletions(-)

