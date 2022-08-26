Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A415A222C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Aug 2022 09:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbiHZHpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Aug 2022 03:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245562AbiHZHpP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Aug 2022 03:45:15 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBC56BD4D
        for <linux-i2c@vger.kernel.org>; Fri, 26 Aug 2022 00:45:13 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 142so820879pfu.10
        for <linux-i2c@vger.kernel.org>; Fri, 26 Aug 2022 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qIh8T4+4nOwG9GFhkeivft0t29HmdMlLLogsNGytBt4=;
        b=YO8O7tpev6lVgcxchYkRVcQ6hFDrP+lFEu8x2WdB49uULsX4NDK+pYzZq2mjY1aaNO
         YIVEzlBLL5QQTtbnDZnv7KV+vCGI7b0QktibVCNxznZyArvhMwU2y+porhxQELMr2ANH
         Ah7UGB6Jf/1Z/MYlITTd/PlDMHY4TzxGzi2Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qIh8T4+4nOwG9GFhkeivft0t29HmdMlLLogsNGytBt4=;
        b=Vnozyuz6TFH5vVyePtc8mMT1HRDBRCytUb4R2w9KnGUoX47guFIZojpOE/JUcqAJt8
         rFpqEKFXqeedk3c+7ytboJ8As4uHHkjGbq/K7UWEPze0Q68xiEJbS7v8tB8+V7dXc8Of
         U+mYZsoSehD73PgG/dKgtSheSqo723fcV8T+7fcGz6W8icrAhcpBis13qtHIi9msdZt+
         E9uqSIuEXjmLbi3nF8fqyxwRDM7uJMCRWhA/QI57iae9ozzTSg6ykhsNyArqPiDSUqVs
         l4hzq1S9zA2gL/8qoGB4VhK2M7A0PS2J6m704aUHG/3RiT+lrbCrMdLF4m0GeWEOfv4W
         ctQg==
X-Gm-Message-State: ACgBeo2Xt4EAYKzj4ZqkpXisrgmkHy/7j7a1/V9J4VHLvCjIvF6pYG/p
        k8vn6eTNJ9Hi+0bflGbFNs8/xg==
X-Google-Smtp-Source: AA6agR7V0nJEYo+vZ6oEyQt6Lh08k0kUBlPTQ7+pfNeEXy0eMbx8w7SA+6es/3lIo4WTWX7ekaQasw==
X-Received: by 2002:a63:4c05:0:b0:41d:12ad:e885 with SMTP id z5-20020a634c05000000b0041d12ade885mr2384548pga.130.1661499913066;
        Fri, 26 Aug 2022 00:45:13 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:2e1e:8706:dfc7:5c74])
        by smtp.gmail.com with UTF8SMTPSA id u9-20020a170902e5c900b00172f4835f65sm851422plf.271.2022.08.26.00.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:45:12 -0700 (PDT)
From:   Mani Milani <mani@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Mani Milani <mani@chromium.org>, Jean Delvare <jdelvare@suse.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: i801: Prefer async probe
Date:   Fri, 26 Aug 2022 17:44:30 +1000
Message-Id: <20220826074430.1333272-1-mani@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This i801 driver probe can take more than ~190ms in some devices, since
the "i2c_register_spd()" call was added inside
"i801_probe_optional_slaves()".

Prefer async probe so that other drivers can be probed and boot can
continue in parallel while this driver loads, to reduce boot time. There is
no reason to block other drivers from probing while this driver is
loading.

Signed-off-by: Mani Milani <mani@chromium.org>
---

 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a176296f4fff..e06509edc5f3 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1838,6 +1838,7 @@ static struct pci_driver i801_driver = {
 	.shutdown	= i801_shutdown,
 	.driver		= {
 		.pm	= &i801_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.37.2.672.g94769d06f0-goog

