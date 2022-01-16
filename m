Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B963A48FAA8
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 05:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiAPEhl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 23:37:41 -0500
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210]:50481 "EHLO
        out162-62-57-210.mail.qq.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230092AbiAPEhk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 23:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1642307857;
        bh=2mTqmg1W9dS0Kv/L7soH7R821Fj9eiYWYXJ3eGCvI9M=;
        h=From:To:Cc:Subject:Date;
        b=OTFH9S0MMT/R14p6eAaEjS4tettjeAtsjTXBsO5HPYDz4Nouch4YkD8HNw+/9FBxs
         ethXx6AJHVMKIiRNyOSr5NCONXnQ9eaUJ8/p7AkMiIqC3SNGZ2xiE0Gz3Top30GYrA
         e2EYJWTrkGWK4AF3wfnKbysXo18ncQ47LHuO/C04=
Received: from localhost.localdomain ([218.197.153.188])
        by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
        id 917314DA; Sun, 16 Jan 2022 12:36:23 +0800
X-QQ-mid: xmsmtpt1642307783t51oumnca
Message-ID: <tencent_3494A6FE814002990D726938622822C34709@qq.com>
X-QQ-XMAILINFO: NALSiNJGVz8siqDzRFfLfEsfl8EiRsW0xQQhTQCVaO8DTNHg2l0Rck11d0d55v
         NpnJiKb4kQiZ1cPZ6642+cGBadiJ3pQ9uaJxSZGiTRS7Tnm5DkkYHknpRdvZXbxDWuXcuDpp9P+q
         VmW1i7eh+5SBmpRPrU8bztSY2FBwQQNVrCFD40K7uyXFuUDrkVlOVOii79ofTM/tn99ip/Psf/RO
         Cf21AKGNg4PSd8y8wXKpkV0vpGz0j8aMet8vfmsARsR6Ti3LSUr201+ovMsM+WPVzFmesD7W6SJg
         P2Wpxg+bLGkcLHdSA0Xsl6So97Swf3kW7Fxt1usEApeb6nUahs0Ydun4f89H9sDgnjMvIT3esd4r
         treAjV2Dr7M0G7526xRbBbdA+PSmwgJv0bThvS60TYWB0kDJKxLO2S9r6wVFeNdJF8JERztjQomh
         okntuSOjuhS9sy9v1aDn7byt8UMBQuzqMA+Mf8yBt/46g7NL/Gw7ahPjyTqIYhvOdKIToglRxGTp
         BSNQyfacd9RjYirCpMxFCiuIgJmjgD530ncOSoQGPNeMZ3ZUuWFI5B31RS6i7qGb7klUhtvbeXgN
         Nj5xrLcGTgNoRqsI0JhcF5B8LMEqKNzSugIYeJpq/RXNry2nf2xBh9iAh4cho6J4lduX8nzxCRSE
         d9QKurMudb21g0R7ewBb2oO2jE6pv7F1+sPj1Dvc7Hs5D2FWzYyt/tkF4GCfYyy9PXQJYAkjHRDj
         Q9VfcdkBW9Ip/2HJp31V2J+Xdvsw6hdl29Ywl6FSZM6h6N4vE7GJsnbaJcd6yLzcEeioO5UoAwKf
         UKCUEvsF1/7TfkC7mAIVgVJZlECzD2W9CZq9Jlv6zJcUHPDkbPQxnpbcDutXOmwYargoeKRvFe4X
         44G7fGm+R2PJgMotraavFl37ZT2OZiHs3Ec8OZ7E4yl97LfWT166E=
From:   xkernel.wang@foxmail.com
To:     peda@axentia.se
Cc:     wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] i2c: mux: demux-pinctrl: check the return value of devm_kstrdup()
Date:   Sun, 16 Jan 2022 12:35:06 +0800
X-OQ-MSGID: <20220116043506.2292-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Xiaoke Wang <xkernel.wang@foxmail.com>

devm_kstrdup() returns pointer to allocated string on success,
NULL on failure. So it is better to check the return value of it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 5365199..3203361 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -243,6 +243,10 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 
 		props[i].name = devm_kstrdup(&pdev->dev, "status", GFP_KERNEL);
 		props[i].value = devm_kstrdup(&pdev->dev, "ok", GFP_KERNEL);
+		if (!props[i].name || !props[i].value) {
+			err = -ENOMEM;
+			goto err_rollback;
+		}
 		props[i].length = 3;
 
 		of_changeset_init(&priv->chan[i].chgset);
-- 
