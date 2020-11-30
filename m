Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424FC2C8567
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgK3Ndb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgK3Nda (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:30 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1E8C061A53;
        Mon, 30 Nov 2020 05:32:18 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u12so16269477wrt.0;
        Mon, 30 Nov 2020 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=511mzKiIywlNQYNwh+9h5lxXxDhZYNjRCyGYr9Xu0us=;
        b=IStKaWOiny1B/u+cgJ2LRmq2JrnYDg/dGle+7gzHXLBwYdMIXZW29V/uLypqm0eTPo
         qrvitPzpPhRonnvZRF52o95OdAeIlbOP1iSKfS4WXFOQ8Wq5a3Qo+vwJFono4qnqsR2Y
         eWDJ+gDq0UoZOK6Jh6B/SK3Gk11h69peJz4vbW/ausArC7j8ihoxiYt0rpU8lWWz3kEg
         3g4Fb16amSnXdBKSGBqPuKGFRSBO33a5yjbQ7CH+bjICTludUiT8cHDShViWtX+3x/sE
         u7xrGB8kgvEwDVgYOdeId9xC6/v9nGi5kCFgDI2/w6T8B8Oq7Ij5Bq9LUUWj6gKl38yq
         nFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=511mzKiIywlNQYNwh+9h5lxXxDhZYNjRCyGYr9Xu0us=;
        b=aLyyxQ2JmEgJ6/ry92boHfQrImLxThar5ibNPhKyynqdlgIgtK+rrXBFKSPOApC/93
         aIhzsra6+geZRBoJhr4LVtoQYFkMOyZt0MT0DobOwG9aO6x1FVRNUJ2xFOUmeQTrssXn
         U/dAE4pe5hYsB7UxtdjMlCGlsdrIXyQY9iTHP/ShgT0QGudyKtZon3i6lwFHUCmjkx/p
         sb25FcUUNgx6ofWMsQ/eFHasKyMPuNG+2iEeFPlnFsX0ChnBCjVziZ/TVoNlg7HgyAvC
         Txb2HsLNEYMJyYwa+6NbEd2S96Vs0rzd7oKdIUpA+P9i2qjgReZuQRiYX8TvVOM5oVsz
         XlhQ==
X-Gm-Message-State: AOAM532Xci+9ZZj7OSE9XPNpxjf+1ndHmAsrhWe6PW2G1Wd76dS4nD32
        4vEaveYHzZ+UlW9aHQ+z+FBi9/aDnmIfzlTc
X-Google-Smtp-Source: ABdhPJx4y/GNSZAZsHXT6kjUa2vcBJ/Pkj3oERILRxY3uLrk1+veimpUUUK/NR8/2AY/Mxf8b9Byeg==
X-Received: by 2002:adf:d188:: with SMTP id v8mr27895510wrc.167.1606743136993;
        Mon, 30 Nov 2020 05:32:16 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:16 -0800 (PST)
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
        heikki.krogerus@linux.intel.com, Dan Scally <djrscally@gmail.com>
Subject: [PATCH 16/18] i2c: i2c-core-base: Use the new i2c_acpi_dev_name() in i2c_set_dev_name()
Date:   Mon, 30 Nov 2020 13:31:27 +0000
Message-Id: <20201130133129.1024662-17-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dan Scally <djrscally@gmail.com>

To make sure the new i2c_acpi_dev_name() always reflects the name of i2c
devices sourced from ACPI, use it in i2c_set_dev_name().

Signed-off-by: Dan Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- Patch introduced

 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 573b5da145d1..a6d4ceb01077 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -814,7 +814,7 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
 	}
 
 	if (adev) {
-		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
+		dev_set_name(&client->dev, i2c_acpi_dev_name(adev));
 		return;
 	}
 
-- 
2.25.1

