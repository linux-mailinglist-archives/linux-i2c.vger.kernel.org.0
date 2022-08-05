Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947A258A755
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Aug 2022 09:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236888AbiHEHnh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Aug 2022 03:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiHEHng (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Aug 2022 03:43:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D59FE0;
        Fri,  5 Aug 2022 00:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659685416; x=1691221416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zyhxpEY3V0ezRF2TAPWgZETEsQajOrAZag7J08YVniY=;
  b=L/C9vzWfC2cSMbQeePRdahtpc9FHEWjHv5H9ysCDkoXxxpibrqJ5n56b
   rK9XJM8d0QKQzKneAzlH20lSprHr8zRRcgyhUI56/NraoYaLG9cj83kNg
   HQLqg3aJXAUAYsWdXIPMcBsokcSePjKFIIEFqj9eX6jh6Q1BT9TA0YtDY
   T3vsPXhW1bGsvJT+ZnjEZJzfTIh3fozaH23T/OfbNoxRWBx/WAEWQjDFs
   7oHh5AnMsxGSO5O3O+oisa69d9mQwxH4dNiae8miNL5YT56iVoVK/eNM7
   NzF8JvqQ3/muW17arHI7Q6Ces3uFJ44fDdcPFoYco6iMLEQjVdyHgcpY2
   A==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="107704825"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 00:43:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 00:43:31 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 00:43:29 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Daire McNamara <daire.mcnamara@microchip.com>
CC:     Conor Dooley <conor.dooley@microchip.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andreas Buerkler <andreas.buerkler@enclustra.com>,
        Lewis Hanly <lewis.hanly@microchip.com>
Subject: [PATCH] i2c: microchip-core: fix erroneous late ack send
Date:   Fri, 5 Aug 2022 08:43:46 +0100
Message-ID: <20220805074346.4123650-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A late ack is currently being sent at the end of a transfer due to
incorrect logic in mchp_corei2c_empty_rx(). Currently the Assert Ack
bit is being written to the controller's control reg after the last
byte has been received, causing it to sent another byte with the ack.
Instead, the AA flag should be written to to the contol register when
the penultimate byte is read so it is sent out for the last byte.

Reported-by: Andreas Buerkler <andreas.buerkler@enclustra.com>
Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
Tested-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

FYI Wolfram, I am still sitting on the MAINTAINERS update as the
SoC updates have not been pulled yet for 6.0 (AFAICT)

 drivers/i2c/busses/i2c-microchip-corei2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 6df0f1c33278..4d7e9b25f018 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -206,7 +206,7 @@ static void mchp_corei2c_empty_rx(struct mchp_corei2c_dev *idev)
 		idev->msg_len--;
 	}
 
-	if (idev->msg_len == 0) {
+	if (idev->msg_len <= 1) {
 		ctrl = readb(idev->base + CORE_I2C_CTRL);
 		ctrl &= ~CTRL_AA;
 		writeb(ctrl, idev->base + CORE_I2C_CTRL);
-- 
2.36.1

