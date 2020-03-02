Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3982F176123
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 18:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgCBRfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 12:35:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39351 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgCBRfm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Mar 2020 12:35:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id n30so230588lfh.6;
        Mon, 02 Mar 2020 09:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Ye8JOMYu3KUEXBI9a+PVBJSVB7KxcW9KKrC8f1zJ54=;
        b=upJzOjhy2lmZxP8hF0aSUpHPT2GOtAEt6zE+bWnSG8tiy++hsjpnb9IQ+Ej3uAkWmz
         oidV/ihLP2ybcvf7eDhIe1XTpIqfux/6tL/jQo7p6/8bJtUcsNhD++wV3wntbflRjpwt
         aaIQ4fbY+AExrfOY9kpydmvdEJoLx/gpGXdzbMzoxS/A6rRCL/olqoZtCsbaF+Le6OC0
         h4fk4tojHsMItBo+5Qny+aC2ScsYamcl6mDFlR8y1XSm36cu092AC3XfjdM3iV98Falq
         USmRq5GznBBWLmsE3+gqMeXrY1/VQnARfM6BrGbHZBeFYyC6Qu/WLEkqo4IHnhGr8jFV
         T0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Ye8JOMYu3KUEXBI9a+PVBJSVB7KxcW9KKrC8f1zJ54=;
        b=r9OWGW4ZNODuYeR0NwWMkM4oRdQyYlalBMXDx6jX7f8R3o5tVg7caLbCm4pCoZmmuh
         +hYFCm/2QbQftlAZnyr4YogHJQ7UpHQPPEJYenHIERIZiopuUoiXK4QOVWrfFmm7qVSO
         5kSq2Y7cDWkZc8/iav97QIHI/sAaZt8GKF3YSB1rZi88Sc/5j5lqF//k+Qhab65mE8yp
         cBnGVn8IWBkGg33CfbVb10ZtYUN1v2NMpClmizzMH94/dKMf16acpSbzNGakfMlgWaVU
         l08RGReq/rA/b8+M9MOUJCJwGZy/eg7Hc1rF4XIEByK4nAbbMq+R88WTCzq2iqzj8yvg
         2TeQ==
X-Gm-Message-State: ANhLgQ1Pc+MrkJs3SS09o+7ZK3l7NTv7rn5/6xwxLaQoQhsGy+GW7B4K
        rENic2WRKyzGyzCbAtFnoQZmsCJU
X-Google-Smtp-Source: ADFU+vvBvSsw+grH09drAKkAsqMI2RyWtkWYoGftLUpOYmEd3fzMzeIjfNxKWlIxUhVItQb3hNwH5A==
X-Received: by 2002:a19:230d:: with SMTP id j13mr111585lfj.189.1583170539899;
        Mon, 02 Mar 2020 09:35:39 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id u6sm1534403lff.35.2020.03.02.09.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 09:35:39 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: tegra: Make timeout error more informative
Date:   Mon,  2 Mar 2020 20:35:12 +0300
Message-Id: <20200302173512.2743-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C timeout error message doesn't tell us what exactly failed and some
I2C client drivers do not clarify the error either. Adding WARN_ON_ONCE()
results in a stacktrace being dumped into KMSG, which is very useful for
debugging purposes.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cbc2ad49043e..b2bb19e05248 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1245,7 +1245,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
-	if (time_left == 0) {
+	if (WARN_ON_ONCE(time_left == 0)) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 		tegra_i2c_init(i2c_dev, true);
 		return -ETIMEDOUT;
-- 
2.25.1

