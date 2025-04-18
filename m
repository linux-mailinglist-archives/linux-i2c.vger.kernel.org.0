Return-Path: <linux-i2c+bounces-10484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EBDA93F7B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A3827ABC9E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB1C21C9F7;
	Fri, 18 Apr 2025 21:33:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net [46.105.63.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014E70805
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.63.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012034; cv=none; b=M/ebhyhsfMRZUzN+0zVA5xLw55jXLCUm+GWYIdU7Th19h9FN4ERj4SNh0wozbV7kUAqvPrRIhqfKS4rqbMfqa0qtxak71nJcVog+NE33udigRPT1D8pRQLtw4M21hsHGFDT8xIS2CPbDv7ZxqN+7rcQHdG7il+AA80W5WKhzU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012034; c=relaxed/simple;
	bh=gtvZRB9iNxOvkloBmfD/D8ku0CD51jtEgy34dv8PS7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gW5hlbNL+4aBSNYZ5d8dlLSQ/e7FrZDraqEJVEsBbBTmpqcvxn7m+IH+KNuF292M8Ujr/YanYv/sTJ9XcOphyFAn3DoY0yHtSE2UjI2eYqyr3zHGEPkf4Ai4POmRJU/7qxHlZ41kTEdbyi7cb+Q5FfY2KgZfH1HmHOFWnjNSv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.63.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.25.156])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJC6WFfz1nw3
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:59 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qcsxk (unknown [10.110.96.141])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A6E8B1FD50;
	Fri, 18 Apr 2025 21:16:59 +0000 (UTC)
Received: from etezian.org ([37.59.142.114])
	by ghost-submission-5b5ff79f4f-qcsxk with ESMTPSA
	id pjniIEvBAmh2TDUA+qAPwg
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:59 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S008d4f4e433-c83a-4006-8edf-f10d0c83a561,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 09/10] i2c: iproc: When there's an error treat it as an error
Date: Fri, 18 Apr 2025 23:16:34 +0200
Message-ID: <20250418211635.2666234-10-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13928226274471512647
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht

If the xfer fails, it indicates a real error. Log it with an
error message instead of a debug message to reflect its severity.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 74903edb4925..9356a16422a3 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -728,31 +728,31 @@ static int bcm_iproc_i2c_check_status(struct bcm_iproc_i2c_dev *iproc_i2c,
 		return 0;
 
 	case M_CMD_STATUS_LOST_ARB:
-		dev_dbg(iproc_i2c->device, "lost bus arbitration\n");
+		dev_err(iproc_i2c->device, "lost bus arbitration\n");
 		return -EAGAIN;
 
 	case M_CMD_STATUS_NACK_ADDR:
-		dev_dbg(iproc_i2c->device, "NAK addr:0x%02x\n", msg->addr);
+		dev_err(iproc_i2c->device, "NAK addr:0x%02x\n", msg->addr);
 		return -ENXIO;
 
 	case M_CMD_STATUS_NACK_DATA:
-		dev_dbg(iproc_i2c->device, "NAK data\n");
+		dev_err(iproc_i2c->device, "NAK data\n");
 		return -ENXIO;
 
 	case M_CMD_STATUS_TIMEOUT:
-		dev_dbg(iproc_i2c->device, "bus timeout\n");
+		dev_err(iproc_i2c->device, "bus timeout\n");
 		return -ETIMEDOUT;
 
 	case M_CMD_STATUS_FIFO_UNDERRUN:
-		dev_dbg(iproc_i2c->device, "FIFO under-run\n");
+		dev_err(iproc_i2c->device, "FIFO under-run\n");
 		return -ENXIO;
 
 	case M_CMD_STATUS_RX_FIFO_FULL:
-		dev_dbg(iproc_i2c->device, "RX FIFO full\n");
+		dev_err(iproc_i2c->device, "RX FIFO full\n");
 		return -ETIMEDOUT;
 
 	default:
-		dev_dbg(iproc_i2c->device, "unknown error code=%d\n", val);
+		dev_err(iproc_i2c->device, "unknown error code=%d\n", val);
 
 		/* re-initialize i2c for recovery */
 		bcm_iproc_i2c_enable_disable(iproc_i2c, false);
@@ -964,7 +964,7 @@ static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,
 
 	ret = bcm_iproc_i2c_xfer_internal(iproc_i2c, msgs, process_call);
 	if (ret) {
-		dev_dbg(iproc_i2c->device, "xfer failed\n");
+		dev_err(iproc_i2c->device, "xfer failed\n");
 		return ret;
 	}
 
-- 
2.49.0


