Return-Path: <linux-i2c+bounces-11013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CFABBC1E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59A3C17C772
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2126274657;
	Mon, 19 May 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iG4cuQcs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C2274674
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653207; cv=none; b=Uuec63DehwGY/r7HgSx8lh5E6kGDkZSefuXhHcenXqhYamYFPDqHRjHH5LpTEPW8qY7qP6DI9vGND2GNdkBzDzias7i2FNAuhGpeS35dx1zEOV+v5YF//w7nrXfm6u4Xqf6PhC0KJ8AJc7naYia3h1rbw9mgJ9l1iMtmDX7vccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653207; c=relaxed/simple;
	bh=cBSjJr4ZQRYMrNU29PScuZhxGS+QW9Aud4TqkRvrQHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9UnS85tduWmRF6vzdwha7GUTwq4lLqFDUA96KPERmB3UWRKDEGPP3OUACJDDpvm1VRlk50FBLmMSb7Q9SXIXtbgSoArBlXDe5Oa56p6tWCrYGykLT0QLoct2pz0tYuwCpqOmr8/b/AzlFMDzsXo9WikC8ZnTE1YwElQFxWVyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iG4cuQcs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=u4FUECbzDmIe3L
	q56KAKS2ibAoxZD68pfZmiEnSX4r0=; b=iG4cuQcs/I++nbDfxXwAzfpGjjFXGA
	uhCiMjXr3CYo9ts4yINOQj+6nQm/KRk1FZguZgapMNitxoEaPKIWqHWMJ6GqKyGp
	6sS0/klxjzaRdeIx2uBjE5KGrbeofS4VY6TG192G70o45wbdQqKihQxXr4qXciNX
	3MQEpVoxleIDUYMeSittfiV+Anb8Ge9yJ0PnXWddXB5P7mCkVDkte41gGR9mxYjS
	ZUakxFp4gJhwY7rwdwGUHFfMi969sojBirEmxcvSYvZoEs0A9ZZgz6H3UhbJHAMx
	0R1zF2iTWmbBmgw9b0cJRfu4SqcDWFs1Pwg3ndrAm9uN2wJ9ji3wiMRg==
Received: (qmail 2453668 invoked from network); 19 May 2025 13:13:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:13:20 +0200
X-UD-Smtp-Session: l3s3148p1@qUchOHs1dstZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/3] i2c: remove 'of_node' from i2c_board_info
Date: Mon, 19 May 2025 13:13:11 +0200
Message-ID: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I promised Andy to support him in his cleanup efforts, and here is the
outcome for tidying up i2c_board_info. It seems it was easier than
anticipated. But my scanning scripts (awk, coccinelle) didn't find any
more occurences and the build bots are happy, too. It really seems this
is all that is left to do. No complaint, though.

Wolfram Sang (3):
  i2c: powermac: convert of_node usage to fwnode
  i2c: use only 'fwnode' for client devices
  i2c: remove 'of_node' member from i2c_boardinfo

 drivers/i2c/busses/i2c-powermac.c | 2 +-
 drivers/i2c/i2c-core-base.c       | 3 +--
 include/linux/i2c.h               | 2 --
 3 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.47.2


