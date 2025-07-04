Return-Path: <linux-i2c+bounces-11822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B767AF8857
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 09:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAF35862D9
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 07:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69CF25D8F7;
	Fri,  4 Jul 2025 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hj0KEHsv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6154C72634;
	Fri,  4 Jul 2025 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612462; cv=none; b=V0D/cJndWLHbcuneQ9dPZkceLusp33KdCImuMjte+NcZOHyJCdKS18SwLjSylOOU1KbzvhzOHJcX26nyKxbZe/VdOddY7jNIdbASt4k9pMPX8ZuAaNVGbgC9NCpYsq/5C3f20JERU5EMXD3fiDqwD3hyoiEtuDlOUM09706tp4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612462; c=relaxed/simple;
	bh=9WrWDigzEJpLGzDtxoaenJht7v54bH1p5TaHigl/27s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5IN4UM8xouT8TvJou0I6YrSR0xY0vTAgdHr5ScMtzFtuZDmW7tYCgQwluCoDSedBV7hn5VGhQUyy0gHMkAOu18AB0doXmH/gu0Vyj/5KizScikHjlcC0SZMmtL2CQZmMliKKVqWj8So2SykS4gBVF3sAXH+yumS5DymP+iUltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hj0KEHsv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4345FC4CEE3;
	Fri,  4 Jul 2025 07:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751612462;
	bh=9WrWDigzEJpLGzDtxoaenJht7v54bH1p5TaHigl/27s=;
	h=Date:From:To:Cc:Subject:From;
	b=Hj0KEHsvw42SoriIkDAhIPMCwCaMtsVv41FqOxGhHzrJGJcys2MKp8H8NsiF1Ipxn
	 ml3sevjBVDYRHvzTjtfLP+46kcSDnxcuHqoAIvN50/3Ud/OwfSbitL5okFsXhBs/e3
	 ufjrPxaK+NjXpqGQ8tTkK81dgYJhu/EPdm9h7rqc98STK6QV22NkM5XckLzDxvdLZ3
	 0LU3vU4KYY92UA00IHKgZl1peMg8oPJDS9KmO3gI6GIJshpVjBIj3mes17vWzKGhr1
	 6DEq6cg4adxxcPu+RcHdRNmytwUXhn17R7/HVkBekjwSuP5AdfeifrLYVye+Tz4rQr
	 ube95H2ev3Fhw==
Date: Fri, 4 Jul 2025 09:00:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc5
Message-ID: <3ygvpeurj6vvve7d2vtlpyygjobbj2yzhgkpmlvyrxbpw24udw@o5zlnw6tx4ju>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

here's the fixes pull request. Nothing fancy this week, all seems
normal.

Have a great weekend,
Andi

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc5

for you to fetch changes up to 5f05fc6e2218db7ecc52c60eb34b707fe69262c2:

  dt-bindings: i2c: realtek,rtl9301: Fix missing 'reg' constraint (2025-07-02 17:23:59 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.16-rc5

designware: initialise msg_write_idx during transfer
microchip: check return value from core xfer call
realtek: add 'reg' property constraint to the device tree

----------------------------------------------------------------
Conor Dooley (1):
      i2c: microchip-core: re-fix fake detections w/ i2cdetect

Krzysztof Kozlowski (1):
      dt-bindings: i2c: realtek,rtl9301: Fix missing 'reg' constraint

Michael J. Ruhl (1):
      i2c/designware: Fix an initialization issue

 Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml | 3 ++-
 drivers/i2c/busses/i2c-designware-master.c                     | 1 +
 drivers/i2c/busses/i2c-microchip-corei2c.c                     | 6 +++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

