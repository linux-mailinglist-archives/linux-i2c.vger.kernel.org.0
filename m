Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2C226082B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgIHCME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgIHCLl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B53C061756;
        Mon,  7 Sep 2020 19:11:39 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so11625411ljp.13;
        Mon, 07 Sep 2020 19:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8EoeQfm2V7iEFCAPBa5UMm2YWlodiF1UtVHJ3u58T+Y=;
        b=u/kGAeoOT8mhEp6dIdJveTArpuHIhO/yjU8QlPRVm4p9dIBm9+fme2Zd0e7OCAhmaY
         fq1XXPRpIv1Mfi3wo+APVP33i0rg7nDfaqUMqekhGMjrmJLMgPxN5HQbx4HaC3DBlXLG
         oot6Q1FSQDVJ0tTOVp/BZ+VwPOzUvz7ld69fzCxgtnxsTI0Cp4/nzI9Ba82MoweXzVtB
         PF2fCSHQC8C1TfUxOl8OwwkoSvJoN+JrRtb6MttVT18wxArGjqmbVmOS1fGbWW/vQiMo
         MhEzk/ahyFMFqt7hK65UNkF0rstBJPlZgDbRwy8fpl9U8kQ3bNXnWjMdGl4p5g/SXkd9
         fUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8EoeQfm2V7iEFCAPBa5UMm2YWlodiF1UtVHJ3u58T+Y=;
        b=ZlDhf53Py9B2zm6oWHzlcU2DpcYegXQaj5jCDRd7253WEu6ip3BPIWD/04qi3ZXZ8U
         KrWUfAWxEV4DCQNYcCYu1zLZLKvjxAbZysJ3EFtNCKBk2mzdzPK104CMBPmmA/IW4rhM
         tXIUZXnz0vwnrUJNx+WlLMWvGG8T5N77audIFTo8EICIB+ezCkwvDcKwL+JDixPYvkO0
         biVx/Heaz3uF+s9lmXEMb2B7t/VGlhxxj1yRYxyz3ZdwL9vd3h5QVYBfmCN0O+oPxZtW
         0QP2MxvoLuCgnxgQbPIExCszi5lmJUKVPGulWncQ1+z2/Nv7N/hZFgIZCSftOGh7p/BH
         Jb5Q==
X-Gm-Message-State: AOAM533H7Vz4iaTy4wLsoas0RIPd+5s7zFC2LKDB9fOZ/A1QDkv3HqnC
        yjDhIl1IHxbUm97ISrueoMk=
X-Google-Smtp-Source: ABdhPJzFbAeVVVVno6VkUk61rrvmXxH6eJGhPCRlFZ0KCNe6prQAsmvBFYKphwQ/ypmiFzt+PDkHVg==
X-Received: by 2002:a2e:9d83:: with SMTP id c3mr6405416ljj.385.1599531098389;
        Mon, 07 Sep 2020 19:11:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/35] i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
Date:   Tue,  8 Sep 2020 05:09:49 +0300
Message-Id: <20200908021021.9123-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Technically the tegra_i2c_flush_fifos() may fail and transfer should be
aborted in this case, but this shouldn't ever happen in practice unless
there is a bug somewhere in the driver. Let's add the error check just
for completeness.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4e7d0eec0dd3..88d6e7bb14a2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1177,7 +1177,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	bool dma;
 	u16 xfer_time = 100;
 
-	tegra_i2c_flush_fifos(i2c_dev);
+	err = tegra_i2c_flush_fifos(i2c_dev);
+	if (err)
+		return err;
 
 	i2c_dev->msg_buf = msg->buf;
 	i2c_dev->msg_buf_remaining = msg->len;
-- 
2.27.0

