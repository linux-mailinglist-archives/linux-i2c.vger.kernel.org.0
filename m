Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0976938B151
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243732AbhETONZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236832AbhETOMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:38 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD486C061361;
        Thu, 20 May 2021 07:09:47 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id n2so17908807wrm.0;
        Thu, 20 May 2021 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hrezTbeUnB44Jq8jpE0EGXBBC95jZc3BI1HpgJHuc3E=;
        b=BG5z9OHjJtE6foNzs9KvYI1znXuHbxzHT64Zex9Nz+9NOk8AjDerA27cgft8+C5VGU
         uNR8qNNanJTfGWhRW22zobrqtwT9cP4cJbYxeO+aUmFKE5hwoVin8pYm4C6oAtAq0xS/
         wNZ4eWgCuVeufDV3AqtWSItVjV3JfiD99WXVN4uMG6qkTt2jUqZZzuGjBBwMcQAeFKYz
         m5svFHE4c1LDShvqZlOpeu7jVAbpN5T0NE2yh2otyWRsLavqkG82K0SHtBgWHFArD7dJ
         HS/RakkufSBC219eztgN/IF7x36MKLBolqxh00XWnVSY2rdwb3ELYrdbdT9RfQSLO0Yb
         UBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hrezTbeUnB44Jq8jpE0EGXBBC95jZc3BI1HpgJHuc3E=;
        b=Cv7XQ5+G5rmEE8puWJocTviVf2rU7/UkHmYsH+jQymRBv77vNDxq8w58TG5avstDdP
         QfwMb0a28nNeN8Od29YkxrmfC2jDAGMg+HDeGhRiY5EbXs//kWNQ/3X764YPLMTl5XU/
         DCNHopuwAdAG/flAoXZQhp6f+Ax+fYxeCDlw9jpOA/ViEV41eMNzSHORV5L5RT27CtnZ
         n/0p1HuCdYDpRSSMzFEjRrnq7UPCHJM9/z0ORqsuWDwRzRIldWMGBbZn456mzD2jWY/8
         YCgpVHYn9PpMXYBmGarHVtjXqdCU8RMQhCdt4J22i/9vQP2tqd5cR09zMvcdwAxO5Z0f
         GkFA==
X-Gm-Message-State: AOAM532JV5sOtrInw+OZIp7UsRpdJWXmIzfBum+oe6bnFrFpnIXBNdf+
        7hSQcyDEHF1n6q0QR37rLh4=
X-Google-Smtp-Source: ABdhPJwswwszza5NkAZ5hZyeTl1MTHiFRi+v733q3DYJ/IwTZdIlc9YEpMz3KP/YH/J/48X31p6qfQ==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr4719995wre.140.1621519786437;
        Thu, 20 May 2021 07:09:46 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:46 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v4 5/8] clkdev: Make clkdev_drop() null aware
Date:   Thu, 20 May 2021 15:09:25 +0100
Message-Id: <20210520140928.3252671-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520140928.3252671-1-djrscally@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To simplify error handling paths, many functions are no-ops when passed
NULL pointers, for example gpiod_remove_lookup_table(). Mirror that
behaviour for clkdev_drop().

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:
	- Patch introduced

 drivers/clk/clkdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 0f2e3fcf0f19..c082720f8ade 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -286,6 +286,9 @@ EXPORT_SYMBOL(clk_add_alias);
  */
 void clkdev_drop(struct clk_lookup *cl)
 {
+	if (!cl)
+		return;
+
 	mutex_lock(&clocks_mutex);
 	list_del(&cl->node);
 	mutex_unlock(&clocks_mutex);
-- 
2.25.1

