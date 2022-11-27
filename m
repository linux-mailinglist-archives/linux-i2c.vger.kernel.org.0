Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E948A639C4A
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Nov 2022 19:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiK0SYI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 13:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiK0SYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 13:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597C362C3
        for <linux-i2c@vger.kernel.org>; Sun, 27 Nov 2022 10:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669573394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SspE+TBwWSr9TCW1N3as9/TtY9hK2M85GwILDRXgC3E=;
        b=WPREulSUC4V4eX+VQN4oLftMzYoWF+jFEZ89HUFygCrFvLg1R+/lV5jipgmhMu890iAno0
        zmh6DxVMC0rMYLCa/aHU/19sDDMmnK3WYmJTjuwWr3YjZQfPIuHNm1OqFWAqEjajzyOKr3
        VwlU0XcW4F+wB2khHBZfWOl1jdoynuc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-NPVO82XUNsek8f9bZ6Bryw-1; Sun, 27 Nov 2022 13:23:11 -0500
X-MC-Unique: NPVO82XUNsek8f9bZ6Bryw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8201D185A78F;
        Sun, 27 Nov 2022 18:23:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7BDF849BB61;
        Sun, 27 Nov 2022 18:23:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mfd: intel_soc_pmic_chtwc: Add Lenovo Yoga Tab 3 X90F to intel_cht_wc_models
Date:   Sun, 27 Nov 2022 19:22:55 +0100
Message-Id: <20221127182257.104410-2-hdegoede@redhat.com>
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

The drivers for various CHT Whiskey Cove PMIC child-devices need to know
the model, since they have model specific behavior. The DMI match table
for this is shared between the child-device-drivers inside the MFD driver.

Add the Lenovo Yoga Tab 3 X90F, which is a previously unknown tablet
model with a CHT Whiskey Cove PMIC, to the intel_cht_wc_models enum and
to the DMI match table.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/intel_soc_pmic_chtwc.c | 8 ++++++++
 include/linux/mfd/intel_soc_pmic.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index 9216f0d34206..d53dae255490 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -165,6 +165,14 @@ static const struct dmi_system_id cht_wc_model_dmi_ids[] = {
 			/* Non exact match to match all versions */
 			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
 		},
+	}, {
+		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+		.driver_data = (void *)(long)INTEL_CHT_WC_LENOVO_YT3_X90,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
 	},
 	{ }
 };
diff --git a/include/linux/mfd/intel_soc_pmic.h b/include/linux/mfd/intel_soc_pmic.h
index 945bde1fe55c..9ba2c1a8d836 100644
--- a/include/linux/mfd/intel_soc_pmic.h
+++ b/include/linux/mfd/intel_soc_pmic.h
@@ -18,6 +18,7 @@ enum intel_cht_wc_models {
 	INTEL_CHT_WC_GPD_WIN_POCKET,
 	INTEL_CHT_WC_XIAOMI_MIPAD2,
 	INTEL_CHT_WC_LENOVO_YOGABOOK1,
+	INTEL_CHT_WC_LENOVO_YT3_X90,
 };
 
 /**
-- 
2.38.1

