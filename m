Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F387758F91C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 10:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiHKIb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 04:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbiHKIb4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 04:31:56 -0400
X-Greylist: delayed 599 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 11 Aug 2022 01:31:55 PDT
Received: from UKPHAPOP01.phabrix.local (unknown [213.1.217.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29F4C8A7DD;
        Thu, 11 Aug 2022 01:31:54 -0700 (PDT)
Received: from cpringle-pc.phabrix.local ([192.168.0.177]) by phabrix.local with
 MailEnable ESMTP; Thu, 11 Aug 2022 09:21:53 +0100
From:   Chris Pringle <chris.pringle@phabrix.com>
To:     wsa@kernel.org, Michael.Brunner@kontron.com,
        ingmar.klein@kontron.com
Cc:     chris.pringle@phabrix.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: kempld: Support ACPI I2C device declaration
Date:   Thu, 11 Aug 2022 09:21:41 +0100
Message-Id: <20220811082141.1428977-1-chris.pringle@phabrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_FAIL,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Adds an ACPI companion to the KEMPLD I2C driver so that it correctly
detects any I2C devices nested under the KEMPLD's ACPI node (SBRG.CPLD).

This allows I2C devices attached to the KEMPLD I2C adapter to be declared
and instantiated via ACPI.

Signed-off-by: Chris Pringle <chris.pringle@phabrix.com>
---
 drivers/i2c/busses/i2c-kempld.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 5bbb7f0d7852..cf857cf22507 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -303,6 +303,7 @@ static int kempld_i2c_probe(struct platform_device *pdev)
 	i2c->dev = &pdev->dev;
 	i2c->adap = kempld_i2c_adapter;
 	i2c->adap.dev.parent = i2c->dev;
+	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
 	i2c_set_adapdata(&i2c->adap, i2c);
 	platform_set_drvdata(pdev, i2c);
 
-- 
2.25.1

