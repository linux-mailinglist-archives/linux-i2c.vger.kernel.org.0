Return-Path: <linux-i2c+bounces-2630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695B88ED2E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 18:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16C671F32AF1
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 17:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E3414D297;
	Wed, 27 Mar 2024 17:47:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AB1487E9;
	Wed, 27 Mar 2024 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711561631; cv=none; b=cpyBBUjIFpNYeEP0zSOVWRXQQkCNwKdEV8FaZabP1CqezfcKezzF7WstSyTOzCHFPZ/OgHa3PW6/TxNNNSV+pSR0nK/CusSnQN/ne5gRlHY3oNkZ09Wsz9AbC4hNORzHtw+b9Z/NESA4SAaWYfGNt7RLttFVkfVRGRI2/8cWJGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711561631; c=relaxed/simple;
	bh=ftACfzTk9Usno0HfT+4cbMwKmq05Nj9un0NkopgUgBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ILf+hQbkOi6Iookplz8BRxOV9xi1jZrm14daSimb6HaZNENJTwGEBPnLA+Si3AuwQpePJPcu4BCABiHVURKv8Wsam1BlomgKBaxqJJkIP8LXOTzYPFgvDcptl58qfd7f1avwEpqLeB9MDSIe+JqHyF48v2IT4ijBwON8GlBDGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6879BC433F1;
	Wed, 27 Mar 2024 17:47:09 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] i2c: viperboard: drop driver owner assignment
Date: Wed, 27 Mar 2024 18:47:05 +0100
Message-Id: <20240327174705.519535-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core in platform_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-viperboard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 9e153b5b0e8e..3784b07f5371 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -416,7 +416,6 @@ static void vprbrd_i2c_remove(struct platform_device *pdev)
 
 static struct platform_driver vprbrd_i2c_driver = {
 	.driver.name	= "viperboard-i2c",
-	.driver.owner	= THIS_MODULE,
 	.probe		= vprbrd_i2c_probe,
 	.remove_new	= vprbrd_i2c_remove,
 };
-- 
2.34.1


