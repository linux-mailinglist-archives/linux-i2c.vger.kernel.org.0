Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4C37D60A2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 05:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjJYDzj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 23:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjJYDzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 23:55:37 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0661F10E
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 20:55:34 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AD13E2C062E;
        Wed, 25 Oct 2023 16:55:32 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698206132;
        bh=qw4Yh2MrWZ7ldiOY9hquUs4lryJE4IdwX6/hlSqnHi8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TKCKpRy1CFI7iTNFeMV+xl0wkOAPe6L21fjeW92aRcGJtpw0m6ZQwoZKsJPpK8up+
         B/bbf75OhB57dWavKf/kY5GSMeUpsWiMwEeOD6BXF/XeN4NkzgtpL3IhsjoWP3jJiQ
         0MMVydvePEb2x/ggXmkEs+nQtGKRuAUJnsurWDa+Uc//MHlktJbcM+9woX9j23SwLM
         RgDTTzL53Pr4tL+7qnjVx0n8oanq3O4rLvLT+ESN5Dxl6FcpyIMHe0WnDUnPOHzJMj
         MIUEBUcdQHvVsy2nF4LpvuigECrxwiv2DZ79GiJQntOUiyfi3mVmO3GVbl/halLccF
         EktmHFW6u93yA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653891b40000>; Wed, 25 Oct 2023 16:55:32 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.11])
        by pat.atlnz.lc (Postfix) with ESMTP id 5C72113EDA9;
        Wed, 25 Oct 2023 16:55:32 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 5ACE9242FEC; Wed, 25 Oct 2023 16:55:32 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        Enrik.Berkhan@inka.de, sven.zuehlsdorf@vigem.de
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 2/5] HID: mcp2221: Allow IO to start during probe
Date:   Wed, 25 Oct 2023 16:55:11 +1300
Message-ID: <20231025035514.3450123-3-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
References: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=VwQbUJbxAAAA:8 a=hpi-KvaB3YVD6pHwyWgA:9 a=AjGcO6oz07-iQ99wixmX:22
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

During the probe we add an I2C adapter and as soon as we add that adapter
it may be used for a transfer (e.g via the code in i2cdetect()).
Those transfers are not able to complete and time out. This is because th=
e
HID raw_event callback (mcp2221_raw_event) will not be invoked until the
HID device's 'driver_input_lock' is marked up at the completion of the
probe in hid_device_probe(). This starves the driver of the responses it
is waiting for.
In order to allow the I2C transfers to complete while we are still in the
probe, start the IO once we have completed init of the HID device.

This issue seems to have been seen before and a patch was submitted but
it seems it was never accepted. See:
https://lore.kernel.org/all/20221103222714.21566-3-Enrik.Berkhan@inka.de/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/hid/hid-mcp2221.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index b95f31cf0fa2..aef0785c91cc 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1142,6 +1142,8 @@ static int mcp2221_probe(struct hid_device *hdev,
 	if (ret)
 		return ret;
=20
+	hid_device_io_start(hdev);
+
 	/* Set I2C bus clock diviser */
 	if (i2c_clk_freq > 400)
 		i2c_clk_freq =3D 400;
--=20
2.42.0

