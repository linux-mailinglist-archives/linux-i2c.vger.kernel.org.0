Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8507138737
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 18:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733129AbgALRRn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jan 2020 12:17:43 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42022 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732762AbgALRRm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jan 2020 12:17:42 -0500
Received: by mail-lj1-f195.google.com with SMTP id y4so7417629ljj.9;
        Sun, 12 Jan 2020 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tlNU9EUj3qjMJkvdyrf3SyjicgidrNBQwoqOOwsuvfM=;
        b=boWiFTwbY2L7ablBt/qB3/1LiL/NpNhY61QyTTEn61/81dtiAIv3J33m5wTG1lEs4t
         0lT/Jp5uaPecEYzrhvT2ZyL+xBbpL4SQDkU5vTaIJYe8CMATi6YKnhhW3qg/N3XEeNG8
         Ygy5NQyvvt005EndxvIJYDHGTlO7vIHy2q00Fuha5hLzMqkXk/1qdawN1BzAtSGCKisX
         cNd/BRd0BzsN8XJ406Sp7yiHXhjzWfCaA7cZnugTuOjXblfLFTaVPDb84gTDmkClLE/s
         l9rpiPivAQTUtCdhfY3tRmGOJXT3sc/B1mG2N7MTPpsz5INdlQlEFAH5WPe0MDmPvGOq
         7Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlNU9EUj3qjMJkvdyrf3SyjicgidrNBQwoqOOwsuvfM=;
        b=rpzhSF+hCUW4jEEmJJzFl5o0sRuzaJj7B3JEHJtF6ozDSspgZixYFFh9bwIlSYckW3
         +COMiw/cbdxo2anX85wk7Kjvf7B4d32SZdbz2PlfwnRP2LX037XjSH9y797hxTOWeLbC
         SEB/vEgo8btUkLtTWZSEIIPtZT+bZfXs2xFNtVomvrvczyQ8+s4lzvJrlTrgYkJ3Ex4/
         9S2C5Sn7Rk4+g3hgJ+kEBJ7cxBp13qx3sTdDXlgiriJTYqYZEmTbdbQB3cWZcMThj+Tf
         ZVYJgR1ahNAMn7aGfRLK0PjayqS7iLZcvAdEMvEIJ+nYo6wcRUmaoGDshWweFRBFcC7F
         GwmA==
X-Gm-Message-State: APjAAAULa2iUqUei1e/k4suUUUmNoKT+0RRkroqH6r1wIfnr3O25IZ+T
        xF3OmgLx5bvzcSWJPvt+so0=
X-Google-Smtp-Source: APXvYqwLXR3FL2dRnCmfY1hPgK+AaHxdxc//QILhGhZzYiUxEzO0RrHVFKDfkcXv6+lMgBeu6iAqQw==
X-Received: by 2002:a2e:858f:: with SMTP id b15mr6358563lji.275.1578849460326;
        Sun, 12 Jan 2020 09:17:40 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id i13sm4506628ljg.89.2020.01.12.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 09:17:39 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/8] i2c: tegra: Fix suspending in active runtime PM state
Date:   Sun, 12 Jan 2020 20:14:23 +0300
Message-Id: <20200112171430.27219-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200112171430.27219-1-digetx@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I noticed that sometime I2C clock is kept enabled during suspend-resume.
This happens because runtime PM defers dynamic suspension and thus it may
happen that runtime PM is in active state when system enters into suspend.
In particular I2C controller that is used for CPU's DVFS is often kept ON
during suspend because CPU's voltage scaling happens quite often.

Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a98bf31d0e5c..79d19f6ce94e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1710,9 +1710,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int err;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
@@ -1733,6 +1738,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
+	err = pm_runtime_force_resume(dev);
+	if (err < 0)
+		return err;
+
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
-- 
2.24.0

