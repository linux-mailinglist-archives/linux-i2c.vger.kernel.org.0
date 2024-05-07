Return-Path: <linux-i2c+bounces-3461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2578BF077
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 01:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02271F21754
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 23:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6A13173D;
	Tue,  7 May 2024 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojzQ/Y6x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BBF7F47B;
	Tue,  7 May 2024 22:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715122761; cv=none; b=UxulFdzHvhrbr0TaBRCYQVcVdu4UIM+fR4T6YKv3Dk3op4Q2LtBk6raGVixZ9Wjr+TDuyV4R4aj56gZkVbfL2FTrG70nfCjRL4LKP8sXBCqPG9cXgowGiYLi19+ttEVqP+ePM3GpT/FoOAleon5H7wmV/tzF8co1PH7mNCpF6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715122761; c=relaxed/simple;
	bh=bL4XKiUnUUaRqwqCTfRC4UYc4MVOEGrNjiGCqnrmDpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrR6UFWY+P8csC1Kxws2j/bN8Mg7b4/Ptm8VC414dH8TQ2yQplyKiyksnLG/XNedPSFQsWuDu3TMdjmydcAK6CWv3YXj5jFfBtwkX+4lFRNnSFqoB+zBWpRrZnuSdqUVAr/5afQEpFfGquo1rd3awEMS8YavaKYvthgeM2+uwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojzQ/Y6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB10C4DDE0;
	Tue,  7 May 2024 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715122760;
	bh=bL4XKiUnUUaRqwqCTfRC4UYc4MVOEGrNjiGCqnrmDpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojzQ/Y6xl+D+j6GtYz7zXXVF6F4ceoPfqxDQUrNTsw68y9mVV0N60L4MUgQn8DOOP
	 WLLaCOA8gGLY6nHIcLbwh+9kessTCN47G7MlANtWtWyPkBLf3xBji1pJtvZBUJ5w4c
	 x0siKqa9HbZAfci2AdWISNEqkqVwMslly76+4OlMp8lQWQ2suSXKPVeESDDDHV0R7I
	 JR+eyUDgQAEZ+Is6XWw+6Mn9BFWTknOvPZaIfO7QDZNzoJwFANOJOZuFiZOpVEIRvo
	 lynzTfgBNu/GTgLyO0BOr2dibsw1FGeXx1Mt9jEYTH2gOQHF6whSDAmpPykDTlR7z+
	 IL1JGi4UkJKHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	gupt21@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/19] HID: mcp-2221: cancel delayed_work only when CONFIG_IIO is enabled
Date: Tue,  7 May 2024 18:58:27 -0400
Message-ID: <20240507225910.390914-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225910.390914-1-sashal@kernel.org>
References: <20240507225910.390914-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
Content-Transfer-Encoding: 8bit

From: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>

[ Upstream commit 3cba9cfcc1520a2307a29f6fab887bcfc121c417 ]

If the device is unplugged and CONFIG_IIO is not supported, this will
result in a warning message at kernel/workqueue.

Only cancel delayed work in mcp2221_remove(), when CONFIG_IIO is enabled.

Signed-off-by: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-mcp2221.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index aef0785c91cc2..c5bfca8ac5e6e 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -922,9 +922,11 @@ static void mcp2221_hid_unregister(void *ptr)
 /* This is needed to be sure hid_hw_stop() isn't called twice by the subsystem */
 static void mcp2221_remove(struct hid_device *hdev)
 {
+#if IS_REACHABLE(CONFIG_IIO)
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
 	cancel_delayed_work_sync(&mcp->init_work);
+#endif
 }
 
 #if IS_REACHABLE(CONFIG_IIO)
-- 
2.43.0


