Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4139C48C36
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 20:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbfFQSjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 14:39:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49895 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQSjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 14:39:43 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M9nAB-1hfwoi06b7-005qYN; Mon, 17 Jun 2019 20:39:41 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@the-dreams.de, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 3/3] drivers: gpio: pcf857x: use subsys_i2c_driver()
Date:   Mon, 17 Jun 2019 20:39:39 +0200
Message-Id: <1560796779-17117-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796779-17117-1-git-send-email-info@metux.net>
References: <1560796779-17117-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:llSAjebDYGluuZiize11hDPpsvBQMhYG4De6irWqXpmrHFW04Ly
 16HNNFKFZTlcAGOEjM3VXOjZFxqfKNcvtKacdROJ+cGjp+KyQoKZp6RRM1f992D8AajRfTH
 ubwHArQwNvStp54tgaocGmyvbXapqAM7qNDKhz2QRgL5qwPbQisxsuiE/XJdECl2+ebOz6T
 ITlmQqYFAR6uLzV5MrTEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/EmVtBUJHQk=:0Lk+obK6sn9wuxf6NJ5WYU
 2N3vh3G4xIS8Xv+4baEazkT2iJ/MRCrxQ7OZmSxMHMAWO6QteAWJKgC3RxmmisIcTTZpIOVN2
 nh6dkNWRBqEeWmeDfROuDTAKmaONjVk6C9Er9AwQ8i/+N0bEYuPYll6uJ+fXsWjs0KoYgg3cP
 5O/Dpjr1Dwy454jQMZbzsyOE6TzVk1a5SRtVzwfjQnCs9QAnA+IpCTY0db46924mrs3RkpsOQ
 D9X9q9Iirffy+tKcFKSQVtmW7Sv1eZJhWgWUWfLjw3Z1FXf73SUTQbbWJ4tZTTRbe2pQ35XVU
 Svx0UoMsSyyRcDDK6YQ6VUlhynhaLPTO75ZEoggsV35m7DGyvwFHkR+jP5gu6Yo1A7cJ8M8bv
 AJaGBg8sfpC6vwk41zOP43SMEP57MOxWPrMGeB+GMCkdyU/NuPH2q28lVzpUu8SWuK/QOjYgr
 bisZIoETFYa7JDOxGz0zN3FIORGMaAzZHdjiyNCgb9Jrmc/HFLBmYjaIE3/PTnLnvj77CrdYT
 SqLs15lZq95H8vwmn4tH7JU/k1lr0/x4ilJjmxfHJvn41s47IbiChy0N+d/S7ztgez1Q2HxGL
 0eg/2N9r8ImIMJmq2FGw+q0INVhrRKchX7VCA0HM7Nv5jclWscVg/qPOR5i1jKLbQgxAUmLlt
 oTDMOSo/yj6OT1bEEJmrAHtIpA9MXn4ygPpBQc3hHYGKRWywNvbpNTbPqC7gZnX7iH3pC3rB4
 A91VyeQi0T8SRG+3uSxJa6mekFpQWtCobrD+CA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_i2c_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-pcf857x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 14fb8f6..554663e 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -430,20 +430,10 @@ static void pcf857x_shutdown(struct i2c_client *client)
 	.id_table = pcf857x_id,
 };
 
-static int __init pcf857x_init(void)
-{
-	return i2c_add_driver(&pcf857x_driver);
-}
 /* register after i2c postcore initcall and before
  * subsys initcalls that may rely on these GPIOs
  */
-subsys_initcall(pcf857x_init);
-
-static void __exit pcf857x_exit(void)
-{
-	i2c_del_driver(&pcf857x_driver);
-}
-module_exit(pcf857x_exit);
+subsys_i2c_driver(pcf857x_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Brownell");
-- 
1.9.1

