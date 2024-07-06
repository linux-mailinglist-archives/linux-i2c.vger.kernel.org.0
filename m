Return-Path: <linux-i2c+bounces-4685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446E9292F3
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305DD2816A9
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA744146595;
	Sat,  6 Jul 2024 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Hy8nlt3u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F2E13F432
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264912; cv=none; b=gNqY6Nr1fc6r1AvTFTEFUGVsRpfza1kb6zvVWehpwEIly69GtnERkVZ5Qiu5bP/KmbHUsQpwSn/RhbSEFI+ICHpICY/JNAusLQdqEWNNMBGy+dW4YgUbedcGR3bCsjVdzO5ZwS+qPuMfxFMEBx8LWvoQoduLhYivNeoR3KV6UZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264912; c=relaxed/simple;
	bh=ODiqnrWGNrS/WPYSBxLCsKs/CMex9UqHgSyoQHgGBjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RodkDe9hIOC4wL9HC3IE3VtHd6996B0dCmN3yuzcdXOimLQWGYjkZGMIDJPowQHw3Pis2svFsRDed7zSY+erf2oFkD0pI4O1Az647QeATdt4sUIMxCaYcYXvaq7NmJ3NzajjROorlQuwWz57urjsR+8bn/+eC7reVgftdggOGGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Hy8nlt3u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=g1uUZqFQvKN9BFWBSV/gSDYpnlosIq6AAXNWx77kxo8=; b=Hy8nlt
	3ub9Wmt0zowOX91z7rMv7a9EEb5UEF0cFwqQzLXxQ5U1QePT0y30NNvILm6VjJgL
	wlJJka/ILg8zUBh6RsTLQcXqX+7oXmehS6frvCJYGdV6VGp8rBRcGpTYA/81jlo3
	eJ913dwWfz+rO+s/LlCq6tWWqrW2ezjfcEgBowwfhZiHr337n0Xwc/WMUSE2G5Wh
	rS+4CRQPuG8s3bHaUfyqrYpWNrzCtnAR5e6vgJGMwOxigYNCycmmUFhG2hjEAh+8
	PsgdeEd3vG83DQnXLcitWeGEQK3U7TEy5a9fD94NuWDpFmIqsAZeE5P9xuDVBLv0
	MSaqisn2QdclWvUQ==
Received: (qmail 3809910 invoked from network); 6 Jul 2024 13:21:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:35 +0200
X-UD-Smtp-Session: l3s3148p1@bqD7YZIcwpBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/60] i2c: hisi: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:18 +0200
Message-ID: <20240706112116.24543-19-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-hisi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index 975c0b1c44de..4b735ad9e193 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -197,8 +197,8 @@ static void hisi_i2c_reset_xfer(struct hisi_i2c_controller *ctlr)
  * wait for the transfer done. The major transfer process is performed
  * in the IRQ handler.
  */
-static int hisi_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-				int num)
+static int hisi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			 int num)
 {
 	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
 	DECLARE_COMPLETION_ONSTACK(done);
@@ -236,8 +236,8 @@ static u32 hisi_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm hisi_i2c_algo = {
-	.master_xfer	= hisi_i2c_master_xfer,
-	.functionality	= hisi_i2c_functionality,
+	.xfer = hisi_i2c_xfer,
+	.functionality = hisi_i2c_functionality,
 };
 
 static int hisi_i2c_read_rx_fifo(struct hisi_i2c_controller *ctlr)
-- 
2.43.0


