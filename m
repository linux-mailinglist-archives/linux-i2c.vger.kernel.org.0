Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38714436FFD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 04:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbhJVCba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 22:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbhJVCb2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Oct 2021 22:31:28 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECA4C061225
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 19:29:11 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id w201-20020a25dfd2000000b005be4c3971cdso2503562ybg.13
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 19:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vzQUdY93uV17R+6G8Th/GOFeC3+4FEsDpxtXXZhhmgs=;
        b=EPIcE6GvBrjKsPNVxqqaat57B6owyW5X9cDEKMMaYE5XhESc6lpKEvdWUNG0dER35X
         FHOm3sNngnTML67qiPsr0gA7n0eWOvDoBP8hC+tiGqedyJtDPZ+jkATU6IDPGyzSpdPU
         NbJWkyOUg9XPE7fn5D49t3EoOu7Um3pcnKf7+z1Hz9exsuB7aPb6gTdLaEkWYqgf8noC
         qw+ViDwKtml5G0uo34mjRJKuAaV4tgRruirbP4fgNBGKP4+Jzl9McgTrVIYJLfIinoMA
         PopNitr9a/qIOW3ijuCd3+bLRPpJg2y6+wJextWbG++TfsNpqWT/g635MYbSfGxx3aF5
         V8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vzQUdY93uV17R+6G8Th/GOFeC3+4FEsDpxtXXZhhmgs=;
        b=ai5a/LcbgraNL25jHzgagWqfte3lGXm/nsKIAoIdh2ngcLydNha5oz0nOL8AaaBMPq
         cNQSxmwcHwvstxB57wak1rbQ0hDUckmdP7A4b7JXRbSbOow+/IhSZTBW3ByEpS+p+Fuo
         SHr0GGuh4OKc6yLZg1gWZkmj6uGH7RBKEaBg4cma+jaZiab73baaCFmUEmxKUoPsRQUL
         GYFDImd6uW33cfe4pCLfchAOHaEGOcwjdD2+f9xHS6oKDm/GupUDqd3mD6CMnBSUfL42
         33N1EqDyclv5JpBR5towBzRCwIKzhXhOV22tbLRwe2Zd7imn/n3HxbyJ5prZsODaEH1t
         /PaQ==
X-Gm-Message-State: AOAM533Jjm6sTgWy8Cbtzi5xkJzKtGMKRJQQ4gDNiCip1FnxwlHlX7p1
        imr22eb1gH5DD+jtOWZC7YLZZzaLCr7i
X-Google-Smtp-Source: ABdhPJw45Ku+iLqKDAWxLO0IAZK55UZm/2cUJLCsdnPLHrj29/HH5/+WviiQLyP3gWnZQiylvF/+8VEm0WXJ
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:cc25:d9a3:4b5:37b9])
 (user=rajatja job=sendgmr) by 2002:a25:1c08:: with SMTP id
 c8mr10660210ybc.316.1634869750638; Thu, 21 Oct 2021 19:29:10 -0700 (PDT)
Date:   Thu, 21 Oct 2021 19:28:59 -0700
In-Reply-To: <20211022022859.1888836-1-rajatja@google.com>
Message-Id: <20211022022859.1888836-4-rajatja@google.com>
Mime-Version: 1.0
References: <20211022022859.1888836-1-rajatja@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH 3/3] i2c: enable async suspend/resume on i2c client devices
From:   Rajat Jain <rajatja@google.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dtor@google.com
Cc:     Derek Basehore <dbasehore@chromium.org>, rajatxjain@gmail.com,
        Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Derek Basehore <dbasehore@chromium.org>

This enables the async suspend for i2c client devices. This reduces
the suspend/resume time considerably on platforms where i2c devices
can take a lot of time (hundreds of ms) to resume.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/i2c/i2c-core-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8d4f2be54e17..70d32efb68ef 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1047,6 +1047,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.of_node = of_node_get(info->of_node);
 	client->dev.fwnode = info->fwnode;
 
+	device_enable_async_suspend(&client->dev);
 	i2c_dev_set_name(adap, client, info);
 
 	if (info->swnode) {
-- 
2.33.0.1079.g6e70778dc9-goog

