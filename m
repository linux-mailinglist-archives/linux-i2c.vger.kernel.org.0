Return-Path: <linux-i2c+bounces-10792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E1AAA0B5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 00:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27574189462C
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704102949E5;
	Mon,  5 May 2025 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py9dPn5o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27945293B75;
	Mon,  5 May 2025 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483516; cv=none; b=Tb/dvIb42+Nj21AH/odBj+gqTSZr+O70SrwtKG166zZkiZ/a/7/NqnFkdI+Q9qjSs8MVIWMXCIkDlaNIsSZCbCePmQzZHBNByJFU0uM5Qxg+/mlKLTNBW72ZkqKE2N8+oSu4wYtrcjYHiptqzQQ99TRJ/azZ/jqsObjNTBX+zy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483516; c=relaxed/simple;
	bh=5XURNcV2GHmTB/0KWzy0nATv8ATS/QFnWDPK41G9beA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tO0kDR89FORWn4qU8iLECEE64kcfb4iB1PkwWuA9f26PPjmiSgYUumHAobTEBKEnBq9zfZz+qMtqg7m5ya9rFaADv9aMT5eJFWuUNmHQEYPBFCOHjY7ece10lItf7mHuSk05dFTha3bFfPikK5p5dkCOLSgej3G0hMYQDf/4zLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py9dPn5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234DAC4CEEF;
	Mon,  5 May 2025 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483516;
	bh=5XURNcV2GHmTB/0KWzy0nATv8ATS/QFnWDPK41G9beA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=py9dPn5oKgoALczjl5dYxjgq/77qYjvApV3PKYvDBuWXkQ98/RXmjOSP2LbA3YpDV
	 sV/WXPnPBrqmtMgTRK1PPKJN4FS1YBvvv7HWTbRKflSyfiAdf/l79gBqjNFCZLZI4C
	 swvcmPExOc3qMtIyN7Gynu1rmuPcQQ3UZ0ivYB01kdUhzw+IbHyE3QS6ka12o5dSLH
	 qFsXHGAsdKMzB2yCz0Ec+h7ceAS++kZTUdwNW/kynq3ysW4IldPGcWsU46HpG9J/X1
	 CAsjb32NBkt1p3cmQfM8H/k85+g+ZkUvdp58W0jzLKDG98WWeJOWY94e7WSP71EW+R
	 J2/FXbt1v7Puw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shyam-sundar.s-k@amd.com,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 091/642] i2c: amd-asf: Set cmd variable when encountering an error
Date: Mon,  5 May 2025 18:05:07 -0400
Message-Id: <20250505221419.2672473-91-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

[ Upstream commit b719afaa1e5d88a1b51d76adf344ff4a48efdb45 ]

In the event of ASF error during the transfer, update the cmd and exit
the process, as data processing is not performed when a command fails.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20250217090258.398540-2-Shyam-sundar.S-k@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 93ebec162c6dd..61bc714c28d70 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -69,7 +69,7 @@ static void amd_asf_process_target(struct work_struct *work)
 	/* Check if no error bits are set in target status register */
 	if (reg & ASF_ERROR_STATUS) {
 		/* Set bank as full */
-		cmd = 0;
+		cmd = 1;
 		reg |= GENMASK(3, 2);
 		outb_p(reg, ASFDATABNKSEL);
 	} else {
-- 
2.39.5


