Return-Path: <linux-i2c+bounces-8668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E29F937A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 14:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54A0C7A3487
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 13:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A921215770;
	Fri, 20 Dec 2024 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6jknFL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6521570E;
	Fri, 20 Dec 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702302; cv=none; b=CuZ7UlagcDp/Mq+RQjW3M6ANBVIZIHCL4hA/ko7u6G4qc/kBQT6U93RG2uLmLab/G00nv1hBVUt8cwTu/IpsyNIPtGttHDEoLrPbF7efHULJMee7zrGdah2wA8XYQEfVKWaQGkr+whzHaaCmLVAOdiuI5HKuNEr7tCqFLxtErVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702302; c=relaxed/simple;
	bh=wlbvY3e8Wfk7FGtjjmf5u3u7kJdMrOY2wnFneXt1I80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tujZ6KWdDQ5b6b5n7P+mZQULjYyVOlx/W4Xn8Shs8/Kqzb3xK3q83w+GrU8PD1NUrqUBoezTAkZVi+fmo/hxYAYWibBHD3SUSV3/7g8zwKJ/fPHX2s+xqYYiUHl1Y9KTrix4TRFpg5fqu7NC7U83XWJq/A9gJrWD3catYBEYnpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6jknFL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEA0C4CECD;
	Fri, 20 Dec 2024 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734702301;
	bh=wlbvY3e8Wfk7FGtjjmf5u3u7kJdMrOY2wnFneXt1I80=;
	h=Date:From:To:Cc:Subject:From;
	b=s6jknFL4MjpY20isgByF98kLfQpHHPobfSQi//ifNbppdytEGuIMuCzZkRSJNZvF7
	 b+aRJX7rSgjHAynX/ASmnMiVfC1xdOv8rWHCg8yia9nFLzgV4TDH3JIMDVXfsWkFhI
	 PgsWRrNeeKJAWj7KaeLb5sfMY7x6mOvnRU+16k4moDHxmrrI+HsG9UA9wz3JCTGWU7
	 l6VFHqq+M6QZkVKO2GuOC+zyrBeSB0l5xG1aUgNsAQU/okiEFzDQyCGLBTsmJuWHbg
	 YNGCsB20aosaGss3u/FZu/dJRo6MrW2n+0zIQMBOqmQTKXwhxZ6XkqUr5n0rxSjhPe
	 vv3YczUs8n3sg==
Date: Fri, 20 Dec 2024 14:44:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.13-rc4
Message-ID: <hwrubrr7qaqak2azgrpnixrchhiu5yvzev4eccts7up5ozq3ml@qsagtzlhrc4x>
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

This week, I’m submitting two fixes for the IMX driver. There are
already a few more queued for next week, but it was too late to
include them this time.

With that said, I wish you a wonderful holiday season and a
Merry Christmas to the entire I2C community.

Best regards,
Andi

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.13-rc4

for you to fetch changes up to 06b911b17b64e922f5a314b822364b607565326d:

  i2c: imx: add imx7d compatible string for applying erratum ERR007805 (2024-12-19 11:33:59 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.13-rc4

IMX driver fixes: fixed stop condition in single master mode and
added compatible string for errata adherence.

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx: add imx7d compatible string for applying erratum ERR007805

Stefan Eichenberger (1):
      i2c: imx: fix missing stop condition in single-master mode

 drivers/i2c/busses/i2c-imx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

