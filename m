Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8296CA6A6
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 15:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbjC0N6k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 09:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbjC0N6b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 09:58:31 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127893C00;
        Mon, 27 Mar 2023 06:58:31 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id r7so6422635uaj.2;
        Mon, 27 Mar 2023 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679925510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJi9k0SusRoBJX6bd5XD9Ah+7FRBbKHs2NSnZLEQwl0=;
        b=focFGVZKHAYnSHwxsLeQfvbDZEaTLOe1a92lQloTQNCzqL0KziKQqfumOQid1ngq1m
         DPLBOccNhN1hVYHkj6kkRABsonQ7SvmLVsRZ/qlO8wVZLgNyQdB66P40BmhdwFJmwTYG
         WaQgY3aGPrLlY2DISHPTQgBlqHSLrlbuY9ZG5zhxMOHzOqre/iLhI/jjdFqWoCPsl9iZ
         a7OVWIYsgd1Xq8PWR655+4ClZveczP64UB4wl6Ifo/aoYwtkkVeWckK9CECKUo0H7vn1
         eLYT7SYdIA2y3btczc/C1Ijr2BB1ZAPI7EPzluDxZ4eIR05VsUoD5CJbCp0n24CTRNek
         MOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679925510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJi9k0SusRoBJX6bd5XD9Ah+7FRBbKHs2NSnZLEQwl0=;
        b=F48fZ6NjXhisHVj2caETCa0PywwX7xUIsjZMHOUyhl2dHt0P/Lf2x4myu8pX2AwS4V
         /W7J/odH2yTFeC4zCnKDiwoiV+LOGyrTQrehW/X6ieVq2Y9+eE1z8+8xVny42YAybSeQ
         NcYknq8cxqPnL3j/S6K8TYC7X4Xe7YbZvLvaK6JOrtzsBxeNaVDSSRB1pEVllg2DmZI/
         TcZTP2Oz1w/WfB2c0Iv120p5MtClASjgeSzqQ2/5zyoOzZnV6+bWbBUtJIUNGqHKY4S3
         h0SGOQmbdwd4a7vGGCc+YDZITdnF0iJfoL2V4Ud0US6g1dP2Ei4BUumfBucpE6y7Ivf6
         c66g==
X-Gm-Message-State: AAQBX9c6hCWHckot5pgQeZHyRLeQLQq7zWa4cArpYlCx/L8w+XwiGGVA
        X/ewaZs9go/0QK7dgtjkoV4=
X-Google-Smtp-Source: AKy350ZyIcCs4NoQw4jqpwzxJW41AoFAtKNvyMHb4Ao/416i7Bz9wVzuOXP+8yFQwuuMe4CnC/ZPmw==
X-Received: by 2002:a1f:6e4a:0:b0:403:23cb:4773 with SMTP id j71-20020a1f6e4a000000b0040323cb4773mr4238755vkc.2.1679925510654;
        Mon, 27 Mar 2023 06:58:30 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id 135-20020a1f198d000000b004367f3393b8sm2731072vkz.28.2023.03.27.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:58:30 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Mon, 27 Mar 2023 15:57:46 +0200
Subject: [PATCH v3 4/4] mfd: tps6586x: register restart handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v3-4-3c0ee3567e14@skidata.com>
References: <20230327-tegra-pmic-reboot-v3-0-3c0ee3567e14@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v3-0-3c0ee3567e14@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
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
For the "normal reboot", this is basically the case since
8f0c714ad9be1ef774c98e8819a7a571451cb019.
However, this workaround is not executed in case of an emergency restart.
In case of an emergency restart, the system now simply hangs in the
bootloader, as VDE is not enabled (as not in use).

The TPS658629-Q1 (unfortunately the only TPS6586x with public data sheet)
provides a SOFT RST bit in the SUPPLYENE reg to request a (cold) reboot.
This avoids the hang-up.

Tested on a TPS658640.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 93f1bf440191..c8adf6a08277 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -30,6 +30,7 @@
 #include <linux/mfd/tps6586x.h>
 
 #define TPS6586X_SUPPLYENE	0x14
+#define SOFT_RST_BIT		BIT(0)
 #define EXITSLREQ_BIT		BIT(1)
 #define SLEEP_MODE_BIT		BIT(3)
 
@@ -470,6 +471,17 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
 	return tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
 }
 
+static int tps6586x_restart_handler(struct sys_off_data *data)
+{
+	struct device *tps6586x_dev = data->cb_data;
+
+	/* bring pmic into HARD REBOOT state */
+	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
+
+	mdelay(500);
+	return 0;
+}
+
 static void tps6586x_print_version(struct i2c_client *client, int version)
 {
 	const char *name;
@@ -570,6 +582,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
 			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
 			goto err_add_devs;
 		}
+
+		ret = devm_register_restart_handler(&client->dev, &tps6586x_restart_handler,
+						    &client->dev);
+		if (ret) {
+			dev_err(&client->dev, "register restart handler failed: %d\n", ret);
+			goto err_add_devs;
+		}
 	}
 
 	return 0;

-- 
2.34.1

