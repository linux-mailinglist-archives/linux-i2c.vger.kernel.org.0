Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073AD47C530
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbhLURoe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240504AbhLURod (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:44:33 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74B9C061574
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 09:44:32 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id u13-20020a17090a450d00b001b1e6726fccso1974564pjg.0
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yQVcC55OoadpUPJm5lgEHKled6Uu3AS/23JgHN3JweM=;
        b=GiDwlFY4PevNZXTZxjYnA+LOJzLzost4vNTVzsrNvamLrnwxkYJYAaMz4PD5VxO/tq
         fXiy+gfDB17AzOm9ExFT9g4+nJMacXzvQmHqhjP1i2CrisMeEvfX7zcFqxRtGF/i38x5
         DbDdCZEdrp8ldNKoPo/hCA3DepLd8fQ882lLlCSRVrU4P44PKojnydVKH/7l/jMOAeJ4
         /2BuLQt3Nh8bFYth2C+kGhwX8fh897taYbjW+WT/jfhohd4okyf4OLXhpWc8GwGcQOZo
         LJqY5OqXrioPP7FVVEor+qksnpyMr36QEDSYU0bhHD6oi1DjTcg8ZYLGjhAc+6HxEhSc
         8AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yQVcC55OoadpUPJm5lgEHKled6Uu3AS/23JgHN3JweM=;
        b=vjzhOXN51a41adQpbEY/k5bSU/WzkzcHEysU93KL3HZFRmbFfDKMRnmhYCUdD2uMWE
         TPLDKdB0eCSh5qOOeibb6ED6iqOSwOMtgkNfZJsTJXIQ5I9qN9Y5lwpLL3sXVww5+APd
         Nbe525GrWdU+etAMerELX+uQ6gEfrDDa5j7iTqqMg5fnT0KL2aLBW1gf30iR8kQ/Zvh7
         dfhW442BXn/PDN7ZGF4ALo1i7DccQXfbHAS4/CSZBYyzAeCkMWbrS59ucxbAgkPj/vr8
         I5icigIhcWugsK0q/v/SiE4JqgpKtZqYlkpPfs9UR77KqQ3bdXHNQiFDcAiY5Ker76se
         GUkg==
X-Gm-Message-State: AOAM531+RPz48S2ZhhzJROOpI+1ZLPA5v2DHWHX9m/K3A5Lf0zmjH1LR
        35BGF0LyFF7oPfINQKzlr3AhNRDgHBaH
X-Google-Smtp-Source: ABdhPJy1QkR7/Vg/h/zj3GiBFEnfoUAbZdCXSJyAJqx7x75BiMeFHNxASCd5GeldXB+EfbmjW5UqUdXWfz5k
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a17:90b:798:: with SMTP id
 l24mr5338989pjz.122.1640108672149; Tue, 21 Dec 2021 09:44:32 -0800 (PST)
Date:   Tue, 21 Dec 2021 09:43:44 -0800
In-Reply-To: <20211221174344.1249202-1-suichen@google.com>
Message-Id: <20211221174344.1249202-4-suichen@google.com>
Mime-Version: 1.0
References: <20211221174344.1249202-1-suichen@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 3/3] add npcm7xx debug counters as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com,
        Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This change adds npcm7xx debug counters as sysfs attributes using the
i2c_adapter_stats_register_counter function.

Signed-off-by: Sui Chen <suichen@google.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index cc7abd0b870be..c3ba5f3d33af1 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2228,6 +2228,15 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
 	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
+	/* register debug counters in sysfs */
+	i2c_adapter_stats_register_counter(&bus->adap, "ber_cnt", &bus->ber_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "nack_cnt", &bus->nack_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "rec_succ_cnt", &bus->rec_succ_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "rec_fail_cnt", &bus->rec_fail_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "timeout_cnt", &bus->timeout_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "i2c_speed", &bus->bus_freq);
+	i2c_adapter_stats_register_counter(&bus->adap, "tx_complete_cnt", &bus->tx_complete_cnt);
+
 	bus->debugfs = d;
 }
 
-- 
2.34.1.307.g9b7440fafd-goog

