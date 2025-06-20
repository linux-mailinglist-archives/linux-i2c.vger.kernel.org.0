Return-Path: <linux-i2c+bounces-11540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEDAE2021
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 18:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999321BC32F7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 16:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0F42DFA57;
	Fri, 20 Jun 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws5pvKWu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166F9E56A;
	Fri, 20 Jun 2025 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437218; cv=none; b=jiXCV7ySgiR0dMoik9yL7gk1oyHxBXGf1bXz/UHCNNdRP6ZHVNE/zMg6rOw3qfzyT+Eq585RwxXhf+dSFRIGR9OgWt0ZNI4a8UlwjeE8FSaWQAncJpcaI4uMNylpcgfkbLhAez7l+jJar+gvieCyVPFKrY4tOQYm1md/0soGkLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437218; c=relaxed/simple;
	bh=KMmUyUrthx1VCXi2f1CfdD7rwl7kJAdZRcWxhQu7GNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BweBkLzM68VF/DEtr+2uDsWSZ3JWm8nuXn55a2hJ1O0O05JAiDRswARNqsM8YjgKNtsa74pIy/i/npIZQ48426qWRnnDlbVVWlZ7ttbJchlX8LM0tKcDwS4tqNw8tZmGcWuUAqHn3AU2zaiAtRp5GYo2wKeTX+FBkFutF/ZRrB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws5pvKWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3225FC4CEEF;
	Fri, 20 Jun 2025 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750437215;
	bh=KMmUyUrthx1VCXi2f1CfdD7rwl7kJAdZRcWxhQu7GNw=;
	h=Date:From:To:Cc:Subject:From;
	b=Ws5pvKWu35c88ITwEsIlVLziRz3e+7sdhYRyAeFdG+b+vK9aTXq6t337fAPoSwo0E
	 70nfTB2pPw1RhQcBLTGqfKbEa8eE8r9NWTcKYMC3xzFpfPnupi0Iv/uOBVOuir10fa
	 9Be/B5XfF16krUbpfNX3tfp1gfLlX5btA1T4yLgu7Lis/SnKsh8b/GRfMF/VArL8Jf
	 iagFrMX+D12MKZitdemmuztuzXy+lT3w5S0DVDPMfyPyhdHBvrNFQ145OsVurwKVKB
	 mmIyIe31fudC4ezRTwUpbWtil1cSWgop8rjMyM54YJ+NsTTXUgaVb5Tc6gS3L+vqno
	 ABzWWVecJHkTQ==
Date: Fri, 20 Jun 2025 18:33:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc3
Message-ID: <rf6vyyocdxdtllhsydpbj5pnaptfjlagsqumblg7ysqby3k44k@mmcwop7nfbqg>
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

I've collected one fix for rc3. It’s rebased on top of the latest
patch you merged from my fixes branch, which in turn is based on
rc2, so there's no tag for it.

I still haven't had the chance to read your naming conversion
series, last week has been quite packed. If you feel it's ready
to move forward, please go ahead. Otherwise, if you can give me
one more week, I'll make sure to review it properly.

Thanks, and wishing you a great weekend,
Andi

The following changes since commit d88d96c79919ef615e6055b77cf8e191b214ed3a:

  dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties (2025-06-17 20:10:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc3

for you to fetch changes up to 941af7ffcbf5503867da2319d2b6a7a188c83b1c:

  i2c: k1: check for transfer error (2025-06-17 23:58:22 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.16-rc3

k1: report the proper error in case of i2c transfer error

----------------------------------------------------------------
Alex Elder (1):
      i2c: k1: check for transfer error

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


