Return-Path: <linux-i2c+bounces-13386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 143EFBB8C5C
	for <lists+linux-i2c@lfdr.de>; Sat, 04 Oct 2025 12:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC59E4E2467
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Oct 2025 10:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE5D25A642;
	Sat,  4 Oct 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCd85I8+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A02459C9;
	Sat,  4 Oct 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759572559; cv=none; b=cl9TQgnS4EJ8IaOFarstNK0ODs6e1f1Hg1FtHrtUExzhrF0Wcnv/hsOTYxzkOzvxt4ugsGLwe40rDk1VOe2H43TqbvQnGrbdvEBnWRQ2FW17B/Hicm77z/m1BbVnPHsA8rgK1NN863WXDUovA5ouD/HFRPuxTjz+mg6jRZFsooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759572559; c=relaxed/simple;
	bh=kJrMLg8ADcs9HHAnYcsM/O7g184dxk4/QgAwrLMpD3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSh46wUUQzMFvOKJItUNH8njYEMxmO8Lb3Pn9aAZz/XfaDThAwoU75zjuram+ZVVO6veP0HebdwklG+90H/p64R3gPiQ54KK2N90ebFgKTb8Ktrs2GDEnpigd0I6KM6xer6KLE53ba1FFoSd7OF6Vd0TYmjTBPQeWOs+w9SUmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCd85I8+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2839EC4CEF1;
	Sat,  4 Oct 2025 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759572558;
	bh=kJrMLg8ADcs9HHAnYcsM/O7g184dxk4/QgAwrLMpD3w=;
	h=Date:From:To:Cc:Subject:From;
	b=LCd85I8+bnpL8DVQ2za7uySLFHZCo0MFWbHtZLq5jDR/im4APGYFbqhZ+VE+UJpR8
	 sa968ExRf7rZcVRqk7Uob4WOA0GTvTS1MvqXe4GN/6AaP1vVSyunOISkQ0EsoNToEg
	 neiTgII+HXdMPchPYxkfEsN+eRB+QSfFhB93oJ5dUNYepvJyU0bTRVWlo3bZmgxpoB
	 g2BnhvBHCQiyRM8I88UKcvRcFVxQMboqPI+yVUPyjL4L2hq0dT4b9LBvCO7wnxM8nH
	 DnwTviBpfi6n+XXoNBAjxNI8rlXmJ987qYRY69EfXG8Bi1SGOHOdsw7y68UgROJPjj
	 sVE1DofQUji6A==
Date: Sat, 4 Oct 2025 12:09:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.18, part 2
Message-ID: <gtymsa6dx67vlus2ostbsxxsixrubzwkqgr5ljqwjlufthlcqi@api2ouzwmmta>
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

here is the second part of the pull request, containing the work
from Jonas and Sven on rtl9300.

This branch is rebased on top of Linus’ i2c merge commit[*].

Thanks again for covering for me. There is plenty of work ahead,
and I am looking forward to catching up with it.

I wish you a great weekend,
Andi

[*] cf8da11679ec ("Merge tag 'i2c-for-6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux")

The following changes since commit cf8da11679ec4e54e2dd3cb147fb310a2230be52:

  Merge tag 'i2c-for-6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux (2025-10-01 15:11:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.18-pt2

for you to fetch changes up to 1e33137d47105a807262aa17e028374463876f85:

  i2c: rtl9300: add support for RTL9310 I2C controller (2025-10-04 11:43:41 +0200)

----------------------------------------------------------------
i2c-host for v6.18, part 2

rtl9300 updates:
 - general cleanups
 - implemented block read/write support
 - added RTL9310 support

----------------------------------------------------------------
Harshal Gohel (1):
      i2c: rtl9300: Implement I2C block read and write

Jonas Jelonek (9):
      i2c: rtl9300: use regmap fields and API for registers
      dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
      i2c: rtl9300: rename internal sda_pin to sda_num
      i2c: rtl9300: move setting SCL frequency to config_io
      i2c: rtl9300: do not set read mode on every transfer
      i2c: rtl9300: separate xfer configuration and execution
      i2c: rtl9300: use scoped guard instead of explicit lock/unlock
      dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
      i2c: rtl9300: add support for RTL9310 I2C controller

 Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml |  45 ++++++++-
 drivers/i2c/busses/i2c-rtl9300.c                               | 459 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 2 files changed, 329 insertions(+), 175 deletions(-)

