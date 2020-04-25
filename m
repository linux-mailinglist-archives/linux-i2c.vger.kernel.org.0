Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093C41B8653
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 13:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDYLv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 07:51:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:26250 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgDYLv4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 07:51:56 -0400
IronPort-SDR: Ho3GaYcMIprpzuMsW5VWqSDoF3mAOfnh2vqjTrZssa8+U+3OmVdnaKvYhWon5MjanNWOSeNAZe
 MH2esxEUrP/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 04:51:56 -0700
IronPort-SDR: 5T2ScETdmqAKhD7161DmJ7OzUfqqUwtzT0Ckes6w0cus4qTqOVKxoXtU75b9xiZZJk9h8YNf14
 1Ua5ltMp567w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="246897474"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2020 04:51:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D57F82F4; Sat, 25 Apr 2020 14:51:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/4] i2c: mux: pca954x: Move device_remove_file() out of pca954x_cleanup()
Date:   Sat, 25 Apr 2020 14:51:51 +0300
Message-Id: <20200425115152.29475-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

device_create_file() is called the last in ->probe() but pca954x_cleanup(),
which is called earlier in error path, tries to remove never created file.
Move device_remove_file() call outside of pca954x_cleanup() to make it
slightly closer to what pca954x_init() is doing.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: rebase on top of latest rc

 drivers/i2c/muxes/i2c-mux-pca954x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 928c6f5ceac70..0908a0655cb79 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -383,11 +383,8 @@ static int pca954x_irq_setup(struct i2c_mux_core *muxc)
 static void pca954x_cleanup(struct i2c_mux_core *muxc)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
-	struct i2c_client *client = data->client;
 	int c, irq;
 
-	device_remove_file(&client->dev, &dev_attr_idle_state);
-
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -531,6 +528,8 @@ static int pca954x_remove(struct i2c_client *client)
 {
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
 
+	device_remove_file(&client->dev, &dev_attr_idle_state);
+
 	pca954x_cleanup(muxc);
 	return 0;
 }
-- 
2.26.2

