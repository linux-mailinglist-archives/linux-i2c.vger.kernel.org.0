Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16B934C8516
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 08:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbiCAH1C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 02:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232952AbiCAH06 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 02:26:58 -0500
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F5E7D006;
        Mon, 28 Feb 2022 23:26:06 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id d3so18968972wrf.1;
        Mon, 28 Feb 2022 23:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ycVXdQLM7srrY8c6er1f1RFEBefwbs4q7mdQO3Fucms=;
        b=KIuTl6X5nAH4ynNAJoVcyH9kGU7GEXa304za85cKoMBzgfN490Ezhj4mNO59nQTNHS
         0tSvVqPTFgY08vG92FpDgtoSC4W6B/lvwBkGxBUJdVjpSwjSitmbWz469QRXLgIOk6KP
         +fxzrGnreibaP/+XWKSGQ0nuEg4SMsI93opp2QLmuaYimugzQXcCEePEJ4bWtrLnDQ1X
         rgGrGQb8hfrqkdSrzHFVrIZD5eaDB05k4JScS3TqoyZgBknd9/YWnUt+OgmIqeTpOnYC
         B3gSRynQa3DXcjMqReULJF8Hq6liP9H+AHmcOb+Zol7KP0ei4wHnnjgpIBkEFBmVrva+
         fJjg==
X-Gm-Message-State: AOAM531vshrgGM6e8Vxv+SoyG8/VO63qEugBva47N2n4jTFRlhq3afDm
        S+Jp+Xf6hA3EWtO0s4eQ3h0=
X-Google-Smtp-Source: ABdhPJxE3Km/V44Av4khjm6F1ArDMBaclXCOIRAfcaWBf51w/LDZFt9kUhQFP73MnyWw+1nYI56Bqg==
X-Received: by 2002:adf:910a:0:b0:1ed:c3fc:2dcf with SMTP id j10-20020adf910a000000b001edc3fc2dcfmr18652299wrj.430.1646119564477;
        Mon, 28 Feb 2022 23:26:04 -0800 (PST)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id l26-20020a05600c1d1a00b00380def7d3desm1724761wms.17.2022.02.28.23.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:26:04 -0800 (PST)
From:   Lucas Tanure <tanure@linux.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: [PATCH] i2c: meson: Fix wrong speed use from probe
Date:   Tue,  1 Mar 2022 07:26:00 +0000
Message-Id: <20220301072600.12352-1-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Having meson_i2c_set_clk_div after i2c_add_adapter
causes issues for client drivers that try to use
the bus before the requested speed is applied.

The bus can be used just after i2c_add_adapter, so
move i2c_add_adapter to the final step as
meson_i2c_set_clk_div needs to be called before
the bus is used.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index ef73a42577cc..07eb819072c4 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -465,18 +465,18 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	 */
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START, 0);
 
-	ret = i2c_add_adapter(&i2c->adap);
-	if (ret < 0) {
-		clk_disable_unprepare(i2c->clk);
-		return ret;
-	}
-
 	/* Disable filtering */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
 			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
 
 	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
+	ret = i2c_add_adapter(&i2c->adap);
+	if (ret < 0) {
+		clk_disable_unprepare(i2c->clk);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.35.1

