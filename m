Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF816E5F70
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 13:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjDRLKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 07:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjDRLKu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 07:10:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703DB8A66;
        Tue, 18 Apr 2023 04:10:29 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id u3so20144783ejj.12;
        Tue, 18 Apr 2023 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816228; x=1684408228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+lVoOUZtTyyGsfBDgf4AuGO750yYFu7Mx4N6XxgK8A=;
        b=oqKwkmHHVS+H8bUhXUZX4FkxJlTh9qLquZdEKUEFxPmIXSv1JV8pzI0Yl/VWl3N+Og
         WowhtLxCZb+75/EQv/FN4xF0olBBjuQ48Su3XSFibCDT8cT+o27vbx+RHIAWvn8LOPzi
         9nHDp/ANxACSih3O58T+BSrjvvkwRjXWXRW+ylFBTrjMm6dhOO5zW/Al68hcy9jpQvJv
         ZMoHDlICGWpFNSG5wWuJ/oDm3uhcp3DNoGzyQFkOBczOd8AawyQicwGcR733hXTWnxEd
         kzJVpojpP5rYPqHrLcnTlA7I0z7jDcB+Isu9gVb7dn3DtPPDHbun3WN8qMJWbsyHVQq7
         w6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816228; x=1684408228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+lVoOUZtTyyGsfBDgf4AuGO750yYFu7Mx4N6XxgK8A=;
        b=Te9EJV6iWGE+0D4t5XiI3nPuf8ySeBEwMyx37S7lGVtGsSCEy/VJLABEUHhu8zwWU0
         ZZBngQ5gD5peD2a4ooQZI+yfMO20kFZ7MgevY+ucpwhmFWJlVjo4RlDuByNR7ImGNHXo
         Ie/s3aBTp1w4XUIJ+GVYENvbDfeCixqxM4LsU5iHoYk+8xh12E404JFJvkieruY1g/av
         2a9SPPaonePJ+n5YkP0bQSZa6a4vr2EIzCZGuQx0RX+wJPtXzRi/fasRFBH+qUONF+Se
         TkmZsa0sfp0q3Kk/EHDMzsimfgu41fXRJtYVQouHN2lsjrAhCGy+Kztx6kc8Wt7gJSxJ
         01ow==
X-Gm-Message-State: AAQBX9cPj+if7Q95B2mT7C8Ok4M4uwu4APSRSEHXJFhJk7fHXRiymOPE
        VoxRVsMFKefVRbTFA6Qtb17akHr7QlDP2DoR
X-Google-Smtp-Source: AKy350ZBsFtOh8G6fWSdZGjumqB6awkFXkuucbnhj6efn7LKhoojGJ+kdr5pouYYgb09xtZwd2FNhA==
X-Received: by 2002:a17:906:8619:b0:94a:93cf:6b11 with SMTP id o25-20020a170906861900b0094a93cf6b11mr9560731ejx.27.1681816227421;
        Tue, 18 Apr 2023 04:10:27 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906379a00b0094eef800850sm5954554ejc.204.2023.04.18.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:10:27 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 18 Apr 2023 13:10:03 +0200
Subject: [PATCH v5 4/6] kernel/reboot: sys_off_notify: always return
 NOTIFY_DONE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v5-4-ab090e03284d@skidata.com>
References: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

A failed sys_off_handler should not be able to skip other registered
handlers. Therefore, report the error but always return NOTIFY_DONE, to
indicate that atomic_notifier_call_chain() should continue.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 kernel/reboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 395a0ea3c7a8..689a147bc1dc 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -320,6 +320,7 @@ static int sys_off_notify(struct notifier_block *nb,
 {
 	struct sys_off_handler *handler;
 	struct sys_off_data data = {};
+	int ret;
 
 	handler = container_of(nb, struct sys_off_handler, nb);
 	data.cb_data = handler->cb_data;
@@ -327,7 +328,11 @@ static int sys_off_notify(struct notifier_block *nb,
 	data.cmd = cmd;
 	data.dev = handler->dev;
 
-	return handler->sys_off_cb(&data);
+	ret = handler->sys_off_cb(&data);
+	if (ret != NOTIFY_DONE)
+		dev_err(handler->dev, "sys_off_handler failed: %d\n", notifier_to_errno(ret));
+
+	return NOTIFY_DONE;
 }
 
 static struct sys_off_handler platform_sys_off_handler;

-- 
2.34.1

