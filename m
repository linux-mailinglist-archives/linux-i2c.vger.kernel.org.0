Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A110B1497BE
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2020 21:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAYUUY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jan 2020 15:20:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:43472 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgAYUUY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Jan 2020 15:20:24 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1ivRun-0001hK-Ro; Sat, 25 Jan 2020 20:20:21 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: parport: fix spelling mistake: "Atmost" -> "At most"
Date:   Sat, 25 Jan 2020 20:20:20 +0000
Message-Id: <20200125202020.12861-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a module parameter description.
Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-parport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
index f8f94a25af26..81eb441b2387 100644
--- a/drivers/i2c/busses/i2c-parport.c
+++ b/drivers/i2c/busses/i2c-parport.c
@@ -129,7 +129,7 @@ static int parport[MAX_DEVICE] = {0, -1, -1, -1};
 module_param_array(parport, int, NULL, 0);
 MODULE_PARM_DESC(parport,
 		 "List of parallel ports to bind to, by index.\n"
-		 " Atmost " __stringify(MAX_DEVICE) " devices are supported.\n"
+		 " At most " __stringify(MAX_DEVICE) " devices are supported.\n"
 		 " Default is one device connected to parport0.\n"
 );
 
-- 
2.24.0

