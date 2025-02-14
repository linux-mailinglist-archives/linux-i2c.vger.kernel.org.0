Return-Path: <linux-i2c+bounces-9458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA91A35D5E
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 13:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72C9167FAE
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F61263C81;
	Fri, 14 Feb 2025 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRWASlo6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A1263C65;
	Fri, 14 Feb 2025 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739535494; cv=none; b=Y06jVur8OH2TMriIVaeBPBXn7ogIebl/zay83v1zjm0sC/de0w5H3tk4qaOxC8eFHJjWAR13InPzRO2wMhX4UYpjpP5rXsqLCvwUe3h3hqWrjk5wWRLt+oNSrLOdspHX1p8fw8yuNEaeq75x4ACAtJSBrhA5zYx9Q8Gio1i4ebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739535494; c=relaxed/simple;
	bh=eSN1GrEjIzOYxcUxA1IlvsHQeUDmqQlO+bVAvbvl1QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNn7lqdDdX2o2di/Yq3tOV24faSg7v+MaqmQB030JGC5/HelBugPFKFJhv8H8swXr5Lzr35EpwN4jWFmb2erY21mG4RHDzinWH5GL8kPghkoqJ2SURNSqi6ftp3Uua8HIyjh1WLMAu9v0vsMN6O0jAGo3s0SibnFb1aRDcOkPko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRWASlo6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BB0C4CED1;
	Fri, 14 Feb 2025 12:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739535493;
	bh=eSN1GrEjIzOYxcUxA1IlvsHQeUDmqQlO+bVAvbvl1QU=;
	h=Date:From:To:Cc:Subject:From;
	b=FRWASlo6W4b7JE8JEyBIrc3rZCd8SAti4gjCULGBDq8ii9eJEwGecynwDuS8B2ZPQ
	 FMlb8QztNUtf37BF2cX+dhRTx1rlKXKhYfUSFdygBxIxU+qLpBWH/BrVbRNjM+7/VR
	 NUs9bKwnEUDG5xYSFsKTrLeARSvkzl0ADF5vGTleq0M+tfwSeg22qiLNVYVgM4iJdY
	 qxLwMS34EcgPAgoW71j8qelEnUDCTh++NZBCV41lhfZ42KeB+nMMMTeAWoWp6PJ8h6
	 FvkNlVX6Lj6sn+/BpwmMM5R5skXu9qMwcokyenOjKtmdYp5Wi6oXsUBpY1hqfSSJ5Z
	 PGnl8aEM+p/Xw==
Date: Fri, 14 Feb 2025 13:18:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.14-rc3
Message-ID: <barspgw6bqm2q4uj6gbrze7ky7nsbgnorzhkdqk5s3jdaahdhb@nnyziqfcnz55>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Finally, I'm back with my first pull request after my injury. I
really missed it! :-)

First of all, thanks a lot for covering for me and taking care of
my work during this time. I really appreciate it.

This pull request only includes MAINTAINERS changes. Krzysztof
Adamski has been removed (I'm always a bit sad when I see
Nokia's traces slowly disappearing from the kernel).

Meanwhile, Mukesh and Viken have stepped up to take over
maintainership of the Qualcomm driver. We had some offline
discussions, and I'm happy to see such a dynamic driver being
well looked after.

With that said, I wish you a great weekend!

Andi

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c-host-fixes-6.14-rc3

for you to fetch changes up to 7422c319fd805b956aab5ba93e0274517a8e3650:

  MAINTAINERS: Add maintainer for Qualcomm's I2C GENI driver (2025-02-13 23:23:55 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.14-rc3

- Mukesh and Viken take over maintainership of the Qualcomm I2C
  driver.
- Krzysztof Adamski is removed as maintainer of the Axxia I2C
  driver.

----------------------------------------------------------------
Mukesh Kumar Savaliya (1):
      MAINTAINERS: Add maintainer for Qualcomm's I2C GENI driver

Wolfram Sang (1):
      MAINTAINERS: delete entry for AXXIA I2C

 MAINTAINERS | 16 +++++++++-------

