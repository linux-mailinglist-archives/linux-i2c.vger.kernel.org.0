Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B1180691
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2019 16:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfHCONn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Aug 2019 10:13:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46279 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfHCONn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Aug 2019 10:13:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id w3so275232pgt.13;
        Sat, 03 Aug 2019 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=2nW1qdYT+ls+yP7SZf0Ct0WsFONxeOJJreCKu5Wq5r0=;
        b=vXpncURIJuxiU45nZgakz+fsbMIciPseDLVeOBtMQSwBKOUqkNji0zExHlbGcox+7h
         A859cGbT9tgfN5TITg97JCDm/WkhwbPqNYG8W+NPEnyo/wjmUZuXfWtw24misjeNEMCx
         OgRHGXee0G00IV3e+5zsE5aWdsq4/aPF6T138e0RccQnvNSrGib0gZ8PGPER20BwqlRr
         V4jrBzx6G4P53o4AYpS3zSSROdjtgY4z+IuprdhBPVooHkZTR1+6zLnnvPaZ192JWVjA
         nk24/4i2yFXERL0+k6GwMn8JJAnwjLV3Jp/DX2zzzWZoqLYaupjolTKbhcvaImgEuGRJ
         PG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=2nW1qdYT+ls+yP7SZf0Ct0WsFONxeOJJreCKu5Wq5r0=;
        b=c2GTDSNvPhoOiRJrI8Ek243pDmM0wChY0JVIA25BtwFEdK4S3OchBltUCiovS41fSe
         FHZ69rXScBT6MTHZAmlwAjrBQCtnEM0ALNFcqf8lFGe08UPoYqkHJBf0wMT8r13gF51H
         vqYCHoQDU0uQn6C/tfNVxTag7l4VrzrY+9QepJ1nSTVnS6kV/KgQbmSIcYlGx++ndg9c
         U1niAv/s2t4oY/KHaVVXuG3+0pnYnrmVLpWdiLkzSlFUNOeY5Gz7Y7jKpHb2rAG4VHX8
         FkfrDwQsgifRHB3QXOR/sOCZ9OlCNZ/91N3z5R9WZ9uFbjDscsSgCXUwijuGO6hIJVUX
         uPCQ==
X-Gm-Message-State: APjAAAUMOPurWvuJuaP6HSrQgrpxAiPRgwSdDGSRYq1CRINydVlcEJDH
        DSTpPgBQJyR3AniPmYWPSb4=
X-Google-Smtp-Source: APXvYqyPilma59RFUQoDatZkRE5fdaK3QZsnXT7UVrQoypYHakMO16WqAbGIumdAE1KTzZGTg+UHxw==
X-Received: by 2002:a63:61cd:: with SMTP id v196mr2130652pgb.263.1564841622833;
        Sat, 03 Aug 2019 07:13:42 -0700 (PDT)
Received: from nishad (p3261240-ipngn21201hodogaya.kanagawa.ocn.ne.jp. [153.202.122.240])
        by smtp.gmail.com with ESMTPSA id a12sm12704967pje.3.2019.08.03.07.13.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Aug 2019 07:13:42 -0700 (PDT)
Date:   Sat, 3 Aug 2019 19:43:35 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: stm32: Use the correct style for SPDX License Identifier
Message-ID: <20190803141331.GA3588@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch corrects the SPDX License Identifier style
in header file related to STM32 Driver for I2C hardware
bus support.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32.h b/drivers/i2c/busses/i2c-stm32.h
index 868755f82f88..2c21893905a3 100644
--- a/drivers/i2c/busses/i2c-stm32.h
+++ b/drivers/i2c/busses/i2c-stm32.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * i2c-stm32.h
  *
-- 
2.17.1

