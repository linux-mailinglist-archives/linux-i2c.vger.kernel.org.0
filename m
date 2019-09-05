Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C2DAAA84
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 20:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403811AbfIESEf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 14:04:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42679 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403808AbfIESEf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 14:04:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id p3so1824237pgb.9;
        Thu, 05 Sep 2019 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=5Txs8VAPnXGIf8GTDK3ZKbmSl6EOvud6WzjlGid3JPU=;
        b=ZhCB0Nonj3gFneSqLa92SuVHC9IgVs6cKMaMkTpUFxGd55oHGSaZHuPd48zNZ/M0ib
         37p870SX5/SlaWaESMJ+uAtwusA8+QJSxCd6MQiMuqN6xgg2UtpbUMKX70AQilD7c4TX
         uO6kHd4krZruQ9U2PjSmzRpRBlii4l5vluhhKrjN8pxQlmXWb2pd+8UEaEiBbpb0xP0Y
         cxYtVeTcjA+8PQ4Q/7LJN6YiDjeIH5cFG7x+h1Sy8ZPYxdMWrUl+aGpIW4NhjEW8g/w1
         Z+03OtpeGLBr/OyHTdr+USOW2dYMFoWZVcHXSPLtQ7IT+3g4Wb7HkbJsW6wzocfhuqu3
         Epqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=5Txs8VAPnXGIf8GTDK3ZKbmSl6EOvud6WzjlGid3JPU=;
        b=ZE/zEFvVy32CKPDDKs+KiRCdq715kPmXm84iRXE8W7ovhuLD81tYyWdS/Hy6DyN7J/
         Z9rtpxBiechGPbVMUtRATuvXiljfyFjbbYk7z9YS9NEty+L38SAnruvIbsuT2dCuohhd
         YnQyHmjzHKeTph9wPhSQbY85BOYk4CzeFLGvjllaxzWzEzHz23w+KT3hZAUnMhahRBMn
         Bm+8nlvOEFFXXuti0Z+2L4JifMaLBK/NHv/xasI1K66Krsqpm9LPoWWJnXWAIuFkl2ce
         /Hc68UKJd5TF7yowJ25+IxnTzOro79Nf7zEp1z5BfwfpdNXQvWlExuOlzDrB0+hnaZxi
         Pn5Q==
X-Gm-Message-State: APjAAAWPuG8t/MYfL5YiVV1RfQijaqO/uZxE7rOTvNC9pl+B0HGX0aKE
        mFEVbVy305Z2nvdPp1z/yt1lPOIg
X-Google-Smtp-Source: APXvYqzCX2u/8LIA815JES2DTFxq97719BEhEovJICs0D9Y0aCAxaQrLFa4yL1/cTDPmXOueCVLuXw==
X-Received: by 2002:a65:6454:: with SMTP id s20mr4343018pgv.15.1567706674352;
        Thu, 05 Sep 2019 11:04:34 -0700 (PDT)
Received: from SD ([2409:4041:2682:8a8d:f8f8:fdec:f250:db13])
        by smtp.gmail.com with ESMTPSA id y6sm3372556pfp.82.2019.09.05.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 11:04:33 -0700 (PDT)
Date:   Thu, 5 Sep 2019 23:34:23 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     linux@roeck-us.net, peda@axentia.se
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: muxes: pca9541: use BIT() macro
Message-ID: <20190905180423.GA7477@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use bit mask macro BIT() for definition where appropriate.

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
Changes in v2:
* Include linux/bits.h which defines BIT()

 drivers/i2c/muxes/i2c-mux-pca9541.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 50e1fb4aedf5..c9b17a305bb5 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -16,6 +16,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
@@ -42,20 +43,20 @@
 #define PCA9541_CONTROL		0x01
 #define PCA9541_ISTAT		0x02
 
-#define PCA9541_CTL_MYBUS	(1 << 0)
-#define PCA9541_CTL_NMYBUS	(1 << 1)
-#define PCA9541_CTL_BUSON	(1 << 2)
-#define PCA9541_CTL_NBUSON	(1 << 3)
-#define PCA9541_CTL_BUSINIT	(1 << 4)
-#define PCA9541_CTL_TESTON	(1 << 6)
-#define PCA9541_CTL_NTESTON	(1 << 7)
-
-#define PCA9541_ISTAT_INTIN	(1 << 0)
-#define PCA9541_ISTAT_BUSINIT	(1 << 1)
-#define PCA9541_ISTAT_BUSOK	(1 << 2)
-#define PCA9541_ISTAT_BUSLOST	(1 << 3)
-#define PCA9541_ISTAT_MYTEST	(1 << 6)
-#define PCA9541_ISTAT_NMYTEST	(1 << 7)
+#define PCA9541_CTL_MYBUS	BIT(0)
+#define PCA9541_CTL_NMYBUS	BIT(1)
+#define PCA9541_CTL_BUSON	BIT(2)
+#define PCA9541_CTL_NBUSON	BIT(3)
+#define PCA9541_CTL_BUSINIT	BIT(4)
+#define PCA9541_CTL_TESTON	BIT(6)
+#define PCA9541_CTL_NTESTON	BIT(7)
+
+#define PCA9541_ISTAT_INTIN	BIT(0)
+#define PCA9541_ISTAT_BUSINIT	BIT(1)
+#define PCA9541_ISTAT_BUSOK	BIT(2)
+#define PCA9541_ISTAT_BUSLOST	BIT(3)
+#define PCA9541_ISTAT_MYTEST	BIT(6)
+#define PCA9541_ISTAT_NMYTEST	BIT(7)
 
 #define BUSON		(PCA9541_CTL_BUSON | PCA9541_CTL_NBUSON)
 #define MYBUS		(PCA9541_CTL_MYBUS | PCA9541_CTL_NMYBUS)
-- 
2.20.1

