Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B152B219
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 12:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfE0K3n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 06:29:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46299 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfE0K3m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 06:29:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id r7so16380027wrr.13;
        Mon, 27 May 2019 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sr6ztk9kkAYwhQ9kmB1b0Qy6c/tH1fWZgChf86og+j0=;
        b=J4YwJzRPlspr7Lly+76uDgjLddXxvmY92zjufT+BkRVcH073GQzVaeMmOAbwE2xgaW
         aYlaTbv7oTPL7HcIW0PbWPryhxjDxbSlRySdx5Qm8UzL84i6CFb8RREi69r9YCY0TNBV
         bl3iJOXxJYQ0cgJSbs5p2R9bepozOtJCw4vYywg3t2NMxO8m2vVWvD8dVG4JNu5AQ85m
         MpHCKtKi476QS8qiRcSdSpHMSBLjabnhrTS3gd5Sl90e9kQ3ftpiM5YjLm1R1CJcUjj4
         zlj9Rlefl/0rQVvqsrUh+UirDPjW4uGlx9gUyMK5Ib2YBkP6McOT2JQbIiE7WjpxAV9+
         2GuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sr6ztk9kkAYwhQ9kmB1b0Qy6c/tH1fWZgChf86og+j0=;
        b=RbUgPt9yXVLPAbBVexAlBHfwPcAEm1xZ1sSriYJ8sD6OdGRJhDfdc/JBUs39xQ55IJ
         DpGlG9fGQqH5tdxgdkk3b2TZ1rcBO08yomaHPsAEw3jgeaoNG5anXhh1nVk4JANbdPyL
         LlENtVi1pwzXNRCky+lKY6K88yYKQKnhzI63OTn5GI8APg2Jt30+76eK3/GR/zrdQV1G
         DfSaZWcQGmhpfQ/6LXzF5I1///4q7HuGoi7biDAzmgItli8WzlUq/oNUKrbAt91UANyL
         wo6MU53ZmC8knR30McHwiBRrNJJNdMdk5qlqN872Ywt9NfOB7UEGK4zUHntPi/UbxsAi
         CLIQ==
X-Gm-Message-State: APjAAAWzVjY9+0H/uY9ZbLoiAy41xD8qFsQaBJXxA0LFlVGm1T5mjE/e
        SvERbfKqoe+6Cz4ME0ZQBq9o33YU
X-Google-Smtp-Source: APXvYqyfFzuhEgbSsrOd6YLa6WQIAUJML6bJ/6hmBGHh8Zekal2z9NVxCa5jE/SAeKjujN64jUw1Iw==
X-Received: by 2002:adf:cf03:: with SMTP id o3mr10492942wrj.5.1558952981010;
        Mon, 27 May 2019 03:29:41 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id q9sm12644695wmq.9.2019.05.27.03.29.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:29:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] i2c: tegra: Avoid error message on deferred probe
Date:   Mon, 27 May 2019 12:29:39 +0200
Message-Id: <20190527102939.7616-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If the driver defers probe because of a missing clock, avoid outputting
an error message. The clock will show up eventually.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ebaa78d17d6e..6bfd5297f425 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1517,7 +1517,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
-		dev_err(&pdev->dev, "missing controller clock\n");
+		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "missing controller clock\n");
+
 		return PTR_ERR(div_clk);
 	}
 
-- 
2.21.0

