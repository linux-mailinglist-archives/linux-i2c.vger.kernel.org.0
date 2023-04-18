Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B594C6E5F78
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 13:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjDRLLJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 07:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjDRLKz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 07:10:55 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0378690;
        Tue, 18 Apr 2023 04:10:31 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id xd13so38215535ejb.4;
        Tue, 18 Apr 2023 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816229; x=1684408229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uj87T+hG7LXIYMqH9ajwVI/kHwGEYduJ3KruAcTVFbY=;
        b=KdRrHgyS6gjueA0u8yVZOCP0GyvZT6zqYwmIirNo6dJ1bVal0AoDargg1S+op4S4XB
         aGjWZiAoVvUrhgWbrzfWXJG1AXq1FX7duI3VqWVvMSnmQ6orDSQIrDTNQIjSRggPo0NU
         DsHEmRR1yuUGWUqgA0XychhS6yx3JZca22wKDsz1KkapBDhGZ+73nZfrGF2/RJVn14Zu
         lLGLaqOpO4Xi5hxpGInTLlpL7jkpMVP7d4ZOHxXhbBMaMcx1DJpY9Q5yikFbj9g27WnZ
         rI6fvPrVb20j2o8aKPAXZgYKTFhoB43Zjk+UCDkMmYSdJlRo83mXiAVWc6YPxdyKpokh
         F41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816229; x=1684408229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uj87T+hG7LXIYMqH9ajwVI/kHwGEYduJ3KruAcTVFbY=;
        b=KpPpQxVBKeGsYEhbBfVgyzqNx1JUfRG1FV2JTnLo5D3X01tVaCDfLuzGvfhA34DP5/
         qAlnj875hdvW4E4odRI4H6OKX0aHsL58jc+gMSI9RlzQvjGBVnZm9qmwqh0KdSuYuruG
         B35r3bggvw/h3LEN3mcHi9oBTrM36C/ySHZKstN4/SDx6gXDPbCMlcc9DMV2uNFeduw9
         mz904CxvyEmLuf36aMhP7AkxxXBb97wO8c57hbCM23oL0vKSDF+koI8ibY/sowZl1Rkg
         /1wOs4vhp879BighlY6FVvx2fx7Udz6S6465TL19kqo5MC8LI31mNjCH597FWVT8KlU0
         TPgQ==
X-Gm-Message-State: AAQBX9c9S46uw0yU07pdBakC7du58XUAjZjbUGnRvlOvmZkdIxzsLRTW
        M4FcpEnQQ0eno3jyiLnJAyFp5NrifgyPjSwQ
X-Google-Smtp-Source: AKy350bXbwagTXdOA606HRqRvyKKhdNP8U0+PTGkWU4hjNNAesTtpKJMMkFzJ5cU6Rx+2nwcElEzGg==
X-Received: by 2002:a17:906:2bc7:b0:94e:ef09:544c with SMTP id n7-20020a1709062bc700b0094eef09544cmr9665939ejg.10.1681816229387;
        Tue, 18 Apr 2023 04:10:29 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906379a00b0094eef800850sm5954554ejc.204.2023.04.18.04.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:10:29 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 18 Apr 2023 13:10:05 +0200
Subject: [PATCH v5 6/6] mfd: tps6586x: register restart handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v5-6-ab090e03284d@skidata.com>
References: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
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

The TPS658629-Q1 (unfortunately the only TPS6586x with public data sheet)
provides a SOFT RST bit in the SUPPLYENE reg to request a (cold) reboot,
which takes at least 10ms (as the data sheet states).
This avoids the hang-up.

Tested on a TPS658640.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 226e856e34e0..f7665b368071 100644
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
+	/* tps6586x only provides a hard/cold reboot, skip others. */
+	if (data->mode != REBOOT_UNDEFINED && data->mode != REBOOT_COLD &&
+	    data->mode != REBOOT_HARD)
+		return NOTIFY_DONE;
+
+	/* bring pmic into HARD REBOOT state. this takes at least 10ms. */
+	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
+	if (ret)
+		return notifier_from_errno(ret);
+
+	mdelay(20);
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

