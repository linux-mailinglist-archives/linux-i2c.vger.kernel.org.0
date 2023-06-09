Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0860072A237
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 20:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjFISbA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 14:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjFISa7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 14:30:59 -0400
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281C93A8C;
        Fri,  9 Jun 2023 11:30:56 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-777b0dd72d8so86815239f.1;
        Fri, 09 Jun 2023 11:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335455; x=1688927455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJw31UEMSDw/4lxj847WRV5dzWgZULa7uFBez8wvxto=;
        b=XRLgB/q8ZkYQ9wWg8nNexQhn0930cuuWzoHgMj6gIXnECxkymSoHsAhZaandmotfxy
         4pxW1ZbLgY3/YX/M635ACp8cLFQh+XcthmqxgoX1vWAg5eVE3GmwxVkTfDQzke52HMPM
         9XHMt/Unqy+5tZYO6UGBpSwq/wj8v3Ubj2JLh1T6RFBjEfWiIgIz8EU+gcyolQw2qEmo
         lcROd6Bxrcb3+z8kcNs1NVYathO5937sxNGlQZkBKWps1YbSobRib1YFbFSHblMiL4qo
         f53CqLbobe8CoSOwtGkEfhwGZBHB0i+fmArd8+8wPoT8fjX5fragSfQrOTd+mKww87Q5
         ksaA==
X-Gm-Message-State: AC+VfDybBu2V0k/IMDWqu386uZG3XrhSvWrIC94NLcGZMrA1oaly8Daj
        MZ5hLhwCkzNVoaoE19yYhRweKxP+Yg==
X-Google-Smtp-Source: ACHHUZ4D1oHdCaXmjUtw353Iv9+ZawqZOzIIypTlfHkcq4ahpCANEOxdjZNzTprXCDY1DgNPItWtWg==
X-Received: by 2002:a6b:dc14:0:b0:774:9c2e:4ef5 with SMTP id s20-20020a6bdc14000000b007749c2e4ef5mr2227096ioc.6.1686335455180;
        Fri, 09 Jun 2023 11:30:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f7-20020a056638118700b00420d2a27e27sm1097043jas.84.2023.06.09.11.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:30:54 -0700 (PDT)
Received: (nullmailer pid 1765126 invoked by uid 1000);
        Fri, 09 Jun 2023 18:30:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mpc: Use of_property_read_reg() to parse "reg"
Date:   Fri,  9 Jun 2023 12:30:44 -0600
Message-Id: <20230609183044.1764951-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the recently added of_property_read_reg() helper to get the
untranslated "reg" address value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/i2c/busses/i2c-mpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index cfd074ee6d54..595dce9218ad 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -316,9 +316,10 @@ static void mpc_i2c_setup_512x(struct device_node *node,
 	if (node_ctrl) {
 		ctrl = of_iomap(node_ctrl, 0);
 		if (ctrl) {
+			u64 addr;
 			/* Interrupt enable bits for i2c-0/1/2: bit 24/26/28 */
-			pval = of_get_property(node, "reg", NULL);
-			idx = (*pval & 0xff) / 0x20;
+			of_property_read_reg(node, 0, &addr, NULL);
+			idx = (addr & 0xff) / 0x20;
 			setbits32(ctrl, 1 << (24 + idx * 2));
 			iounmap(ctrl);
 		}
-- 
2.39.2

