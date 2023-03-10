Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C576B471E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 15:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbjCJOs6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 09:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbjCJOrg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 09:47:36 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D920122CFD;
        Fri, 10 Mar 2023 06:47:20 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id bi17so4404516oib.3;
        Fri, 10 Mar 2023 06:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka6j+AgA2RvHVAeCG1VhdJNgY4FfjdR69Jx9JHYwZhg=;
        b=w8TGocdIZCTyMZCLDafig57t1wBUXSSUvEulxa/nlsdW8hyMX8Z/7k1HhUThS+tsBS
         GN74MUBRD7b3lj5jO9nIvlm3i6pJXjrRDpvRB7hfcd7Duq9BEHHEbda9+2JKnwZwBaQ0
         VhCKEh1tUqIt64f7+Dv3K1wc3E65WRGUmEKKfBNSMpzxAioZSZpbVVOEWBBbAVJTI8Rx
         1UAtA/mt9voXtjOmR0FSnEufMGSxecnJBqfUukRumdfZ4cFidUvGWSPzlHz9nt+jqsmf
         lZjLs+6eRh+ZgC+az295syeWa6qCB1k0Tmmu9grGvmXxPKYxl/lBIMyIcPnapTKwHQVA
         ydxg==
X-Gm-Message-State: AO0yUKXjWPkAusqJMlGHuAQ0AOyfk9pd7uC8Plr+YR1Chn7+3j3MmPw5
        6Opz1DZZxXe3pSDRQnP91JzF6AQKeQ==
X-Google-Smtp-Source: AK7set8TvC0VECuhekh0dMNgsgsQFHZqqlEa6RM1vSnKJe/vWFQIrYIcuTUldEWpst2SMO5u3Smlfg==
X-Received: by 2002:a05:6808:e8f:b0:383:b38f:74f9 with SMTP id k15-20020a0568080e8f00b00383b38f74f9mr1132785oil.17.1678459635957;
        Fri, 10 Mar 2023 06:47:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n22-20020a4ae1d6000000b005253a5cc3cfsm865351oot.29.2023.03.10.06.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:15 -0800 (PST)
Received: (nullmailer pid 1542639 invoked by uid 1000);
        Fri, 10 Mar 2023 14:47:07 -0000
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: Use of_property_read_bool() for boolean properties
Date:   Fri, 10 Mar 2023 08:47:07 -0600
Message-Id: <20230310144707.1542595-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/i2c/busses/i2c-mpc.c | 2 +-
 drivers/i2c/busses/i2c-pxa.c | 6 ++----
 drivers/i2c/i2c-core-of.c    | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 81ac92bb4f6f..bec0c5dc20d1 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -842,7 +842,7 @@ static int fsl_i2c_probe(struct platform_device *op)
 		data->setup(op->dev.of_node, i2c, clock);
 	} else {
 		/* Backwards compatibility */
-		if (of_get_property(op->dev.of_node, "dfsrr", NULL))
+		if (of_property_read_bool(op->dev.of_node, "dfsrr"))
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index b605b6e43cb9..f9fa5308556b 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1261,10 +1261,8 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	/* For device tree we always use the dynamic or alias-assigned ID */
 	i2c->adap.nr = -1;
 
-	if (of_get_property(np, "mrvl,i2c-polling", NULL))
-		i2c->use_pio = 1;
-	if (of_get_property(np, "mrvl,i2c-fast-mode", NULL))
-		i2c->fast_mode = 1;
+	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
+	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
 	*i2c_types = (enum pxa_i2c_types)(of_id->data);
 
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index bce6b796e04c..aa93467784c2 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -55,7 +55,7 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 	if (of_property_read_bool(node, "host-notify"))
 		info->flags |= I2C_CLIENT_HOST_NOTIFY;
 
-	if (of_get_property(node, "wakeup-source", NULL))
+	if (of_property_read_bool(node, "wakeup-source"))
 		info->flags |= I2C_CLIENT_WAKE;
 
 	return 0;
-- 
2.39.2

