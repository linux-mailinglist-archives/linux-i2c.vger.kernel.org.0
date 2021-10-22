Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6B5436FF7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 04:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhJVCb0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 22:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbhJVCbX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Oct 2021 22:31:23 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53313C061764
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 19:29:07 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id r13-20020a17090a1bcd00b001a1b1747cd2so1329257pjr.9
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ijVYb03qsUXHo6CKgq/jFRZoGv36pg7G0FzeLowQevM=;
        b=GFmmGhXFGiiG4aBOIbuik6hEaw76jr99tzyjl7v7t3Gfmzc0u3UPmHbGBa+WAwzn0k
         WxWnCK1oml3wfu8uS3NvmvMI3Kd5Y/JFIZ4Q1voLaAc6RaqgTB7T8nPrBVutWnraZTYq
         CyIs5CrcQiESRIFHLm44RiTwzMOuJ4nRyVyMPk9AYShAoV8qWvjP+prQ607aP+K2E5M9
         U90FgLVS/4T+uSac3ZMiOfveSMgeAk0r2vW2syM756aOPIS3TeVfCEwJofjEXAV1tbgL
         UUMkQvo0JxfMUTr0tpj9h6IccSNykU7q4ZrqNdKWTvrNed0M9+sOr3h/TpcjcNuLKR49
         V+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ijVYb03qsUXHo6CKgq/jFRZoGv36pg7G0FzeLowQevM=;
        b=nZcVkYe+cC1Ccu5p/oFmYsv2nwHauPdIFT0fLrWi8jPC8E2JZFHvdTh2cZqHwIhqVB
         HdPNNTg7I392g4N3dWX9N1m49LX9YRezDdk5kKyl2yFk9jLG0MNguqbv5kHE66iqyrJh
         shatYT3uqtnn2H2BwuY9ZadpYdPHXlcsaWttYj2cNf5lLCq0ilJaqiR1nxypbuN7b41j
         GqlaXvfNkmh9xloEC1s0cyjz/Yrntc8aQcX9lzJ98GTemIXrH0ATyx8gJpZpXMvElYpN
         UbfwFfkEKkaSCHSfP7l2QpaTZSYeAQom9NtVWEt+pvVOFGrZmLiPnWz13TJfR5YSswhQ
         k7tA==
X-Gm-Message-State: AOAM532hyalOVSPtNqaNx3Xmz77ubkCF3yUdfDWMgLAWzcadYoJjn4nY
        fsV52lkLDub7v0WMfhCJADZerHpviMc/
X-Google-Smtp-Source: ABdhPJxk2OnWe6ziiCaTwDnvay3U5Dq4gzwUl08eYp9OFoMcwi1QgNd/aLIbB6QCrVNIqVy6bPPtz7uwbAOn
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:cc25:d9a3:4b5:37b9])
 (user=rajatja job=sendgmr) by 2002:a17:90b:4f84:: with SMTP id
 qe4mr11246662pjb.209.1634869746745; Thu, 21 Oct 2021 19:29:06 -0700 (PDT)
Date:   Thu, 21 Oct 2021 19:28:57 -0700
In-Reply-To: <20211022022859.1888836-1-rajatja@google.com>
Message-Id: <20211022022859.1888836-2-rajatja@google.com>
Mime-Version: 1.0
References: <20211022022859.1888836-1-rajatja@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH 1/3] i2c: designware: Enable async suspend / resume of
 designware devices
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

Mark the designware devices for asynchronous suspend. With this, the
resume for designware devices does not get stuck behind other unrelated
devices (e.g. intel_backlight that takes hundreds of ms to resume,
waiting for its parent devices).

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 21113665ddea..2bd81abc86f6 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -293,6 +293,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 					DPM_FLAG_MAY_SKIP_RESUME);
 	}
 
+	device_enable_async_suspend(&pdev->dev);
+
 	/* The code below assumes runtime PM to be disabled. */
 	WARN_ON(pm_runtime_enabled(&pdev->dev));
 
-- 
2.33.0.1079.g6e70778dc9-goog

