Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3D424C228
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 17:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgHTP1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 11:27:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:14749 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726852AbgHTP1d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 11:27:33 -0400
IronPort-SDR: W9vf8HeFuoAkJ86gsYOIlTA+xkOAhxz3kTiiQK73R5QZhYNuePeb2GBC9N24VKVgghtSVSl9NE
 nPlG4jbAhOmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="240147260"
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; 
   d="scan'208";a="240147260"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 08:27:32 -0700
IronPort-SDR: kzNb9oqFp9ptB5EMvoQ3IthmhJtmUevoicZl1YzzZjbFrj5ojtWtP/pAK5AMK3hGUSwj59cojz
 iLPlqiKy1eWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; 
   d="scan'208";a="442022297"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 20 Aug 2020 08:27:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AF5421FD; Thu, 20 Aug 2020 18:27:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>, Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: mux: pca954x: Fix trivia typo: busses -> buses
Date:   Thu, 20 Aug 2020 18:27:29 +0300
Message-Id: <20200820152729.74944-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix trivia typo: busses -> buses. While at it, rearrange LOCs
for better readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 4ad665757dd8..dbf98d0aa656 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -510,9 +510,9 @@ static int pca954x_probe(struct i2c_client *client,
 	 */
 	device_create_file(dev, &dev_attr_idle_state);
 
-	dev_info(dev, "registered %d multiplexed busses for I2C %s %s\n",
-		 num, data->chip->muxtype == pca954x_ismux
-				? "mux" : "switch", client->name);
+	dev_info(dev, "registered %d multiplexed buses for I2C %s %s\n",
+		 num, data->chip->muxtype == pca954x_ismux ? "mux" : "switch",
+		 client->name);
 
 	return 0;
 
-- 
2.28.0

