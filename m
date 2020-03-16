Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA801868E7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 11:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbgCPKYv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 06:24:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:35078 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730527AbgCPKYu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 06:24:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B8125AC22;
        Mon, 16 Mar 2020 10:24:49 +0000 (UTC)
Date:   Mon, 16 Mar 2020 11:24:48 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/2] i2c: i801: Instantiate SPD EEPROMs automatically
Message-ID: <20200316112448.073eecf6@endymion>
In-Reply-To: <20200316112224.0eaeb925@endymion>
References: <20200316112224.0eaeb925@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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
Cc: Wolfram Sang <wsa@the-dreams.de> 
---
 drivers/i2c/busses/i2c-i801.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-5.5.orig/drivers/i2c/busses/i2c-i801.c	2020-03-16 11:11:57.463497502 +0100
+++ linux-5.5/drivers/i2c/busses/i2c-i801.c	2020-03-16 11:14:33.279262494 +0100
@@ -1318,6 +1318,12 @@ static void i801_probe_optional_slaves(s
 
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
