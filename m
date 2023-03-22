Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733376C4197
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 05:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCVEa7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 00:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCVEa6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 00:30:58 -0400
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99C214FA92
        for <linux-i2c@vger.kernel.org>; Tue, 21 Mar 2023 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8OnwN
        hcfwhK2s8cm2vkgjfw99rYLHIXLgrm+m7baWbo=; b=dOPz6zulRqpTw/9KQUWjO
        dAOaYAPu4bbzdApqM6iorzgXDQBkOrR9nR0u3xbWl9cyHljcqMEA3KO3Nt63XeBe
        dwLMmMZO2GJ4xQF9aidBvBb3rBzuonC1TfMjdUcno4i+rXHWiW7J29S5vcd/lmP9
        Wi4qYWXg3ouAYNbxjXyS2Q=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wC3H6hAhBpkIDKXAQ--.64108S2;
        Wed, 22 Mar 2023 12:29:52 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     peter.korsgaard@barco.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, evgreen@chromium.org, windhl@126.com
Subject: [PATCH] i2c: mux: gpio: Add missing fwnode_handle_put()
Date:   Wed, 22 Mar 2023 12:29:51 +0800
Message-Id: <20230322042951.1857247-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3H6hAhBpkIDKXAQ--.64108S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1kuF4kWF1kGr13Zr4ruFg_yoWfKFX_C3
        Z8X3ZrJw1v9r9xAw12yFW3Zryjvr15Za18Gry0va4F9w13ZF1DGF10va4fGrWDZrWrtFW5
        Xw1jqryxZw1fJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREVWLUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizh46F18RQrH2NAABsD
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In i2c_mux_gpio_probe_fw(), we should add fwnode_handle_put()
when break out of the iteration device_for_each_child_node()
as it will automatically increase and decrease the refcounter.

Fixes: 98b2b712bc85 ("i2c: i2c-mux-gpio: Enable this driver in ACPI land")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 73a23e117ebe..0930a51c8c7c 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -105,8 +105,10 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 
 		} else if (is_acpi_node(child)) {
 			rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
-			if (rc)
+			if (rc) {
+				fwnode_handle_put(child);
 				return dev_err_probe(dev, rc, "Cannot get address\n");
+			}
 		}
 
 		i++;
-- 
2.25.1

