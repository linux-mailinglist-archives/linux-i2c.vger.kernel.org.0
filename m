Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE119701CE1
	for <lists+linux-i2c@lfdr.de>; Sun, 14 May 2023 12:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjENKiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 May 2023 06:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237372AbjENKhR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 May 2023 06:37:17 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94181FCA
        for <linux-i2c@vger.kernel.org>; Sun, 14 May 2023 03:37:15 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QJzTC4F5Mz9slQ;
        Sun, 14 May 2023 12:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1684060623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+pNLEM67C7eGHuRPLnaCaZVb0MEuWPzCgH5AM/sZq6w=;
        b=yYwaHwtIywaJslI5D3mZuTVRHklOC6qNi1QoqnSqZEBIia/v5EIfsAheqZSdVzkuPntvXt
        ygrwWmQlITxxYcOc5w2irzLBff3wQ1hMJ7Xvd41Wei79Dxl6oFhP7JN+i+bQXTK2GUZs9Y
        MwcOmkKhbdfCEegH6/pOQnLXRELI9+TBW5KxBIVnkotKbGMqCjvOyq1Ov1x19qSNwqy3+P
        ERCrTLyJwdxiuJue31t/1JcpzJpYsbx31+V2EmpjYwVM1DJorNZejmlVhky1od0kZI90my
        LukX1nOwhjr8R7t4h4ZWOgU03b1g/T32CL+hFcUuoFk46vKQ+jNF0NnwoHcmpw==
From:   Marius Hoch <mail@mariushoch.de>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marius Hoch <mail@mariushoch.de>
Subject: [PATCH 2/2] i2c: i801: Force no IRQ for further Dell Latitudes
Date:   Sun, 14 May 2023 12:36:34 +0200
Message-Id: <20230514103634.235917-3-mail@mariushoch.de>
In-Reply-To: <20230514103634.235917-1-mail@mariushoch.de>
References: <20230514103634.235917-1-mail@mariushoch.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4QJzTC4F5Mz9slQ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Per the referred bug reports, there are further
Dell Latitude devices affected by the same bug,
so also handle these.

Signed-off-by: Marius Hoch <mail@mariushoch.de>
---
 drivers/i2c/busses/i2c-i801.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 5fd2ac585160..2e13fd04a6ab 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1635,6 +1635,20 @@ static const struct dmi_system_id dmi_force_no_irq[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E7450"),
 		},
 	},
+	/* Per https://bugzilla.redhat.com/show_bug.cgi?id=1415950 */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5450"),
+		},
+	},
+	/* Per https://bugzilla.kernel.org/show_bug.cgi?id=194141 */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.40.1

