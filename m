Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EBD28E43D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 18:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388213AbgJNQSB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 12:18:01 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50478 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731843AbgJNQR6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 12:17:58 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 14 Oct 2020 19:17:56 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 09EGHnja007559;
        Wed, 14 Oct 2020 19:17:56 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH 6/6] i2c: mux: mlxcpld: Extend supported mux number
Date:   Wed, 14 Oct 2020 19:17:47 +0300
Message-Id: <20201014161747.31926-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201014161747.31926-1-vadimp@nvidia.com>
References: <20201014161747.31926-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allow to extend mux number supported by driver.
Currently it is limited by eight, which is not enough for new coming
Mellanox modular system with line cards, which require up to 64 mux
support.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index c76180919fc3..760636b507fa 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define CPLD_MUX_MAX_NCHANS	8
-
 /* mlxcpld_mux - mux control structure:
  * @last_chan - last register value
  * @client - I2C device client
@@ -24,7 +22,7 @@
  * @sel_buf: I2C message buffer for mux select 16 bits transactions
  */
 struct mlxcpld_mux {
-	u8 last_chan;
+	int last_chan;
 	struct i2c_client *client;
 	struct mlxcpld_mux_plat_data pdata;
 	u8 sel_buf[3];
@@ -94,7 +92,6 @@ static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
 	int err = 0;
 
 	/* Only select the channel if its different from the last channel */
-	chan++;
 	if (mux->last_chan != chan) {
 		err = mlxcpld_mux_reg_write(muxc->parent, mux, chan);
 		mux->last_chan = err < 0 ? 0 : chan;
@@ -143,7 +140,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	if (!i2c_check_functionality(client->adapter, func))
 		return -ENODEV;
 
-	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
+	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, pdata->num_adaps,
 			     sizeof(*data), 0, mlxcpld_mux_select_chan,
 			     mlxcpld_mux_deselect);
 	if (!muxc)
@@ -158,13 +155,9 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data->last_chan = 0; /* force the first selection */
 
 	/* Create an adapter for each channel. */
-	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
-		if (num >= pdata->num_adaps)
-			/* discard unconfigured channels */
-			break;
-
-		force = pdata->adap_ids[num];
-
+	for (num = 0; num < pdata->num_adaps; num++) {
+		force = pdata->base_nr ? (pdata->base_nr +
+			pdata->adap_ids[num]) : pdata->adap_ids[num];
 		err = i2c_mux_add_adapter(muxc, force, num, 0);
 		if (err)
 			goto virt_reg_failed;
-- 
2.11.0

