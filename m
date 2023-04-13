Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C11B6E0821
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 09:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjDMHrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 03:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjDMHrM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 03:47:12 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1548A78;
        Thu, 13 Apr 2023 00:47:07 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dm2so35280585ejc.8;
        Thu, 13 Apr 2023 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681372026; x=1683964026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi1d/YjeLexKJcbgToDInYZzxIr8FRJ39DahrVUGeSc=;
        b=nfH4WdCQMMdVZx/gPfjblfSFfD1zVmy7zCqRHWLdVSfNVGMhQ0mWxG6f4JZ5p3LPND
         yAFNxbxc4kwiJp6sj4PYKJYGmsnCpWvMS6mwlb/8jouZR0MdvN54+++WXNWCDqjL3g+I
         VO3Uk3j/v88BmzhVa4xfmTLo4zSsNoe206q0xhax4oi4bvAhiQKtc2qDUxT4YAat4UKT
         45AFUsIew9mB4EUrM38/WZNAeru7t2gLCN0t+O+gA8o3BebuoKT4byUWwwhL2CDAgkfm
         WrgDFX8qT25Njj51RFxr5td9P+3dYmqtqsOL7/XBVnP0ksTGhXywRYJUDR/niq+LFYD2
         zAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681372026; x=1683964026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi1d/YjeLexKJcbgToDInYZzxIr8FRJ39DahrVUGeSc=;
        b=PRk5zXEjxlboNGAZBQ67eisOGxjktoHHRBPFTLxH8DFwK36riSAl135sZ3kLtLfoOg
         MlahxnAjf7DtcCxL/dRVmRIAJtvTwCwKS4Cxfd8TUxiTDfg/Y0mH5XdvX8S/OKLu3eJN
         sGwh98uTzukoRCzrllYvVA56lXMszm8Fx77rFTZqgPNkYA6yCFZ0kUO0tUKOxsv1UMsz
         EvJ3n3isyr0+ZB9V8xSkxKPsveP5B60Y6atyl2F87YGvFDrEa9QD2XbES2x8QbD3mG/+
         8vExk5vIgV9l+JxmoHGK5BK851gEgXPpcKTgvPxS41ikgA6xXiie+kxE9RWh3BSzXYsw
         +iog==
X-Gm-Message-State: AAQBX9dNoyzK80Jtk9D1onT8y/FbPIVyruCP6Yt+wN94IlL/SfBjy5jC
        AzN72AulaWar8QklErV12VX0RQyDdjVnWQ==
X-Google-Smtp-Source: AKy350a045OqV+ZEjYV8npQxGwumhviRukmrC30BjZ/b+Y+5EmO8Fzz6nxHlrRjwZLuiuCpa3a2jMQ==
X-Received: by 2002:a17:906:9486:b0:94e:509b:c5a6 with SMTP id t6-20020a170906948600b0094e509bc5a6mr1740152ejx.75.1681372026086;
        Thu, 13 Apr 2023 00:47:06 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id q16-20020a1709060f9000b0094e954fd015sm565620ejj.175.2023.04.13.00.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 00:47:05 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Thu, 13 Apr 2023 09:46:42 +0200
Subject: [PATCH v4 4/4] mfd: tps6586x: register restart handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v4-4-b24af219fb47@skidata.com>
References: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
 drivers/mfd/tps6586x.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 93f1bf440191..91754f30e26b 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -30,6 +30,7 @@
 #include <linux/mfd/tps6586x.h>
 
 #define TPS6586X_SUPPLYENE	0x14
+#define SOFT_RST_BIT		BIT(0)
 #define EXITSLREQ_BIT		BIT(1)
 #define SLEEP_MODE_BIT		BIT(3)
 
@@ -470,6 +471,19 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
 	return tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
 }
 
+static int tps6586x_restart_handler(struct sys_off_data *data)
+{
+	struct device *tps6586x_dev = data->cb_data;
+	int ret;
+
+	/* bring pmic into HARD REBOOT state. this takes at least 10ms. */
+	ret = tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
+	mdelay(15);
+
+	dev_err(tps6586x_dev, "restart failed: timeout\n");
+	return ret;
+}
+
 static void tps6586x_print_version(struct i2c_client *client, int version)
 {
 	const char *name;
@@ -570,6 +584,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
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

