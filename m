Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A2B2C853B
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgK3Nci (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgK3Ncg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:32:36 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD8CC0613D2;
        Mon, 30 Nov 2020 05:31:55 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a3so25181444wmb.5;
        Mon, 30 Nov 2020 05:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RJsQiHGqEJvDI1A950rE2xj0EG8wzsrrAHbyxhByNz0=;
        b=aCL28tM5Keans39iuF0yPmX8N2Zo6DPH4Ma7s7dw4MyY3eGABozdRLlf6DFDkUzn0k
         HsURvPU0p1ZOQwfMSn1dPSl7KUl4VQsA+pBuvR2GZQWvLyLTETkYDpW4pB50dJGEDAVT
         Gl6iinIuTEdutRdQFyoMROOJLR4pP0/11oJgm6QgsEmc0wK13XNqqHZKSO8HGXAOcBhP
         4uCYVP6WetkhuOaHwSg9W0DMQni9jk5yjPGkx8IebTAGt+GcfUg9covZKsRMekzLILgF
         3KA9ikRPV8GB3d3t7E+i3TsSm+P3yO8JCND8N8DtHxCJ8WPkOL/ZQN0kwVMVAMMUT/tV
         tkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RJsQiHGqEJvDI1A950rE2xj0EG8wzsrrAHbyxhByNz0=;
        b=qkw/s5tU7x9ZX58R34bAXdSqcSsMcoCCbCx98ut4Kf3U7DUENYU/9oWNCyTP1WfwVG
         K3qiC+0YOVwu81v4SfuJi9JHLu0yiq/NvyHeWKua2sTpuqoeZrwq2FEaFrSmWmOQ/in1
         dTqRns3EOWr+9oD7r8JoccWTtIFKA14XwTs+XTeLuH/S53vw0eMB0m5AkT8bcHV4alAN
         GBUWrFfNYpgIAoZPsETTyK+59mv8F1q2u27GAA6/ugV0RtpWaQvkaYUiVm5H+0ygrI48
         22LYYyHe3Z8tJUMVJxHN8q8mLCKHWnR4are7A1c/MJQxFLpcC8StrNOQjCp52iKVhqYs
         h9WQ==
X-Gm-Message-State: AOAM532QGq0W4IKF71YQNxv3rMxukllk4Tl+nwAU6iICi5bAsghFmrKz
        IPBNiRY0OVx9Wrr9WhXyX2UbvCWl89QW1hv4
X-Google-Smtp-Source: ABdhPJwPbNSwrCgOQ0IMIpkzz/7n/VoBoBA1eGQ5Ii7+/pXicjg96dORtNIdGwUWRytKAvCDAttg9A==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr23640950wme.0.1606743113991;
        Mon, 30 Nov 2020 05:31:53 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:31:53 -0800 (PST)
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
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 01/18] property: Return true in fwnode_device_is_available for node types that do not implement this operation
Date:   Mon, 30 Nov 2020 13:31:12 +0000
Message-Id: <20201130133129.1024662-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some types of fwnode_handle do not implement the device_is_available()
check, such as those created by software_nodes. There isn't really a
meaningful way to check for the availability of a device that doesn't
actually exist, so if the check isn't implemented just assume that the
"device" is present.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	patch introduced

 drivers/base/property.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 4c43d30145c6..a5ca2306796f 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -785,9 +785,14 @@ EXPORT_SYMBOL_GPL(fwnode_handle_put);
 /**
  * fwnode_device_is_available - check if a device is available for use
  * @fwnode: Pointer to the fwnode of the device.
+ *
+ * For fwnode node types that don't implement the .device_is_available()
+ * operation, this function returns true.
  */
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
 {
+	if (!fwnode_has_op(fwnode, device_is_available))
+		return true;
 	return fwnode_call_bool_op(fwnode, device_is_available);
 }
 EXPORT_SYMBOL_GPL(fwnode_device_is_available);
-- 
2.25.1

