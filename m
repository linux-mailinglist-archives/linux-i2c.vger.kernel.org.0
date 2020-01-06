Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6294130B2B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgAFBE7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:04:59 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36427 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgAFBEq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so49270642ljg.3;
        Sun, 05 Jan 2020 17:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQFgmvNzzMNkQGJ6E3WQRfYtR4IleSz/24HtNaKqzaA=;
        b=qaVEUiIi+bUfSZo5f5O17+9PBG1k9KPpT3pyWQPJ+uVPGornWnWDU+jhE6QRisZZZ8
         Tj10Ajeo5Ja0branooSpUBnwYO7eusz0C+JLvkeMUgYbs2hj3Kpu5BLDpAJ9YFcfWTw7
         zSsO7oLRDy5gy8BYhWg1I1Ur883iOWYh4EfA3UTPQUxn2LW0/tWyb8yWOVEgFfFgeMga
         cHx+Na4OQV0afyxvVp8fxTcmHgdMMMsDRCSqAOjmVxwjVFv86q3ybnPOvdbznbxHvKjX
         ginCjPZ6R8aMpkb78P7OLKhJZa10aSsoWttTcq7iGss/dSzZt4WzH9h29C/BXzRdg5yr
         DD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQFgmvNzzMNkQGJ6E3WQRfYtR4IleSz/24HtNaKqzaA=;
        b=gcVb45yyFd3DCDQB1YFyyQe+81H39D9xiH+IuatSt8FEQzeDGLxgHDAeGUjvm0K1mE
         K5BpL5av6JG7KjewC8zo3h8uHUcbtW2EHs/aCM2jizNQNnf+UNDXEg0NChXBldfPyLbc
         MaMSU5r0+eQVdMOvlgVByfOQK0uI/sDeJKRTXrGAV9E15ksDhijUo2GnZVzicsZxQ0qw
         MfYcdoCQOX5hOhvHnlZW8suhTJdx/Jk/WziPT4x+BIjr2ak26wS/lj3y/mDkp2Etdrif
         J7a/nPJ8k741o63hf9phrhaIqoZuXGaJIvp4amh95Axo24FsysWz3+Kr1lkBswFR9lJD
         a+JQ==
X-Gm-Message-State: APjAAAVoWhzR9t62TFK/iq9t5Nfw0WuKtc+3DFb8dCZw11sHiYN6I/Qf
        q80QtSz4vVRxTzzxD5hrkrg=
X-Google-Smtp-Source: APXvYqyp3TAJLD/r+ZHYJre/8ERqD2FFylo4FcuxqdjDyBwU/wM4mR9zjzbovdLTpi/seEyO+/+VwQ==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr54620658ljm.202.1578272683782;
        Sun, 05 Jan 2020 17:04:43 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] i2c: tegra: Check DMA completion status in addition to left time
Date:   Mon,  6 Jan 2020 04:04:23 +0300
Message-Id: <20200106010423.5890-10-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is more robust to check completion status in addition to the left time
in a case of DMA transfer because transfer's completion happens in two
phases [one is ISR, other is tasklet] and thus it is possible that DMA is
completed while I2C completion awaiting times out because of the deferred
notification done by the DMA driver. The DMA completion status becomes
100% actual after DMA synchronization. This fixes spurious DMA timeouts
when system is under load.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3c7c86d4b0e4..cbc2ad49043e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1224,7 +1224,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					 i2c_dev->rx_dma_chan :
 					 i2c_dev->tx_dma_chan);
 
-		if (time_left == 0) {
+		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
-- 
2.24.0

