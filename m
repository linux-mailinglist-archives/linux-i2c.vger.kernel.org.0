Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42DC1C5D00
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 18:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbgEEQHx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 12:07:53 -0400
Received: from www.zeus03.de ([194.117.254.33]:42494 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729365AbgEEQHx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 12:07:53 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 May 2020 12:07:52 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=k1; bh=X0Q91izrK4UW1W/HUwdjfD2eKdG
        Alaq4rEqT0gWkf9E=; b=1PA6kzZwDvl9d9ISOq11WPgTgyyo5tBZK6ALjVdpXTy
        wX52XixxMoMLJkQ+AbLjBogzOcqzYkQ5SmhN7pv6DbuEAfwo67m14etYJ4JD/M50
        k1BucAl6qjTpMyTgu3qdGm5FlGQRatepurkwwWlPN3cTVOkVd4IA2fmuxK/iMnGg
        =
Received: (qmail 344315 invoked from network); 5 May 2020 18:01:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2020 18:01:10 +0200
X-UD-Smtp-Session: l3s3148p1@O6KQweikrsUgAwDPXwzKAGcVR8vvnnu/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] i2c: reword explanation about atomic transfers
Date:   Tue,  5 May 2020 18:01:01 +0200
Message-Id: <20200505160101.12399-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Atomic transfers are not only about sending messages like the original
wording suggested. Speak of 'accessing' now like in i2c.h.

Reported-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 517d98be68d2..94ff1693b391 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -23,9 +23,9 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 			       unsigned int num_resources);
 
 /*
- * We only allow atomic transfers for very late communication, e.g. to send
- * the powerdown command to a PMIC. Atomic transfers are a corner case and not
- * for generic use!
+ * We only allow atomic transfers for very late communication, e.g. to access a
+ * PMIC when powering down. Atomic transfers are a corner case and not for
+ * generic use!
  */
 static inline bool i2c_in_atomic_xfer_mode(void)
 {
-- 
2.20.1

