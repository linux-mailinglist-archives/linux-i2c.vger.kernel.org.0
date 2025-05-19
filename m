Return-Path: <linux-i2c+bounces-11026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049AABC067
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB9717E753
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C04A281366;
	Mon, 19 May 2025 14:19:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003727E1C8;
	Mon, 19 May 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664384; cv=none; b=F4p5CBZA0cvltg0UZQ5UpfJ4H43qmX9S9qUsvuNuq6eMrJcFmoNyBdxjxORqWiiMJdSeZfmimumg5pOq8yMoCYAtsxwFiBFzQnaP/MLoJezVFRIbHSYMtM76tlmQb36+YDOzJ71VpFFk44aM8Ml3jJ8A44p/W4FVxgPpHz1InkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664384; c=relaxed/simple;
	bh=es2cvXKEqRFFmJnMp32QtmtpAovkfjDeKegBP82uAQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQjHuh1vu+V8IcGpMDRRRTS6rj/x+oHc7qfBqYsa7grIsQH/aJBDtgoWAfJhHfL10qnaaIhMQ1XMhV6zFXfpx293Cgre3YFrT/zUuAh+y6TwXn5V8TJ7DkjnRSl2OTXxTvJDI/3i6KfwLQ5LttVkOoqOlKyuaQyl9ymDB2y9h7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAD3RvL3PStoaGlqAQ--.17984S2;
	Mon, 19 May 2025 22:19:37 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andi.shyti@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
Date: Mon, 19 May 2025 22:19:18 +0800
Message-ID: <20250519141918.2522-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3RvL3PStoaGlqAQ--.17984S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtr45Wr1UJr1DCF1UCFWktFb_yoW8JF48pr
	4DGrsIkr4UKFZagFs7Xr1SvFyYga98WFW8KFyjganavFs8Xwn8Aa13tryY9r4xAr9Iyw43
	t3s0yrWfCF4jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbqg4D
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAHA2grOUgR0gAAss

The qup_i2c_xfer_v2() calls the qup_i2c_change_state() but does
not check its return value. A proper implementation can be
found in qup_i2c_xfer().

Add error handling for qup_i2c_change_state(). If the function
fails, return the error code.

Fixes: 7545c7dba169 ("i2c: qup: reorganization of driver code to remove polling for qup v2")
Cc: stable@vger.kernel.org # v4.17
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-qup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index da20b4487c9a..2477f570fe86 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1538,7 +1538,7 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
 			   int num)
 {
 	struct qup_i2c_dev *qup = i2c_get_adapdata(adap);
-	int ret, idx = 0;
+	int ret, err, idx = 0;
 
 	qup->bus_err = 0;
 	qup->qup_err = 0;
@@ -1588,7 +1588,9 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
 		ret = qup_i2c_bus_active(qup, ONE_BYTE);
 
 	if (!ret)
-		qup_i2c_change_state(qup, QUP_RESET_STATE);
+		err = qup_i2c_change_state(qup, QUP_RESET_STATE);
+	if (err)
+		return err;
 
 	if (ret == 0)
 		ret = num;
-- 
2.42.0.windows.2


