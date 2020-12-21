Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0D42DFC5D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Dec 2020 14:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgLUNoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 08:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50619 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725806AbgLUNoA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Dec 2020 08:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608558153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IsdWpDDewYbJE6ImRHpkM3QUfxVPOz63I/06nG9k12Y=;
        b=Rk/6MsjDel1q+Rt3yV9C+jt6LaQG4ifToKVLKPNCbzMAlMVkQKcD2onFBE+SCRnh6fdaSv
        J09PhIUA0RRIx99ndoYKS7NYuoV9rpBYf0TnZGGEdVSNcA+/PZXH2rZrQe7vKF+mXbQmSc
        I2IcIYI63VflsTfaIUIAazTLN8h+Rgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-fEbEvL95PNeqYBzRUkF8UA-1; Mon, 21 Dec 2020 08:42:30 -0500
X-MC-Unique: fEbEvL95PNeqYBzRUkF8UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B029800D53;
        Mon, 21 Dec 2020 13:42:28 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-12.ams2.redhat.com [10.36.115.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 58EB219D9C;
        Mon, 21 Dec 2020 13:42:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] i2c: i801: Fix the i2c-mux gpiod_lookup_table not being properly terminated
Date:   Mon, 21 Dec 2020 14:42:25 +0100
Message-Id: <20201221134225.106728-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

gpiod_add_lookup_table() expects the gpiod_lookup_table->table passed to
it to be terminated with a zero-ed out entry.

So we need to allocate one more entry then we will use.

Cc: Serge Semin <fancer.lancer@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/busses/i2c-i801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ae90713443fa..877fe3733a42 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1449,7 +1449,7 @@ static int i801_add_mux(struct i801_priv *priv)
 
 	/* Register GPIO descriptor lookup table */
 	lookup = devm_kzalloc(dev,
-			      struct_size(lookup, table, mux_config->n_gpios),
+			      struct_size(lookup, table, mux_config->n_gpios + 1),
 			      GFP_KERNEL);
 	if (!lookup)
 		return -ENOMEM;
-- 
2.28.0

