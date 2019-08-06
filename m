Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C2482D94
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 10:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHFIPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 04:15:45 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.31]:47980 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727259AbfHFIPp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Aug 2019 04:15:45 -0400
X-Greylist: delayed 1488 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Aug 2019 04:15:44 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 2D97B3D2CC
        for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2019 02:50:56 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id uuFEhIeCidnCeuuFEhkZ02; Tue, 06 Aug 2019 02:50:56 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BLQJA0ZrIGSjNwAj/WHSkr6DM6khrjzA0+pF5VmmsmM=; b=DWdHrQLk2XlqdgAc9eA42TO10d
        TxRxW4ldd8yVBZOzcglkunMfnY3Dc/NCGpSRGLtGsY15dF0mMnGjEEZpXHMYHOxOVmUjS6Uf+VTt2
        qe5b7EFfDKEUQZ9ffTMSjRK/uF79FRbVp8XNQqzlGSHoJ6OUIVF3gbDH8wEe5VsXDwBYK/o2jNLfX
        HVDqMXqnppkEt/pl7BKCl9Fi+zRXxnStJ3Zf4Hhfjrfxl/0I4K2FxsU+set7Zt26ZxX0xF2VDxaMJ
        fy6tdsN2qSDg3n/1JGTTxly3sge5LJhuFSGOmbDMFMDOOM7T2UDehOLFZWsNvCOF5t9Rr4/Oih8KW
        MBuYnMPQ==;
Received: from [187.192.11.120] (port=43460 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1huuFC-000YPs-U1; Tue, 06 Aug 2019 02:50:55 -0500
Date:   Tue, 6 Aug 2019 02:50:54 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] i2c: designware: Fix unused variable warning in
 i2c_dw_init_recovery_info
Message-ID: <20190806075054.GA15418@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1huuFC-000YPs-U1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:43460
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following warning:

drivers/i2c/busses/i2c-designware-master.c: In function ‘i2c_dw_init_recovery_info’:
drivers/i2c/busses/i2c-designware-master.c:658:6: warning: unused variable ‘r’ [-Wunused-variable]
  int r;
      ^

Fixes: 33eb09a02e8d ("i2c: designware: make use of devm_gpiod_get_optional")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 867787dade43..e8b328242256 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -655,7 +655,6 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 	struct i2c_adapter *adap = &dev->adapter;
 	struct gpio_desc *gpio;
-	int r;
 
 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
 	if (IS_ERR_OR_NULL(gpio))
-- 
2.22.0

