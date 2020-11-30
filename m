Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4E92C8546
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgK3Ncl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgK3Nck (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:32:40 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E71C0613D6;
        Mon, 30 Nov 2020 05:31:59 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id z7so16225563wrn.3;
        Mon, 30 Nov 2020 05:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FePnQn4sOjIUa7n1a1AkFBbevNR2+2SK//M9YhzxN2A=;
        b=PM/YOw7P5R3RYA3romGtkjPAxx82J5/HMMsPKt6mYIJpu9Cj2e4A1oSI0gf7rQzEmL
         EAvt7RDcCh9Yffz+57Ko1QRGhm4XwvBWdVNIE0aV6m0QIlZOidH7pTC+JlC9rw5krB60
         mZr87CzJOLVm2pfldpJZhaCTvJwcpoaKLjIuRxzlB1oBuKJpLcPB8SALog27LXtuCaST
         0/Y4lW/1Zy7pJ3BnuTOzNZwxmdaNUZAZKQ+/6I5qJ/wAZgMnqAX7wXQTQXGBgnlQ1h+2
         BBxh8hDijrDng6sGFg5SKmPN8kDJvI24vfLUS2neisbfffKuC1Zsd/SDUrd4DmQlgldM
         SldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FePnQn4sOjIUa7n1a1AkFBbevNR2+2SK//M9YhzxN2A=;
        b=NvrhkDYDtIF0AzCtdl7YbQARVAhp+4MbQkfthJbQ9EMenu7hMFO5K/E1YHsjEL7uGj
         3ymTCvf5lwoyH/Q0Bb+utfWX4+kHgILatmnsqgObrvzZbEIVSgmjntdIl+sNVt9jpXsb
         85dCbj+DwGYXVop9SsCViUd0Mq9y9m8y2XKfsHBE4l4mXAqg383VrzDInQfqy38LvdnW
         TkCqjHhLxZ9RJzS+xnsldfgrFMGNxQOMyMWvNXcOyxt9QrxCUjA+m5xDo8HV3GTxQp4B
         Gg492F4vGUyCGEkvGqRn84X7amqKdEVf5fxuRNBrJulkK2FYw2fdewZLFUXcWR2pIvgi
         DJIg==
X-Gm-Message-State: AOAM531Nff8guToaVTAzKxRTIwy5P3hzw71kgQYfH8MuBvkL+YQxX5RW
        Zvv4xGeCEP0uEkHcjBv6ACwIsIeYqvXUFE2g
X-Google-Smtp-Source: ABdhPJxcrjv1HcdEbv2OM0uY8wL3w4pWdRYFa2ZVlxXHKfJRC+d5brQXdT3aThuu9hFxcO1JjpV99g==
X-Received: by 2002:adf:fd47:: with SMTP id h7mr29381616wrs.106.1606743118371;
        Mon, 30 Nov 2020 05:31:58 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:31:57 -0800 (PST)
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
Subject: [PATCH 04/18] software_node: Enforce parent before child ordering of nodes array for software_node_register_nodes()
Date:   Mon, 30 Nov 2020 13:31:15 +0000
Message-Id: <20201130133129.1024662-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Registering software_nodes with the .parent member set to point to a
currently unregistered software_node has the potential for problems,
so enforce parent -> child ordering in arrays passed to this function.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	Patch introduced

 drivers/base/swnode.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 615a0c93e116..af7930b3679e 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -700,14 +700,21 @@ int software_node_register_nodes(const struct software_node *nodes)
 	int i;
 
 	for (i = 0; nodes[i].name; i++) {
+		if (nodes[i].parent)
+			if (!software_node_to_swnode(nodes[i].parent)) {
+				ret = -EINVAL;
+				goto err_unregister_nodes;
+			}
+
 		ret = software_node_register(&nodes[i]);
-		if (ret) {
-			software_node_unregister_nodes(nodes);
-			return ret;
-		}
+		if (ret)
+			goto err_unregister_nodes;
 	}
 
 	return 0;
+err_unregister_nodes:
+	software_node_unregister_nodes(nodes);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(software_node_register_nodes);
 
-- 
2.25.1

