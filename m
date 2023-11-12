Return-Path: <linux-i2c+bounces-76-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D87E8FF6
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 14:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100371C209C8
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 13:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FB08BF2;
	Sun, 12 Nov 2023 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEkfg4Vk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990114A9F;
	Sun, 12 Nov 2023 13:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21078C433C9;
	Sun, 12 Nov 2023 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795434;
	bh=Xq/kzMbdpTOA74+EGlOh+LhuKvaYKKQT5nN3FI1YCg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TEkfg4Vkipt0lpod+cxCs1UUm0ojxghxNEPncUudRPU8088njuoObB/+YZz5O8FwO
	 l69MhKYUoq9pxtRHEKVXDTy4Ua+9/lwdhIGSdxjGuFBePShZAdzD5cWNS8WyCSrEn5
	 iwRGWs8KgDPePv0UiOyE0jZJOD3b07hRfrl2Kh0+P6cNtLOnSBGGQijv0cppifrB13
	 lNEks/mQDUdpnmE6suilU9WDqsED2hUc6W1yv8bCQQM5dsXq0t+EmVL6sQeVT41NAn
	 e9DKRnEoP2mfCWP7xeezF1WLpF4cVOXJlbXxZUkCKR9bbj8h17bfSqSinBukH9r3tD
	 Eh1rpqINqhO4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Lin <axel.lin@ingics.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andi.shyti@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 4/7] i2c: sun6i-p2wi: Prevent potential division by zero
Date: Sun, 12 Nov 2023 08:23:36 -0500
Message-ID: <20231112132347.174334-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132347.174334-1-sashal@kernel.org>
References: <20231112132347.174334-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
Content-Transfer-Encoding: 8bit

From: Axel Lin <axel.lin@ingics.com>

[ Upstream commit 5ac61d26b8baff5b2e5a9f3dc1ef63297e4b53e7 ]

Make sure we don't OOPS in case clock-frequency is set to 0 in a DT. The
variable set here is later used as a divisor.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fa6020dced595..85e035e7a1d75 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -201,6 +201,11 @@ static int p2wi_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (clk_freq == 0) {
+		dev_err(dev, "clock-frequency is set to 0 in DT\n");
+		return -EINVAL;
+	}
+
 	if (of_get_child_count(np) > 1) {
 		dev_err(dev, "P2WI only supports one slave device\n");
 		return -EINVAL;
-- 
2.42.0


