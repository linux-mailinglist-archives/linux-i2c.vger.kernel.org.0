Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE46FCE2D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 21:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbjEITDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 15:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbjEITDk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 15:03:40 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F27649EE;
        Tue,  9 May 2023 12:03:39 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9661047f8b8so733150266b.0;
        Tue, 09 May 2023 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659017; x=1686251017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbgVQUp/vUincJRkcsp/7lCVaCrW8ZOrNJHo4G9adBQ=;
        b=Afvjm2OnP/cD1G79QHO+6f/98CFgsDJipiNhtGgCLQ163WD/TgRIJOCoPI/htLTnM/
         mvr/x3KmOS6hUNe2fRTGk+QZUyM5UdwnuHndH0eaaLvqqQxWHo7Nc9RM62YhrKaL67zz
         kG/Ie8OqEwT4yGD320fK8tpLWgWZulX2hZDCpphgltCOXrmoGuYym6dYM7mh84PGvLrb
         Y8/Te5E31rPgn0BpzH+2DbpV3T+dFATJXgeS+lANmT3i3+NPQ9EI0QeTZEUlH1BTSnwE
         Oomukj7VUTvhJ8Rw0y0xyHcHA4Dh7BC8BZRtm+0UCmNHwx8oSX8OtPCiIYhAKp3ZnHqo
         ywIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659017; x=1686251017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbgVQUp/vUincJRkcsp/7lCVaCrW8ZOrNJHo4G9adBQ=;
        b=QFGy5AFP3WRuY/JfA8tv4PWIekrEHLZvD9b2A+HUDk1327RM8w/Z3MHwHEa5FK16xq
         aORT93GxvYjvJl8oY4d/ceOjIlZLRZSxsIyKnu5lms1wc+3y8+JBcf5GFue+Q/c7kJJV
         qw1c+J4qoCcBDbOAMfQdn1OsUmY1o3/GnmZBr3SFav5b5H3tvt+P2mkWfhECOceCPpei
         TTdu+US5mm4KZliZ0xlH2mC/+0tqsuNGpQoU7dWruWgKSIAHxkCGnR6vGjnbogqtHd1t
         zBhpmKLjav9/M4nCOG3nzqj8bUwPPIujp65Y3p0nHXGge07DqjJDkJRSdfJ2y9HWYfG0
         FcRg==
X-Gm-Message-State: AC+VfDzA/+aPnppaLI9/pqkEMr2/PEnqt3A5+ttONbH7+P+EG6P6bGH3
        QEtYGwtQqwIYU60wNd+hIGyqxKuauNxqWvoh
X-Google-Smtp-Source: ACHHUZ7SZPJq43m1vkwSM8OY9Jp1q+dUpgBMGulzGUFY6gKuPbX9x/U6HHzFHCtZEHrXxbptHT4TqQ==
X-Received: by 2002:a17:907:3e05:b0:94e:988d:acc5 with SMTP id hp5-20020a1709073e0500b0094e988dacc5mr14025282ejc.46.1683659017415;
        Tue, 09 May 2023 12:03:37 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009697aa5acfcsm1640232ejz.122.2023.05.09.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:03:37 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 09 May 2023 21:03:00 +0200
Subject: [PATCH v6 2/5] i2c: core: run atomic i2c xfer when !preemptible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v6-2-af44a4cd82e9@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

Since bae1d3a05a8b, i2c transfers are non-atomic if preemption is
disabled. However, non-atomic i2c transfers require preemption (e.g. in
wait_for_completion() while waiting for the DMA).

panic() calls preempt_disable_notrace() before calling
emergency_restart(). Therefore, if an i2c device is used for the
restart, the xfer should be atomic. This avoids warnings like:

[   12.667612] WARNING: CPU: 1 PID: 1 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x33c/0x6b0
[   12.676926] Voluntary context switch within RCU read-side critical section!
...
[   12.742376]  schedule_timeout from wait_for_completion_timeout+0x90/0x114
[   12.749179]  wait_for_completion_timeout from tegra_i2c_wait_completion+0x40/0x70
...
[   12.994527]  atomic_notifier_call_chain from machine_restart+0x34/0x58
[   13.001050]  machine_restart from panic+0x2a8/0x32c

Use !preemptible() instead, which is basically the same check as
pre-v5.2.

Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
Cc: stable@vger.kernel.org # v5.2+
Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/i2c/i2c-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 1247e6e6e975..05b8b8dfa9bd 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -29,7 +29,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
  */
 static inline bool i2c_in_atomic_xfer_mode(void)
 {
-	return system_state > SYSTEM_RUNNING && irqs_disabled();
+	return system_state > SYSTEM_RUNNING && !preemptible();
 }
 
 static inline int __i2c_lock_bus_helper(struct i2c_adapter *adap)

-- 
2.34.1

