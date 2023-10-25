Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891587D60A6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 05:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbjJYDzl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 23:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjJYDzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 23:55:37 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B59CB0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 20:55:35 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DD0B22C06A0;
        Wed, 25 Oct 2023 16:55:33 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698206133;
        bh=k2Z4c3jfAi6Xiz4C0xNUsXl4Y0M6FQPwo3UXBWP78bQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AXctCMLLU/Ip2/xOQUzVlWfedwTryfIrkOfI/ajxOg96GiIDIrLwoy7dQIoAUSKhz
         OH7X1gh160v/tIRf1p4/2Axc25V2NVkwPByILzq8/QKTx8og3ql5Rte6qSrn06g+eS
         VXFfQJSRjXDConBv350rut20qT6jmFV1tsx+Ob+KpDoETNX6Yh4FXdVTRPnO2DEtVC
         LoVVr6ngm14KYIfPtNpLIUVlqjkP4GwfXFvQVYvZo23oCXJI6WUznoVmQwMduZ0crL
         7I2ejJXS+ODfxFpk0F0sCKFQ/uISQEIpn3cpLMR88sJyyX2k2UdVWDr3h/5WkEfEZR
         d0zNeUaU/f9pw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653891b50000>; Wed, 25 Oct 2023 16:55:33 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.11])
        by pat.atlnz.lc (Postfix) with ESMTP id 829A413EDA9;
        Wed, 25 Oct 2023 16:55:33 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 80F2D242FEC; Wed, 25 Oct 2023 16:55:33 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        Enrik.Berkhan@inka.de, sven.zuehlsdorf@vigem.de
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 3/5] HID: mcp2221: Set ACPI companion
Date:   Wed, 25 Oct 2023 16:55:12 +1300
Message-ID: <20231025035514.3450123-4-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
References: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=BpYdKR3naCp1qFSn3UAA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In scenarios where an I2C device tree is defined in ACPI and exists off
the MCP2221 I2C bus, the devices could not be instantiated.
Mark the USB port that the MCP2221 is connected to as its ACPI companion
so that the USB device can be bound to the ACPI tree when enumerated.
With this change the downstream I2C tree devices can be instantiated on
ACPI systems.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/hid/hid-mcp2221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index aef0785c91cc..a219cd2e3309 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1156,6 +1156,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->adapter.algo =3D &mcp_i2c_algo;
 	mcp->adapter.retries =3D 1;
 	mcp->adapter.dev.parent =3D &hdev->dev;
+	ACPI_COMPANION_SET(&mcp->adapter.dev, ACPI_COMPANION(hdev->dev.parent))=
;
 	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
 			"MCP2221 usb-i2c bridge");
=20
--=20
2.42.0

