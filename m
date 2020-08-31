Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27B425828A
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgHaUYR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729982AbgHaUXc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:32 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B0BC061573;
        Mon, 31 Aug 2020 13:23:31 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j15so4235992lfg.7;
        Mon, 31 Aug 2020 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gHgiuwktFuNHisqmCuic313IjjZCR0r8Yab3mbg/wXU=;
        b=B/KOs4w02g8hE+IsBUTqQnmPot9G0NMpLoolhcnpdPOZ52L8Fly9+DRSScCdIe1Qho
         Ryr1dS3S6EvZGJ619GEYzZSMb2WuC5BbpXVseDU1Xt0IsRB9hw4pRM2w530PbY12zwkt
         Mt7U/3AD6iCIgt5QqgRrUp/WOTJVQbLxXOSydezCzPitbKeaqN/XHWlwuGow0+YaNpmr
         S3PfoyFV4fAm+dnLzAXU6/pYe95YFsU7Hn3IJ2mtQaWbtU4CwBPmylEkZV0WYq3+GhbQ
         f3NxcB96omwY8drfT03TlMKg9QmY5ZaOrZr7x8tonxPm1O4SJZobCgR8KKZQRhZm6Ahn
         EY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHgiuwktFuNHisqmCuic313IjjZCR0r8Yab3mbg/wXU=;
        b=oaSFrycO3imk46BjWrXLSGXOTeiM/RML/8O1bWjQ7LIU+UUg6DcWJDpDKdSq6iRk7y
         qsz91IgrXLI1hEA3L+C402u3GlidU052fVEXGp6jcIbbSRkeEtwRSlUaImtooLLesVyR
         HAbwm2bOglXyDWHG84J030CIQoYVK5NsAUXScLC9l7Y85gjOOEcwbmXrVOJSuHwMGeE+
         6d5N+bEzfVE5MP9lq6uthDqaoIKS+zbqkflSL09emY3CBdqCp+FR77c7LtrmMHIB0pFI
         w0wcsWGAeQEPIqmvKnSpyZfdDNq1SgRF6kQT/5bd+5gio61WQ926Vluo56XFwekbFDly
         PHeg==
X-Gm-Message-State: AOAM533oJGKHIlm8lL8eSUAVxmzhBG2w88yzF3USRgl+60dFlZCKXqoG
        4ypxT96EFn+o8syym9BslEQ=
X-Google-Smtp-Source: ABdhPJxt9ABEAYWD+Ee6lkGkyhj6ob/OlMlRV1yzeBhAbCEpBchmHKVUrbzxHNNT7lBYIDhO0pnlyg==
X-Received: by 2002:a05:6512:2010:: with SMTP id a16mr1414256lfb.196.1598905410419;
        Mon, 31 Aug 2020 13:23:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/12] i2c: tegra: Use reset_control_reset()
Date:   Mon, 31 Aug 2020 23:22:56 +0300
Message-Id: <20200831202303.15391-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a single reset_control_reset() instead of assert/deasset couple in
order to make code cleaner a tad. Note that the reset_control_reset()
uses 1 microsecond delay instead of 2 that was used previously, but this
shouldn't matter.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a7ef3a93e1b5..6957be34bc41 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -791,9 +791,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
-	reset_control_assert(i2c_dev->rst);
-	udelay(2);
-	reset_control_deassert(i2c_dev->rst);
+	reset_control_reset(i2c_dev->rst);
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
-- 
2.27.0

