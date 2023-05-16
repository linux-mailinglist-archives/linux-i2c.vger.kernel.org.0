Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171A0704758
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 10:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbjEPIGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 04:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjEPIGA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 04:06:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FA449E2
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684224359; x=1715760359;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0zSxL55E9J0vXq9b2yEohLMfpjMdLpSTiqKsFrmh0yE=;
  b=AXR9Yw/czjntojWvkRpNrKiAynw4GvxLbl3L+28yxwFlut563jmJbU7o
   udVOvcGf/VMk3t73OpB4cSacG2005T6TfhS6hDEWwK5BiG9DQCm8t+Z5J
   EYI7BRnIK3o7UTLm6wZOX4E+/8utuhUOnxDAiAPDZWX/brtHtuazhTaCW
   eXq2kq57W5g9vXNt8IQPVtIFYIsBo+v8SEJwz0K4pqUP0lJG5CWxcqoDS
   wKFpfyEjACFZCdXWMZQPHFLk9C8NzWrcr6VL1Nun6/wdnF1GjtTceSpit
   T7716Pfmi1nXzweVztTQ33GhRLhddXIBycefMdxDQ3UBWX7//MBsb5FGh
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677538800"; 
   d="scan'208";a="30926984"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 May 2023 10:05:57 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 16 May 2023 10:05:57 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 16 May 2023 10:05:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684224357; x=1715760357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0zSxL55E9J0vXq9b2yEohLMfpjMdLpSTiqKsFrmh0yE=;
  b=QpEQhfy0cVpeK4/sOv2ThYjbFQKdZLJ9ExV/HEwjO4TA71U5sJfrxgcY
   +kjIkVxWPjCyUbxYaES42yEuXsOZQTA6JMsMPA6VqiTamBTEDbNZpTUZb
   EzWxSbXGD8JRVHS3SxjGXw9Gicq8fYmgYYmUPf60zrFTJtDW4bB55ckwG
   dhDn5Se1kqPlicPG0y8mt7aQ4hx0KS5itTkSKwLjnpD59pUzvJfH5bOMd
   fr2d/XthxM6szqBZUzFTW5xlGt2F3CWcIjzajeAJOkGkio2U5Nd13jXe6
   ppqV1awa1CNo6sA1UU/LlquhpvWHSriNrndnlvnTswM2DDkzzk2VxOmGa
   g==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677538800"; 
   d="scan'208";a="30926983"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 May 2023 10:05:57 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6AC82280085;
        Tue, 16 May 2023 10:05:57 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH 1/1] eeprom: at24: Use dev_err_probe for nvmem register failure
Date:   Tue, 16 May 2023 10:05:53 +0200
Message-Id: <20230516080553.427681-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When using nvmem layouts it is possible devm_nvmem_register returns
-EPROBE_DEFER, resulting in an 'empty' in
/sys/kernel/debug/devices_deferred. Use dev_err_probe for providing
additional information.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/misc/eeprom/at24.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 938c4f41b98c..5aae2f9bdd51 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -761,7 +761,8 @@ static int at24_probe(struct i2c_client *client)
 		pm_runtime_disable(dev);
 		if (!pm_runtime_status_suspended(dev))
 			regulator_disable(at24->vcc_reg);
-		return PTR_ERR(at24->nvmem);
+		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
+				     "failed to register nvmem\n");
 	}
 
 	/*
-- 
2.34.1

