Return-Path: <linux-i2c+bounces-9096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD63A11AEA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 08:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D08F166F34
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 07:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCED41DB12F;
	Wed, 15 Jan 2025 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PCiqYn0M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9161DB131
	for <linux-i2c@vger.kernel.org>; Wed, 15 Jan 2025 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926206; cv=none; b=pZxCZp1faAkSHvVgbapls9o9g6MKtSexk154wQbNQPLJNggKouBYAyToNzJm5kDXlRUpeK63M+7nPGHJkirjUoDBxkJYDuhA4MSSQaGeF6hoOGk4WcW7QZvW0GM4WkCmGhhIliryG5oo0iBh0ozHhR43uFoh+UObd++rTxxhDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926206; c=relaxed/simple;
	bh=fqHdlM81pAjC9kssjHu+5HAZ5MYlUa9ohh0Cr6CpAI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f7HegV/M7G1nYu4+TZLt5CugcqY2Nfve2QVA15BU0m0vhpVkc/WblTa8OtAyx44wYslQpJz/JA3tUbz9qIJVRD/p5Aifw8N4dHaSZzMnOi5aqy2WG8oA8qbPSJ5mEnvRzGI4FwKfNf4ilP7KW2yTbl1P2HQMcf2FKjGa1JPHcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PCiqYn0M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=5MCethZUGJhsRh
	AbcwWU4QElDDNIkMmKLXXfYzXylSg=; b=PCiqYn0Maks2MevtNL/F9DVTKf2zUu
	KX9Xfbdcmixznyz5QxE+9t2siphCkbWy5WFAjDBtG+cfVbVl7IGPS6eBwN15DmiU
	d6wxhnm9aziNgKUxjlfAYel5Gse5QrDee8WITfatptHP68fPbAs9I+Trl9s7aA6t
	t+nBN4PvA41m9eEbSpo+fNp/jmJkmLcp69UVEGbDfN59lR/uKffz/yiaY4g0Z91j
	VsFnGrxg/6WtHN0iR+krxMIsGvkhOSos5X+CW3+7HJ1GUSj2kgqRDpiAXjH7v598
	Q7d0rb2NZrPN6szzbilCJLPSU7agjzT0UaD5TB1Ysm42d1aBwLz1/JzQ==
Received: (qmail 461188 invoked from network); 15 Jan 2025 08:29:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2025 08:29:58 +0100
X-UD-Smtp-Session: l3s3148p1@+x0IpbkrXqgujnut
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: mux: demux-pinctrl: check initial mux selection, too
Date: Wed, 15 Jan 2025 08:29:45 +0100
Message-Id: <20250115072946.7688-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When misconfigured, the initial setup of the current mux channel can
fail, too. It must be checked as well.

Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Renesas Lager board (R-Car H2).

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index dce18f763a09..b204e5a21ce6 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -261,7 +261,9 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 	pm_runtime_no_callbacks(&pdev->dev);
 
 	/* switch to first parent as active master */
-	i2c_demux_activate_master(priv, 0);
+	err = i2c_demux_activate_master(priv, 0);
+	if (err)
+		goto err_rollback;
 
 	err = device_create_file(&pdev->dev, &dev_attr_available_masters);
 	if (err)
-- 
2.39.2


