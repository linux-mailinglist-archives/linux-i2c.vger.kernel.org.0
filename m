Return-Path: <linux-i2c+bounces-7218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01B9901C4
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 13:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BA561C228DF
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012EC146D65;
	Fri,  4 Oct 2024 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayWsb63V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F8812C81F;
	Fri,  4 Oct 2024 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728039791; cv=none; b=ArgflSeYs6glKXDkR/NQ0ggySKkQRNRKzWYTRbKDM+Iv0NPDJq5leOykpl3is0LVfdp03Io+xYiyneLDitEsyx1pgwVe9VZgvH9BafT63NKNhfs8Hgh7d0UhaBDHrPvB9vDrCDSirMNRg7yG8cGubKUsi4ciazMjvtJavjtnjFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728039791; c=relaxed/simple;
	bh=wjz7Z7lg1U5pFEk+ZkgwZ8zx75oxG1iLJLpCceriqwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4HDv5SgSyErvTa1puKKBr3ANLDog4igl7mu2r+C38XYaZmJR6YzTTbEZ8Gpu4tCKDMYLRFf154sXI17EaYI1wjovMnJsrHkxEpcul+hkrgCqWdJgZLkudOHBX4dC9cZyw+mHrwas6Ri+1J6Pn42dd/MqzvaJZxTIqcnOA8XKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayWsb63V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FA0C4CEC6;
	Fri,  4 Oct 2024 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728039791;
	bh=wjz7Z7lg1U5pFEk+ZkgwZ8zx75oxG1iLJLpCceriqwA=;
	h=Date:From:To:Cc:Subject:From;
	b=ayWsb63V3RvI4H4W27K+vHefKnGz8/If7yQ8VEYBrJ1Wz59RSMvLMSKWKi3rOJWGE
	 vfKSjq3SRsfNUV4OuhMCThz2hrbq7143KjBOCr0Naz04K1wGPSwWhlA+ZEUP8oT6t2
	 KZ8fAZ70v/W20jT0tJ7lURwTON/6nULbYKyuphAccHOnTDgZBdQzi9uPuPceTGRiPD
	 UpVZDsZ4dxIXz/4JayxNEej/Dvewb6RWHLQxQHi6Iw9L4kzx/PdfQ6jEOcltoVi0kB
	 2zfSx9t//j2lfZsyEjphX3latCVremX67uyqEltS7noTVGOWiF4E3C9by+6slUa3NO
	 qP6SfL/xDUgUg==
Date: Fri, 4 Oct 2024 13:03:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Marek Vasut <marex@denx.de>
Subject: [GIT PULL] i2c-host-fixes for v6.12-rc2
Message-ID: <jtzq4rriyqzerfbxcb2hojrrmdj3cenooijz37u7ejh7twawfo@zussiajim3rt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

only one fix for this week from Marek.

I wish you a great weekend,
Andi

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.12-rc2

for you to fetch changes up to 048bbbdbf85e5e00258dfb12f5e368f908801d7b:

  i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume (2024-10-01 16:39:00 +0200)

----------------------------------------------------------------
i2c-host fixes for v6.12-rc2

In the stm32f7 a potential deadlock is fixed during runtime
suspend and resume.

----------------------------------------------------------------
Marek Vasut (1):
      i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume

 drivers/i2c/busses/i2c-stm32f7.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

