Return-Path: <linux-i2c+bounces-5246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFDC94CEF8
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 12:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87799B20A11
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 10:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6651922F7;
	Fri,  9 Aug 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQxSwJ8M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8991922F2;
	Fri,  9 Aug 2024 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723200837; cv=none; b=LD/aEgtAG9S2uRBdvjglwTEx/FO9u+hbX71K5a9DbFyl5xfFZ4GNFvXT/J2V7/HKppzrpDrzoPRgj/Lr89UQFqSZMSSGXE+Ldm9aC+PV6aFYtK7/Hu3hcvL6HeEMIu9bPxn1gw16vP60A4ILZ4FNECziu2I/OmMTMCyXaw+WWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723200837; c=relaxed/simple;
	bh=DataimYbMFvoLh4roh/y8L/IJ46bJyE/0LG9N37Vcbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AfDr39QvM50H9gHOz3dN3pw/u6idVycjkxvYm96Qos2zFipmaJ9pXt41u+Nv9fLaiyUewd11qEVqGKgh19jEukzayCAZyET9IeOC3f+6BBoEp+y7maJAsODwtN1VD+mNeGknQHWiOA02BwMr0t8T5h6u56KsOSH9GeQrkBuBq4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQxSwJ8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95302C32782;
	Fri,  9 Aug 2024 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723200837;
	bh=DataimYbMFvoLh4roh/y8L/IJ46bJyE/0LG9N37Vcbk=;
	h=Date:From:To:Cc:Subject:From;
	b=UQxSwJ8M09tKSmL7JikUpdUwtOeQIlUVVQHvFgHqkHWiKw6+FrC3DxR3UPzr3EQF9
	 OJcny67cWs5hQ9Go1SgRcO31RjU4ADpW/Xj6GxmQNLadlwfnRN9e/zm6fsSDZlZY9p
	 EAFzaZ8lRMqqsP4eOGWUHKYgOWcjpoL+odTFDwrikcikOtVgfKpOJoGWT8mwyaq4XY
	 Oac/yLF93ciDBtLckX3DCdPYWeUjwq1/sv3733ugh64MW3Y7QKOYjWXyi5UFjn3tA5
	 ibwCm1dGP9IPqsk+EnQ/t5Nz/oRAf7VwXvfl0FkCnrjW5T+y0CRUQZ4CKFNIypkjH4
	 8VXtab/NELo1w==
Date: Fri, 9 Aug 2024 11:53:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [GIT PULL] i2c-host-fixes for v6.11-rc3
Message-ID: <3oxrthtenkyypr5pqpduxyndw6wxihn24s67p6ppogkcdd6mjd@s5pg3swp6flp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

two fixes from Gaosheng in this pull request on the Qualcomm Geni
device.

Thanks Gaosheng and Vladimir for the reviews.

Wish you a great weekend,
Andi

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.11-rc3

for you to fetch changes up to 9ba48db9f77ce0001dbb882476fa46e092feb695:

  i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume (2024-08-07 01:12:14 +0100)

----------------------------------------------------------------
Two fixes on the Qualcomm GENI I2C controller are cleaning up the
error exit patch in the runtime_resume() function. The first is
disabling the clock, the second disables the icc on the way out.

----------------------------------------------------------------
Gaosheng Cui (2):
      i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runtime_resume
      i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume

 drivers/i2c/busses/i2c-qcom-geni.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

