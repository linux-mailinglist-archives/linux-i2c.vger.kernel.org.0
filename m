Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4A9EC010
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2019 09:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfKAIy0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Nov 2019 04:54:26 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:35745 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfKAIyZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Nov 2019 04:54:25 -0400
Received: by mail-qk1-f193.google.com with SMTP id i19so849793qki.2;
        Fri, 01 Nov 2019 01:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wGP9J7Unwih+h2svnZAKyto9DsfRZgk3cs18H/3/VKI=;
        b=Hhde+YtTRa4P10hNi8eW6fIn9ZPCI7zdbRMXu/Pv9jiTSPmYPwH0CMpmEk7mvLanwU
         zVKInR8T/tKQxa3LUVMcekQNkQCDs//bhgcVRopYT38uUp4uTx7c31vWXoE1c5XqNVXD
         ddlLpKNDk3l9HiALPbPp2S7dnAUUp2p2t3HxQwCUOwcpPN1JWJUCequg0cbE27jh/ife
         Th0xXeRjvLMSM5RyY0c8iB59m5HGzNoPmpXzEyehsL47JGD7KyW1A6eCamh9ZjqwijYZ
         jlTegt5KXzXbb+HmNFGKFntumtnzDVsN/w9QxdP54UYNFHfyVC19jwQATPBbKhdFA+Cw
         ipeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wGP9J7Unwih+h2svnZAKyto9DsfRZgk3cs18H/3/VKI=;
        b=NnGb0VqbZVYSYjkZkiQTW8W+GuscZK6aGCtx8031S2cC5fkB0e/eD7hicVePEL96zc
         71orKyUkRYbZvIWaqiaIZNx8BXRBbhB3FqdW9MQxaiByDVdBHNqF5fr3tvVIZFMn5MtI
         vxH/ytjq/7tikysxDUxvgv+Z5nYFdXBYWDKbeerusm60nHGYnvFbo301mw3++7hmzvOT
         2oQCytg4HEpOAQ5eUqJY+SULbeS03DZQ/vnVAj8fzw1z66MHS19YjsPjCLfCVWzwRpnn
         GAlURqw/d3I9GNuN+fN5upo0Q2lgfBly7yoZDbtMBN6Uezvoe2FMtKTR7pFfeZKYBmcb
         8NIA==
X-Gm-Message-State: APjAAAXrqi0sdnApIyPGKCZ69gl881wLkISmopIvfejRyZ/4h0D/ptdm
        doQo9OwW+KtNyTDDG6De3DM=
X-Google-Smtp-Source: APXvYqyRx02Fmb67ruhdAATYmn3SZi11O9XARzhsfqe9U/x8dRlGlKndbYo0PY2bteYobTzH8UiXVg==
X-Received: by 2002:a37:a50a:: with SMTP id o10mr2150208qke.115.1572598464774;
        Fri, 01 Nov 2019 01:54:24 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id f24sm737571qkh.81.2019.11.01.01.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 01:54:24 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] i2c: imx-lpi2c: add clk_disable_unprepare calls
Date:   Fri,  1 Nov 2019 16:54:04 +0800
Message-Id: <20191101085404.10339-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver forgets to call clk_disable_unprepare when probe fails
and remove.
Add the two calls to fix the problem.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c92b56485fa6..72eba477d04b 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -621,6 +621,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	clk_disable_unprepare(lpi2c_imx->clk);
 
 	return ret;
 }
@@ -630,6 +631,7 @@ static int lpi2c_imx_remove(struct platform_device *pdev)
 	struct lpi2c_imx_struct *lpi2c_imx = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&lpi2c_imx->adapter);
+	clk_disable_unprepare(lpi2c_imx->clk);
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.23.0

