Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F493139F10
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbgANBhN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:37:13 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44715 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729102AbgANBhC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:37:02 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so8430593lfa.11;
        Mon, 13 Jan 2020 17:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tl7vtSi+PnhU8zv8cy8MKZTZZyU72nU5B2eEjZlckoM=;
        b=UeKvUXKumE2bgthaRKD+h9XeZI2IVPFxvsubyfOZvKMOyrvGIQ3LpC778yrECkYGV3
         LW8YERSx6NJsN0mx1YmM6QJhqOblsAgtopOjCwAHWK2q3ztwj1JyfcMbS/H3VA60ZRCC
         WzmPSVC8iChut6dBjL9SfGaeqOp6cJNNx4tWaisd4LiOPZNKYd7GSJ/BGHKEfIrhaGOE
         k+MFYe7By6718WSX5YloIwneCPBl4iD0IcJ8chPUCHz1NEgT0pswlBlVhOrDExEVL9cq
         oJu/kbtyPFAvKeU8A+DDCEqGMPV/Bp0PXJSPHTw/hSmj3zcrhATKY0/3iayjAPewQOaX
         c0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tl7vtSi+PnhU8zv8cy8MKZTZZyU72nU5B2eEjZlckoM=;
        b=tZ0R1SfQ4EDRFyL6VMWuKyBkzYww09W9K0A+3VLmpU78FGZqi1ILqaAjFdVErfBfwz
         uHlA47FsXFPtaaBVZ7FJljNPGvTddTHQRJM9X8zCToz71q5tbtkbn3627zdEjGzD0Q19
         dQ3h39wp3muXdEh4hMhcQy6DxC3k2syEkQ9l6nJ8YhujfJLqu6PlvzYZUQ2AAgn9rwAg
         EYxuV/S8ZCHQFh20DgKk9hsgw3zNYBG+gJoEXUELHnujbCw/miJzedBPOYpVsfIn0Yd3
         7kgdzWZhWFAEWbCUn1iS8d/qu3ZfvEHlhwm6NxCMWSmGhr3feXfKijr+73rVy4xau6Wz
         El8A==
X-Gm-Message-State: APjAAAVYwwt52UoqNZUXUuErarJz/U8uLA7LoYm6dzaOTqPxddYfHiCM
        7HXqjHoXPNPR2AgfZ44fWGp7klOj
X-Google-Smtp-Source: APXvYqxTzRO9jU6rYH9ZP5ltqn+SQQzNSyhPcGS0K3yOpg3rowGnBtNoeWSJ+y5qyCxFBALnNZsj2w==
X-Received: by 2002:a19:f811:: with SMTP id a17mr188803lff.182.1578965820028;
        Mon, 13 Jan 2020 17:37:00 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:59 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/8] i2c: tegra: Always terminate DMA transfer
Date:   Tue, 14 Jan 2020 04:34:41 +0300
Message-Id: <20200114013442.28448-8-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is possible that I2C could error out in the middle of DMA transfer and
in this case DMA channel needs to be reset, otherwise a follow up transfer
will fail because DMA channel stays blocked.

Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1a390e1bff72..3c7c86d4b0e4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1220,11 +1220,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
+		dmaengine_terminate_sync(i2c_dev->msg_read ?
+					 i2c_dev->rx_dma_chan :
+					 i2c_dev->tx_dma_chan);
+
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			dmaengine_terminate_sync(i2c_dev->msg_read ?
-						 i2c_dev->rx_dma_chan :
-						 i2c_dev->tx_dma_chan);
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1237,11 +1238,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
 			       msg->len);
 		}
-
-		if (i2c_dev->msg_err != I2C_ERR_NONE)
-			dmaengine_synchronize(i2c_dev->msg_read ?
-					      i2c_dev->rx_dma_chan :
-					      i2c_dev->tx_dma_chan);
 	}
 
 	time_left = tegra_i2c_wait_completion_timeout(
-- 
2.24.0

