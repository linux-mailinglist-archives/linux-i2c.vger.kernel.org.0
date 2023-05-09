Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C876FCE25
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 21:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbjEITDm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 15:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234410AbjEITDj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 15:03:39 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4431A4224;
        Tue,  9 May 2023 12:03:38 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so61810502a12.1;
        Tue, 09 May 2023 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659016; x=1686251016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClcmwgNB66OteygA0EuqrobbOiZGS0nq7YJHw1f4dDg=;
        b=JYhBuR4qpiaDvkhg6AZK8V7F0fbdddRjnrzxLmoLI8nDqKbdv7tPEmPeZaWGvGmc4/
         f1ONolfAENAOEYgA/Pf8MAm2Ed1RDYhlmIssUlQC336Bhzji5gOpQ9Wo3Trd2F93ZiMP
         AC9lMomxq7i9L6Jj4qcSNVrgoBha8mmq1YMhRahx1i4/hFfA2oCGc/Md+zysak7gbxH9
         i1+CrqAjW8qrMhnUy59U/KkuNBR3bi4PGLOTrH/8uQpYI2knKBU5h8YwY9umFxTaK1pL
         +n6+/UAIfE1VRDF0Nj3aLGoqSEKTg4Ybb6JOXMgn6/Ddc4v7rjS7fA+88tMfdbqi+krk
         uqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659016; x=1686251016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClcmwgNB66OteygA0EuqrobbOiZGS0nq7YJHw1f4dDg=;
        b=eW5UyFpW3MO8KaGIahvKn8RgvKCgKDZVbV2by/AARg0jRv53Rffl7MJ9Xj+cBfVpS3
         K0p3vIto4sXPNlE7uDDmtJApo3XP4gNLCoTUOP/5m+12u1SDHgB+4oH2oj8HWSDYDgZr
         s70edMzmGmmRfqTNkumvLngJXpYxpYWtgZcrfJql6YShLG2wqFe0jBMzodPWrN2A40Ml
         ViQqYZYGOeYfgecMVlE1XMQrbiYez1dglmQq9Q0K6j13l+FK08u7/BVstj0d0dA3h+vh
         MKXD/e4PHk9q++z/Z5kFJNvM/0KXhIUIayQf+ZGxjTfgkQST0D+wTquw4X1T896+nmra
         oNSQ==
X-Gm-Message-State: AC+VfDzbyBrW3firk6/s0LZG+9PPBOhlM38AcZOQg0GYVYy2UEjFhL7x
        vWL+dtU7ziqqenqUHaXjhVSYbhIvND+6O7Wl
X-Google-Smtp-Source: ACHHUZ4sqC9G7JlHs4jYEbeNTTDzn/nCy3hXXPEdhgwIei5SoIH/ZCCfsVZTJsGaEx7Cf0DwyzTSGQ==
X-Received: by 2002:a17:907:3f22:b0:96a:2b4:eb69 with SMTP id hq34-20020a1709073f2200b0096a02b4eb69mr1662985ejc.31.1683659016408;
        Tue, 09 May 2023 12:03:36 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009697aa5acfcsm1640232ejz.122.2023.05.09.12.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:03:35 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 09 May 2023 21:02:59 +0200
Subject: [PATCH v6 1/5] kernel/reboot: emergency_restart: set correct
 system_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
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

As the emergency restart does not call kernel_restart_prepare(), the
system_state stays in SYSTEM_RUNNING.

Since bae1d3a05a8b, this hinders i2c_in_atomic_xfer_mode() from becoming
active, and therefore might lead to avoidable warnings in the restart
handlers, e.g.:

[   12.667612] WARNING: CPU: 1 PID: 1 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x33c/0x6b0
[   12.676926] Voluntary context switch within RCU read-side critical section!
...
[   12.742376]  schedule_timeout from wait_for_completion_timeout+0x90/0x114
[   12.749179]  wait_for_completion_timeout from tegra_i2c_wait_completion+0x40/0x70
...
[   12.994527]  atomic_notifier_call_chain from machine_restart+0x34/0x58
[   13.001050]  machine_restart from panic+0x2a8/0x32c

Avoid these by setting the correct system_state.

Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
Cc: stable@vger.kernel.org # v5.2+
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 kernel/reboot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 3bba88c7ffc6..6ebef11c8876 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -74,6 +74,7 @@ void __weak (*pm_power_off)(void);
 void emergency_restart(void)
 {
 	kmsg_dump(KMSG_DUMP_EMERG);
+	system_state = SYSTEM_RESTART;
 	machine_emergency_restart();
 }
 EXPORT_SYMBOL_GPL(emergency_restart);

-- 
2.34.1

