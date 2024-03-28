Return-Path: <linux-i2c+bounces-2651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136B890B71
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 21:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D91C71F263AA
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 20:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45056137774;
	Thu, 28 Mar 2024 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RySmZsPQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD641A80;
	Thu, 28 Mar 2024 20:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711658299; cv=none; b=oo8w4CQcQRKeuUJlblo6WfBC/jC3nkC85zeNzuz2m+4rXx6dB853bwLvLw7jqJkSAz9FOawMnMdzJ9/L3PVRf0J1E0icCgiDJ8AVUTcKnwYgoJphw6TOT3KIykKjvRRyIbthl/gYoZeTDat8GdgyCmN+cegGzumUoOAnftKr1Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711658299; c=relaxed/simple;
	bh=qyRYNMsv/h6baYTAYBDleiNK6goIRySEnDBg7VBFA/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQuagr28nMgyotut6puM0zVXWP0bpONuXLGMVa2zHWgm/rFHPr8Wq9TI38CY11ZBOQhit+W1kZgzz5/7jrT9H/82E5yX9/Dw245Ub79CsMwPP6kqeEJK31iw+lalswrDDLCnUYE4tWpGJM53hynQmW9kqmoaZ5yYRNu3iED3nLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RySmZsPQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D398C433C7;
	Thu, 28 Mar 2024 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711658298;
	bh=qyRYNMsv/h6baYTAYBDleiNK6goIRySEnDBg7VBFA/A=;
	h=Date:From:To:Cc:Subject:From;
	b=RySmZsPQzQSJ89+tOE3+KgyYuyTefXoliI0/kIV1ELS/alz21crFUVlTCwrOs3sVa
	 HtCne4KlRZuRTgz540+35GEoSMwzpCW2U3e5ma8ZJT8sfb7BaIlDSiB7M5hwvFqoXo
	 OE8kh8ArYNy8AljoKTA4MKPuuCDB+wlJQfK2qzbToE28/JwxPDBltL/76GyvSmjzA7
	 Gzu3pwdmjdIuKkJ0UuUHmDQFe4owAa17hoLcmcuVz5EHibvUAUBhi2QnZDVerNRFxQ
	 03LCQC0rMCsyR1NE8gtJwy+sE+dGD2X86BKdEf52MKWMXWLzS/aooCEXzf+O+r/Hd2
	 9NtKcqHleuF1A==
Date: Thu, 28 Mar 2024 21:38:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.9-rc2
Message-ID: <66u5tce25yh2zq26qclsn7to7kqp7muw5tbe4uuw7elb5daebw@6jvkpuy5yrm6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

a very quiet rc1 week with only one fix from Maxim.

Thanks,
Andi

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.9-rc2

for you to fetch changes up to d1ef7a9ca867ab5c161d1647b2a8ec93a2ea155d:

  i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1 (2024-03-26 00:47:08 +0100)

----------------------------------------------------------------
One fix in the i801 driver where a bug caused touchpad
malfunctions on some Lenovo P1 models by incorrectly overwriting
a status variable during successful SMBUS transactions.

----------------------------------------------------------------
Maxim Levitsky (1):
      i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1

 drivers/i2c/busses/i2c-i801.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

