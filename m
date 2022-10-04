Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6AE5F49B4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Oct 2022 21:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiJDT1U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Oct 2022 15:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJDT1T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Oct 2022 15:27:19 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD66567C9E;
        Tue,  4 Oct 2022 12:27:18 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j7so17490249wrr.3;
        Tue, 04 Oct 2022 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9/J9FTSCX+rpRE3PNiC/X+c5hlANUvvCZc9JIlcmbQI=;
        b=lGRbq7aEbeKpcYD1nFtTZLIwZt6STv3+ZWCFf7kGSsNBLaD5fNw6ZXHoLpu5m/brL/
         h41sJGn07YTi+KHm1wsyeahrcSYShCVHX39Dpw8pUwFIkgCTanSfCtnYf/A2fx88oVSf
         nk/ZCbzr0iYBH1YwAxW3p/PDovfrG33YjfZOXxGYq0nsjBNPAekN3hGUWCNhGGFm5YfD
         M+X0hHv6pELHQtgGV2pzYJbPJW6UE5Dn8ENiaKcTaurlr0ThSSjq4X75juikTceyKlEV
         g4yBJrD1xG+SVQcfDe85f0cl0pytP17uViOLW2C/Qoit0RtWGPbS+a3cXtPmq7gIN8J0
         LVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9/J9FTSCX+rpRE3PNiC/X+c5hlANUvvCZc9JIlcmbQI=;
        b=ugYg5Y4JQc8SNZWeBNJXkyOerg46wHDIRRqPUdyABkYoipADL9s8az+PvC3nZ685NW
         ag0GtvoRqV9E8lmwAGklQE1O/ra/5V3dMgLs+IDAI01xSFPxXE0IUBzkcIzxoO3GdO1e
         0MzVA1SK1wez7CO+gX8lzEsnSGLvLrKlzNsanlGwyh0EDwGs8KG7o4EcXS+oG2aOj/6l
         SLO7A132nfK5WLrg+up0iYQqz4M4FePpAhaMNxV9r0Cb6gNHkPhz7nxOvQaL4+BYXZ1F
         piJGETgqK57wcSHQkiMKWHqV7y091Koiiotn3cPheWorX6sSClNTw6oHiRlBxkEoK3fa
         +V3g==
X-Gm-Message-State: ACrzQf3OEsRK1oGo2loQW7LAYYsYL6L6Vh995o+huuXi31Nyi1NI6MJy
        d1KzIAhL1pfi/0E4MzAHW4w=
X-Google-Smtp-Source: AMsMyM6RAMcr15uouXasI6t4O4is72G4r5MjrHSdLcohCzFWRk+0bT+yI+rICyqascTtAMF3eRz6Sg==
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id e3-20020adfdbc3000000b0022ad393bd84mr17318750wrj.626.1664911637100;
        Tue, 04 Oct 2022 12:27:17 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id q22-20020a1ce916000000b003b56be51313sm15636251wmc.44.2022.10.04.12.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:27:16 -0700 (PDT)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] i2c: microchip: pci1xxxx: Fix comparison of -EPERM against an unsigned variable
Date:   Tue,  4 Oct 2022 20:27:15 +0100
Message-Id: <20221004192715.173210-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The comparison of variable ret with -EPERM is always false because
ret is an u8 type. Fix this by making ret an int.

Cleans up clang warning:
drivers/i2c/busses/i2c-mchp-pci1xxxx.c:714:10: warning: result of comparison
of constant -1 with expression of type 'u8' (aka 'unsigned char') is always
false [-Wtautological-constant-out-of-range-compare]

Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index f5342201eb6b..09af75921147 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -708,7 +708,7 @@ static void pci1xxxx_i2c_init(struct pci1xxxx_i2c *i2c)
 	void __iomem *p2 = i2c->i2c_base + SMBUS_STATUS_REG_OFF;
 	void __iomem *p1 = i2c->i2c_base + SMB_GPR_REG;
 	u8 regval;
-	u8 ret;
+	int ret;
 
 	ret = set_sys_lock(i2c);
 	if (ret == -EPERM) {
-- 
2.37.1

