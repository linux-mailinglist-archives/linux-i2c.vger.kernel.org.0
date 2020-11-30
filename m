Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98FD2C8583
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgK3NdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgK3NdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:18 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C11C061A48;
        Mon, 30 Nov 2020 05:32:05 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a3so25182137wmb.5;
        Mon, 30 Nov 2020 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lrl33MwSXvMl0DHbqDMcSOWgFCmI1fsujcf0HrXSVMw=;
        b=HZf90MOpm4UrGQruq1FslBdjyHHJXBUpQs/+ByhkIk7fFQ6nnsiPwK5sjNVmxBNsPl
         GSSMpIEP1xzOtFmJA1UqlE31YHI1WyGGIOAsNq+fdUJVto3fIYNm4DujPVSOZ1nPD6wu
         c2CORb81pqdoXCYkd22uUWvRNQn9HMZV93W+RPpND0omHzAAUmuUUWBBV5keMl6mz1rU
         St+OnX6NSbau/bQr/PqRbQucbqtaD4ZserNkN05zLm1JY+DlS2WcWyi9VbZvvSwRaYQ9
         yviTBPAFKTKsQW2Em2dzkE+mBF7OQQ23E8bV2tV7hT6zedqk/JMidKFLYONdoBopJQhR
         b8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lrl33MwSXvMl0DHbqDMcSOWgFCmI1fsujcf0HrXSVMw=;
        b=fZELRtQ7ycX8OzAskPE63P+7kB0/mLeC1bE1AtFPVpfXdCbbceGfBKGxKfZokqmdIG
         MWwtocyH/0KAGmdMYXpy3+j8CqI7gU4MXShtUZ3pAPwauwJp4orzIVkjlZgfb0yh9Dcw
         x6MiuiHVUaqPzFpUucJ2T323OfCBSUEioAe1Vq9g2IT0bwSOUNvIMDMoDDEjHvNkHfi1
         l16tZI4hIcicZmSRlHBstotwQ5li6cC3lC2UF2VfAr17vw+9B+TPw5pBmfyBk6XD89Kv
         BSNOU3yEPVXpjoHqFu9OboIDwjfJX1bfzPCTR+5OifuDRDNtVOh60tptHv1H4RslEPwI
         Rreg==
X-Gm-Message-State: AOAM530ceWnww04AIzTD1hPu80dwaREQBf2I0JSbeYg3VTUuXXDJo/o2
        NJemfFlXKPgRNQL5EDYAjGIVFlY22swvXrdi
X-Google-Smtp-Source: ABdhPJzCENcFwsD92T2J5i7GBfndY1f6FvmXomxK1QDwSugBH+f6xf6WvbLaWfVDIDSX5bobRKn1nA==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr10089468wma.7.1606743124434;
        Mon, 30 Nov 2020 05:32:04 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:03 -0800 (PST)
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
Subject: [PATCH 08/18] lib/test_printf.c: Use helper function to unwind array of software_nodes
Date:   Mon, 30 Nov 2020 13:31:19 +0000
Message-Id: <20201130133129.1024662-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the software_node_unregister_nodes() helper function to unwind this
array in a cleaner way.

Acked-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	Changed the called function name - didn't drop the tags since it's
	such a trivial change, hope that's alright!

 lib/test_printf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 7ac87f18a10f..7d60f24240a4 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -644,9 +644,7 @@ static void __init fwnode_pointer(void)
 	test(second_name, "%pfwP", software_node_fwnode(&softnodes[1]));
 	test(third_name, "%pfwP", software_node_fwnode(&softnodes[2]));
 
-	software_node_unregister(&softnodes[2]);
-	software_node_unregister(&softnodes[1]);
-	software_node_unregister(&softnodes[0]);
+	software_node_unregister_nodes(softnodes);
 }
 
 static void __init
-- 
2.25.1

