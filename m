Return-Path: <linux-i2c+bounces-4241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896069132D8
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 11:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B37ABB22273
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 09:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9720214BF98;
	Sat, 22 Jun 2024 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5Qb3/jX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954F1422B6;
	Sat, 22 Jun 2024 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719047636; cv=none; b=kmQEGXkPAZ2VnGSwOafdDFQFJIuQIsymu4dpoACoHf37KxE11nIdHM5cOW5aTsfIAbvWlTNqrb4G+QPWjA8pLQOIIYowTT+4TvEvWfA75VJpITvbXNxIA6QC/c+4CC1Sw9L9QUQyOQjiWHpped12k88ydddNX+OxRZyZmKx7wXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719047636; c=relaxed/simple;
	bh=SZd7ny3EirRYRxhj56AZwQV6SXfI4sHhKeyspS8X6zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJResyRU6qFHffRzsNcDkczu6Oi4ILx0WLCQajpoKWU24u03zN/pV3+EkJTCxWdcxu1aj/ohvRkXgJlhR8dffeWq1BbzD5cJx1XwrLgeC84UZM/Hd4s3lpX8TS4G+gobDXJvQXSBZs8l6UBoz9y5aplFTc9hIfSYw39gJI8cIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5Qb3/jX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F28C32781;
	Sat, 22 Jun 2024 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719047635;
	bh=SZd7ny3EirRYRxhj56AZwQV6SXfI4sHhKeyspS8X6zQ=;
	h=Date:From:To:Cc:Subject:From;
	b=o5Qb3/jXa9vGgu5KgPKMF07mi6u4KmUFCkkCN6HiJC2BWapl1BV8EZDKyddUD+FNz
	 bvfpib++YJUs7csg+LQkkOQDcXr+XondzzV6gwz3dLdx1RZOLT9AGGV3l1fSRxJTyN
	 qiVu6nG1LtMB4i0nIau7jKC0TV7Nu/3wVGNnmsMUgt2m8bUhYS+E3P3yhtBQiBsN8+
	 YP5OqWOvrTCSX63XxJ7MsQ+KvPRH9fVSg9ck43DUgU7dGg78w8nzwGLga5pd3jZHx5
	 9p5WS3iS9eTvHYwOba3cg/DBE2RK5pmPr4RkNt90bub0/fv9sF2JZ0izr+Rr5ZFYr3
	 pDPT8XxOTR6Ug==
Date: Sat, 22 Jun 2024 11:13:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Grygorii Tertychnyi <grembeter@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.10-rc5
Message-ID: <z26bzagsktppxbftswcocv66a5xmx6kbxn3ui27qq2iie6z2mo@r22mkxmxwfu5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Sorry for the late pull request. I wanted to allow a few days for
testing this branch, which has resulted in a Saturday morning
submission.

Thanks,
Andi

The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.10-rc5

for you to fetch changes up to 5a72477273066b5b357801ab2d315ef14949d402:

  i2c: ocores: set IACK bit after core is enabled (2024-06-21 01:17:43 +0200)

----------------------------------------------------------------
This pull request fixes the paths of the dt-schema to their
complete locations for the ChromeOS EC tunnel driver and the
Atmel at91sam drivers.

Additionally, the OpenCores driver receives a fix for an issue
that dates back to version 2.6.18. Specifically, the interrupts
need to be acknowledged (clearing all pending interrupts) after
enabling the core.

----------------------------------------------------------------
Grygorii Tertychnyi (1):
      i2c: ocores: set IACK bit after core is enabled

Krzysztof Kozlowski (2):
      dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
      dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml         | 2 +-
 Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml | 2 +-
 drivers/i2c/busses/i2c-ocores.c                                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

