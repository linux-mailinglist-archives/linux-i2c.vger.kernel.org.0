Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B18537A1E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 May 2022 13:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbiE3Lnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 May 2022 07:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235989AbiE3Lnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 May 2022 07:43:42 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE293EF0E;
        Mon, 30 May 2022 04:43:40 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id n13-20020a17090a394d00b001e30a60f82dso1882875pjf.5;
        Mon, 30 May 2022 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1BvAlV75hXlmEW6H7NZj8m2+emc7pNPWivCpEN7QdQQ=;
        b=AKkizI5vxdL5uQcfmsXWVkWdXI8Pq9JhYnyFP0MGpMimsx6reIaVisnHQEXGR52xZY
         wxcGjJUMBWEq9eU3gQCY9ZNIey6s8Xd+jt09aZwkWby8RrmpXEC3olVVASmhX7omnVVq
         f9OXP5KNAL5TxNuAhyUwDs12Cr+pMSULGKNyEe/pvJoAeLqw2rbAVFV5b8IIBNaoaX8q
         yHlK9CB/JoHkSgMvc0+BF9zg2QRbGlDIqm2qGYVo4DmMDHAE8XLGNzvQFBeab+ux4gxo
         X7OcuLR3x+woErt+qDtGgD+/CG2m3vkFsd8jc9O9WMvm/qzqtlGr2UYZr9a84t5CAyPl
         xn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1BvAlV75hXlmEW6H7NZj8m2+emc7pNPWivCpEN7QdQQ=;
        b=soDzh7/pn3xw8afz6RIUfap9ztd41VfEcGT1VaO7EmIy4jpUXxifjS7lqPdyja/B5E
         oqVqGc/ukzEwBahu0cC4EBTt3iQvy2KI4ZnweLC8jONghgriPs0acAwS9TBldBuEBh/k
         c9j+DY58MSPYF8VjrwyW+38dasIhBneuyfKhx55bfLZU5dXrff4gfmSwLpJbISNjS6IH
         6ZmO74Z0EJbJHLnUWXAsLrYcWu1e9p/pdJn7HnyVopXXGQnlq5lq5A3J177CZlRfwEAq
         JwfQIovaL0IpECGlVGOgfPA+H/K1lckbbfN1IbDdabFCXQjLKA3QW2Z6USNdhJ94lB1c
         zQTw==
X-Gm-Message-State: AOAM533LhSnfQEusrkon5Shv5Q9Q/+sUiBzskJjI6oRyRqk457LQbQH/
        TDv+0tUtbuRg1eDBnabx8dI=
X-Google-Smtp-Source: ABdhPJyBjD7ZjB9mqxCcZxSrR5aW0PfM7hAyksDSD984OOLHfR+h/OvSF/fOXgX4vDfty6M+7PqF0A==
X-Received: by 2002:a17:902:8ecc:b0:15e:f63f:233f with SMTP id x12-20020a1709028ecc00b0015ef63f233fmr55548885plo.86.1653911020277;
        Mon, 30 May 2022 04:43:40 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902c2ca00b0015e8d4eb207sm8865069pla.81.2022.05.30.04.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:43:39 -0700 (PDT)
From:   Potin Lai <potin.lai.pt@gmail.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Porin Lai <potin.lai@quantatw.com>,
        Porin Lai <potin.lai.pt@gmail.com>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] aspeed: i2c: add manual clock setup feature
Date:   Mon, 30 May 2022 19:40:56 +0800
Message-Id: <20220530114056.8722-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Porin Lai <potin.lai.pt@gmail.com>

Add properties for manual tuning i2c clock timing register.

* aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setup
* aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
* aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
* aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 55 ++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..1f4b5c4b5bf4 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -898,6 +898,56 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 	return 0;
 }
 
+/* precondition: bus.lock has been acquired. */
+static int aspeed_i2c_manual_clk_setup(struct aspeed_i2c_bus *bus)
+{
+	u32 divisor, clk_high, clk_low, clk_reg_val;
+
+	if (device_property_read_u32(bus->dev, "aspeed,i2c-base-clk-div",
+				     &divisor) != 0) {
+		dev_err(bus->dev, "Could not read aspeed,i2c-base-clk-div\n");
+		return -EINVAL;
+	} else if (divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
+		dev_err(bus->dev, "Invalid aspeed,i2c-base-clk-div: %u\n",
+			divisor);
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-high-cycle",
+				     &clk_high) != 0) {
+		dev_err(bus->dev, "Could not read aspeed,i2c-clk-high-cycle\n");
+		return -EINVAL;
+	} else if (clk_high > ASPEED_I2CD_TIME_SCL_REG_MAX) {
+		dev_err(bus->dev, "Invalid aspeed,i2c-clk-high-cycle: %u\n",
+			clk_high);
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-low-cycle",
+				     &clk_low) != 0) {
+		dev_err(bus->dev, "Could not read aspeed,i2c-clk-low-cycle\n");
+		return -EINVAL;
+	} else if (clk_low > ASPEED_I2CD_TIME_SCL_REG_MAX) {
+		dev_err(bus->dev, "Invalid aspeed,i2c-clk-low-cycle: %u\n",
+			clk_low);
+		return -EINVAL;
+	}
+
+	clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
+	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
+			ASPEED_I2CD_TIME_THDSTA_MASK |
+			ASPEED_I2CD_TIME_TACST_MASK);
+	clk_reg_val |= (divisor & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
+			| ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
+			   & ASPEED_I2CD_TIME_SCL_HIGH_MASK)
+			| ((clk_low << ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
+			   & ASPEED_I2CD_TIME_SCL_LOW_MASK);
+	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
+	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
+
+	return 0;
+}
+
 /* precondition: bus.lock has been acquired. */
 static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 			     struct platform_device *pdev)
@@ -908,7 +958,10 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	/* Disable everything. */
 	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
 
-	ret = aspeed_i2c_init_clk(bus);
+	if (of_property_read_bool(pdev->dev.of_node, "aspeed,i2c-manual-clk"))
+		ret = aspeed_i2c_manual_clk_setup(bus);
+	else
+		ret = aspeed_i2c_init_clk(bus);
 	if (ret < 0)
 		return ret;
 
-- 
2.17.1

