Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C1A2C8553
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgK3NdP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgK3NdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:14 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB5BC0617A7;
        Mon, 30 Nov 2020 05:32:02 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id d3so15383938wmb.4;
        Mon, 30 Nov 2020 05:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQdwYeMzPseIpDXUiLIT9hkS7ClLsv/lm9CY7n8eprs=;
        b=ntKHJ05P7kwwej7B3/bM8gpGvw9px5edstK9WYOoikfPuhXRzvnrEdIzSdLQ183++J
         csaWbbzBeFIeE+Qu8pn/+Ja1p9NSv9A39w70AOC+XN9GTUx5ECILc+IexJH8Zr98HN71
         8/0V/mO1noQAy2U80MBWRW6y2nVk4kq1Z9Ji3t2JVxmVptw66EXX2vy9UTSTzjYwfWoK
         Ncy2pqphfNUeyALQRDmcFee39rETI6qGDiM6Ds2g+TfAQmb83QXh7AX9hfxRcCzfU0FU
         oe0Yi6dfNEACMd+hVUVsUVfJzU/L0xXoTg91JVuVlNR05K0pbNMc1aWhTBfJ2SPgQoh4
         vfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQdwYeMzPseIpDXUiLIT9hkS7ClLsv/lm9CY7n8eprs=;
        b=K5Hkei3wjLBXk/ZfP4Su8q4fwpqF4VU35XEyCPaPLxSbPfQALI3JM+vx0iBEpbjlpy
         3r3zrtMRy8E5DwnTZbbSefvtHlXdKfPL5DS7gGpVgWbRaBKWbJlpioSp+hVci1duPH8y
         8FoINJh0tzwXn4PWjX1gTDWd4Kc2SxoS2V97WkruzZdbUca6ry5/ewVwhsJhi5Esp6P7
         XsAWHPi1UZ1F2AUmX7jn+hEABxk71mGmKoC/9v3G2VDFBVSalbF9YzX2r3KRfRHbFdKy
         Yd6pmQVECuP3P2nBIrWUWZRA+lciostvnCl5aiWkPCjk+KeZBSz8rep2bBBU3i6X8sQQ
         A9BA==
X-Gm-Message-State: AOAM5321EOcUyXVkhT/NXK4xYUhvHc0k7R8NpZ0gW9JUdCd2TjBtl0zG
        GxWtI7VI/1AHoGvW2daxcbp39ChtgGpcf/kf
X-Google-Smtp-Source: ABdhPJxHqd9qSFpaMcuFblPNdct1nYlwJkSKoY66tmWoUlL/S+cakZ0YUKByMejlo1eGSNUdopCTkQ==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr23332580wmh.54.1606743121413;
        Mon, 30 Nov 2020 05:32:01 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:00 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: [PATCH 06/18] software_node: amend software_node_unregister_node_group() to perform unregistration of array in reverse order to be consistent with software_node_unregister_nodes()
Date:   Mon, 30 Nov 2020 13:31:17 +0000
Message-Id: <20201130133129.1024662-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To maintain consistency with software_node_unregister_nodes(), reverse
the order in which the software_node_unregister_node_group() function
unregisters nodes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:

	Patch introduced

 drivers/base/swnode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index d39e1c76d98d..9bd0bb77ad5b 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -782,7 +782,10 @@ void software_node_unregister_node_group(const struct software_node **node_group
 	if (!node_group)
 		return;
 
-	for (i = 0; node_group[i]; i++)
+	while (node_group[i]->name)
+		i++;
+
+	while (i--)
 		software_node_unregister(node_group[i]);
 }
 EXPORT_SYMBOL_GPL(software_node_unregister_node_group);
-- 
2.25.1

