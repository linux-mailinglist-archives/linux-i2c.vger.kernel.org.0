Return-Path: <linux-i2c+bounces-12381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F3AB317AC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 14:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80013B66C7A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 12:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC2393DD3;
	Fri, 22 Aug 2025 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhdXkx9+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71892765ED;
	Fri, 22 Aug 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755865478; cv=none; b=XQrzueMMwk/doWUsZ9yam8OG2EadHGi5TdiQa2Wi0+SBuSqROUFpU8d9dyp63Yd2OYpba35M+hLOZgOB3ewk4DoHNmy3EC9LhCXPLNMbHsXfFCdRp1rL4IKpgE6HsCsEBsU4mzWemIs2TARXyaAJS6f4wR5Xuco7eUyXQ0u7/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755865478; c=relaxed/simple;
	bh=tQ0rGBwSIgf406O7Tk4ojsslaN/E9jMzCbSFx4XmZDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AK/Stv89w4KNd1LtiqY948PBI9j34BX3F5oIjx8nS0Fw7zuHwuiaSqLe+F/O8JQYR88cKz+lRmiUb/9v75CqakxWAD3JYu9C+SYKb7QBEvXyk1n/HQZnOjqayXWzNH9CYuWdIeiSsevlwf1XkXfeUMauXa8vLo6RpNWT2Mn9yUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhdXkx9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C48C4CEED;
	Fri, 22 Aug 2025 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755865475;
	bh=tQ0rGBwSIgf406O7Tk4ojsslaN/E9jMzCbSFx4XmZDk=;
	h=Date:From:To:Cc:Subject:From;
	b=VhdXkx9+pm0D1pxUcZ1AEhgH5ox8qPyYX0qKoiER7mcGMeVwZOVmS2C3cZCmELh+s
	 jcTJfUDRPVjZaZuEVlpBwMurQAdCdnpKqnUUzF+wMLGRHhJgJLn7fSg/YajFjLk8y2
	 8jVaCk6bjCSM3iIHsgI/9m+V8Te8vYllKTE62N6KKzmei087Z3FTlHUPzoZIdK2/Wd
	 ychdMdP319ZZ8nwURME5iWwMLINu117o0un64gumBqpotmuwL3TQWaLLna1C+cMyG+
	 KBy19IuHwVHsitIM3TWSVBD4z+rnrvirsbz31lEnX+NN2t3EJDjwIOGNlLttLN10mQ
	 pwZbIkw19dBxA==
Date: Fri, 22 Aug 2025 11:24:30 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.17-rc3
Message-ID: <hw4vxalm4vifwdgt5stle53eierogvrslxsyckwbfd3inkjzu6@74qfsxp47vtl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Here is the pull request for this week. A big part comes from
the rtl9300 controller, which has gone through several rounds
and finally made it in. One last patch completes the work from
Sven, but that already went into i2c/i2c-host.

With summer ending, I hope the rhythm will soon return to the
normal pace.

I wish you a great weekend, and the same to everyone flying
back home.

Andi

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.17-rc3

for you to fetch changes up to 82b350dd8185ce790e61555c436f90b6501af23c:

  i2c: rtl9300: Add missing count byte for SMBus Block Ops (2025-08-19 20:21:03 -0100)

----------------------------------------------------------------
i2c-host-fixes for v6.17-rc3

i2c-host-fixes for v6.17-rc3

- hisi: update maintainership
- rtl9300: fix several issues in xfer
  - check message length boundaries
  - correct multi-byte value composition on write
  - increase polling timeout
  - fix block transfer protocol

----------------------------------------------------------------
Alex Guo (1):
      i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer

Devyn Liu (1):
      MAINTAINERS: i2c: Update i2c_hisi entry

Harshal Gohel (1):
      i2c: rtl9300: Fix multi-byte I2C write

Sven Eckelmann (2):
      i2c: rtl9300: Increase timeout for transfer polling
      i2c: rtl9300: Add missing count byte for SMBus Block Ops

 MAINTAINERS                      |  2 +-
 drivers/i2c/busses/i2c-rtl9300.c | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

