Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692F647C52E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240489AbhLURoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240504AbhLURoa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:44:30 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4E4C061574
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 09:44:29 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id b15-20020a25ae8f000000b005c20f367790so27005820ybj.2
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 09:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HkXdeoDDS4XC9WW1t3ovXGQdnbI8L5ktylsEwvM1dMc=;
        b=ETNvHd8111/hLG/3/ROxw3sC6AqMoWNtx1W2oVtJKNsM5tdBbnLwCpLxyxBEpJxoOK
         pcCq+L1AMUhQf10lvFRHOysRre6GXkZ6InOGARh3EmPwaQJHqa1oPFo6aUyC+am5vibq
         DC25E2eGr5Ts4/9M5el+gPDxxPgakEGZOE5zNfGkkC/R6jZsnAaLha0n90XkOPmEr4gA
         DnulDSw9hJApvOFHNlTlCC19SxtmbHfC0x0vTSoVY9dgY98mJKoXTW48nk8dxV1zwI31
         pI0Y3fJGBcjBJ4uunsi9ZWaoixmMab4ug8sqWtWCK5UFCoNI51jcBqR8tIYXceRTMa8N
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HkXdeoDDS4XC9WW1t3ovXGQdnbI8L5ktylsEwvM1dMc=;
        b=DdqMbzG5sKXpqBNMZxtSZSPPkouBP1QbAz1IVKyrX2arTVIlXPXcm1I7P9QzosFYZy
         KVuJ5wQjgIvhJBsy6BR1mKmbFG/i9b590b2RlmoHdjJpYyMRUrfFYembicOJWG8ZHOcT
         L4nez+SLlhK5zZtkhIX9QQ1TNzWrQgM+OiGMIQBZJRq+muWece2vB/q8VoKVP/nLR4IX
         iKg6cbQBs/nvT2LTqKaoTRZ1+tM4I961/AGlf04f/LBYyzgVHBuZUcJmW2Be7DMHJhys
         WyVviTCR772aqDbTR25YaCZIeFAHE8/IoJC4a+2q9UoC2x8AwQbRL29Sywq3rajy8U54
         /DWw==
X-Gm-Message-State: AOAM533CcH23uJOf4KKyFl/CWRYes591T1ynwlgqur80DRlU5b3lKQyH
        NTP18x/dtooWhk8lSs0lVX33xwLuQWU1
X-Google-Smtp-Source: ABdhPJwCJM4EkwOClyVAfTDeoeRC4+/Y03u13sQX/1lpfnuJre5DLbkFg1YukGstywgAkyz6SQT6mUZi0gzY
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a25:bfd2:: with SMTP id
 q18mr6304044ybm.542.1640108669011; Tue, 21 Dec 2021 09:44:29 -0800 (PST)
Date:   Tue, 21 Dec 2021 09:43:43 -0800
In-Reply-To: <20211221174344.1249202-1-suichen@google.com>
Message-Id: <20211221174344.1249202-3-suichen@google.com>
Mime-Version: 1.0
References: <20211221174344.1249202-1-suichen@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 2/3] i2c: npcm7xx: add tx_complete counter
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tali Perry <tali.perry1@gmail.com>

Add tx_copmplete counter which increments when a
valid transaction completes.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9b..cc7abd0b870be 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -314,6 +314,7 @@ struct npcm_i2c {
 	u64 rec_fail_cnt;
 	u64 nack_cnt;
 	u64 timeout_cnt;
+	u64 tx_complete_cnt;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -684,6 +685,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 	switch (op_status) {
 	case I2C_MASTER_DONE_IND:
 		bus->cmd_err = bus->msgs_num;
+		if (bus->tx_complete_cnt < ULLONG_MAX)
+			bus->tx_complete_cnt++;
 		fallthrough;
 	case I2C_BLOCK_BYTES_ERR_IND:
 		/* Master tx finished and all transmit bytes were sent */
@@ -2223,6 +2226,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
 	bus->debugfs = d;
 }
-- 
2.34.1.307.g9b7440fafd-goog

