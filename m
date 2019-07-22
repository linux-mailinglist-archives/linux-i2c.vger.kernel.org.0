Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41EC2708F4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 20:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfGVSza (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 14:55:30 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:57653 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbfGVSza (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 14:55:30 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45srPD71TmzB2;
        Mon, 22 Jul 2019 20:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563821649; bh=bE0dGjjaQbgRByh9iGi+rEP/3lt1aLZBFV2P9c6N2Ts=;
        h=Date:From:Subject:To:Cc:From;
        b=BXy4QEJVLaikHX+RNr5A4A4LXU6tRqxeihcJdBKf+gCIL5ETxjHwqSmDnTBuKiSRr
         8fl4ykxTVlXMGqn+dDEHmprEcT28UHT4sBE2uAka5Y2VvpslDXMUe95K8/HNJD4E3T
         WI22brJNzRhjB5/mdDK9orERCtgfA+559dRJqVbAb9g0OhELP5KwmijrKwtI9Sc1/m
         wUhU5Q/JSK+nZDLVtJa1LdNEnRRbtg+7zlQxlqZ6saPicgsHouLIyPupUrEgGK/Rgd
         6rJ/97WfPogYa7FE00f1aJT66nhAZFJtf9GWTVcL7GiNeWxKhwTzto8QqJ7IiX7HaX
         qz7rctNgabfJA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 20:55:27 +0200
Message-Id: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] i2c: at91: disable TXRDY interrupt after sending data
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-i2c@vger.kernel.org
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver was not disabling TXRDY interrupt after last TX byte.
This caused interrupt storm until transfer timeouts for slow
or broken device on the bus. The patch fixes the interrupt storm
on my SAMA5D2-based board.

Cc: stable@vger.kernel.org # 5.2.x
[v5.2 introduced file split; the patch should apply to i2c-at91.c before the split]
Fixes: fac368a0404 ("i2c: at91: add new driver")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

---
 drivers/i2c/busses/i2c-at91-master.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index e87232f2e708..a3fcc35ffd3b 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -122,9 +122,11 @@ static void at91_twi_write_next_byte(struct at91_twi_dev *dev)
 	writeb_relaxed(*dev->buf, dev->base + AT91_TWI_THR);
 
 	/* send stop when last byte has been written */
-	if (--dev->buf_len == 0)
+	if (--dev->buf_len == 0) {
 		if (!dev->use_alt_cmd)
 			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_STOP);
+		at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_TXRDY);
+	}
 
 	dev_dbg(dev->dev, "wrote 0x%x, to go %zu\n", *dev->buf, dev->buf_len);
 
@@ -542,9 +544,8 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 		} else {
 			at91_twi_write_next_byte(dev);
 			at91_twi_write(dev, AT91_TWI_IER,
-				       AT91_TWI_TXCOMP |
-				       AT91_TWI_NACK |
-				       AT91_TWI_TXRDY);
+				       AT91_TWI_TXCOMP | AT91_TWI_NACK |
+				       (dev->buf_len ? AT91_TWI_TXRDY : 0));
 		}
 	}
 
-- 
2.20.1

