Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 977C488023
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 18:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407439AbfHIQd5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 12:33:57 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:35603 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407418AbfHIQd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 12:33:56 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MYNaE-1hsKSU25II-00VNep; Fri, 09 Aug 2019 18:33:40 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: [PATCH 2/7] dma: iop-adma: include prefetch.h
Date:   Fri,  9 Aug 2019 18:33:16 +0200
Message-Id: <20190809163334.489360-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bh33ykmcy9xC7bSgKe5HpMvYyRBu8+rYYbrInIRFMtFJWkiaYiw
 WkUwer8jq/UzOidzEA2SoYi8Cby4xXUV7rj1mrrTA9Tyw2wfzv3Z/MWd5Lqbvhp558XUBip
 jgMrj+QezZpI3n5o6cFazIyoZ8oAk+Mf4GFmrn8xzYXhBaPucLOSAzl1X0tOzqPkzR7oH4x
 cXZXRBV+RIzmlMdUMm03A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6RfzKM1WAow=:uRVERwLffrlsRjNFOt+pi/
 o4Yzomyhusb70fgqKxK7mCVPktO6DPJmXP/KoHG4CqGpBCzcXM7+WBSKpiHoLwTisX0GuKMOP
 USXv41Z27HZ2NpBieQROias2ZqVdiZQf3cyOpzSinyBbHjZp5K9whhaTUGFKaPFcIbDa0Sl5F
 E+uayFQhczgS4r5YsgbfQhaK1pXGWrEB98+X8YtM5TJQ3tYdYmN9vIGMMPsmz6O3ObS3C+fB6
 YbVmwjlqFgwEphEHMZk1FNozIkRcLXcx4g7lq4L9PYBaBborbA6OquIuQ6ZsZ7W5HIDwJ0wmK
 EaQuJgjaQXdHxltzpjT3KzXxn1ywQwtFOxjmqgrl4XDVouqp5TIanotlqyh5tAScihZaDBNiF
 BJL7+wC3D+rKTHlS9UAjeMy5YWvaMZ9mOc9IIs81L2YrLKzpxzwZ/J5WCYnFizUtuRIaAUSfD
 5qqs+SLcebKIS3173uK16zA8mgNOrMysSnLYv2xYz7KEDrTPS/q2Ruwztim9M7RY4Yqn8eU95
 kgZoWtFhYpWG9tydQEVO/Q+9urJOK7FYWi1QvixiKrudFBkQkXsNGdHXA7L7JME/nRbprrpE/
 qDE+hxr2Z5DBy50I7lUQrZkf2aJls+zc7PVokBNL/BVXzYxVUXleQa5qNjjk5IH6OJR1wvtda
 w2dqwGRfE1zjjv4vAcWplfNoVImcKYxRj18CqNmbufCCrCx4V54IsFOfXRAaihabdu39gRPT0
 JHKIiuxSzy17u+JGUIk78ntBZ7qpurTzJuKlyA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Compile-testing this driver fails on m68k without the
extra header inclusion.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/iop-adma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
index c6c0143670d9..7857b54770d1 100644
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@ -16,6 +16,7 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/prefetch.h>
 #include <linux/memory.h>
 #include <linux/ioport.h>
 #include <linux/raid/pq.h>
-- 
2.20.0

