Return-Path: <linux-i2c+bounces-80-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06E17E9007
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 14:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACD4280DBB
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C758BF4;
	Sun, 12 Nov 2023 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sydTs7YZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C16111BF;
	Sun, 12 Nov 2023 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFB8C433CC;
	Sun, 12 Nov 2023 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795486;
	bh=bLEEQRy0ruNhv2+OyXHuZ6I30HdiPO+33fSao6p0PUs=;
	h=From:To:Cc:Subject:Date:From;
	b=sydTs7YZOECHdK84a5j0dQlapb+Gi0lu9tM+aQn8D4ohM/gv+CbLG2Lfjn8RpFnNV
	 kIsIYJ00JkzrTHc6EsYJpWBRnOnRI0IpyYQ8oC8XJr4FhySjsgwbuHtF7Tpez9DUJI
	 +qh+HDmVk62fqNSEHAWhCH96MlpqTOn/sDuQwp/N1B0yztqviiDU8NZ0+6mJQv/9IL
	 3oHZZzj7hvGKygioizjlHBiZhXbvS8wpWLTg+uj836c6mLu3nPQJAWBCbTzaatSsxD
	 TA/tPzK9bCdynofSua1MVMfyGeUEnFpMTigs3SQGabF5808dGpaHTk/Z2GnoNrmV6d
	 T5WnLZg7EfYLw==
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
Subject: [PATCH AUTOSEL 5.10] i2c: sun6i-p2wi: Prevent potential division by zero
Date: Sun, 12 Nov 2023 08:24:42 -0500
Message-ID: <20231112132442.174812-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.200
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
index 2f6f6468214dd..4f7a4f5a1150a 100644
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


