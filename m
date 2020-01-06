Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2B1130B31
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgAFBEo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:04:44 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40654 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgAFBEo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:44 -0500
Received: by mail-lj1-f195.google.com with SMTP id u1so49239679ljk.7;
        Sun, 05 Jan 2020 17:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AmQ89GILhlx/U5P8wU6P6IdbZMbjFb3kbbiTdTM2PN8=;
        b=b9SFcRGUcwEA7bpeM1e9rApZKfIA/IjrZ1BS1JitW1dH4TSjYjDhNpfcKkLEhVnKa9
         XcV08CvSrQIBwybwMUpRtaFsRedHXoxagtSjasGrhN8Xqvurc20N7LhlyRUtxA/i0dXw
         UDzJJVMOfZq4IqFh7EgrrSoGwShfwkEbZMT6+ybqlC8TcThG8r9XZx7+K3vV32IBztum
         vrpEDbfgHl0ZPDmFdoUnL5sYNV0xCdhyYl0N38k+mJzDbASF/kiX2cYmAs/zfnFjPLjB
         w5wPMLThnoMASFvclTEHnPFprIDyZgLexyN/2csG6l7g5XzvwiCTxJrFgdv31NANTvBz
         RUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmQ89GILhlx/U5P8wU6P6IdbZMbjFb3kbbiTdTM2PN8=;
        b=qVt3JZc0M0PdNG466H/xcwQRWUsUWZfEkx7DVfEQLJcxnnNIlrhXLSwXLzbl3MT2hE
         ueNWmxC5aVjvxRYltaZVTtznO00KvDxRBFGrDy3926BQpHyFBMZ8LMWVMGD2Vna358/e
         dOIseHpWrKGnB1R1jVe3CmM7c3Di75nozSNWJ65GeAecNpHuPs43j27VwmxqFsIqu7SP
         w3VE7iymZa/qx/8ZbvwGE4qk0oFfO55pUpJVwpMNy8Gk7gStbl6uJX9kdWMig68GVJws
         6jrQKnUAfItWjFq8qh7OjBjD1kyYkawpbUII1JBbyNxIyHYnwLAXQNacnsTQA4Bo3TUQ
         YNAA==
X-Gm-Message-State: APjAAAVtf3IK8UWD3eVuNtjbDWLKGs5GG6fTHDSRAMawiwtf5MreJ2R3
        3vEh/N9/mFjvpYkFIoJwSVM=
X-Google-Smtp-Source: APXvYqzFhYK6TKgdScDuTqQQPBTj4Hr5hSZQFj76V4+2+JTJtYVfU6Z8YuBz+vd9KNsuSCP0Rj4dPg==
X-Received: by 2002:a2e:7009:: with SMTP id l9mr59107035ljc.96.1578272682061;
        Sun, 05 Jan 2020 17:04:42 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:41 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] clk: tegra: Fix double-free in tegra_clk_init()
Date:   Mon,  6 Jan 2020 04:04:21 +0300
Message-Id: <20200106010423.5890-8-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's unlikely to happen in practice ever, but makes static checkers happy.

Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra210")
Reported-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index e6bd6d1ea012..f6cdce441cf7 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -231,8 +231,10 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 	periph_banks = banks;
 
 	clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-	if (!clks)
+	if (!clks) {
 		kfree(periph_clk_enb_refcnt);
+		return NULL;
+	}
 
 	clk_num = num;
 
-- 
2.24.0

