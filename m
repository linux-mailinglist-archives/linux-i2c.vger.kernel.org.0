Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BC6132D6B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgAGRsS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:48:18 -0500
Received: from sauhun.de ([88.99.104.3]:53318 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgAGRsR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:17 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id DB5982C05BA;
        Tue,  7 Jan 2020 18:48:15 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] i2c: cht-wc: convert to use i2c_new_client_device()
Date:   Tue,  7 Jan 2020 18:47:35 +0100
Message-Id: <20200107174748.9616-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only.

 drivers/i2c/busses/i2c-cht-wc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index b8fde61bb5d8..35e55feda763 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -388,9 +388,9 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	 */
 	if (acpi_dev_present("INT33FE", NULL, -1)) {
 		board_info.irq = adap->client_irq;
-		adap->client = i2c_new_device(&adap->adapter, &board_info);
-		if (!adap->client) {
-			ret = -ENOMEM;
+		adap->client = i2c_new_client_device(&adap->adapter, &board_info);
+		if (IS_ERR(adap->client)) {
+			ret = PTR_ERR(adap->client);
 			goto del_adapter;
 		}
 	}
-- 
2.20.1

