Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B60A26082C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgIHCMF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgIHCLl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:41 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ECBC061573;
        Mon,  7 Sep 2020 19:11:40 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c2so17973045ljj.12;
        Mon, 07 Sep 2020 19:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j3XbNtVZD6rVkiU+YdggTYpRd5hx/FUuMpH7Z/8WhF0=;
        b=bfACNC4mgijqjZUM0XhCOrQ1IF9F6EHmKtbubf/SDt+AQSXgsA3SJ6fkGubv7LUxQb
         X3A3AAoeTyVWVqDeek9DQl0LrCIuBIVr28UPKqa7u2ouRTDNMcDVcHAMKARMyJLQZRiE
         plq4Scz4VisdUOrhEpjauonuuwrl2k2x/tOP/dmg+9Hp/8QIfuCo+iV6itR7gLzygZgf
         05dG78W0tVYW3Vm1Wy+XEShv+8ekrZ2BAFX3XZoVVIZOvNpbMsH3b7P7pjH+f8zSN874
         u13o5ziUz/NfXNqAAjD/+EyASi5Umm4Kx4arIiiLL/x6aGdxWccL+Ejd5Tbyfn8klz3c
         0vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3XbNtVZD6rVkiU+YdggTYpRd5hx/FUuMpH7Z/8WhF0=;
        b=gP3e1tFQNWS7z/7BPw0Go/lLl1vcMFdOzP/XYeZ98UkpBWx6iWYlWPLNtU7CFuX3Ke
         pP/B9+K4fED4R6rpmyEl7kE/BEvx9QP1Bh6qpSfcA3WHE0pa9Bt3O74Amxax/VokJjjS
         ZpcNCqguGtu/glPina6G0+OUTohAzmuDpC/VwfYOzOa6sjEOyB+Ra3e8dXT68oN3iTjG
         b6xqGZkW536AA3cQcLn3/ctVwSwersKsAvM7kqdH5gaPGYKZWY4BrDzsD4aljMfgmIcD
         KO+GhPnwvauJ6WLaStQ2ByAmUvG8uo2i8xayMNbP+VWw5ZblomTepJ6XYRJquyXLVHIa
         25ug==
X-Gm-Message-State: AOAM531G7UcGd2ZjdLaa3Skt8L0yTwuvJJUBZeuIIOP1sx5GR4XW2Vxw
        MldJsyv8NXkkfIpkUcC1qH8=
X-Google-Smtp-Source: ABdhPJwnXyhIPrOlQ+HMfbgSOwjbhn8/IKD62gk8XYrkiImPXVDd+tsTBBNLHafEMTJVjJWxR/RGiA==
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr12103956ljn.316.1599531099258;
        Mon, 07 Sep 2020 19:11:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/35] i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
Date:   Tue,  8 Sep 2020 05:09:50 +0300
Message-Id: <20200908021021.9123-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_issue_bus_clear() may fail and in this case BUS_CLR_DONE
stays unmasked. Hence let's mask it for consistency. This patch doesn't
fix any known problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 88d6e7bb14a2..1d1ce266255a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1149,6 +1149,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	time_left = tegra_i2c_wait_completion_timeout(
 			i2c_dev, &i2c_dev->msg_complete, 50);
+	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
+
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
-- 
2.27.0

