Return-Path: <linux-i2c+bounces-1558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE608442E0
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 16:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A911C23A88
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 15:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C9F84A51;
	Wed, 31 Jan 2024 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5LsiJhj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B4580C07;
	Wed, 31 Jan 2024 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706714424; cv=none; b=EV4uzoL3C2jdp7Q5qeG0oTr/2xyCqLyw1bVkrJeDS/81h0xV3Try0RCuzjnSj7zxdurDVsNyT55d/oZDf/p42Wp4KgYPHqPeQoDyiUcck5jBWVFciCW7BAQHX3P2FiGDVzivkyKJgBs1i/A6+7UuW1UJBRlRz518CXAWhyEJJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706714424; c=relaxed/simple;
	bh=Gr74ONIaZTedRoeUUDoZkXUP5VNLAxHplRrixPLjtsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjmF0HtSLs12Kz1u+kCkCml8hAMaGM89qTX5xl23WE/ecD2+Go3joVCJNpjRByTNBMaVL86wnfdBP09RIUVO3VpDyG+A6/JDvOOqtp7iSnvlU6itA7W8oB+DxuVSOOWY0pzmqCs2xj1+fRKy7YNDaF+mG9AHp7iKt9Mh61yibNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5LsiJhj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E72C43394;
	Wed, 31 Jan 2024 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706714424;
	bh=Gr74ONIaZTedRoeUUDoZkXUP5VNLAxHplRrixPLjtsg=;
	h=Date:From:To:Cc:Subject:From;
	b=X5LsiJhjHd8V4VtlySEnDsVf1LJZE1JlTr15d9RBEkiJMz6ad63jgt1cjJRINSx67
	 9kooCT6FDwX9pUyLunkXJRnUXI1PPUI9GyFpY1v6M1eJAYHBeT+NK/VYkBI5vuTaXv
	 zZGRhyCdy4Eupye8b14b01eX+uPLzzPGs1Gs6BhAT758mkteZC56DQxCAQTQgxzrSj
	 M5tvZhA6d2as3jP2sP6brjk9GvjFi5Vc5V1HrGq+q0qCQ24JNLY56rHWbmWv1Ft2O5
	 Hy5Su+WACg/GGzf/by0S0ltF8s87HwiDzU4aQRXfAGgrWRR1wMnBmgwJ6dnLbrVk5v
	 6c/pAweAvbOkA==
Date: Wed, 31 Jan 2024 16:20:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Krzysztof Kozlowski <krzk@lkernel.org>
Subject: [GIT PULL] i2c-host changes for v6.8-rc3
Message-ID: <heubxjuedaz7tfkmdendm7jkpahd5yhvuivxw5dxvxmvf7da7z@gohlttvtjn7b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

I'm sending you the first pull request. At this round I have only
collected the repository URL update.

Let's kick things off! :-)

Thanks,
Andi

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.8-rc3

for you to fetch changes up to 9189526c46f2ad14df25dbdc30443f79d03dc7bd:

  MAINTAINERS: Update i2c host drivers repository (2024-01-31 16:05:07 +0100)

----------------------------------------------------------------
Just a maintenance patch that updates the repository where the
i2c host and muxes related patches will be collected.

----------------------------------------------------------------
Andi Shyti (1):
      MAINTAINERS: Update i2c host drivers repository

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

