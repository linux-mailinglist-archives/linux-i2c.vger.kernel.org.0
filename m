Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 745D8158069
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgBJREI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:04:08 -0500
Received: from sauhun.de ([88.99.104.3]:43684 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJREI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 12:04:08 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id A8C212C07F3;
        Mon, 10 Feb 2020 18:04:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND] macintosh: convert to i2c_new_scanned_device
Date:   Mon, 10 Feb 2020 18:04:01 +0100
Message-Id: <20200210170401.5357-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from the deprecated i2c_new_probed_device() to the new
i2c_new_scanned_device(). No functional change for this driver because
it doesn't check the return code anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I can take this via I2C tree if this makes things easier...

 drivers/macintosh/therm_windtunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 8c744578122a..f15fec5e1cb6 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -321,10 +321,10 @@ do_attach( struct i2c_adapter *adapter )
 
 		memset(&info, 0, sizeof(struct i2c_board_info));
 		strlcpy(info.type, "therm_ds1775", I2C_NAME_SIZE);
-		i2c_new_probed_device(adapter, &info, scan_ds1775, NULL);
+		i2c_new_scanned_device(adapter, &info, scan_ds1775, NULL);
 
 		strlcpy(info.type, "therm_adm1030", I2C_NAME_SIZE);
-		i2c_new_probed_device(adapter, &info, scan_adm1030, NULL);
+		i2c_new_scanned_device(adapter, &info, scan_adm1030, NULL);
 
 		if( x.thermostat && x.fan ) {
 			x.running = 1;
-- 
2.20.1

