Return-Path: <linux-i2c+bounces-9360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D25A2E5F7
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2025 09:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E7DF1668A0
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2025 08:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43E91AF0AF;
	Mon, 10 Feb 2025 08:03:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E850957C93;
	Mon, 10 Feb 2025 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174594; cv=none; b=mGEsWH9y2ry9cFLB3Z/gcJRJ7fJS7ntJWNMDqjGk2rP7Ai+yC4TkmRc4fUVMqtKsZgKwXMEcl6so0/QahKw19zwca8PGYdmcLP0cqO57DzqzI9ChL+gbXGW2xbnlmuWy+dSG848usFu9pfy4nA6W1sRFIf3YAabXTRL8/9qxarU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174594; c=relaxed/simple;
	bh=jL/pEsH/rjvfPHDD6aA0E6boPhBCMlwB7mXQln+dGSc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YVDiavswIaLNgMICeyQhy7fbw2XpdzOZP8IHnR2zw/rqvs+QVEPYbsRY3io6t9pMl+kTu+FkDsCeTdAjkH1W+1PaW3MP/znYLy+NoHE23TnIbU9pSPDdg5Mwo0LPVMO0cU7xlIULArqDsaQLTNP7pdwJgQqFq+8I05D5NNVzCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 8B00060272A84;
	Mon, 10 Feb 2025 16:03:03 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: wsa+renesas@sang-engineering.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: core: mark i2c_detect_address noinline_for_stack
Date: Mon, 10 Feb 2025 16:02:18 +0800
Message-Id: <20250210080217.2772467-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compile with CONFIG_FRAME_WARN=1024, there can be a warning:

drivers/i2c/i2c-core-base.c: In function ‘i2c_detect.isra’:
drivers/i2c/i2c-core-base.c:2507:1: warning: the frame size of 1028 bytes
is larger than 1024 bytes [-Wframe-larger-than=].
 2507 | }
      | ^

Mark i2c_detect_address() noinline_for_stack to avoid this warning.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
ps: found this warning during running randconfig test.

 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5546184df05f..59983d2a9cca 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2405,8 +2405,8 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
 	return err >= 0;
 }
 
-static int i2c_detect_address(struct i2c_client *temp_client,
-			      struct i2c_driver *driver)
+static noinline_for_stack int i2c_detect_address(struct i2c_client *temp_client,
+						 struct i2c_driver *driver)
 {
 	struct i2c_board_info info;
 	struct i2c_adapter *adapter = temp_client->adapter;
-- 
2.30.2


