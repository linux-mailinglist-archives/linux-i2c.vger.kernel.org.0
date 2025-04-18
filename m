Return-Path: <linux-i2c+bounces-10478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AEDA936F2
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 14:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8F61B65CB3
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1C62522A1;
	Fri, 18 Apr 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjvk5QoY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F91B4145;
	Fri, 18 Apr 2025 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744978728; cv=none; b=NgppPqCwClqm1Lq8gXr8P+16vAw4LweYRdA627YrH5QASpkucRFukWX6hn4+zy+vNbIZpeRWwBJGevCg7BOIuz70tgfT2a4gCaoEPKuPSte6w7YOA+ow85SjbwL69X1htsp8wephjAfa9woIcD0z2R+H04S6ZWRkQ1YgouILrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744978728; c=relaxed/simple;
	bh=9SK70E7929mT6SYZygI4BwxZ2Vh/2y0vyBLbyfLsegA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtA4bm1BRv1SaJ2rWAIF8pqFweDpgbPg8dOWHF3kIGDcULXXBS2IywVeu8FYUDwvTnH4+/yZKXJm8xDkr29IMYwAtaprTqvmtVDYQEnqzlM50tyPAjyLJM+XVKQa+ZK+8vDtLSmlU549lN5d0BQNz1LKPgKec4+WPf3Ae1uq81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjvk5QoY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C034FC4CEE2;
	Fri, 18 Apr 2025 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744978727;
	bh=9SK70E7929mT6SYZygI4BwxZ2Vh/2y0vyBLbyfLsegA=;
	h=Date:From:To:Cc:Subject:From;
	b=jjvk5QoYQOkxdCHXMhTrvXH37XF8cEF4CFCvpMeDDlr9zk+uf9g7mngNtH1u2nm8w
	 5gmtOd48jSHIWeamx107cep58/QEog2nhfIv/QrNY15YdF/0fDW9rrx58mG5s7SeRi
	 p2OhO7X+L6L6Rq3dtjwJnp3+g1LgW+ZRsFfrPp4cBiW/+BS509i6NLzvtZRW8yoNpQ
	 S6MmDLmUfLHBHhBFAOfWQTidCUHf5xDRkiLDkvL5xhhRja5+VAmR8upfRY7Yg9qe/Q
	 ola8y2MMe9kdfxA+9mr939xrL2pdvZSW2JPrUfUtFELgjrM8PvIPButhhy9FQ4rt40
	 G02O41kIFLv7g==
Date: Fri, 18 Apr 2025 14:18:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.15-rc3
Message-ID: <mtqiyp7mtyuivs7snzfp3dcinr2u5jw63afxqto4s2rnqe6nyc@ozaxoxvtvdxt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

one fix for this week which prevents a potential NULL pointer
dereference by adding an extra check in probe.

Have a good weekend,
Andi

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.15-rc3

for you to fetch changes up to 424eafe65647a8d6c690284536e711977153195a:

  i2c: cros-ec-tunnel: defer probe if parent EC is not present (2025-04-13 21:33:44 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.15-rc3

- ChromeOS EC tunnel: fix potential NULL pointer dereference

----------------------------------------------------------------
Thadeu Lima de Souza Cascardo (1):
      i2c: cros-ec-tunnel: defer probe if parent EC is not present

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 3 +++
 1 file changed, 3 insertions(+)

