Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5469525A0B1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgIAVN3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgIAVL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A52FC061247;
        Tue,  1 Sep 2020 14:11:29 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so3301470ljc.3;
        Tue, 01 Sep 2020 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBP4sN9HKmwSlR7KiVXj6bhhwLMA1Oz7lpKmbb1yCMk=;
        b=Gz9DrNWUYSnn1smrUSkcoI6oUlZ8+zXQ8kd2hNBoKHf7N15ZJLqk5pGSKkSK7eqEey
         XAUcRnYe9ijuIVJLlgjsVM/cokzVRzb4JNL4MkdICHTsZtsUlYLRlinEKgiu+6DWfzNA
         kbToctAXceEx0yswV+hCyLvDwfD5GRxMPkiUGyvzGkhdyd70CiQcdPjzM6I1x5HywA6q
         olWFdSyAh21jXPd/dwwXuEGg2a5HBBSlj33+27bhuf4mQgB41Gv9XAfWLF3ju2leOaXB
         UhRppzYBVtiBb2lTE1aKp3QZcTkayHyaujryEaaq/747JQWr8+c+kBrKINHLbodJGGr2
         k6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBP4sN9HKmwSlR7KiVXj6bhhwLMA1Oz7lpKmbb1yCMk=;
        b=FlpRZ2eGxd/OIFnpNGWHhkqoALmZdWO+GxkMJcow20AxmImtSgJ93owmvZ77h6us6z
         gzRrfmLE5tCMouNyMmKNU1LpSyD3f98IxvNAb7xOz/4AH1OOeU5zVWa6mz+OiGvmSozu
         E0tGcQX+vj/odnadiQesBwIKNspqPOMWyTt/Vjo0kuzbzFhjcGhdSzWS6Z1TjNwoyaGg
         yzqrZFtB80Wjibx+bRzL9msr0GHgg6NuSKeWXixtVDrmDx7YXsNqLiZFf3N4pu4tS2iV
         nBP8Oke0Fjl8s4pDtm8ZdDmECQ6Gml5EFLwoX79Yy3TxelspHUGQWFAy3HuY5kuaIzGb
         pyew==
X-Gm-Message-State: AOAM5313ceQ0G/3/uOs1XDx111n2a3C97Mj2pGZoPuyFY3iOuhU/mORW
        BrubFD2ViHg3aPmkyJbl0m4=
X-Google-Smtp-Source: ABdhPJzND/nTU7CATHNAZEFzs3Axo0s+UjGcgs1ZEizboMhvWloaGbjni6hxydQiBgxZNdrMhyJx6w==
X-Received: by 2002:a2e:9b59:: with SMTP id o25mr1672157ljj.264.1598994687560;
        Tue, 01 Sep 2020 14:11:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/17] i2c: tegra: Don't ignore tegra_i2c_flush_fifos() error
Date:   Wed,  2 Sep 2020 00:10:49 +0300
Message-Id: <20200901211102.11072-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() may fail and transfer should be aborted in
this case.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0d358bc12973..2da45ff32621 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1179,7 +1179,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

