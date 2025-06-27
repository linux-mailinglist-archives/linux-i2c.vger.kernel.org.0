Return-Path: <linux-i2c+bounces-11633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B3AEAE72
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 07:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A8AF4E1484
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 05:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D871DB548;
	Fri, 27 Jun 2025 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEu8tg57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887D42F1FF1;
	Fri, 27 Jun 2025 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751002149; cv=none; b=aBUm5OKbUgDLM8+Sj16TZHuq7p+GjwKatZAXLtnptet0ZXgm7h6wNkQ+ToYVeG8B46+ElgHKRVpAY6VqVklwB+8bnicsVEfNgdTBQYXZzOt1cttUzLJdHa9Nju/Jy65DGaKpntsoZI2WzYNuO28PcGdWw6yphvTPtocx3Minhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751002149; c=relaxed/simple;
	bh=wEo+1wEx1ZncyyIhJ/6Ofm4hKy6XZWOuLP4VoiwT/Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQMHauoaSsuBQ9qvsYNXY9l8ICvKQw0JwsN/q93sAMKbEHGhrVd26IoFc6xMok+hIb32MAI5FF+1psyAa6D8kGqRJS6ChCxIkGfCDZgf/48nga7kR3zzKIFyg3Z7A7yffNom5pS7hmsXLlIARD6zkPjA9gs6XBlj2wvfJ7X1xW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEu8tg57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A602C4CEE3;
	Fri, 27 Jun 2025 05:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751002149;
	bh=wEo+1wEx1ZncyyIhJ/6Ofm4hKy6XZWOuLP4VoiwT/Tw=;
	h=Date:From:To:Cc:Subject:From;
	b=bEu8tg57rCIquwQZSU31Nkee7p+/Iot/FZdhwHivg3HQviQy+2QWoazuc/qoqCS2t
	 Fhnox5xkh1Rniw1EtdYWGYebb2GFiws8Y0sZs9//JohQfQnw0Abe8Kq1saHCTBDUtv
	 9znT2agzhdxtVkX9ecOmF1TTlY6iBA0Vp+eZ5IOBhkAitSctpgeDvCcC5ue5oelsUq
	 TjIvm19fGDOAkIQ7xiKE6RfCZgy7KsJg7/xfU2UzkdwEID93ES4vM+YINLQV3khPby
	 B2npdwY90RnxHKpVMYIeNQWbkaeYquWI3NNgKheoOUNBr2qbf40BJU/i93vN9z2msR
	 CvP1xDlZTeiCA==
Date: Fri, 27 Jun 2025 07:29:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc4
Message-ID: <7rnodnh6pww34mtj2rj4t5dnaj6gnngink3xkx2ijm73cyawlm@qtrv6kkhkjxp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

I am now in a part of the world where internet access is not
always available so I am not always very responsive. I am happy I
found the time to send this pull request in time. Sorry for not
replying earlier to your message on my previous pull request:
everything looked fine to me, though.

This week we have a rather big pull request. We inherited from
platforms/x86 a build fix that affects designware and AMD
platforms. Ilpo suggested we take the whole series through I2C.

Please note that the patch with the fix uses the "Requires:" tag
for commits not marked as fixes. If the commit ID changes we will
need to update the tags accordingly.

The rest of the patches are ordinary fixes.

Thank you and I wish you a great weekend,
Andi

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc4

for you to fetch changes up to 666c23af755dccca8c25b5d5200ca28153c69a05:

  i2c: omap: Fix an error handling path in omap_i2c_probe() (2025-06-26 00:07:33 +0200)

----------------------------------------------------------------
i2c-host fixes for v6.16-rc4

- imx: fix SMBus protocol compliance during block read
- omap: fix error handling path in probe
- robotfuzz, tiny-usb: prevent zero-length reads
- x86, designware, amdisp: fix build error when modules are
  disabled

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: omap: Fix an error handling path in omap_i2c_probe()

Lukasz Kucharczyk (1):
      i2c: imx: fix emulated smbus block read

Pratap Nirujogi (3):
      i2c: designware: Initialize adapter name only when not set
      i2c: amd-isp: Initialize unique adapter name
      platform/x86: Use i2c adapter name to fix build errors

Wolfram Sang (2):
      i2c: robotfuzz-osif: disable zero-length read messages
      i2c: tiny-usb: disable zero-length read messages

 MAINTAINERS                                |  1 +
 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 drivers/i2c/busses/i2c-designware-master.c |  5 +++--
 drivers/i2c/busses/i2c-imx.c               |  3 ++-
 drivers/i2c/busses/i2c-omap.c              |  7 +++++--
 drivers/i2c/busses/i2c-robotfuzz-osif.c    |  6 ++++++
 drivers/i2c/busses/i2c-tiny-usb.c          |  6 ++++++
 drivers/platform/x86/amd/amd_isp4.c        |  3 ++-
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 9 files changed, 39 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

