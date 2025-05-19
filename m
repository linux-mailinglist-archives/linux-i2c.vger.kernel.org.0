Return-Path: <linux-i2c+bounces-11014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13115ABBC1F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E093B6562
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3581135961;
	Mon, 19 May 2025 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iQVH6dK/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF7274FDE
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653208; cv=none; b=DG3/koia4VsVGfY6NGJ+xdHQURtvhnhzIG1wUwfRZI4iGc25+I26WOiPeXW4kc6KAggq1Duh1jCYiqDkM0yqKBQcqnAoche25Z4s03f0PvxygsiZ8fTjVNgwMn3CbM34+IVANSLnLuVhNUJ6aJHNRxe7b+eplSolbSL+irEVoKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653208; c=relaxed/simple;
	bh=RTRj09vqetCc3R5wOnxeYoFWLM53HNJJTbv6q9syoCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOknXwOl3A6gBcSC/2VwFosSj1zDj20SLFBHtVgQAW2V8CTs2S0n9nrVMiz4P9WKgFbI7L/soOWmPe/2Z9yDMyTJ5mNIl69TqszJRWvmZC1NnuhR2igODJKJCEwp7jX4EZVFRAJLPcAdOtTUgpT43ciAevEHqDJR3Tb2Bd/kIxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iQVH6dK/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=i2BK8GIpTb62nl2a+Wd6Fp6A8rDO1DQatwQW1+PcGs4=; b=iQVH6d
	K/KsgRy4ml0cRvW2RZSRYp7rb4qJjPWVLGIMOrppwfRFJGpo6Bm5ZHd+etGQh2mH
	06MTuH083qq8UfYqVl+A2SY1+LaOUAR0hTfucW8btrG/d/9sRTxlMr3262PlMaUW
	MooG6XH13EK/5FmJyi/PrRNyylEfjVWi4G6JRQwEiQuCEgyv0ecn9rGZM4ngUbfi
	Qy3gWOwr8217Utw476TAcD6FBIFJNm5RtYs2XaRzxUl2HgGdgAQ0dMBIg5w22au5
	76OrLKvDUhK1d1lcW4Nio0tpRrcG/XPLxBBe9tm1otJq83tNHJWJZzi825h4KQcn
	sgApZx7wEnCvytKg==
Received: (qmail 2453768 invoked from network); 19 May 2025 13:13:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:13:22 +0200
X-UD-Smtp-Session: l3s3148p1@WO9JOHs1ft5Zz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2c: use only 'fwnode' for client devices
Date: Mon, 19 May 2025 13:13:13 +0200
Message-ID: <20250519111311.2390-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No client sets 'of_node' anymore, so we don't need to handle the case in
the core anymore.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index dc3c60a7d382..63ffde07a143 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -961,7 +961,7 @@ static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
-	struct fwnode_handle *fwnode;
+	struct fwnode_handle *fwnode = info->fwnode;
 	struct i2c_client *client;
 	bool need_put = false;
 	int status;
@@ -1005,7 +1005,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 
 	device_enable_async_suspend(&client->dev);
 
-	fwnode = info->fwnode ?: of_fwnode_handle(info->of_node);
 	device_set_node(&client->dev, fwnode_handle_get(fwnode));
 
 	if (info->swnode) {
-- 
2.47.2


