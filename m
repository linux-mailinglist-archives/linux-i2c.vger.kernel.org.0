Return-Path: <linux-i2c+bounces-12111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D8B18BB0
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 11:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 086117B32F3
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08316229B02;
	Sat,  2 Aug 2025 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWE+sRhI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3E225779;
	Sat,  2 Aug 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126649; cv=none; b=rcTzWtuwBuklPd6kV5fi3KZAlehSrf4V+I229zuGAkdz5Hoddm0VYCGWp8cOXeJ9nT9SMCmS3Rjfep4GHfdDRFw1ojFxh/tWbRJzrAD33WvqsPOVBXbUxdXHJ68vf0FLWOYzbyXZvggJK51iWMvFPBUvEpXEkVkx4OnD70ICVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126649; c=relaxed/simple;
	bh=q+3RdWiG0wEAxUWsm/7pnNd2Vk3OjWsGYVGoqzKzVOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZPQxGt427AnQxhIv4glR+jX6nerfJ5TPfEBgLaOmUiU6lDNCeBMtIOOUxRCptPHQtpR3y5d4LU/4rPj23vxADW4votF5ysyaDPH0DMpOvcW5yjo7vRGHdj2a9Hkfy98erucUBlRXFh+2SK0mQTXRQnB/raHB8ijEmA9+TRRzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWE+sRhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F2C4CEF6;
	Sat,  2 Aug 2025 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754126649;
	bh=q+3RdWiG0wEAxUWsm/7pnNd2Vk3OjWsGYVGoqzKzVOY=;
	h=Date:From:To:Cc:Subject:From;
	b=RWE+sRhIIzlPGSDXRhtI5Pui/Xz0BAxfUWFwS0BkrY/o4klxPOzSGfZ1bn/ccNFHo
	 GpDIThDz+LL9v3jt6AGtlZjtUfVlGCQp+pklQNjOx14P3K5Ozi3QwrzuMaO7xHkza1
	 uKCqjFl7f3Dq6uw+Ll0cl4z7GS2TZ91o9STm5jV3KeGZLQCxigQTzYGsAm2dPh4qPA
	 3+i5HjK01TemokGH1UVCSuZOpq0HO18DHHaET3zpccQkfZR1V2t8LZx5LTbSpqyode
	 Dh/x5JrWWqq+/6dY8JXykWIeTI/0jXo1ewF3H08O1OfEs7kpwNZ1shhRZ3j0M44rXX
	 hSUYuIzhAyEGQ==
Date: Sat, 2 Aug 2025 11:24:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.17, part 2
Message-ID: <et2mpmxohgqclvaa47qbx3bdowp4usovgz4fptlm6zfxogzuwb@t3touqocg2w7>
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

Here is the second part of the pull request. It includes three
follow-up patches (two from Akhil for Tegra and one from Clément
for STM), the first patch from the Apple A7–A11 and T2 series,
and a fix for the Qualcomm controller.

Everything is rebased on top of Linus' merge commit for your
pull request, 0ae982df6776 ("Merge tag 'i2c-for-6.17-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux").

I wish you a good weekend and a happy National Day to all the
Swiss I2C developers (and non :-) ).

Andi

The following changes since commit 0ae982df67760cd08affa935c0fe86c8a9311797:

  Merge tag 'i2c-for-6.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux (2025-07-29 11:35:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.17-pt2

for you to fetch changes up to 85c34532849dae0fdcf880900ac9d7718a73fd1b:

  i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates (2025-07-30 00:39:54 +0200)

----------------------------------------------------------------
i2c-host for v6.17, part 2

- apple: add support for Apple A7–A11, T2 chips
- qcom-geni: fix controller frequency mapping
- stm32f7: add DMA-safe transfer support
- tegra: use controller reset if device reset is missing
- tegra: remove unnecessary dma_sync*() calls

----------------------------------------------------------------
Akhil R (2):
      i2c: tegra: Use internal reset when reset property is not available
      i2c: tegra: Remove dma_sync_*() calls

Clément Le Goffic (1):
      i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

Kathiravan Thirumoorthy (1):
      i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates

Nick Chan (1):
      dt-bindings: i2c: apple,i2c: Document Apple A7-A11, T2 compatibles

 Documentation/devicetree/bindings/i2c/apple,i2c.yaml |  5 +++++
 drivers/i2c/busses/i2c-qcom-geni.c                   |  6 +++---
 drivers/i2c/busses/i2c-stm32f7.c                     | 32 +++++++++++++++++++++-----------
 drivers/i2c/busses/i2c-tegra.c                       | 64 ++++++++++++++++++++++++++++++++++++++++++++--------------------
 4 files changed, 73 insertions(+), 34 deletions(-)

