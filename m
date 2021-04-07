Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAAB357494
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355436AbhDGSvB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348580AbhDGSvA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 14:51:00 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83200C061760
        for <linux-i2c@vger.kernel.org>; Wed,  7 Apr 2021 11:50:50 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 71so21829543ybl.0
        for <linux-i2c@vger.kernel.org>; Wed, 07 Apr 2021 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Z+cU0cubea5IW7G2rrulWCH4/axSqIvQteecVrrdERs=;
        b=datFYg43GzeOSYAuHMH4cqmENNE1YOtm17ojn/kK6cIRea+OF2hpgmVjn/o0YHNJ5k
         Ewdy0SXBoIjyZic7xDF/r4V92e+lchqNyynmUlCFVLIkCDAeSIRWS75aMmQJadTjntUK
         KLg/QA4uWUHOdOU0UqYooSENsQfAi7s9dwIyTZCiCAOTwYYO7cw8gD9LHD+l3JskoWMD
         rQR9QcfITlveNjXK8hynavgw2wMFWb2Kv79R2ZTOiUdb1s0qQl9JithlJXzHsMvL4/HT
         q/DlQ5OOnyX2HxiFIpkmdItdRHlzRs/T/xSy1HEUDRVcIVk535XJNurcXX8RoH9jfGsb
         zhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Z+cU0cubea5IW7G2rrulWCH4/axSqIvQteecVrrdERs=;
        b=PnYrRMXYHTwPjN2yyi0PKRvyqLGGoXrRdZr37w3IuyiZiu87l9ulfb2mc5ny8klEmQ
         6GZeXRDb1ySFbIcltR5m61NjA/BLqfQx5lEP50iVpdEi/DXp4npw1U2VFk/802tZQpJV
         vWrn0j/rslLqEerWkgw+I9YHMzf8ViNn/M3JEzyhsiSOaOBprHjRMhUqkOTf0JMCX3eB
         WiXv2Ta1NMXDwjJwhchHAa/crqvL9clGPlcB21vZapCmsnldbANu/7Chlqe1b2KUh5jA
         ep7jGMmma8X1uVUqaz3pZksTT5qxKfZp1pHxExHFS8QUi2kDDHpKqMLMcisoMmi//kuy
         lqkA==
X-Gm-Message-State: AOAM53242SbiOanEFp2xRRJXrACi346rPjOwPdRcqpwymObSir778TRX
        aYjpiWMehFbEkvadJc+DnRgXpUyE8TA=
X-Google-Smtp-Source: ABdhPJzEGo2Im1fwYKE3dyy1xIw1Znu1ydIrq8lcJTb+KNSnCGfz5TR15GLDVFpKnfKOo7fjBPs3VaJsHuk=
X-Received: from legoland2.mtv.corp.google.com ([2620:15c:211:1:c151:20a4:9e4a:b11e])
 (user=varmam job=sendgmr) by 2002:a25:3057:: with SMTP id w84mr6161945ybw.62.1617821449791;
 Wed, 07 Apr 2021 11:50:49 -0700 (PDT)
Date:   Wed,  7 Apr 2021 11:50:39 -0700
In-Reply-To: <20210407185039.621248-1-varmam@google.com>
Message-Id: <20210407185039.621248-3-varmam@google.com>
Mime-Version: 1.0
References: <20210407185039.621248-1-varmam@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v1 2/2] i2c: use "dev-name" device tree property to override
 device name
From:   Manish Varma <varmam@google.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Manish Varma <varmam@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since the dev_name field of i2c_board_info is not set while instantiating
an I2C device, they are named like <adapter_id>-<device_addr>, unless
they are instantiated through ACPI.

These coded names are less desirable in some situations as they will vary
across systems with different hardware configurations, and even also on
the same system as the adapter_id may change with change in the order
of i2c bus enumeration (i.e. due to device tree modifications).

These device names are further used by other modules like "system wakeup
events framework" to assign the name of wakeup_source. So overall this
causes somewhat difficult to interpret device and wakeup source names,
and hence presents difficulties debuging issues at multiple levels.

This change addresses above mentioned problem by setting dev_name field
based on value assigned to an optional "dev-name" property of device
tree (if present). And as a result of this, i2c_dev_set_name() should now
use the actual device name instead of made up one.

Signed-off-by: Manish Varma <varmam@google.com>
---
 drivers/i2c/i2c-core-of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..d7a85a9cc499 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -58,6 +58,8 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 	if (of_get_property(node, "wakeup-source", NULL))
 		info->flags |= I2C_CLIENT_WAKE;
 
+	of_property_read_string(node, "dev-name", &(info->dev_name));
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
-- 
2.31.1.295.g9ea45b61b8-goog

