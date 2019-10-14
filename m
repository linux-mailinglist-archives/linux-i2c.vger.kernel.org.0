Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46BB9D5F2A
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 11:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731105AbfJNJlb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 05:41:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:56454 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731097AbfJNJlb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 05:41:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 013AEBDD2;
        Mon, 14 Oct 2019 09:41:30 +0000 (UTC)
Date:   Mon, 14 Oct 2019 11:41:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 4/4] i2c: i801: Instantiate SPD EEPROMs automatically
Message-ID: <20191014114146.08b58f16@endymion>
In-Reply-To: <20191014113636.57b5ce89@endymion>
References: <20191014113636.57b5ce89@endymion>
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
 drivers/i2c/busses/i2c-i801.c |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-5.3.orig/drivers/i2c/busses/i2c-i801.c	2019-10-11 11:00:10.574348301 +0200
+++ linux-5.3/drivers/i2c/busses/i2c-i801.c	2019-10-11 11:20:03.741576063 +0200
@@ -1314,6 +1314,10 @@ static void i801_probe_optional_slaves(s
 
 	if (is_dell_system_with_lis3lv02d())
 		register_dell_lis3lv02d_i2c_device(priv);
+
+	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
+	if (!priv->mux_drvdata)
+		i2c_register_spd(&priv->adapter);
 }
 #else
 static void __init input_apanel_init(void) {}

-- 
Jean Delvare
SUSE L3 Support
