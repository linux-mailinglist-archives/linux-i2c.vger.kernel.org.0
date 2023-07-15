Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F84475475B
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jul 2023 09:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjGOHxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jul 2023 03:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjGOHxq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jul 2023 03:53:46 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E6935B3;
        Sat, 15 Jul 2023 00:53:45 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso24223965e9.0;
        Sat, 15 Jul 2023 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689407624; x=1691999624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cO8MaIrmzLIgpAh79j/PTcb6h7we+UptA1d76S5ZSws=;
        b=S0yWZlEfOXQCIdfQ7MJ/pLor2v4HmMmfN9UlsoKQIFHefBL4zXFQXlEFgONXXWVska
         yQev/sBOgNu08yX6LX/1S1dWqBlm9HVCLPnbVNUbi5RtP18YMGtiLxjcOA4jViUCfD28
         Ek7fKcPmlKPSEIOgJ+Uaq3iKtPnB/P936EDPHSo7JaeMAZ1fm1jyZSKE++/1XSDTce/w
         uzvdU7nc/SdoK5kfjpF/r/8cbNFkE85OeSFlbztuRFmCCimEswkNMV2af8AM/4ziq9xe
         CRCFl2qBwDBxVo54zLGeTEhT5HVF11+7yZ2slZ21TocaPHIfDAnoutrPXOd0xEkBxyTX
         t+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689407624; x=1691999624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO8MaIrmzLIgpAh79j/PTcb6h7we+UptA1d76S5ZSws=;
        b=XG8APEn6gt6GVcoYBFjlKb++LuKoJERvTTITFzqixMAFe9zVnl6v27F0nIQa9LZKpq
         k8z1aums1zSvxlAwpjdpYN9qBJTlkuZf3E3yIFoWcAm1+C1GG8XgfUmr+lnGP9l9hF5n
         iqht54BCiPd9nA1v8oeAJ3i72GYGFllnJNrj3WlSzvacctuepHmlUMj6pREWP+Y0cAb6
         m17iISO/pIN9hCfzsAjg4uaGp/HsmP+jjWjKB0it2ff7aCDhBDtVVwfdE30FMGAjZ8Ri
         1m8VBRIJru9SLMmGrTFD7u0CuQvC05/8O02lVEEEFtp0VD6QlDalsZn+b1rzMsGIUFry
         aS4A==
X-Gm-Message-State: ABy/qLYlN4/OKdhyVK6a2//aZPle8AJtef81sD1NpgqEPj7osYXaQ08i
        L25CN3WoXtrzubSXTY8H1OA=
X-Google-Smtp-Source: APBJJlGro5VHrnSJt5gm25Ax8kAN55eHOQJS1zTEspa+DjFeZWNzb+DbAda48F6OBIRsbIG1wX1WEg==
X-Received: by 2002:a1c:cc15:0:b0:3fc:48e:581e with SMTP id h21-20020a1ccc15000000b003fc048e581emr5990254wmb.24.1689407624088;
        Sat, 15 Jul 2023 00:53:44 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm13001271wro.24.2023.07.15.00.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 00:53:43 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Sat, 15 Jul 2023 09:53:27 +0200
Subject: [PATCH v7 5/5] mfd: tps6586x: register restart handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v7-5-18699d5dcd76@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
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

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Acked-for-MFD-by: Lee Jones <lee@kernel.org>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index b12c9e18970a..1777d8d3a990 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -30,6 +30,7 @@
 #include <linux/mfd/tps6586x.h>
 
 #define TPS6586X_SUPPLYENE	0x14
+#define SOFT_RST_BIT		BIT(0)
 #define EXITSLREQ_BIT		BIT(1)
 #define SLEEP_MODE_BIT		BIT(3)
 
@@ -475,6 +476,19 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
 	return notifier_from_errno(-ETIME);
 }
 
+static int tps6586x_restart_handler(struct sys_off_data *data)
+{
+	int ret;
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
@@ -575,6 +589,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
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

