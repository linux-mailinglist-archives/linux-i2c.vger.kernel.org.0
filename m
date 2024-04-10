Return-Path: <linux-i2c+bounces-2852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F989F096
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D39284705
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01F9159598;
	Wed, 10 Apr 2024 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bT56KSqE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358C15959B
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748310; cv=none; b=tgT5UTnrmbTahCMe7NxMAllfHrD+UwKwV01tJVBg28hNxQ26k7VjiGfD6b7jreiiMyJg3xKWrarcElaS224yD4qFcSN/BmL/wi5Q6MnIh6dtBYxvHxO4bUdKog7BYlv4phvcKCg1b9r/iByT5Vq1UY7zdHTxYmGzBH2Bhx7SMQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748310; c=relaxed/simple;
	bh=rML+54KQxwJwfHqQB1Xs1kpoGt4Fp0NfJJiMWEPs+08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riOBl97EVOFBXQ0Yv+iznPmp3sDMV4SNrdJ6j0xqP6HJHd/vvHZ8IlN0jrkIgqCY60hBxDrHRYrMHilyAwzbT+EcFzgZ3xmkppwxmHz0HftLaa4G3uEsufizb7amF659MwjVs/IFYInjrIgxYkv8n5KXxLHJwWHO+FMTPDZN75U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bT56KSqE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Q2XuHTnpBIWpyQZNHPcbLppoXDYJ4UpElNhcDdmY5jE=; b=bT56KS
	qE/8jdTPtzKVw2Ql1egR3fsIujU6yyooIfip4LLJuwCIwiFEVnYf4cJk3MF5AgG1
	lViwoGWmMBRNYcFlrDHP8D4F1gA7UiHBIJXqw/xL592owDRZJvvZA6mJnXea7zER
	RU4D3At3BuQwZXPGy/dEhD7KSR8RhtmzgrSEEF5VCgPT5fxIjYjCHXAab+1g71nL
	wkhCFyxZkp9dG0SQNjR5ZsyuYEKtHBZ5xzWufQAhPK7SHvc7noOMJdUrgbDH3otw
	RXKQ0TH9Uw/dKTgvDYtZUDAqliK8B2DgNx2tQq7L3KL4p8YUrgE0rcuTn0CiiyZp
	fRh8SaupDeeDUvng==
Received: (qmail 521390 invoked from network); 10 Apr 2024 13:25:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:00 +0200
X-UD-Smtp-Session: l3s3148p1@xiz9SbwVCgdtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] i2c: bcm-iproc: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:16 +0200
Message-ID: <20240410112418.6400-22-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index e905734c26a0..133d02899c6b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -811,8 +811,6 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
 	}
 
 	if (!time_left && !iproc_i2c->xfer_is_done) {
-		dev_err(iproc_i2c->device, "transaction timed out\n");
-
 		/* flush both TX/RX FIFOs */
 		val = BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
-- 
2.43.0


