Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB0D100149
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 10:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRJ2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 04:28:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:58206 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726460AbfKRJ2u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Nov 2019 04:28:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4D421AD55;
        Mon, 18 Nov 2019 09:28:49 +0000 (UTC)
Date:   Mon, 18 Nov 2019 10:28:48 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 4/4 v2] i2c: i801: Instantiate SPD EEPROMs automatically
Message-ID: <20191118102848.4fdadeb7@endymion>
In-Reply-To: <20191118102410.78cd8e6e@endymion>
References: <20191118102410.78cd8e6e@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Call the function to instantiate SPD EEPROMs automatically on the
main SMBus controller.

Multiplexed SMBus systems are excluded for now as they are more
complex to handle.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v1:
 * Fixed build error reported by kbuild test robot

 drivers/i2c/busses/i2c-i801.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-5.4-rc7.orig/drivers/i2c/busses/i2c-i801.c	2019-11-18 10:21:39.688372006 +0100
+++ linux-5.4-rc7/drivers/i2c/busses/i2c-i801.c	2019-11-18 10:21:41.928402933 +0100
@@ -1320,6 +1320,12 @@ static void i801_probe_optional_slaves(s
 
 	if (is_dell_system_with_lis3lv02d())
 		register_dell_lis3lv02d_i2c_device(priv);
+
+	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
+#if IS_ENABLED(CONFIG_I2C_MUX_GPIO)
+	if (!priv->mux_drvdata)
+#endif
+		i2c_register_spd(&priv->adapter);
 }
 #else
 static void __init input_apanel_init(void) {}

-- 
Jean Delvare
SUSE L3 Support
