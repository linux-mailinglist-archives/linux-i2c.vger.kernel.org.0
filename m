Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650433F52F6
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbhHWVnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:03 -0400
Received: from phobos.denx.de ([85.214.62.61]:40870 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232975AbhHWVnC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 17:43:02 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D427182D50;
        Mon, 23 Aug 2021 23:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754938;
        bh=4TlT1H5rGAosO+tcBf6tvfXYm8Lg6jHQaz5+n8pTPBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v3M4c09y6fecvTjQoKyFS1iL5Qa2uLJl+hUnQh5uOcTTMtBsRrS9RQW5l6TdQgBhC
         dB39ppbKTqaoNJ2Mr99lTSY2FDh/fBue/ubliGwyZCwcf6/9bE09jT285/uRJb/Dfs
         GiaaxJxbgjaZgGWZqlQCQkjSsX65AWrbC89ZkcgoJ0Qf2Ts/NDKUk/6IX8zLkgkxpN
         9K8Xy0uGLdC57ZKLKKfM2OvXr6mVPuHv82Gtgz5kQnjvkEj8ASuvON1yyv7o26WNcv
         JWI8llItTOCOoBVn5vYSgXt5mXdcc3By906DwBDuseZZlsWWCBY5xleT0lAw7fZ9VS
         KbLghp+87KvDA==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 6/6] i2c: xiic: Fix RX IRQ busy check
Date:   Mon, 23 Aug 2021 23:41:45 +0200
Message-Id: <20210823214145.295104-7-marex@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
References: <20210823214145.295104-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case the XIIC does TX/RX transfer, make sure no other kernel thread
can start another TX transfer at the same time. This could happen since
the driver only checks tx_msg for being non-NULL and returns -EBUSY in
that case, however it is necessary to check also rx_msg for the same.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
V2: New patch
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 6cd7830fe4898..eb789cfb99739 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -543,7 +543,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
 	int tries = 3;
 	int err;
 
-	if (i2c->tx_msg)
+	if (i2c->tx_msg || i2c->rx_msg)
 		return -EBUSY;
 
 	/* In single master mode bus can only be busy, when in use by this
-- 
2.32.0

