Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1280754751
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jul 2023 09:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjGOHxp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jul 2023 03:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjGOHxo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jul 2023 03:53:44 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73443358E;
        Sat, 15 Jul 2023 00:53:43 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-316f4abb1e1so291797f8f.3;
        Sat, 15 Jul 2023 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689407622; x=1691999622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+obao1vrgT6KgLyos6QbGdIaBLL4NR6czetr68SUf8=;
        b=O8evkQvgJtq7ml+5tf0IhSV1zngA5Z7BkV4VKvBJ0F2zCtW4ZeTAWs0VxF7Q+oLnx1
         amSHIqAOq85VPHMQUgCqXX8z1FprthpkaNSgXrTW2qc+zdfDZd3w2lcff0p+GXSU7MIx
         K0kOnWc5kfIGSlmRhExfFWq4PTSmxp/bDWHvnoQSMqcSCl7FCrHCojGvXfsEoCVzJsda
         D9hl7SY1B7omLGkf3ATPOv4DvA/VbZkooZ8g8oe1p5xrNrBV3Wmk+UtkDGVPB6O+teG9
         Xec/PRid17C8i3dNUw9/jJlN6Jbuv/ppzKoESL4wqJR7SY5jjAiFefjo6KW4d7awxuvy
         saug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689407622; x=1691999622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+obao1vrgT6KgLyos6QbGdIaBLL4NR6czetr68SUf8=;
        b=f5P1qdbZeGOyUGQjXZEp/P0qCIPor/WTtAQzjA0LunqNWgIKpIEo+PmL+Kfh9HHGy6
         moO7F17tKsgtz28IfJguc6gfg5L35OGuCYgu/OktavVCoFzmACesVcB1XDdNEb4x3KbO
         6TdwVxh0uQVHC4NkxTt2AbAkeqc9m16mN7bstnskRRe9M6lkwNgRHwW9CzLjPCUnf+O6
         zuULLrFacT+BHCwECA1xYH5aBSb/pkzody67XJMS9aVrG/3+F1MEWYLm62Z9bSDoDijV
         VeSBWq6727H7retiCiVNWp0lT+PXZsseAY0i//HNis54p04cpr4zTf3Z6CkFZqZasZVA
         sKTQ==
X-Gm-Message-State: ABy/qLZwbHyASQQ/juZDK7LUOH86kN/dzOQQuif6KqeIQEpwHw3/eLmX
        31gxka5xaM/YCSJMyNmN1dUW/WCXBvXUW3rb
X-Google-Smtp-Source: APBJJlF9bB3nAEEihMb2nZ7+5Y9uwEUlEU6kZi1nhDv6kvU0/EUdBRl0gq0XcG1IFKVrhp+XiAHBKA==
X-Received: by 2002:adf:e801:0:b0:313:fe1b:f444 with SMTP id o1-20020adfe801000000b00313fe1bf444mr5761068wrm.68.1689407621760;
        Sat, 15 Jul 2023 00:53:41 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm13001271wro.24.2023.07.15.00.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 00:53:41 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Sat, 15 Jul 2023 09:53:24 +0200
Subject: [PATCH v7 2/5] i2c: core: run atomic i2c xfer when !preemptible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org, Nishanth Menon <nm@ti.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
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
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Nishanth Menon <nm@ti.com>
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

