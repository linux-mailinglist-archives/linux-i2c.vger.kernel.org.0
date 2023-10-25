Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54507D60A4
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 05:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjJYDzk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 23:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbjJYDzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 23:55:37 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2320DC
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 20:55:32 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7DB192C011D;
        Wed, 25 Oct 2023 16:55:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698206131;
        bh=iVWFkB0EmAPELYtaE02YvjsdW301G7v+jsZLafFdS1s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZIKKhX/KDqz1enYskvI5VIOkCvZeOaAaBlA1bVq2FqHS6yCOGbMS3x2RAvjG8Leo4
         i+CM6r0wDMag7jU8RiojUApSCe5JncH3J0W/cMK5pkKXNYMK/R/gNQE+7kEInQq1ty
         QK4rcJSbDUgNLRap/7VBJ1P4KJbjA/eLBBS6jyj91BQbOWFxX1Ib60gemlaMohy/Ys
         +MQ8bDVLS01QePg0l53kqcgjSq3orE19XzvcG5xxAyH8RBgPJ/t2LlkFmzra2zjC89
         WUiJZHLRzNXW4vtKbc8Zqdfg47FKW7QIaIwf2/jAHSf2scgMgkjPLIy0aLWmgoFswb
         iWNlJD3yP9bEA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653891b30000>; Wed, 25 Oct 2023 16:55:31 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.11])
        by pat.atlnz.lc (Postfix) with ESMTP id 034B013EDA9;
        Wed, 25 Oct 2023 16:55:31 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 018C2242FEC; Wed, 25 Oct 2023 16:55:30 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        Enrik.Berkhan@inka.de, sven.zuehlsdorf@vigem.de
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 1/5] HID: mcp2221: Set driver data before I2C adapter add
Date:   Wed, 25 Oct 2023 16:55:10 +1300
Message-ID: <20231025035514.3450123-2-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
References: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=VwQbUJbxAAAA:8 a=wCWeksEBtQYof55t2KQA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The process of adding an I2C adapter can invoke I2C accesses on that new
adapter (see i2c_detect()).

Ensure we have set the adapter's driver data to avoid null pointer
dereferences in the xfer functions during the adapter add.

This has been noted in the past and the same fix proposed but not
completed. See:
https://lore.kernel.org/lkml/ef597e73-ed71-168e-52af-0d19b03734ac@vigem.d=
e/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 72883e0ce757..b95f31cf0fa2 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1157,12 +1157,12 @@ static int mcp2221_probe(struct hid_device *hdev,
 	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
 			"MCP2221 usb-i2c bridge");
=20
+	i2c_set_adapdata(&mcp->adapter, mcp);
 	ret =3D devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		return ret;
 	}
-	i2c_set_adapdata(&mcp->adapter, mcp);
=20
 #if IS_REACHABLE(CONFIG_GPIOLIB)
 	/* Setup GPIO chip */
--=20
2.42.0

