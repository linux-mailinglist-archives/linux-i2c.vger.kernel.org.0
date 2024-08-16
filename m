Return-Path: <linux-i2c+bounces-5450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA609544A1
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 10:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B4AB234E3
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 08:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9CA139566;
	Fri, 16 Aug 2024 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/kbfw7T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8F1D69E;
	Fri, 16 Aug 2024 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797690; cv=none; b=S+Kw4yofI8fSz9UOMBGGqZFNRzdUOCOfMhYMOP3tdMCS4R2+qDjygXX11cq/xJw6wqG85VhChF/JT3yCgCU//0KT3wYbDKFN+azhgE38B70bG21LEqwSitMhTajRExOF7O6s5lA6gD0Zmm/ZVCug5krdIYuYA0WRmLxurDC3mcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797690; c=relaxed/simple;
	bh=VvfsnWEeHu7KFH88viVTvZMFM3kwGB/yBLxn8smvq9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVL8FEgVJDChoMCHLlGTseVsIJkZpcjpnIjoOtIWzp7BP+l5le4zcSegc+UEN6lFm8Dkb+xV5KdFJJO4RSanZMv9IRJxEKW1zYCUOKlIq9qUajYqMnxowyco9A52OAIcQcQKVzosVVkjP3fplo4OYVmwS9hYyPdYwTnWpANnQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/kbfw7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C011C32782;
	Fri, 16 Aug 2024 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723797690;
	bh=VvfsnWEeHu7KFH88viVTvZMFM3kwGB/yBLxn8smvq9w=;
	h=Date:From:To:Cc:Subject:From;
	b=k/kbfw7TJ/e8RyHsvUEzeZFSlL7YyfpDY1HitsRUffR868b2q0MUc5Wyro+xslrBW
	 xBV//cSq/UyHJROivoXA8RViToVPJuoNUJ7K6o4GbKz1rU1EzP57//cQ0EkBjzImC7
	 Vc9FDq397AKj6u3D2I1ampzG1DRPP9OLzNffVW6x3ijccl43dsq3iV4T/AIMrnhPmZ
	 Qx2osnMaODBwTXTZDy4rdsPZp0FioOmXfv9PXpMkxszXap352fgcb3U2+O0FrezgY7
	 v47KHX/8ySrrcdJRd5DxE9/pSU1pe7O2mgdKIutMfU+vrh9E9J68Png6ZpZEhfm3F0
	 zfSpQ3a8wIBMg==
Date: Fri, 16 Aug 2024 09:41:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Breno Leitao <leitao@debian.org>
Subject: [GIT PULL] i2c-host-fixes for v6.11-rc4
Message-ID: <hai5dhvjdh6qrw6hu5smc5kykqnh42mbxjyr4y7odgtorbridf@idkhasdrmoak>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

This pull request includes two fixes related to the runtime PM
functions, which are described in the tag description.

Breno's fix will require additional support when backported to
stable kernels.

My fix addresses an issue that was missed by Gaosheng in last
week's patches and overlooked in my review. With this change, the
exit path of the runtime_resume() function for the Qualcomm
controller should fine (there's still a minor cleanup needed,
which will be handled in a different branch).

As always, I wish you a great weekend!
Andi

The following changes since commit 7c626ce4bae1ac14f60076d00eafe71af30450ba:

  Linux 6.11-rc3 (2024-08-11 14:27:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.11-rc4

for you to fetch changes up to 14d069d92951a3e150c0a81f2ca3b93e54da913b:

  i2c: tegra: Do not mark ACPI devices as irq safe (2024-08-15 00:22:28 +0200)

----------------------------------------------------------------
Two fixes in this update:

Tegra I2C Controller: Addresses a potential double-locking issue
during probe. ACPI devices are not IRQ-safe when invoking runtime
suspend and resume functions, so the irq_safe flag should not be
set.

Qualcomm GENI I2C Controller: Fixes an oversight in the exit path
of the runtime_resume() function, which was missed in the
previous release.

----------------------------------------------------------------
Andi Shyti (1):
      i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume

Breno Leitao (1):
      i2c: tegra: Do not mark ACPI devices as irq safe

 drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
 drivers/i2c/busses/i2c-tegra.c     | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

