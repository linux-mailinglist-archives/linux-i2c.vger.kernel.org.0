Return-Path: <linux-i2c+bounces-12040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F07B126DE
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 00:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4664A17E9AF
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 22:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8950F25A334;
	Fri, 25 Jul 2025 22:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq+Y4gsV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467094A3C;
	Fri, 25 Jul 2025 22:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753482503; cv=none; b=sfzy4ulapQ5UBZtyS7j03t4vf0AorQhRtMS4qafPYZYTfpsAkbQX8iRvyPr4lIeyN7cDfS+eIsNku8w+DOayCTLQJ5BZFl2aa87+WS03CwzqDijF6mGxnmxBwxhoRxPP05eslk5j67Nrv1PvctLpqjAU/O1igdu4MK6qDoTIdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753482503; c=relaxed/simple;
	bh=xK3n95JmpEgrZpWD5H95OfXxr5U1R5rTH1HYcNCsuN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwtLQ7bS70r+F47tA1WPjB0rhXFpEGI1XtliNEWIk5BNW6JbVgpjXoE2Wi9LjNmHzYDKDjPFNtzIatFBu2GaT0/cuS5tNloZsG+0ty/zTrwKYgKPhdPxSV5ceqqDe1e6ItuTxEbEqXnyrgKdeSnIscMjO5RslHy/DQ3/mKqPc0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bq+Y4gsV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4220FC4CEEF;
	Fri, 25 Jul 2025 22:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753482502;
	bh=xK3n95JmpEgrZpWD5H95OfXxr5U1R5rTH1HYcNCsuN0=;
	h=Date:From:To:Cc:Subject:From;
	b=Bq+Y4gsVz92QuvUHpwocS5yxaBNSE5Wr4CZ6e5y7Jf60WZpPwiIatNm9oPYaF5c/h
	 nixSLHrxCv2DuxkIBGaFFPYWQfpldp0zJP60BP+m3CRaBbVXXiTfQRX0XUPInpeBTE
	 gn2p9itR9iyyGbmlnJQH+yUe/5BZwyAyWgbwffM8x8+HYC5BCbOwqX7yFBzsAAAQ3Q
	 afQGB04fjmXfAtlo5nxvQXoghHBWtgC9YYhezknIhIJFSHhL2uzy8XqY2BHxi/C4HE
	 c9RsP3EpZYB4WmA3kbKtb4PYfTxNH+jvyOVS6thHnrfyCfTh3GQ/zSIUuKnCaBirsc
	 tSc85v19We2ZQ==
Date: Sat, 26 Jul 2025 00:28:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.17, part 1
Message-ID: <alsos2omteyu3d7ao3edavnd2dg2udpjmjok3gcdy65tgocw6q@o6fjrxd3xhsa>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

This is a rather short pull request, likely due to the holiday
season and my own time off.

I plan to send part 2 next week. Some patches depend on the
fixes already sent and tagged as i2c-host-fixes-6.16-rc8[*].
Nevertheless, those patches are already in i2c/i2c-host-next.

I am aware that a few patches are missing from this pull
request. Some were skipped due to lack of time, but not many.
Others are part of larger series that have not yet been properly
reviewed by other subsystems. You pointed out a few of them
yourself.

It has happened before that such series were left hanging, and I
prefer to wait rather than merge something that lacks full
support for generic hardware.

For part 2, I also planned to include the most trivial ones that
were temporarily set aside.

Thanks for reading through this longer message. I wish you a
great weekend,
Andi

[*]https://lore.kernel.org/linux-i2c/ql4g7pi5fk2zedld3d4oq43iqk75pgqvshpmu7awj4et4tf6pg@q4z22o2icwip/T/#u

The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.17-pt1

for you to fetch changes up to 85b9dd6e90b92f5cb7c47991421ceb4925ba2a87:

  i2c: lpi2c: implement xfer_atomic callback (2025-07-25 23:15:39 +0200)

----------------------------------------------------------------
i2c-host for v6.17, part 1

Cleanups and refactorings:
- lpi2c, riic, st, stm32f7: general improvements
- riic: support more flexible IRQ configurations
- tegra: fix documentation

Improvements:
- lpi2c: improve register polling and add atomic transfer
- imx: use guarded spinlocks

New hardware support:
- Samsung Exynos 2200
- Renesas RZ/T2H (R9A09G077), RZ/N2H (R9A09G087)

DT binding:
- rk3x: enable power domains
- nxp: support clock property

----------------------------------------------------------------
Emanuele Ghidoli (2):
      i2c: lpi2c: use readl_poll_timeout() for register polling
      i2c: lpi2c: implement xfer_atomic callback

Frank Li (1):
      dt-bindings: i2c: nxp,pnx-i2c: allow clocks property

Hans Zhang (1):
      i2c: tegra: Add missing kernel-doc for dma_dev member

Ivaylo Ivanov (1):
      dt-bindings: i2c: exynos5: add samsung,exynos2200-hsi2c compatible

Jonas Karlman (1):
      dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain

Lad Prabhakar (5):
      dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to the end
      dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support
      i2c: riic: Pass IRQ desc array as part of OF data
      i2c: riic: Move generic compatible string to end of array
      i2c: riic: Add support for RZ/T2H SoC

Qianfeng Rong (1):
      i2c: st: Use min() to improve code

Troy Mitchell (1):
      i2c: imx: use guard to take spinlock

Yuesong Li (1):
      i2c: lpi2c: convert to use secs_to_jiffies()

Yumeng Fang (1):
      i2c: stm32f7: Use str_on_off() helper

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml  |   1 +
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml     |   3 ++
 Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml  |   3 ++
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 105 ++++++++++++++++++++++++++++++++++++++++--------------------
 drivers/i2c/busses/i2c-imx-lpi2c.c                      | 256 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------
 drivers/i2c/busses/i2c-imx.c                            |  37 ++++++++++------------
 drivers/i2c/busses/i2c-riic.c                           |  54 ++++++++++++++++++++++++++-----
 drivers/i2c/busses/i2c-st.c                             |  19 ++++-------
 drivers/i2c/busses/i2c-stm32f7.c                        |   3 +-
 drivers/i2c/busses/i2c-tegra.c                          |   1 +
 10 files changed, 322 insertions(+), 160 deletions(-)

