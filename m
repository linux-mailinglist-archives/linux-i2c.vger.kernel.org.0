Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BDB26D17B
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 05:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgIQDOW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 23:14:22 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:53229 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIQDOW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 23:14:22 -0400
X-Greylist: delayed 326 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 23:14:21 EDT
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.227])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id C0CA14E1447;
        Thu, 17 Sep 2020 11:08:52 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] i2c: Use kobj_to_dev() API
Date:   Thu, 17 Sep 2020 11:08:44 +0800
Message-Id: <1600312126-24048-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ01PSB1NHh1NS08dVkpNS0tISklKSEhLSElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MD46NAw4Tz8ZQxQvIzMOHAIx
        HDwaCT5VSlVKTUtLSEpJSkhIT0NCVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlJTFlXWQgBWUFKSUJNNwY+
X-HM-Tid: 0a749a0945409376kuwsc0ca14e1447
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use kobj_to_dev() instead of container_of()

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fc55ea4..5662265
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -344,7 +344,7 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 
 static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
 {
-	struct device * const dev = container_of(kobj, struct device, kobj);
+	struct device * const dev = kobj_to_dev(kobj);
 	return to_i2c_client(dev);
 }
 
-- 
2.7.4

