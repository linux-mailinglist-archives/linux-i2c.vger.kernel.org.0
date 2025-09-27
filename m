Return-Path: <linux-i2c+bounces-13243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5EBA5DEA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 487A81B226AD
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA19E202F7B;
	Sat, 27 Sep 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szHCtQMr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987EB28C5DE;
	Sat, 27 Sep 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758969907; cv=none; b=acnPYjfHdTLd0+FF+tmmxpRZCt1trsCzBnkk/yepFSCrEKYmxKY6z9v+CVzI4cpTefOty9bRnyU428yHEE9bQy0mBfGkDHlXtDizjMjqyV89OcOAndznipC50dpdOHvt5r6kVdNUY+gWVgdFdS95aHGj9Nz8kPeHS7l2SbmSjYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758969907; c=relaxed/simple;
	bh=hw5PQZnbjz8yyE23U8GGenwbSKEoJO239bLpat2s2MI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEUFLlZk7Hf5tucPVzdTm4BMYK4jxY6BSDHKlJQPf6ENPGfJVxWG4mR57hJqw3nljSyV+brtl/UKtdiKcMQVG5BRmGfgF/gxe01uiorHlC8j248tcdiUlAO+DTQ32WHrtmXJ3g8MqRKFds6sV7EyamUMQNWdbDqj1MQZTyynf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szHCtQMr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B8AC4CEE7;
	Sat, 27 Sep 2025 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758969907;
	bh=hw5PQZnbjz8yyE23U8GGenwbSKEoJO239bLpat2s2MI=;
	h=Date:From:To:Cc:Subject:From;
	b=szHCtQMrWvLYM7aAOrzFJpPL6tCPy4TancUw3z4fZgDnu9CqHd+DlfLTEdTdQNMOR
	 iPNZm7uz80EDfcN0BmBCsnrMKW6rMrNxjIUnjuPAkPCgeuT8qqKS+KU82V9byATWqT
	 LIMwuUMIFhy0T3O6OZIucgHhHtBV3RTkZ2it4cj0lbmdh0WLq/pYNTdCX0llCv23Hf
	 h+3TchbD0KJPhUPA1bQa8HP6hvYDV0JutZDPtWvpfQ/rqcoEqWzuo93a9LfroJ7UnY
	 Xb5UPWaV70f9qz9YYklwTRtL2hnGGWO9Opm/+BM6TdTLwt3zkV8SZCv9B0WY5gwxtu
	 5dabmeMlgE41Q==
Date: Sat, 27 Sep 2025 12:45:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.18
Message-ID: <4osuv4vajewmcpgl5sqnea47addwsrm7nfl3s57ymwv7vaxade@unuwhsw4ccnx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

this merge window pull request is rather small, and the blame is
all on me. It has been a very messy period, leaving me with
little time to look after the patches for 6.18.

That said, I now have quite a bit of work ahead, but I am
confident that with the next pull request I will manage to slim
the queue down.

For now, I hope you will not mind a second part of this pull
request, where I plan to include the most obvious patches from
those still in the queue.

Thank you and wishing you a great weekend,
Andi

The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.18

for you to fetch changes up to 217f92d91c9faeb6b78bd6205b3585944cbcb433:

  dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878 I2C (2025-09-25 02:06:09 +0200)

----------------------------------------------------------------
i2c-host for v6.18

dt-bindings:
 - add support for MediaTek MT6878 I2C
 - Drp[ support fpr S3C2410

----------------------------------------------------------------
Igor Belwon (1):
      dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878 I2C

Krzysztof Kozlowski (2):
      i2c: s3c2410: Drop S3C2410 OF support
      dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml          | 4 ++++
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 --
 drivers/i2c/busses/i2c-s3c2410.c                               | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

