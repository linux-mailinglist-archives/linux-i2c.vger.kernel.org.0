Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA4373D2F3
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 18:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390339AbfFKQsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 12:48:22 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:44422 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387814AbfFKQsW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 12:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:Reply-To:Cc:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IdZ8MhLjTQ3+GmMDTWNfRq37QvDLfsqCS7lnrzKdDxw=; b=rOHlwKZfvwMPWkj197Y71Ok63g
        enp+nSpl5Ht+HL5Trdje8qlYfKzR0HOrDg6Q7jBKhPYnmd892qyAX9HovGQiFUqk6Y43mboza36/9
        mj+cZNruqD/H120hC7J2Fj12iO7KzI1kGzglFfpKZrTYFyY36IzaCbU/ruTlXgcWfgT9+vU6etpTk
        bfmZgNN6oT/nTZI+RTvGO0ziXeXlAichK0cDhywNj9X3EppzIhSR21G6Y5ocXVf28GCvlQLkgVbXp
        wT/YbCQ7LMpl6odexl2KnznYavNUcnL8CKWFXBrdbjSxafleJj0Ms/qCESuCwpd+0kHeHjmAYJp7c
        zEVYtvgg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55468 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1hajwZ-0006sl-9Q; Tue, 11 Jun 2019 17:48:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1hajwY-0003Aj-OD; Tue, 11 Jun 2019 17:48:18 +0100
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: acorn: fix i2c warning
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1hajwY-0003Aj-OD@rmk-PC.armlinux.org.uk>
Date:   Tue, 11 Jun 2019 17:48:18 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Acorn i2c driver (for RiscPC) triggers the "i2c adapter has no name"
warning in the I2C core driver, resulting in the RTC being inaccessible.
Fix this.

Fixes: 2236baa75f70 ("i2c: Sanity checks on adapter registration")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-acorn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-acorn.c b/drivers/i2c/busses/i2c-acorn.c
index f4a5ae69bf6a..fa3763e4b3ee 100644
--- a/drivers/i2c/busses/i2c-acorn.c
+++ b/drivers/i2c/busses/i2c-acorn.c
@@ -81,6 +81,7 @@ static struct i2c_algo_bit_data ioc_data = {
 
 static struct i2c_adapter ioc_ops = {
 	.nr			= 0,
+	.name			= "ioc",
 	.algo_data		= &ioc_data,
 };
 
-- 
2.7.4

