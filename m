Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF88A429AC9
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 03:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhJLBKz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 21:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhJLBKz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 21:10:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2FBC061570
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 18:08:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so80393560lfd.12
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 18:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=9HcOVr8JD61cbEk0dQbFXubvFww54VrmGyyOpCRyVXc=;
        b=BHyOda20zyDEXOXBUvqbHt94HRTkDaOhU190MxEcDj0RslE6dILpEnR7ie/2pSSz50
         4sK4ADM15RsiyJF95Hi4CKVBzKpQbvCCgGlcIPt4LUwvR5M8YyjmYJgHVBYTylm9wbWw
         NpSWKi9dMeIpV9O+88tqxLAoTWV/ZAtVZWWkCuWrttShreqh25qc4KX3g4OxGhiJAC8Q
         jCDdPz1pEECZTmJoKU/AjzkGneSqokOzIHEq+nZwLdkmRssEGoi/eHUPsAoD4jzUk+HN
         4Vt+rxOgxA66HWDSQi6QZVGK5vH3qIwOMlEQHBcS6L1YTP4J7F2/1knXFl+0w9LgWYCM
         KIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9HcOVr8JD61cbEk0dQbFXubvFww54VrmGyyOpCRyVXc=;
        b=y0s2awQDs8IkXqoLNLMDk7R6ZyL527gWR7dlYxA7DMbp+Y6pZ8MYWzOYV1j3+o8/ae
         EgyhYhuDJH7M/SQ9PIm6LaN5vocgGp4ndCMlIJWMYm8TcHGrYqn9Kp5H/USKk0jIcxxT
         F0bRFWyicAYAGcfdfbq/f0TyQLtACsgGAwZ0AVBRuKWxGu0vGLv0tnY2bMMhFAY+TFUP
         CND0FrHd7ZXr2FaEHTuz/PR4Tm8m4gNFOx9Lo2t/TMGAKoauBdyR1HBZKUmhY/32CQRT
         zvHjv+pS5ABKK2vbuddBVQIVV9WRppc9P4gVAa8qZJOSfYVhb+rzlVaanijziuSWZk0z
         9A8Q==
X-Gm-Message-State: AOAM532L8SGAYXQDiUzNKsOWerYz93JJvLYN8HSTJreoW69peAz2XiiX
        pl6cb1qLsjLl5BNc7sVy7PQG0MQJLsOubMnKir+6MrtWiKqeWg==
X-Google-Smtp-Source: ABdhPJxd8UZalePXNSvl8KsyBg9KAYSGURryVOZlt1PmIvCf/h9Bpd+QH4q9VxNbY3k9ouXcOePE+cDFVTwNZB+OQSQ=
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr27598350ljc.91.1634000908167;
 Mon, 11 Oct 2021 18:08:28 -0700 (PDT)
MIME-Version: 1.0
From:   Sui Chen <suichen@google.com>
Date:   Mon, 11 Oct 2021 18:08:16 -0700
Message-ID: <CAJOps0smzC980mxpwqCtxbjCwzzU0ur4tm_f=mGH8t1PLPjPNA@mail.gmail.com>
Subject: [RFC Patch 2/2] add npcm7xx debug counters as sysfs attributes
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This change adds npcm7xx debug counters as sysfs attributes using the
i2c_adapter_stats_register_counter function.

Signed-off-by: Sui Chen <suichen@google.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9b..def044207cae2 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2224,6 +2224,14 @@ static void npcm_i2c_init_debugfs(struct
platform_device *pdev,
  debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
  debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);

+ /* register debug counters in sysfs */
+ i2c_adapter_stats_register_counter(&bus->adap, "ber_cnt", &bus->ber_cnt);
+ i2c_adapter_stats_register_counter(&bus->adap, "nack_cnt", &bus->nack_cnt);
+ i2c_adapter_stats_register_counter(&bus->adap, "rec_succ_cnt",
&bus->rec_succ_cnt);
+ i2c_adapter_stats_register_counter(&bus->adap, "rec_fail_cnt",
&bus->rec_fail_cnt);
+ i2c_adapter_stats_register_counter(&bus->adap, "timeout_cnt",
&bus->timeout_cnt);
+ i2c_adapter_stats_register_counter(&bus->adap, "i2c_speed", &bus->bus_freq);
+
  bus->debugfs = d;
 }

-- 
2.33.0.882.g93a45727a2-goog
