Return-Path: <linux-i2c+bounces-6683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E42977C91
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 11:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0BD287EFE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20071D6DB1;
	Fri, 13 Sep 2024 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tA657A3T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4E1C1743;
	Fri, 13 Sep 2024 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726221222; cv=none; b=nKMwUy6q42t9fDx6BqXL8dVcd/Lt7RRWLkBfTZAK1CRP16Q6Wu5hQ4yZ2G62IMc8oS7sWhmPYlMp974cfSEIMYjjxeLG/6Uyz/TGNwlvjdya3oUPyS1ztlT/7+Iv9UfJWueyLU1OdQeoojh2UXZYwspmhmpTmh5K9h/u1L57AzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726221222; c=relaxed/simple;
	bh=cuzH8Hj+L953K1sA3kRypWenka/IYKY+pc1YGlB57Po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbROzq41AvY8wq6pCY7fPrgKfcreiuDIo+98hhi8seDNJ2KoboW1vSstkbTQ4fV85HDwj1BEjzg0vgktDAaDpaXUOVlhu7u8d7Vfazsl4KHE1y7WTr4wt9N0zE1NSAGCksA5uakI9TprtpL/7+bcNlsP5oRoSJDbgzEocb9eMMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tA657A3T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C9FC4CEC0;
	Fri, 13 Sep 2024 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726221222;
	bh=cuzH8Hj+L953K1sA3kRypWenka/IYKY+pc1YGlB57Po=;
	h=Date:From:To:Cc:Subject:From;
	b=tA657A3TOzVEs/hHx7YtaywjORoprAlIsoPgXZ+UAwOBqZ83rIdYN+wpNxXUhpyNS
	 /zZfeEW/LBbocS4YyAxVhB4vCP2DewbPvn8AFlRFFAZQ+JXKp2W5b0wk8agMqohvL+
	 oW6NBLdA67qXmhvMBGGdTyrv2f925ElMKE6prSehkFtBruld7n6njy4YfCvYs0UXAi
	 zNTJr0CqAvMVZzk5uNPC1lgdMhZ5L1HJVWthRHeLasFrlwNU6fTmLHw7PZf0HFvdmz
	 Txr0SjFa86sJaNYfdG32t/PeFWQCyWX9xyimtXMQvLiDySFIpwtU7ZK/5Z/8mTLmiy
	 92jGdpVcIog6w==
Date: Fri, 13 Sep 2024 11:53:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.11-rc8
Message-ID: <2itivkfhp7s2dzmihtlo67w53wpdiukmmrcf625isex5rrtu23@4naen2rzimxw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

Here’s the fixes pull request. It’s funny, after a few weeks with
no fixes, right at the merge window, I’m sending in five!

I’ve also brought in from the past two fixes from Robert Hancock
for the Xilinx controller.

See you later today for the next pull request.

Thanks,
Andi

The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.11-rc8

for you to fetch changes up to e2c85d85a05f16af2223fcc0195ff50a7938b372:

  i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq() (2024-09-12 09:08:22 +0200)

----------------------------------------------------------------
The Aspeed driver tracks the controller's state (stop, pending,
start, etc.). Previously, when the stop command was sent, the
state was not updated. The fix in this pull request ensures the
driver's state is aligned with the device status.

The Intel SCH driver receives a new look, and among the cleanups,
there is a fix where, due to an oversight, an if/else statement
was missing the else, causing it to move forward instead of
exiting the function in case of an error.

The Qualcomm GENI I2C driver adds the IRQF_NO_AUTOEN flag to the
IRQ setup to prevent unwanted interrupts during probe.

The Xilinx XPS controller fixes TX FIFO handling to avoid missed
NAKs. Another fix ensures the controller is reinitialized when
the bus appears busy.

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: isch: Add missed 'else'

Jinjie Ruan (1):
      i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()

Robert Hancock (2):
      i2c: xiic: Wait for TX empty to avoid missed TX NAKs
      i2c: xiic: Try re-initialization on bus busy timeout

Tommy Huang (1):
      i2c: aspeed: Update the stop sw state when the bus recovery occurs

 drivers/i2c/busses/i2c-aspeed.c    | 16 ++++++++--------
 drivers/i2c/busses/i2c-isch.c      |  3 +--
 drivers/i2c/busses/i2c-qcom-geni.c |  4 +---
 drivers/i2c/busses/i2c-xiic.c      | 60 +++++++++++++++++++++++++++++++++++-------------------------
 4 files changed, 45 insertions(+), 38 deletions(-)

