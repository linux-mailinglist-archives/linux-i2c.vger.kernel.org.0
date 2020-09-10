Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2880B26430C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 11:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbgIJJ6s convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 10 Sep 2020 05:58:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:33488 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730556AbgIJJ5N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 05:57:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 298B3AD39;
        Thu, 10 Sep 2020 09:57:25 +0000 (UTC)
Date:   Thu, 10 Sep 2020 11:57:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <volker.ruemelin@googlemail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: i801: Exclude device from suspend direct complete
 optimization
Message-ID: <20200910115708.263c8e02@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

By default, PCI drivers with runtime PM enabled will skip the calls
to suspend and resume on system PM. For this driver, we don't want
that, as we need to perform additional steps for system PM to work
properly on all systems. So instruct the PM core to not skip these
calls.

Fixes: a9c8088c7988 ("i2c: i801: Don't restore config registers on runtime PM")
Reported-by: Volker Rümelin <volker.ruemelin@googlemail.com>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: stable@vger.kernel.org
---
 drivers/i2c/busses/i2c-i801.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-5.8.orig/drivers/i2c/busses/i2c-i801.c	2020-09-09 18:41:55.118961045 +0200
+++ linux-5.8/drivers/i2c/busses/i2c-i801.c	2020-09-10 11:36:40.352858458 +0200
@@ -1917,6 +1917,7 @@ static int i801_probe(struct pci_dev *de
 
 	pci_set_drvdata(dev, priv);
 
+	dev_pm_set_driver_flags(&dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
 	pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
 	pm_runtime_use_autosuspend(&dev->dev);
 	pm_runtime_put_autosuspend(&dev->dev);


-- 
Jean Delvare
SUSE L3 Support
