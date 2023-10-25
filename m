Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777157D60A0
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 05:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjJYDzi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 23:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjJYDzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 23:55:37 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2523C0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 20:55:31 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BB0F72C00C1;
        Wed, 25 Oct 2023 16:55:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698206128;
        bh=tNeMGanJzf0KRNiF5AbFyAoQLLim5+thJX7fFB2cwYc=;
        h=From:To:Cc:Subject:Date:From;
        b=Tj0s03pf4AM8h2Smd7clh+m9GqtJlagto4Z9Jdls+Z3D2oOwAD3FUR9vieRbLHdCg
         sYfFldq2UxnL4PO7hATZPfmuZWXz7Rc9BfnGNo7F78e1QwVB7hMUGtMUQKPu+3QlIE
         BxHu6QxAP3eA1i+Kcg0KNbCwfMWV4RNITsqGqvFOTF5gipE4mSb91ue/tcOOSDlSu7
         buCLqIyjrvLgDtDyaspFNk/MFW2tX9Jraak1QuHVTzAvJSvwvtQF2Sr/TfFZKeiFOw
         AjNh4hX0bETkaQh+Ha8EbJ9Z2WXJqc2l8I4xfJETDvwt+CYdIUAMi+YEIzdny5e1bv
         RvCmNBnfDHZWA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653891b00000>; Wed, 25 Oct 2023 16:55:28 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.11])
        by pat.atlnz.lc (Postfix) with ESMTP id 97DDD13EDA9;
        Wed, 25 Oct 2023 16:55:28 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 943B1242FEC; Wed, 25 Oct 2023 16:55:28 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        Enrik.Berkhan@inka.de, sven.zuehlsdorf@vigem.de
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 0/5] MCP2221 Improvements
Date:   Wed, 25 Oct 2023 16:55:09 +1300
Message-ID: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=Q7htqfs8IZaJ85Kc9tIA:9 a=ZXulRonScM0A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recently I've been prototyping a new system which uses a MCP2221 chip as
the I2C bus. During that development a few issues were found that form
the patches in this series.

The first two are resolving long standing issues that have both been
reported before, patches submitted, but it appears never accepted.
The ACPI patch resolves an issue in my x86_64 system.
The final two address fundamental issues with the driver that have not
worked correctly from the beginning it seems.

Please review and let me know what you think.

Thanks,
Hamish Martin

Hamish Martin (5):
  HID: mcp2221: Set driver data before I2C adapter add
  HID: mcp2221: Allow IO to start during probe
  HID: mcp2221: Set ACPI companion
  HID: mcp2221: Don't set bus speed on every transfer
  HID: mcp2221: Handle reads greater than 60 bytes

 drivers/hid/hid-mcp2221.c | 76 +++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 23 deletions(-)

--=20
2.42.0

