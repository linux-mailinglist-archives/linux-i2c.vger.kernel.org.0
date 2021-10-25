Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F4E43A5F7
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 23:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbhJYViG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 17:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbhJYViC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 17:38:02 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFCDC061348
        for <linux-i2c@vger.kernel.org>; Mon, 25 Oct 2021 14:35:40 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id n2-20020a17090a2fc200b001a1bafb59bfso7893215pjm.1
        for <linux-i2c@vger.kernel.org>; Mon, 25 Oct 2021 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jYZ/gLN2FtdtPCm5bp5BM+B38r1yxpSWcEKu3dd8FPk=;
        b=Q7p9y6SsnmzF1ZhJu3/jii6ySfU9hpX3ZUBNIwzd3ocDPVGfH5m4sDwSwj4P07sPdu
         8mJSjSJwoTxs99b5GAq0GSkv0GpO5e10kRp7EERpRmmYYI9WSBr6NgNefFgRRgWu5FUW
         z/AXxlwzso9sF8y22x6NJUXvVlF9wxNggQARFGaMpTYvLQfgzk2QUsk5GFH3QxFGbzQv
         MfkU1Lrh0qiacj8WIckRXofSTh5k0fX9HcG+kUmkUfTSU0RKYNteaxXSUGtZGSsjNPAF
         iL3evaps+l3CAH72ZooXnARTMBNOjK6uSYvUtT3Gv77l6mOwDFPRKV0drzKQWddgbpMq
         GrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jYZ/gLN2FtdtPCm5bp5BM+B38r1yxpSWcEKu3dd8FPk=;
        b=Be+27J6Xx8acR5ha6T/TKNEmHwRjC0auwX87uO5xaqzoAFqr159pDSuoWhw1A5m7MK
         J/Ix01tpV4xWnRbefFiPBh+XsZJrhDlbsKapEPgEeQXHDDG211j027YrsHLjwxfPI98P
         gkb9JWuy8aqIqaapbpSYOk8jepmM+anKDryNnlHYJhX4DnTpz3cfIIG0xMW8z6o/WCY+
         CWHN6o76iH6aqacZjlpxJWnpWfc5CIaDr5eDZkPNXzHMVgN1G0XLiweVvjuwU86C86aM
         H6hFBgLZeSSnP/rNDvsMZHX4424UE/+ruJB/Q25xyCyD9rQO00D9tdz9UMmgalOXpD9q
         Bqdg==
X-Gm-Message-State: AOAM531qg9+QMCxOy7bv4XQonz4VLtUssboFrtHT7i/ULycrg5qTfzwH
        fmtvMh0ZZB3/S529t7HNzeRBbegXP5Oz
X-Google-Smtp-Source: ABdhPJzVKK7ZDVEgV0xPUL1u4UVmovt9MKolVdLnS+fAVQoyvq/LRoKqY06DDnF8Pfx2uSTlfXGeW0PRMfzo
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:5478:3d15:6893:1074])
 (user=rajatja job=sendgmr) by 2002:a17:90b:1e49:: with SMTP id
 pi9mr38518077pjb.144.1635197739902; Mon, 25 Oct 2021 14:35:39 -0700 (PDT)
Date:   Mon, 25 Oct 2021 14:35:30 -0700
In-Reply-To: <20211025213532.2349161-1-rajatja@google.com>
Message-Id: <20211025213532.2349161-3-rajatja@google.com>
Mime-Version: 1.0
References: <20211025213532.2349161-1-rajatja@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH 2/3] i2c: enable async suspend/resume for i2c adapters
From:   Rajat Jain <rajatja@google.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dtor@google.com
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com,
        dbasehore@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable async suspend/resume of i2c adapters. It enormously helps with
reducing the resume time of systems (as much as 20%-40%) where I2C devices
can take significant time (100s of ms) to resume.

Signed-off-by: Rajat Jain <rajatja@google.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Add Jarkko's tested by

 drivers/i2c/i2c-core-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 54964fbe3f03..8d4f2be54e17 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1576,6 +1576,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (res)
 		goto out_reg;
 
+	device_enable_async_suspend(&adap->dev);
 	pm_runtime_no_callbacks(&adap->dev);
 	pm_suspend_ignore_children(&adap->dev, true);
 	pm_runtime_enable(&adap->dev);
-- 
2.33.0.1079.g6e70778dc9-goog

