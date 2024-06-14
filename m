Return-Path: <linux-i2c+bounces-4034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE1908AE0
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 13:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14DC81F2204D
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 11:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAC4192B98;
	Fri, 14 Jun 2024 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyHrDvni"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980114D29B;
	Fri, 14 Jun 2024 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718364861; cv=none; b=SBV1Nf3McrEa40wbbknqdJW/OcjVEOxbifn9WNC9Sz4Z5+eNWd4aqGa9Pdh5Jkj1ucJ+1/BbCbnRD6IERGpiIVXNkT0HO921lvkgoAm7TxURPzENurXuCAgmHy2tF4rLcAtXflTL6o5lEYaY4JD3HjH5kJe5BpAcEg0jdVzdrT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718364861; c=relaxed/simple;
	bh=a6SfxOD/OD964Vn3l5GGkho4iS9L9TigZsmPyszmyyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkI0mOFj9nunNSpChyIF5Q+GTisqdqTUMK7zdoFmqGXQgjU5RnR1gwt7sZkbfxFNGRnCcOLok01STvzKymGwxJnQ7N8eCzmr9sww+cDv/tJsvLW58Q/z03u+Y/MK8wH4trlxp1A9cqwnLqQ/c0l2GlscdAODCrmygjHLg/nEBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyHrDvni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD2CC4AF1D;
	Fri, 14 Jun 2024 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718364860;
	bh=a6SfxOD/OD964Vn3l5GGkho4iS9L9TigZsmPyszmyyk=;
	h=Date:From:To:Cc:Subject:From;
	b=qyHrDvniMH0T1YjwWZIvzspPiASRLb/PAbidhdOaRSTZ6EgiSH+wyApb9ra8wmr3f
	 M5B8ifQuPgniTPWJ89p++14NtI5nBYkP30g3FBLk8kB4b06PrDw/eS+mAoi1BwKC+6
	 HJorhnFpvKwNI9gkB8FmnY15TR/Anot1Z3CvY5DA7LagOl8UnPu3opPzDMC0X7F4wM
	 pXk3a0vPa+Nym6Xb3gMAKH0SDspb3W3M8PGyMC+ryzj1qvd3O+oZ+OpnovMc+7MOwS
	 TlZ3AgxWC4l1XpAn1uEorI9f3GFmEw0E4CHo5Pt8qtDf/VPMg42WcYycHIvs4IElCP
	 /tdKykjpvGp7w==
Date: Fri, 14 Jun 2024 13:34:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>
Subject: [GIT PULL] i2c-host-fixes for v6.10-rc4
Message-ID: <u4eloe4b6geus3g24orbcz4fz5r6ze55fhdue4q7dwluhakwh5@a6j4n3jgu3tt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

not many fixes in this period. This pull request includes two
fixes from Jean that were queued up last week.

Thanks,
Andi

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.10-rc4

for you to fetch changes up to cbf3fb5b29e99e3689d63a88c3cddbffa1b8de99:

  i2c: designware: Fix the functionality flags of the slave-only interface (2024-06-12 17:07:34 +0100)

----------------------------------------------------------------
Two fixes from Jean aim to correctly report i2c functionality,
specifically ensuring that I2C_FUNC_SLAVE is reported when a
device operates solely as a slave interface.

----------------------------------------------------------------
Jean Delvare (2):
      i2c: at91: Fix the functionality flags of the slave-only interface
      i2c: designware: Fix the functionality flags of the slave-only interface

 drivers/i2c/busses/i2c-at91-slave.c       | 3 +--
 drivers/i2c/busses/i2c-designware-slave.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

