Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB61186FA6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 17:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbgCPQH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 12:07:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:23813 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731687AbgCPQH2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 12:07:28 -0400
IronPort-SDR: gVG7xQZQ7Ajory0O3/wwvXkEMYqnJ6xeF3arq93BiV00ACwNpVaUGezPnU3NjOkx3fc6DcL172
 7Bl/9nxXuX0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:07:27 -0700
IronPort-SDR: 6sdz053FgWr7NvxsHqWjD3p7W9wZ1BgLvsp9cfPck9iEiKUf4mLRpwIzTdJ+htC4taWdYr1J0g
 kSyzLb2lGC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="417188767"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2020 09:07:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 457F0109; Mon, 16 Mar 2020 18:07:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/4] i2c: mux: pca954x: Move device_remove_file() out of pca954x_cleanup()
Date:   Mon, 16 Mar 2020 18:07:23 +0200
Message-Id: <20200316160724.37596-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
References: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
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
v2: no change
 drivers/i2c/muxes/i2c-mux-pca954x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 928c6f5ceac7..0908a0655cb7 100644
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
2.25.1

