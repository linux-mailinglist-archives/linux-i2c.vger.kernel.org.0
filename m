Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D3C4BC46F
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Feb 2022 02:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240877AbiBSA5f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 19:57:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240989AbiBSA5Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 19:57:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD2B227D68F
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 16:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645232182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=yAdt8c3Kx+H+/O3yRynb0JPTBtvJf6iuj3i77jiRv/E=;
        b=SSfOksnKoVSq5+XQ4xfT5kkIXPHLmHL6e7jH/o+a2jy6Ci2cExrViRiPGFyGcycpu9zttP
        beAya5nw3uaBn3khS/P2pjZUo74N9yHPeo48D/H4C3orfvqarclnCsTq9P6YloZTbcdlw+
        HA+QCpFMjvO3JvfFQIJfQMqe5h7yzME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-VXpIlbqxMZCUfEdjOGjxyg-1; Fri, 18 Feb 2022 19:56:19 -0500
X-MC-Unique: VXpIlbqxMZCUfEdjOGjxyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C331091DA1;
        Sat, 19 Feb 2022 00:56:16 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-39.pek2.redhat.com [10.72.12.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D760D62D4E;
        Sat, 19 Feb 2022 00:56:04 +0000 (UTC)
From:   Baoquan He <bhe@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org, hch@lst.de,
        cl@linux.com, 42.hyeyoo@gmail.com, penberg@kernel.org,
        rientjes@google.com, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        David.Laight@ACULAB.COM, david@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        linux-crypto@vger.kernel.org, steffen.klassert@secunet.com,
        netdev@vger.kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, linux-s390@vger.kernel.org, michael@walle.cc,
        linux-i2c@vger.kernel.org, wsa@kernel.org
Subject: [PATCH 16/22] usb: udc: lpc32xx: Don't use GFP_DMA when calling dma_pool_alloc()
Date:   Sat, 19 Feb 2022 08:52:15 +0800
Message-Id: <20220219005221.634-17-bhe@redhat.com>
In-Reply-To: <20220219005221.634-1-bhe@redhat.com>
References: <20220219005221.634-1-bhe@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dma_pool_alloc() uses dma_alloc_coherent() to pre-allocate DMA buffer,
so it's redundent to specify GFP_DMA when calling.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index bcba5f9bc5a3..d234de1c62b3 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -922,7 +922,7 @@ static struct lpc32xx_usbd_dd_gad *udc_dd_alloc(struct lpc32xx_udc *udc)
 	dma_addr_t			dma;
 	struct lpc32xx_usbd_dd_gad	*dd;
 
-	dd = dma_pool_alloc(udc->dd_cache, GFP_ATOMIC | GFP_DMA, &dma);
+	dd = dma_pool_alloc(udc->dd_cache, GFP_ATOMIC, &dma);
 	if (dd)
 		dd->this_dma = dma;
 
-- 
2.17.2

