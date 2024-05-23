Return-Path: <linux-i2c+bounces-3648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE348CD192
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 13:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC051F22A6A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6691D13C3D6;
	Thu, 23 May 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goG7MfuI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9913C3C4;
	Thu, 23 May 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465391; cv=none; b=Vq0kg60BcE83nQ/Bld0VeDCvE6ZtAydWf37RDJEm1ZzSy6Yt8uMyGmxVY8ys+U3pnLPplvbjlkaDkmniTmj2HugBkYuh9jPkFhJmPLspsjB5KEvBBEgtZW7muhsU6pvkH/F77tlB+CEMjUc1M1Zh3H6ltZzrxvXo6df+nPOzkLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465391; c=relaxed/simple;
	bh=uw8xC9pXxF1eGRimce3uwPFF5cBihp03zIdk4OAmmkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRos2JubMGCTtSf8MKw50ivPV3GUv3INGxyMXMfM5ZdM5BSwSJTpGYXbsrfov6iafpgogsP3KvF/4E6+ycq98caAZj1hn21o675yEmRT/qsXV59NqiPepowSQ1OpAZJDHiRqp4/bVh5kbm5x+dtnmGKfAJ9Y/QCSbq/B8wUiFPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goG7MfuI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F274FC2BD10;
	Thu, 23 May 2024 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716465390;
	bh=uw8xC9pXxF1eGRimce3uwPFF5cBihp03zIdk4OAmmkQ=;
	h=Date:From:To:Cc:Subject:From;
	b=goG7MfuIRrVZOKIpVWXt6sIMZuG3t0eOUnEVVoDvRqv6GAOCp7XUt3Ri2KUNdZRJS
	 aZfo8q46UIIoVIVzODo71DZp1HSP/UyxC+oUCVw43C+B/k7WtVDw+3KQ06ctWQFz+z
	 4kkK/BUjB6bI27gdQb/BoT2ET+UypqpAhWEBpklzplWs2ndmHBgT8nJXttp8v2gP42
	 wPeGoXFk5UTUEmZPj5kHxmIafxlGy2Tk2WXrC39RaCc09Uhm5XrYqslbY2gamGDXom
	 n1cVWwW1dep+EJsQl9S6KCWETG3aerFSrAN7WAx2T+mTjyenUhlBJ1HRT2VCIb7988
	 41VoDOZ7+9knw==
Date: Thu, 23 May 2024 13:56:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host changes for v6.10 - pt. 2
Message-ID: <2qtn3bk6pat2xkw7qz34pjpgh6zariuz6zjxhmuuo2jcddfpi4@xn6aqqppl3hi>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

now that the dependencies are fixed and no error report has been
sent on these two patches, I can finally send the second part of
the i2c pull request.

Thanks,
Andi

The following changes since commit c760b3725e52403dc1b28644fb09c47a83cacea6:

  Merge tag 'mm-nonmm-stable-2024-05-22-17-30' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm (2024-05-22 18:59:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.10-pt2

for you to fetch changes up to e61bcf42d290e73025bab38e0e55a5586c2d8ad5:

  i2c: Remove I2C_CLASS_SPD (2024-05-23 13:38:15 +0200)

----------------------------------------------------------------
Removed the SPD class of i2c devices from the device core.

Additionally, a cleanup in the Synquacer code removes the pclk
from the global structure, as it is used only in the probe.
Therefore, it is now declared locally.

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: synquacer: Remove a clk reference from struct synquacer_i2c

Heiner Kallweit (1):
      i2c: Remove I2C_CLASS_SPD

 drivers/i2c/busses/i2c-synquacer.c | 11 +++++------
 include/linux/i2c.h                |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

