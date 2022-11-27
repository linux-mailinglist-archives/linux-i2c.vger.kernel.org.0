Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC47639C51
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Nov 2022 19:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiK0SY2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 13:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiK0SYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 13:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BAC63B3
        for <linux-i2c@vger.kernel.org>; Sun, 27 Nov 2022 10:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669573398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SXx0cfDGf4zqnICsNky1w2M79w0a2NmEGAvIq2j1/rc=;
        b=UPvEvWlCjWDSXLBXr66FFzaNz7r3vaKeJRHzhEXKed6XHrQF702G0bzejShIImUSGZ1P15
        kW+wnoQmp5feC8ZSjC8Yy15h1e8HEa4kMw1d2018YCLd/nY1vz2yuaUiaDQBUxGydDWABN
        zJ1xJ+18CETE9s59+CWrfbnBerdOJ30=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-0vOp5uyqNIKVlk_6Fu1Avg-1; Sun, 27 Nov 2022 13:23:12 -0500
X-MC-Unique: 0vOp5uyqNIKVlk_6Fu1Avg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BADAE811E67;
        Sun, 27 Nov 2022 18:23:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7ACC49BB61;
        Sun, 27 Nov 2022 18:23:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i2c: cht-wc: Add charger-chip info for the Lenovo Yoga Tab 3 YT3-X90F
Date:   Sun, 27 Nov 2022 19:22:56 +0100
Message-Id: <20221127182257.104410-3-hdegoede@redhat.com>
In-Reply-To: <20221127182257.104410-1-hdegoede@redhat.com>
References: <20221127182257.104410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On x86 devices with a CHT Whiskey Cove PMIC the driver for
the I2C bus coming from the PMIC is responsible for instantiating
the i2c_client for the charger chip.

Add the necessary i2c_board_info for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/busses/i2c-cht-wc.c | 46 +++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 190abdc46dd3..2b2c3d090089 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -380,6 +380,49 @@ static struct i2c_board_info lenovo_yogabook1_board_info = {
 	.platform_data = &bq2589x_pdata,
 };
 
+/********** Lenovo Yogabook YT3-X90F charger settings **********/
+static const char * const lenovo_yt3_bq25892_1_suppliers[] = { "cht_wcove_pwrsrc" };
+
+/*
+ * bq25892 charger settings for the round li-ion cells in the hinge,
+ * this is the main / biggest battery.
+ */
+static const struct property_entry lenovo_yt3_bq25892_1_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", lenovo_yt3_bq25892_1_suppliers),
+	PROPERTY_ENTRY_STRING("linux,secondary-charger-name", "bq25890-charger-0"),
+	PROPERTY_ENTRY_U32("linux,iinlim-percentage", 60),
+	PROPERTY_ENTRY_U32("linux,pump-express-vbus-max", 12000000),
+	PROPERTY_ENTRY_BOOL("linux,skip-reset"),
+	/*
+	 * The firmware sets everything to the defaults, leading to a low(ish)
+	 * charge-current and battery-voltage of 2048mA resp 4.2V. Use the
+	 * Android values instead of "linux,read-back-settings" to fix this.
+	 */
+	PROPERTY_ENTRY_U32("ti,charge-current", 3072000),
+	PROPERTY_ENTRY_U32("ti,battery-regulation-voltage", 4352000),
+	PROPERTY_ENTRY_U32("ti,termination-current", 128000),
+	PROPERTY_ENTRY_U32("ti,precharge-current", 128000),
+	PROPERTY_ENTRY_U32("ti,minimum-sys-voltage", 3700000),
+	PROPERTY_ENTRY_BOOL("ti,use-ilim-pin"),
+	/* Set 5V boost current-limit to 1.2A (MAX/POR values are 2.45A/1.4A) */
+	PROPERTY_ENTRY_U32("ti,boost-voltage", 4998000),
+	PROPERTY_ENTRY_U32("ti,boost-max-current", 1200000),
+	{ }
+};
+
+static const struct software_node lenovo_yt3_bq25892_1_node = {
+	.properties = lenovo_yt3_bq25892_1_props,
+};
+
+/* bq25892 charger for the round li-ion cells in the hinge */
+static struct i2c_board_info lenovo_yoga_tab3_board_info = {
+	.type = "bq25892",
+	.addr = 0x6b,
+	.dev_name = "bq25892_1",
+	.swnode = &lenovo_yt3_bq25892_1_node,
+	.platform_data = &bq2589x_pdata,
+};
+
 static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 {
 	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
@@ -459,6 +502,9 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	case INTEL_CHT_WC_LENOVO_YOGABOOK1:
 		board_info = &lenovo_yogabook1_board_info;
 		break;
+	case INTEL_CHT_WC_LENOVO_YT3_X90:
+		board_info = &lenovo_yoga_tab3_board_info;
+		break;
 	default:
 		dev_warn(&pdev->dev, "Unknown model, not instantiating charger device\n");
 		break;
-- 
2.38.1

