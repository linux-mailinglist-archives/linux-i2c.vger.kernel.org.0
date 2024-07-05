Return-Path: <linux-i2c+bounces-4663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F492894C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 15:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67BF81C21602
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 13:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3F814A611;
	Fri,  5 Jul 2024 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd0NAF27"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92D14A096;
	Fri,  5 Jul 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720184788; cv=none; b=dziwn78HEH+1vIJrT5EuL5+JKBRb7iFaQJtupwlewT1vjAUBNyMV1bFZAfoiJTKft/Hq3wv+QOeDswI/qKZI+lIJS0HBBXhww5IeP/f04KUM2qMCYl9NJZbPbn7tsRR7+aKdi1E+6E2fKxw9O+EUbsBurcvuCdw5spDlzX7ht3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720184788; c=relaxed/simple;
	bh=GVDZRjaahNKXDvzRfmcR0YugoOkYGrpXGDu8DeiYkoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0Gg33IWmqAxVf15i3E8J8NGAUi8dO0+I2Yvsp7onWXM/iMhQpW3u9lt0wI56WHaj3lAIRHOtv5FiaCii/zjfE/32vP+nmTPLHpgrzf008giLcjyRdEI7tveY5kNS6bO0bsrEfr3mvreta7r/JHqU9nzD01vEA068zMG8keDY4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd0NAF27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08847C116B1;
	Fri,  5 Jul 2024 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720184788;
	bh=GVDZRjaahNKXDvzRfmcR0YugoOkYGrpXGDu8DeiYkoA=;
	h=Date:From:To:Cc:Subject:From;
	b=Wd0NAF27RDAkVhqdeIWFbL66geDI1Kux56cmkz44aJoP3wxNhhC6r/VK36sZG/uya
	 9bOiNGF1jK/HxP8bsZUJIBfcf35aa28MZMXbn31/RurZwrrEiBTEKvzuVCg3kCmnRn
	 VYyV5zT09I45GFbv5XQfknHv3vyVnoF8lyzTk0q3gU1Btvs+pDAVcQd2T7xwqFexqT
	 8f/ywuMOodffxjByeFryO1gyrezrMtdQcRIo0SJRaa3q7qwpFnIWPb7Pbs8vBsAoA8
	 h/CYqmgwcH3S4wcdOapBxxRLW4lg4OhKnM8dT81aiseKf/WwUEU2+Vt4Y13eOkQoI5
	 b4ffKWZn/qNBQ==
Date: Fri, 5 Jul 2024 15:06:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.10-rc7
Message-ID: <snxb7qd23vzrhls4duer3bt46m3lwzil5fzx75s7jl4okhexak@2e23wyd6qe76>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Jist a nice fix from Piotr coming in this week.

Have a good weekend,
Andi

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.10-rc7

for you to fetch changes up to f63b94be6942ba82c55343e196bd09b53227618e:

  i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr (2024-07-04 00:17:47 +0200)

----------------------------------------------------------------
This tag includes a nice fix in the PNX driver that has been
pending for a long time. Piotr has replaced a potential lock in
the interrupt context with a more efficient and straightforward
handling of the timeout signaling.

----------------------------------------------------------------
Piotr Wojtaszczyk (1):
      i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr

 drivers/i2c/busses/i2c-pnx.c | 48 ++++++++++--------------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

