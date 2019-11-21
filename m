Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1776E1055B5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 16:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKUPgA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 10:36:00 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:33425 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfKUPgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 10:36:00 -0500
Received: from orion.localdomain ([95.115.120.75]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MJmX3-1iIkaN1UBl-00K6ei; Thu, 21 Nov 2019 16:35:58 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: i2c-core-base: tiny indention cleanup
Date:   Thu, 21 Nov 2019 16:35:41 +0100
Message-Id: <20191121153541.26402-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:L6EOFn0STmgsIK79q6tHtVhD0cjobzcbBwLr/SzPFpeQYjM9ZPH
 59kFgTeDOjgMu0BJwpi0Po+upOXAx5352VOKzodWRd/ICCM6bs1hWDv4+3aS1oYHfsh/JsO
 1TXW1V5s4qjNlaiLMZumITx3xohQXbnA0XCf5dRpX2huSDBVKeqNmzkAAWKoenpuc40/BpO
 K1/ILPOhUPgEUbd2+bC7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F5VK7nogLpA=:itMk1bZoeMJBvG8RKb5XiB
 j9m9mNAX3NcSPoBLEKZq4WzRAPpdZrpXIrnG2mUzBcN6OJ0eSpIQpE6/4a/x6/OxrluaQq2R5
 K9FsgyuFWQTzfUF7gQCp+Jj/T6EB2BsYdGQdBPA4+pzOxtqPAmxy1ta0fg80jP1tQCtqtnMxE
 rr/UJXFaIB9CPkSRUVoo9wZkg8yV8Benw7MJDU4cIsDJulaeUcfbcoMBb4CwKrAosSETXw6n1
 jnRP27seoP1hym6tbNkLIz+4/af9FNO3gDXBgNl/xgNFK4WQNAAoV0lCv7UtyY9uHhisCCd+d
 gL7600g0lGfY9gnmFaNKWbq885IEhd5aSKDeu2ael07hN9FrzSmM5ciXSUw1P1ChSokYA25yV
 ruog1oPU3Vn1nUQFlORzqnUIlw62ut3p6iEmCp/W3L15xDXrNpsZl2OtI3w+/95vG2d/aHAxZ
 R8A9BEw7iM/JakRMWq/OTpOcd0eM7TnwAa1+ldqPHJ9lGcg97Wyx1S8gI5ADCH9BXsX/dsyIL
 HLNvBBYROx21318ys79g8ocFKVJSou6lb693nM0Rr16MEhGedlMG+H80QTxsVHlOIc4n9EyxV
 NcYJJgolGZHrDLXYOkiQs+orwFB2vUuW87L9dQWMcFYVx3RKmZuDnVfKsGgHVRMoyNY6/gvsP
 id0JwGzIotOqaFGWBlvgdjznaDudIt7ZgrJGP3GEOIFnGyqcItUVB8Cr7D9iLN1o4m7fW77V5
 EcwWqvB4OOBu6gjSJwR5eZShq2io6REFqlvBhrye0jyAjS+HQICS4vftOMlBYbKQ97r9t8851
 EPusDa/XoWqIs21tFBVlsZ8uRSX5Qx3FP2/S5TbvA6mkWx04q7oAm7S//tRaXzvc3ErZs+qeS
 LD7M948AEpB5fZlDA2Jg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5f6a4985f2bc..68be4e89d16a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2326,7 +2326,7 @@ struct i2c_adapter *i2c_get_adapter(int nr)
 	else
 		adapter = NULL;
 
- exit:
+exit:
 	mutex_unlock(&core_lock);
 	return adapter;
 }
-- 
2.11.0

