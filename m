Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A482625A07A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgIAVLb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgIAVL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:27 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEA0C061246;
        Tue,  1 Sep 2020 14:11:27 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a15so3304200ljk.2;
        Tue, 01 Sep 2020 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRnx45u7/i2kry58qh4geYUb8/TK/AjF/UDJOIFPEeg=;
        b=lFlkmSD7LTWLNj4Vxpv/0mu+bucA/Wpf/Sxdf7+dq4J3C9Z1iQ8x7q3Ee8VAb86NhE
         WwaqLOmjhrlAyzA+sXlFAfFQkMDIStd0oPaVCJeWajz8qF4VB3SKB8zsSqEV+QMDPvGQ
         lFYlgOR+R7LPBpeNTGvm3zyCajLD+R2Ycy2YUjtfdEQAeBOGzSvCeUcf5WfBdXYNf9Tv
         nYUAl6geeD6ITidW+p2w0txKwuLzHnuQqaUhgx1C70jqyCZxdA3DYHTFIwIggsSXYq+V
         MJ3lkhySKySIgC3CEgMyUBoDX0N3UIUgG1y/11ENmOgHck9vf943y7YEjR3xnTcj3bD4
         9mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRnx45u7/i2kry58qh4geYUb8/TK/AjF/UDJOIFPEeg=;
        b=Gvne01KUofItxe8J3KPZNQjz3h3bfwZtHVG/oehN3KjcKbKVdNYq3AlWR0dybpCUX+
         /J31+tAr0jE0v4xOrdGOjq5HZgoRoCu8IJYmN0ntwD42aHxV1CZpwG5LycN2kZVuFrB3
         GO++GNag/MhCCSpOwlMnxZU8LKjnAYkVGIORO4tudlQ/gEvmlCMGHqWkOuKQEsoWoKs2
         oMKO3gx3JhUq5j7JVAdduq8upBO1JgOXhniljISn5oWjiofoLK+dX0sIuLIyDkReBprT
         SGC/wMxLgdIo5Gsxm6S1vvxq+w+COJDPKj1ep+sSuQy39I5Bg7wW7H/bSy8eWRfzcPhQ
         6S3w==
X-Gm-Message-State: AOAM531SbVj0oP0T7C5N/IzsGfMLrbPhTq6iggVQK2UFlqdj4M5/Ugxj
        RcsOgRize6BIvJ/JAXCBceUqXg2K/HI=
X-Google-Smtp-Source: ABdhPJzgYQjh3/CTH++mR3nRXrWPPnTN6ZqbGJwDiU5Eo68NSJJTL5VwrNGf8EbP5zco4wJpLplhTg==
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1555675lji.41.1598994685513;
        Tue, 01 Sep 2020 14:11:25 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/17] i2c: tegra: Add missing newline before returns
Date:   Wed,  2 Sep 2020 00:10:47 +0300
Message-Id: <20200901211102.11072-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the code are missing a newline before return, making
code more difficult to read and creating inconsistency of the code.
This patch adds the missing newlines.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index aab58395fb71..9bd91b6f32f4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -317,6 +317,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -392,6 +393,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -500,6 +502,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 		ktime = ktime_get();
 	}
+
 	return 0;
 
 err_timeout:
@@ -707,6 +710,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	clk_disable(i2c_dev->slow_clk);
 disable_fast_clk:
 	clk_disable(i2c_dev->fast_clk);
+
 	return ret;
 }
 
@@ -1421,6 +1425,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1888,6 +1893,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	clk_unprepare(i2c_dev->fast_clk);
 
 	tegra_i2c_release_dma(i2c_dev);
+
 	return 0;
 }
 
-- 
2.27.0

