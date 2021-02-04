Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C759230F7BF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Feb 2021 17:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237044AbhBDQ0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Feb 2021 11:26:54 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49687 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S237958AbhBDQZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Feb 2021 11:25:47 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 4 Feb 2021 18:24:58 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 114GOrHG012325;
        Thu, 4 Feb 2021 18:24:58 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v4 5/6] i2c: mux: mlxcpld: Extend supported mux number
Date:   Thu,  4 Feb 2021 18:24:50 +0200
Message-Id: <20210204162451.29518-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210204162451.29518-1-vadimp@nvidia.com>
References: <20210204162451.29518-1-vadimp@nvidia.com>
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
v3->v4:
 Comments pointed out by Peter:
 - Move changes for i2c_mux_add_adapter(): use 'chan_id' instead of
  'force_nr' to patch #4.
v1->v2:
 Comments pointed out by Peter:
 - Remove introducing of 'base_nr' field.
 - Drop chan increment in mlxcpld_mux_select_chan().
 Added by Vadim:
 - Rename 'adaps_ids' array to 'chan_ids' array.
 - Drop forcing of adapter 'nr'.
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index ba307ee6b034..5e0672f9979b 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define CPLD_MUX_MAX_NCHANS	8
-
 /* mlxcpld_mux - mux control structure:
  * @last_val - last selected register value or -1 if mux deselected
  * @client - I2C device client
@@ -142,7 +140,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	if (!i2c_check_functionality(client->adapter, func))
 		return -ENODEV;
 
-	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
+	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, pdata->num_adaps,
 			     sizeof(*data), 0, mlxcpld_mux_select_chan,
 			     mlxcpld_mux_deselect);
 	if (!muxc)
@@ -155,7 +153,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data->last_val = -1; /* force the first selection */
 
 	/* Create an adapter for each channel. */
-	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
+	for (num = 0; num < pdata->num_adaps; num++) {
 		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
 		if (err)
 			goto virt_reg_failed;
-- 
2.11.0

