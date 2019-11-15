Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDFCFD3CB
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 05:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKOEu6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 23:50:58 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:33199 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfKOEu6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Nov 2019 23:50:58 -0500
Received: by mail-pf1-f201.google.com with SMTP id s24so6692239pfd.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2019 20:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=w71CA9nI41QLngUUjO4kaDNCWv8Is/cxYLfXviB89PM=;
        b=NTo8ybxoixlCH0ZM1hpm8k1kL45i3+Eh5sJUx6aF70GQFnFicUSLH/iVN4V7v5nxez
         aSeLn+YhSHtNCWALSPcXKt1kt9rXZTysNWTysx9jJCcdsfzPAZHfZ3lVgIJDVQOh/kk8
         U6L8AqrRcEQR/8bltVArD3ZU0+dZmE4FYWigJYdNlpP3DSOGwSn1zsz2krBosITPAmTs
         DJitrC4FkVwD/IOkaerJR5ymcO2HxxN9VZZ0CH7/ALoVmiIlZr+IV0BPY5WaPBS6c/Da
         Pojk/sakGMiZms6D9fYDH8aveluLe5NxC43OLQeYNe0ds5yXHzA3H1OTuiFV2I05mNtL
         Q3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=w71CA9nI41QLngUUjO4kaDNCWv8Is/cxYLfXviB89PM=;
        b=aHlkusTar8GKsgMwUip74R844/daSqNZcUfXWo6cYKz6V1smnY4ciVrtZau8z0HK+d
         iCSAB3uhuLcnt9LaVXp0D+OHHEdwohGTtOh/C2oRvTodgo7LWDWHj4IA4oxhID7lJ2BN
         fVWp79ub/fcNSbE/2CZRBudBjdxjQ9sPTwGFENoa40WKw2I5ERN+5A2BErsbcjXttuZL
         iwGFe7RXAHctBxp+flEj1Yfyk0QsVARl+CrDOsdtwL03QlxIKkiTvwuIiX6J6hs4Bo8V
         Sw1Qt1Njw9Ko9eGK/DrSJ1RINmzg1hOI/DJZjcvf251YQcy+L4/d5ZEYT9eyzX6kph6v
         nz6Q==
X-Gm-Message-State: APjAAAWkbb5HuseaZN7xdaEKrylOzm8Hptyhkny9BMPIUHx2yDm5h7AR
        w1ZoZAtzGfKDqB4dWW+jLFz8rtxR3LzTnCc=
X-Google-Smtp-Source: APXvYqwoR0UhMLan4e4IUMAvPvgf+9vxmaOtBTzeVFpTKGkCGgYwDAz522FkrjiFpB745lMdX6ZtroWuXToyQIM=
X-Received: by 2002:a63:ee44:: with SMTP id n4mr1499531pgk.137.1573793455780;
 Thu, 14 Nov 2019 20:50:55 -0800 (PST)
Date:   Thu, 14 Nov 2019 20:50:48 -0800
Message-Id: <20191115045049.261104-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH v1] i2c: of: Populate fwnode in of_i2c_get_board_info()
From:   Saravana Kannan <saravanak@google.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows the of_devlink feature to work across i2c devices too. This
avoid unnecessary probe deferrals of i2c devices, defers consumers of
i2c devices till the i2c devices probe, and allows i2c drivers to
implement sync_state() callbacks.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
The of_devlink feature is present in driver-core-next branch. It started
off with [1] but it has been improving since then.

[1] -- https://lore.kernel.org/linux-acpi/20190904211126.47518-1-saravanak@google.com/

 drivers/i2c/i2c-core-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 6f632d543fcc..4e913c890a7b 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -50,6 +50,7 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 
 	info->addr = addr;
 	info->of_node = node;
+	info->fwnode = of_fwnode_handle(node);
 
 	if (of_property_read_bool(node, "host-notify"))
 		info->flags |= I2C_CLIENT_HOST_NOTIFY;
-- 
2.24.0.432.g9d3f5f5b63-goog

