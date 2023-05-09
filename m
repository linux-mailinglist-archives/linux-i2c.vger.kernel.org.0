Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0D96FCE3D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 21:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbjEITD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 15:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234983AbjEITDp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 15:03:45 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D283C15;
        Tue,  9 May 2023 12:03:42 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9619095f479so997324666b.1;
        Tue, 09 May 2023 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659021; x=1686251021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lg+AaRFA0UQRvNOojE4EBlRJNw3ULgD7/078ZrdcKSc=;
        b=FRP9FGuh3WhE0zFzq6ReOR6WRHhCd7Lcym/WHCBZLuje1tKK571gGvNANpetGfMMoL
         NgtpCh8mqlJ9t09DtZWTj6GV8TT6j1ZXKvYX3mTHTMS+qZo8RElx3Hy/wKhnTcmjPLCN
         pQbuJIVGHJkXeIntHaMAn21+xYVxAxhejRkUZnweBGMNAG9e84aCAiY112dqxE88QIPh
         CoHWE8FIluBl04iImcIvmCje8KiJDfBCiIosA7DU6jqHdd+CzFQv2bJJ7KnjgK47dTEj
         P9HfCQ87WwSEiQNiUdaqLGbhQej5C0Y1X5kIiipxfSNNl0OT533VNxPwhGTZLcgXm7oO
         IjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659021; x=1686251021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg+AaRFA0UQRvNOojE4EBlRJNw3ULgD7/078ZrdcKSc=;
        b=ckmydxHM1+qn3apUV8z6+OH38YL4RFBo9PcznREDJrCBRmXUAAMxJMqaFI0k9fK41F
         CTbn3BZxfIQGFKGIcuPc4cFP2VY2eytO5fi2CdgLtrjQyKwgEwCCUrL8QC32IQ8H/Mgs
         V3hmBw/wHIBp7qdfqV5NQfWkDAvci8Lvp9wNcImlAUciz3ePWk7MZOc/GaLtqouVUm5g
         EbhiF/3Lw8ZJBuqImsz9/VgwHz/ywN5VjtXLF13n1cXzR4916wPC0DhAXkVxDBqQeBFv
         L/NVJwJw0pJACpX6X75J3LFVWYY3X3tLlv4f7ZyKE14PU4oCaxrrD8gQ3ORaZSy8vdhv
         PToQ==
X-Gm-Message-State: AC+VfDz6O2pMqjkkj8Te1r3LxzXsL9ShWcFATsYq4JljmdVHiupBObf7
        QZ7bPkYIPT03d/4iuKZGM3KjXw6NyzVdcPvZ
X-Google-Smtp-Source: ACHHUZ7K5NExcERUaziATQooKwQ1xXwdhlZ+QKnFckt4KMJEXCxZqUcZo1UdzvcVXuZXNmQpgKVlsQ==
X-Received: by 2002:a17:907:6e0f:b0:94e:fe77:3f47 with SMTP id sd15-20020a1709076e0f00b0094efe773f47mr13781046ejc.67.1683659020286;
        Tue, 09 May 2023 12:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009697aa5acfcsm1640232ejz.122.2023.05.09.12.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:03:39 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 09 May 2023 21:03:03 +0200
Subject: [PATCH v6 5/5] mfd: tps6586x: register restart handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v6-5-af44a4cd82e9@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

There are a couple of boards which use a tps6586x as
"ti,system-power-controller", e.g. the tegra20-tamonten.dtsi.
For these, the only registered restart handler is the warm reboot via
tegra's PMC. As the bootloader of the tegra20 requires the VDE, it must
be ensured that VDE is enabled (which is the case after a cold reboot).
For the "normal reboot", this is basically the case since 8f0c714ad9be.
However, this workaround is not executed in case of an emergency restart.
In case of an emergency restart, the system now simply hangs in the
bootloader, as VDE is not enabled (because it is not used).

The TPS658629-Q1 provides a SOFT RST bit in the SUPPLYENE reg to request
a (cold) reboot, which takes at least 20ms (as the data sheet states).
This avoids the hang-up.

Tested on a TPS658640.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index b12c9e18970a..3b8faa058e59 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -30,6 +30,7 @@
 #include <linux/mfd/tps6586x.h>
 
 #define TPS6586X_SUPPLYENE	0x14
+#define SOFT_RST_BIT		BIT(0)
 #define EXITSLREQ_BIT		BIT(1)
 #define SLEEP_MODE_BIT		BIT(3)
 
@@ -475,6 +476,24 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
 	return notifier_from_errno(-ETIME);
 }
 
+static int tps6586x_restart_handler(struct sys_off_data *data)
+{
+	int ret;
+
+	/* TPS6586X only provides a hard/cold reboot, skip others. */
+	if (data->mode != REBOOT_UNDEFINED && data->mode != REBOOT_COLD &&
+	    data->mode != REBOOT_HARD)
+		return NOTIFY_DONE;
+
+	/* Put the PMIC into hard reboot state. This takes at least 20ms. */
+	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
+	if (ret)
+		return notifier_from_errno(ret);
+
+	mdelay(50);
+	return notifier_from_errno(-ETIME);
+}
+
 static void tps6586x_print_version(struct i2c_client *client, int version)
 {
 	const char *name;
@@ -575,6 +594,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
 			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
 			goto err_add_devs;
 		}
+
+		ret = devm_register_restart_handler(&client->dev, &tps6586x_restart_handler,
+						    NULL);
+		if (ret) {
+			dev_err(&client->dev, "register restart handler failed: %d\n", ret);
+			goto err_add_devs;
+		}
 	}
 
 	return 0;

-- 
2.34.1

