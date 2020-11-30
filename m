Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2142A2C858E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgK3NeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbgK3NdU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:20 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C34FC0617A6;
        Mon, 30 Nov 2020 05:32:01 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r3so16245730wrt.2;
        Mon, 30 Nov 2020 05:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J3yOjM1+/wwV5fdoMWqJFpfZ/FDOx9RThnGQ3iq7dmg=;
        b=plUqWbBCxH+vhzGu1befzPbYHZOK/zl7JXWO5KxV4Bhx5zzf/meAPDkoBGQYco5ZFu
         Q9ymtlbjpenLCw8Z5CJMJLHmJOLfeXIAMWvFg9MYmZrZIzNQEjnyiaISmzKVwMXrE4gy
         DnBsxnGSVE+Jh7KR5MTV+Deo6G1hI9m9qcleRk1p94RhzuIBgXCamTUepfHR4cXKZZ+o
         gFFpsHWf7mIm1bY+ICqMmUyUofStPupYaASEl1+B+ch/t7pE/J7Dqk+OkGTMIA7ZpoIk
         BBbMed4yBQCQKVRg1y4jnxqr0cOQAP5zKT+vOxVxFAwvugncBEq5+fjZxXUc/wRx3mXY
         MDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J3yOjM1+/wwV5fdoMWqJFpfZ/FDOx9RThnGQ3iq7dmg=;
        b=Wz2mjr/D4Q6EtuUXpD5pAmHoggXczov2ZNJZq58g5djRKXaCUNZmxSBkKK1k+s6OwN
         5vHhCbMGwC+pe/HRHcbF0tTSWjQO16wexsPQ7GUgufALBBmCox7GpB5vK4u5BRQfKx2p
         sEvFs9FgBLVJtYGz9oC2C3X53qrIYpiad2Vs38eBR4XlKcSIyJrLbKRMpgaxg+hVMRWT
         c5e5xvi97Ob2SFmWncZYPTXe7Bw87Xsh5f7A4GuiAb/KZUyIp5FU8/tfls8tkM4me2Es
         Bs95LLVnOeHM/QV8qdeqbRtYpGzXVGzOv8EfNKvPy8IND2CdkpH82KYdK8g/pM13dfM8
         4k4g==
X-Gm-Message-State: AOAM532+ov+BugwBKmEcKmn9TSZKACa6z/4nPGDPP9clv/81vtGgYE69
        8EI2mqdAQDEXow9F3mr4XkqI+ICT3QzOELC1
X-Google-Smtp-Source: ABdhPJxmDOmkAli8PCxbBBWHn5U/bF5oL+V8iSg+mtHUYGvUsMa7e2ABUXizOD+UAW2e1G8PYRwGLw==
X-Received: by 2002:a05:6000:1cf:: with SMTP id t15mr27503567wrx.321.1606743119922;
        Mon, 30 Nov 2020 05:31:59 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:31:59 -0800 (PST)
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
Subject: [PATCH 05/18] software_node: Alter software_node_unregister_nodes() to unregister the array in reverse order
Date:   Mon, 30 Nov 2020 13:31:16 +0000
Message-Id: <20201130133129.1024662-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Software nodes that are children of another software node should be
unregistered before their parent. To allow easy unregistering of an array
of software_nodes ordered parent to child, reverse the order in which
this function unregisters software_nodes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	Switched this functionality from a new function to replacing
	the existing software_nodes_unregister_nodes()

 drivers/base/swnode.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index af7930b3679e..d39e1c76d98d 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -720,20 +720,25 @@ EXPORT_SYMBOL_GPL(software_node_register_nodes);
 
 /**
  * software_node_unregister_nodes - Unregister an array of software nodes
- * @nodes: Zero terminated array of software nodes to be unregistered
+ * @nodes: Zero terminated array of software nodes to be unregistered. If
+ * parent pointers are set up in any of the software nodes then the array
+ * MUST be ordered such that parents come before their children.
  *
  * Unregister multiple software nodes at once.
  *
- * NOTE: Be careful using this call if the nodes had parent pointers set up in
- * them before registering.  If so, it is wiser to remove the nodes
- * individually, in the correct order (child before parent) instead of relying
- * on the sequential order of the list of nodes in the array.
+ * NOTE: If you are uncertain whether the array is ordered such that
+ * parents will be unregistered before their children, it is wiser to
+ * remove the nodes individually, in the correct order (child before
+ * parent).
  */
 void software_node_unregister_nodes(const struct software_node *nodes)
 {
-	int i;
+	unsigned int i = 0;
+
+	while (nodes[i].name)
+		i++;
 
-	for (i = 0; nodes[i].name; i++)
+	while (i--)
 		software_node_unregister(&nodes[i]);
 }
 EXPORT_SYMBOL_GPL(software_node_unregister_nodes);
-- 
2.25.1

