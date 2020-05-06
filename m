Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1024F1C7A55
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgEFTeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgEFTeI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:34:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D46C061A0F;
        Wed,  6 May 2020 12:34:07 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 188so3813950wmc.2;
        Wed, 06 May 2020 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6gfIA98m6Kq83YFHVv1ty1+xaTzgsdXty3MlRCydSZ8=;
        b=ToxBsfECyvCZWmwMSi3VsVpNVYWtvuz30H9NVhCtb+Hyc6Qsl2RAnr7jkaz6TJBf4/
         KclGRuBTSuUl4sW4sYy1hgeybys5PvDJjgm3PSrtZ+eC58PqNyFOPOfH2BYcT6nXo19K
         EE6r33yVV5WE410RRw1ZNo2ezfHGOqTAlbUxpYNLLr9gYXJ3PoJ9ZWyfUYHOKd/SQ27A
         CKPbs1LVu5WAfn/v+TdbubBlXykRjMpEXXj/7c42HgNXH7ckMFpu/3+oD45bTeYwK8bS
         24q2HYWSiNCGVepAevmKnJM+U2Y9stHeIVvBHNB/O/kFhmT6yXtTXbUhVL9mr6+E1ccm
         HQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6gfIA98m6Kq83YFHVv1ty1+xaTzgsdXty3MlRCydSZ8=;
        b=qEi1ZfrxB0CPqP4YRljfUJa4TczySi7WIPMSX/Cl3C9CkpfIlNj/J+53XkarxFX5rn
         1R/URq1mLZEyX/b6WxIl3Agcq5zV8d905fGjT/MooEkzRcwGFSO+lL902z864p/lx7mo
         IKG0NU6RuLLGv3sAl+zyiWX8X5t15TGTDEFYyORbBoAIN1tk06N6ZDRU/WuYMZrTKG5O
         rH6j3VMiJKn2ouD+8ZDLosQ9/G9EQol7S90gA/D2ycxmr1eTCbLo8M7mAvBAfm/6+l15
         tMYqtw7xsaK7q/qFhPLztPKjIm6+GWkrrvEMs0XPz9fflGXUSQLvtDgzOTHd6u/WXDb+
         RZ9A==
X-Gm-Message-State: AGi0PuZ8O1nlaE6sZrFTy9u7K/3wSn7KgrXC3xJm5lerSOhtj5hhQ+Yi
        JFM2Q+qs/ckA6UVtPz4MBQUeFwvtMkA=
X-Google-Smtp-Source: APiQypIo1QCiRAdc0oRFYY6QCpNn1HU3arTrP53Uedh9w++MD2krClXm+3bmRckYmxUSRixniEMZkg==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr5880968wmj.169.1588793645895;
        Wed, 06 May 2020 12:34:05 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id 88sm4395767wrq.77.2020.05.06.12.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:34:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/5] Revert "i2c: tegra: Fix suspending in active runtime PM state"
Date:   Wed,  6 May 2020 21:33:54 +0200
Message-Id: <20200506193358.2807244-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506193358.2807244-1-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This reverts commit 9f42de8d4ec2304f10bbc51dc0484f3503d61196.

It's not safe to use pm_runtime_force_{suspend,resume}(), especially
during the noirq phase of suspend. See also the guidance provided in
commit 1e2ef05bb8cf ("PM: Limit race conditions between runtime PM
and system sleep (v2)").

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4c4d17ddc96b..7c88611c732c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1769,14 +1769,9 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int err;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
-	err = pm_runtime_force_suspend(dev);
-	if (err < 0)
-		return err;
-
 	return 0;
 }
 
@@ -1797,10 +1792,6 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	err = pm_runtime_force_resume(dev);
-	if (err < 0)
-		return err;
-
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
-- 
2.24.1

