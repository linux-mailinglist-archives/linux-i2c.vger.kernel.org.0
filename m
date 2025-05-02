Return-Path: <linux-i2c+bounces-10731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D3AA6CBE
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 10:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C86B9C2312
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 08:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8786A22ACFB;
	Fri,  2 May 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZ4AJZrE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369222AE6D;
	Fri,  2 May 2025 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175496; cv=none; b=NtnOTvJ1x9p0qTMAYohVs2zKUelCHNJIO5z8vhAxPPcwz7bm43LwqrlfAB6o6rNrkqO56pbMGlWsAxtya2KKIP3JNVgBgijsRwVu0vYTzpv/WBrIskn0blAWh3xcvHV2Acm2njJdlHwBw6Pm/iF/ygxlmm3p1zXxPq5GkO3CQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175496; c=relaxed/simple;
	bh=sYMWsTxKXXvcpCoM9Gf9wOBg8lbkfjRkRbc4VE5Khho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L84TZCVNfaqG00NqL9LB/xgpQh8MCRNpGuLL/yavdeI/oCuHnissOclhIOKqrFCiRL0ZOZK0xOqPuSB2L4+Rh+z7DbPH1Uby1J2q62FevrS8ushTKCUwMFGv3welN6PA4UnpX+jS4Nz2mxFouEv4Rhi4dAn0HSVXe0kiSmsXjrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZ4AJZrE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098E9C4CEE4;
	Fri,  2 May 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746175495;
	bh=sYMWsTxKXXvcpCoM9Gf9wOBg8lbkfjRkRbc4VE5Khho=;
	h=Date:From:To:Cc:Subject:From;
	b=XZ4AJZrE2vYztC63ct7lXzUeyhxQOMa+rX1qizbFbRX+XvTW3/5FrDjrbnrsKF0h6
	 kaqTrOZet6+TNX/K8eznCOzak+3s+esjTUYYbLvFhGXEm+bA4OOD1m8o74UQMyyyGD
	 PH53/Km7CMzsqzlRUph1jIrmzcgtSR9PS1xrezELmObOHULTOhOe3aLcSTN8ZBhoKA
	 oKfBkFLQDT2UuBiSsYk5fMSVahXsY8QVTKSFwFvym8renv1yVsyeH9hcSBzUVc0ft4
	 RG56Jb89yoTfu1Omy7fI39y2+uul9nSlSHESAIH8G0scQzXQvUrempBSTMcLMbseyp
	 UN3lns4JSKxfQ==
Date: Fri, 2 May 2025 10:44:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.15-rc5
Message-ID: <nflt7kb4vjqzg52g55lpyp7yvbbuwdj3au6xecuufojtucbhqp@visdczivr45s>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

only one fix in this quiet week's pull request.

Have a good weekend,
Andi

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.15-rc5

for you to fetch changes up to b1852c5de2f2a37dd4462f7837c9e3e678f9e546:

  i2c: imx-lpi2c: Fix clock count when probe defers (2025-04-29 10:18:51 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.15-rc5

- imx-lpi2c: fix error handling sequence in probe

----------------------------------------------------------------
Clark Wang (1):
      i2c: imx-lpi2c: Fix clock count when probe defers

 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

