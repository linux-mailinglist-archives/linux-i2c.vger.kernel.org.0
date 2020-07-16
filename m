Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31079221DDF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 10:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgGPIIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 04:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgGPIIy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 04:08:54 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EAFC08C5C0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 01:08:53 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 207so3323333pfu.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DQl00yYXYwsbpEtRwxsV9i6tqBPWGw0OYdTItL8Npos=;
        b=PCX3eNBJh2mqYNaMPMn0gVvxkCAmz8mqNsRWiN5HBvqOC3YNoY+sXnQEa7TLgzm7yz
         OxRZajCzl6VnFa0FbTdELIg4dQXr66IYV9Xb3vjeNrQCLsdGmhpg3pWKBlVTqgYEv0lK
         gxQsQ9Tofpz1qTaejYFP6lDGToXNhgTJMrM04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DQl00yYXYwsbpEtRwxsV9i6tqBPWGw0OYdTItL8Npos=;
        b=XC5glMzmBzvgTMm2thvyteBP6V4BIEcTFkaiqQorn8j96X4EMXrkO4sm1UOirQRA3Z
         IGb/UhUlvbEiu0pEYlZsRm7ES6t7mYo0jnFUw2DwIr7fSMHKMjU9xlrr7Y9/+mzd01nY
         nrmg8JcafIHaHsW4jFDx3Iyom8mXB2XAprDhB1SzmxTaXJM3AjX949TuoiHyQUeDnPCU
         0ve6L6HJRGh5GpjM1MWKDGHuf0/w29IigqQVTSE2R7j3ALWuPykhudoEwYNfPP/1BGHg
         yfSR2DHMvY0iCtZrzPo3lvjuISOcqWyeN4KUjIea0SoTpWVHh6+eJUe6TJ0X0K5lT/aD
         XckA==
X-Gm-Message-State: AOAM530leHQ1wu72SGGZi5XVEvKOR1k6wTqlnFy/PSdm2EZ290Yxec36
        H8e8RuhzY3oERcaCMy+OsIAuK3ckJQc=
X-Google-Smtp-Source: ABdhPJxm7zAj2YaUS8iycAQbwnHzDM0z0BXDv4TUVD79cq9vyE7R2aq700W4lTKv5MMyGXmEi6aBUA==
X-Received: by 2002:a62:347:: with SMTP id 68mr2540133pfd.185.1594886933131;
        Thu, 16 Jul 2020 01:08:53 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id a3sm4353085pgd.73.2020.07.16.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:08:52 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH V1 1/2] i2c: add PEC error event
Date:   Thu, 16 Jul 2020 13:38:35 +0530
Message-Id: <20200716080836.2279-2-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
References: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new event I2C_SLAVE_PEC_ERR to list of slave events.
This event will be used by slave bus driver to indicate
PEC error to slave client or backend driver.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 include/linux/i2c.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index b8b8963f8bb9..e04acd04eb48 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -370,6 +370,7 @@ enum i2c_slave_event {
 	I2C_SLAVE_READ_PROCESSED,
 	I2C_SLAVE_WRITE_RECEIVED,
 	I2C_SLAVE_STOP,
+	I2C_SLAVE_PEC_ERR,
 };
 
 int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
-- 
2.17.1

