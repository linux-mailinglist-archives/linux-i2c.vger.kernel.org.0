Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE3B75474F
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jul 2023 09:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjGOHxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jul 2023 03:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjGOHxn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jul 2023 03:53:43 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F21335B3;
        Sat, 15 Jul 2023 00:53:42 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-316f589549cso167070f8f.1;
        Sat, 15 Jul 2023 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689407621; x=1691999621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkZwqb3Vffoas0KVRKwKV1wchqc/EYndL8Fu8HZrU3o=;
        b=dvTbeBsiheUTHcMMniyY/m4PoV4r6uJMCT0r8qcXyNJq8w33m1VsaEqZyZOyfNSVYC
         otHuqvaOlMgsikX9JrvgNmfEPOJpZClaXShrU/pSz7hIFd1bkYW1tzextkt5V26iiB+p
         JveQFRxvZDsJhCEDDfsrohk4Ngp/umuexp6RGiV+HAwKTUkRPPrFgL1yKk/Tz3N3kM3Q
         YjOE3uTDuG91TlnOXDl93PeGe+hdTjueyRxEK61aO/1whE5my1y/By3/9EQ+FSQ9YtDb
         EDnNI21GGWJsG+NIOj/uqpm5cCX6y2MasJOfBiLQH9Oe9L0CMWTni4/x42kA4X+AfZq8
         Ym8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689407621; x=1691999621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkZwqb3Vffoas0KVRKwKV1wchqc/EYndL8Fu8HZrU3o=;
        b=XjekmUX94d49Apwzo8Q5MvSZGee6mRgORY9NJ+LGTReYQG0wsw4kaYLV/YIdEQeuDe
         yLO3iMAT4QAdD1t7Igydamhq1npn1/xakC4qveXMYNNmyl7M6RMfdK0+5hptzrxXdCvU
         oQlCHaOkQorvQbISiJqp4la5dAxV8VhWP8dm/ceR3kCVGeSBTydphrqcUMZq2yItLbLW
         nZ/eLAy/LyVYpY7FbmjQL4wibEVjesYCEPnchMXzvHMaXczR2zkPFYeWsqM5rHm1HE19
         a96lwd+omhlzugNqD0p561oCh5nMgNFDRLst9+aqIq1VB+qNMZV8vJMx0nwZHanhv4f5
         Egfw==
X-Gm-Message-State: ABy/qLaJme/JM8O/I0rwI/uM7gnaHSPX+RcZAKQ27dGzoRY4cxKLtWxi
        9hsQ5hBSSgmFgHtXzV6MGFNBfuMqqzQkFQAo
X-Google-Smtp-Source: APBJJlGw8BKGae83Ti0dFAC+Xvl5fT43WIHmXQehaFygK2EtfDNujLdnjv/1SCD/9eNY7q1jx7+g7Q==
X-Received: by 2002:adf:f1ca:0:b0:314:5f6f:68ce with SMTP id z10-20020adff1ca000000b003145f6f68cemr5388310wro.66.1689407620997;
        Sat, 15 Jul 2023 00:53:40 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm13001271wro.24.2023.07.15.00.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 00:53:40 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Sat, 15 Jul 2023 09:53:23 +0200
Subject: [PATCH v7 1/5] kernel/reboot: emergency_restart: set correct
 system_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v7-1-18699d5dcd76@skidata.com>
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
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Nishanth Menon <nm@ti.com>
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

