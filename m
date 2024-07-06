Return-Path: <linux-i2c+bounces-4690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C49292FD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21C71C20F5A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4308A14A4C7;
	Sat,  6 Jul 2024 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QY0HDJZ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003C77101
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264916; cv=none; b=C6SXc02aWFloGOvN61xee80LsPHuyUaqRQ/ia3q58L2zC2bwYWpohPngFDL64jZWtydXFDOM/0/5MGQlVaSSHZFqoMpazguev+iCOQy6WQ6EY7YLAWG8QwFAJJrI2g+/17awmnXHnZH2hP7quFx7hwgURuTHyxCKkIuUcSd0qLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264916; c=relaxed/simple;
	bh=5fzlYQ/DlpNv/VmQIMYDW6udKbLmAXPQatdsAI21DhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WW+OcNm1jsW5+xm33vJOO73f+rohYBKs9YzN/PuR0BMy62Rn+DypMaBnwwK7g94IB0UiEQXJbyCZNSpZcZbee887y2t07SCgQzcSnZZe/SLRDIsnKd5oGTqzlh0nb2tIo0CPr1DRG+XI4ihR7rv+1+9YA096DMKFATcIkP0N3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QY0HDJZ6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EKoXsPcibdMNAxqf9IYcKHn5yG7I+fJ1HIfIgGqP4MQ=; b=QY0HDJ
	Z6b//NdX9nnwvd6X6txx6en4z3+qRo0ZqW4vo8LeQLRC38WjulN4ODOJNNazqWUT
	In5ezs7XLNL1U0Yrmq8OnzW+NCG04OikdqToBPbETiHGycVJV6HVYPimoxAuDA/3
	cLgqoe6VzApRi5v2GFJ7hQyeaLrg2PqJBOTsCQIsVwQ++d9vvXF539Ljy2PFuwLb
	u7QZkNRLtUO67z6rQqpYin/d/GOUH1SqjNMLEFD2jwzcpy7Ld/wWoNpM5HoEU0N5
	qoq+lgEXZu30uPLbHB8IwrL6HDmosxY3E3Kjc/xAfk8RgvNsClHfyySvJxrKCkJT
	eNBAZbPD1vkvJuPA==
Received: (qmail 3810044 invoked from network); 6 Jul 2024 13:21:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:38 +0200
X-UD-Smtp-Session: l3s3148p1@Z6EwYpIcQIZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/60] i2c: isch: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:23 +0200
Message-ID: <20240706112116.24543-24-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-isch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 416a9968ed28..33dbc19d3848 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -104,7 +104,7 @@ static int sch_transaction(void)
 		result = -EIO;
 		dev_dbg(&sch_adapter.dev, "Bus collision! SMBus may be "
 			"locked until next hard reset. (sorry!)\n");
-		/* Clock stops and slave is stuck in mid-transmission */
+		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		result = -EIO;
 		dev_err(&sch_adapter.dev, "Error: no response!\n");
-- 
2.43.0


