Return-Path: <linux-i2c+bounces-3669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A79048CDC52
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 23:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D080E1C20BE6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0604C84DF5;
	Thu, 23 May 2024 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKqDxAPB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C8AD2C;
	Thu, 23 May 2024 21:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716501014; cv=none; b=eGHvncvUr3Lxe0VmSAZBZLLX5vuKvzaAbUY9M4yfUeV3so90ZfTEc2cvfdP7NCYHJojS5IkqfzPWRU04VCthQqccGpQePQemAAtqiMpkHNzaEDHT9rXULxkow/8egDWxTvjYT9tOENRlWYzMcF/rZAqE498UHXd/D/sJzAIZmJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716501014; c=relaxed/simple;
	bh=y9jUjPCs66IgzlFQvFQEovD3bg4Oymvy7fROCylRCcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9GK2mjXopyensH+IbPKrg5XaTmOUth44sBxHYDR/Ye7K61HzjAvILFSgZvaw11ADlWRVEg7ftp7amPmT/Gar+ryMGutQnLxzSj5yas6jAtbl4wd488vkxlTkJTJ999d5MoZcKEL9/6/qI7l1lF2g9+VRWQWWe67Um1XS8wopu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKqDxAPB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A0EC2BD10;
	Thu, 23 May 2024 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716501014;
	bh=y9jUjPCs66IgzlFQvFQEovD3bg4Oymvy7fROCylRCcM=;
	h=Date:From:To:Cc:Subject:From;
	b=OKqDxAPBy1ziNNj6ifJ7gfV590aAM6KC4phZguv9zawj+RBBaEwdBc3FCrG7vAXCn
	 vO2bO6HhLJuak/8de72bVQbZxVkek5fDw0CWxQsxi1m1ovRDSwxDS4chOHQemRL3A2
	 bbfuzZWek/33mvTaZB1h5vnE5AlSIoVM53aVrTiCOE8r6Yf3oVzjGcMPDkLVYf9eY/
	 RbdbrSnK9pvQIyuC0/of/Kn5kMSheBJQQm35RvVIilMvgYaziOzYKANjiDTpBopfS1
	 czt6um27o8dpEEPT/pbhsAMKWbfEoDfpOe/1BuNz+alc6wzzJTiGMNRp40sBftMcOL
	 33npukBoYGTKQ==
Date: Thu, 23 May 2024 23:50:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Andi Shyti <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [GIT PULL v2] i2c-host changes for v6.10 - pt. 2
Message-ID: <3dthoxafgruyxkndp6kws7ejoetd52xedofu32aapmja54epvb@mbdgcvnx2dit>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

I removed Heiner's commit from the pull request because, as you
found out, there is still one remaining usage of the
I2C_CLASS_SPD macro.

Only Christophe's cleanup is included here, and its description
is in the git tag.

Thanks, and sorry for the inconvenience that brought to this v2.
Andi

The following changes since commit 6d69b6c12fce479fde7bc06f686212451688a102:

  Merge tag 'nfs-for-6.10-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs (2024-05-23 13:51:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.10-pt2-v2

for you to fetch changes up to a6b250149c79ce75cbc9a791ae482f0ce31b8dd7:

  i2c: synquacer: Remove a clk reference from struct synquacer_i2c (2024-05-23 23:34:04 +0200)

----------------------------------------------------------------
a cleanup in the Synquacer code removes the pclk from the global
structure, as it is used only in the probe. Therefore, it is now
declared locally.

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: synquacer: Remove a clk reference from struct synquacer_i2c

 drivers/i2c/busses/i2c-synquacer.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

