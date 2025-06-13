Return-Path: <linux-i2c+bounces-11407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F22AD88B3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 12:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D8B3A6B1E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 10:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92128291C23;
	Fri, 13 Jun 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLjZ7RqV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13A189BB0;
	Fri, 13 Jun 2025 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809028; cv=none; b=ca22Zwy1c0ZNFoFbJt3XYM0Aqr0Db2R0s3O3iZuxPp4Hkj3bT4RYvH5imOGSwNDqCwTTpmseq+PUiEianhbLW+XrkvfnsEASNrt5sJuc516NUfVXpmDzs/Vnh4xVGD2OoYdL1mHEZ29/ycU2XRZelKsxshdnDHU1Vrb5Rh+EcQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809028; c=relaxed/simple;
	bh=x2z9TNH4CJ6g0WVFqhT43lA+FO1oVwNYxFdJaa2w0Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EeJgWokb+iLRgjczJmcGX9YRv4Ib01W5zFeEWZQhTp+yqOq44e/gtGdJMsCXDdxk2QxycciaTVG3hezea/f4n4Q2UBBPxuhkNEImkZJiP0QrN6d1qyNr1JeE0RIBshV/+utrB3B9ZVmtjJV7nOsOoF9B/b1kdo2Ji/+bQBJe78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLjZ7RqV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08479C4CEE3;
	Fri, 13 Jun 2025 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749809027;
	bh=x2z9TNH4CJ6g0WVFqhT43lA+FO1oVwNYxFdJaa2w0Cs=;
	h=Date:From:To:Cc:Subject:From;
	b=MLjZ7RqVgpjPdPZk7OokU2ryoPm5L6kAjgyhEi/ItkEcHPbmxBq8VMprHfdOA6BXB
	 v09aOk1M2A7+t/5cN8i6777Ydf6gx0MqPgoGN/dLikGFYHC9vlV5GulPYJJH7XZsUi
	 QeBIHYoUXifcl7JLV3KFgy8Z3iOxf1qis0QqCIDXsaMJiWOUnJ6VCwiUgRVxEhAN4g
	 GXz9d+7M+KRwXNlQf1SXvYAO+9vXmiS9G9IQ2GbSbGPAaNyEZ2ZyYgInYfl4aqoBVv
	 gw456abo/2KIPGst+pX+Q05d+SnvNskV+fdi/BN5P4LL69gL5pS2/GttNNBj4/Px8s
	 +KQpTJyMgBiCg==
Date: Fri, 13 Jun 2025 12:03:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc2
Message-ID: <sihm5iy2rnldcrk3zyh73kp55r7zywvraycgijtihh27yu5uny@zaj4w54t5ywc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

I'm just back from a short break (from the mailing lists).
This week there's a fix for a previous binding conversion to
yaml.

Have a great weekend,
Andi

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc2

for you to fetch changes up to 903cc7096db22f889d48e2cee8840709ce04fdac:

  dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties (2025-06-12 02:58:49 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.16-rc2

tegra: fix YAML conversion of device tree bindings

----------------------------------------------------------------
Akhil R (1):
      dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties

 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

