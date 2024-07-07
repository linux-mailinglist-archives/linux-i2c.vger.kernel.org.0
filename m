Return-Path: <linux-i2c+bounces-4737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD20929716
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 10:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7006AB21271
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731FF10A14;
	Sun,  7 Jul 2024 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LxXPRCEr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63387182B5
	for <linux-i2c@vger.kernel.org>; Sun,  7 Jul 2024 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720340943; cv=none; b=NRkH2OThCsKV43QztXic0ureklJQ+I5ea1HcNL+WBQ3CzvTSIn97QpbMuPe+KW9p8twOLl9REl3ZXWEyBaVQaEsWXXGOK4nmHkN4jY/WP/8Tkmuih/O9bbSbNJ9JyXYXm5lrHhYGcDt/6PpXM0jYlijA2HNIn0mqZziXMtEfwwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720340943; c=relaxed/simple;
	bh=J4G82IpKgYXtLJX8foN16NvIY5zG75CYcZVm7pJ0HpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R5moeCDCSXZQjFLHTSb0/nsnOlUKj0MG00LP5QcHWh4isVlvaGBvaKGs6AgYJ7RGmeEc5lbEl+f8tpFXIUWTFiMn3lv/NY+6ZBlKViMh3Gy/YakZ9OiOnkFAeflBpuTc6JcxRiYo+VO8/IrpHWvbD9LSGedJhoeTifipcNfxMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LxXPRCEr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=xA/Egzr9x+pcBo
	x+pS4WhaFPbyfsa6cSKT2typfQe8o=; b=LxXPRCErlaTyAVE3qCudqF/709F2ht
	8ggUdB5oEQtWHTaWAnLjPG2OerJrpmjEdRedcE2O4IqmcFwMUjSFo2gKZi5zyL+R
	v1nUAHpTd6RImiSlulOY4/exPHmKlb3IwXiNS30M1UwpRss6KddIstRHBxxcUMb/
	5yjHJc5aPJvBfkdLMsP9tYiNBIyv3IwxhxXj4eENimJP2RT6PvlufOipZ4L0aazR
	+8M4qKuiRQ4r+arxPv6AjbYckzGOhbs0KedSvme/BPM1MFejwLCs+sK8TVij/8Vj
	k7vSaAHSdMO0Naa29pDTw/SqndF25Pnqg5P4LgmKRQFTYPq+bsXkOEKQ==
Received: (qmail 4044161 invoked from network); 7 Jul 2024 10:28:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2024 10:28:56 +0200
X-UD-Smtp-Session: l3s3148p1@DLhoFqQcPJRQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i2c: rcar: avoid spurious irqs
Date: Sun,  7 Jul 2024 10:28:45 +0200
Message-ID: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks to a report from Dirk, the first patch clears a window in which
spurious irqs might happen in probe. The second patch makes the
detection of spurious irqs louder. The third is a cleanup found while
developing this series. The first should go to for-current, the others
to for-next. No dependencies, luckily.


Wolfram Sang (3):
  i2c: rcar: bring hardware to known state when probing
  i2c: rcar: WARN about spurious irqs
  i2c: rcar: minor changes to adhere to coding style

 drivers/i2c/busses/i2c-rcar.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

-- 
2.43.0


