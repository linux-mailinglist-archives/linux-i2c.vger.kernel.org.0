Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3D77AB81A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 19:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233443AbjIVRuX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 13:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbjIVRuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 13:50:12 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757551B7
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 10:50:02 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fdd6011f2so2020611b3a.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 10:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405002; x=1696009802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Zplt7bJOl4CFlcfp3YYRAe0azxom+WSOFTcPCPX8Y=;
        b=Nst6s4GP7aybxtmVUD6pRmv7OLP8Tj6b7hQQCzttFBY2994lGhQqeWuszB+y7Wh9tE
         cfQJaceAhAJp853l/BhwS9t6jkb/39QW5ufi4BzG+sh5l1s0ffk5dUWqml1VB8xNsoul
         grG9Da/EFWX5H9/bFXCrfwCQQ2EBtVfxYk2Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405002; x=1696009802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/Zplt7bJOl4CFlcfp3YYRAe0azxom+WSOFTcPCPX8Y=;
        b=CfJwXLg2f5Vi650/vHY2AovUlhL8cb04IPICRA7Nd4Kr7R1/SG7KaSEqg/SN8tXT8w
         HIpWkaeUC0RXmKHqQAVG49JDHjjoX1MhestNJuPZLPtr1vpotPJIjpkrUpq4dwo0yX1Y
         cu5/1NRmRQkzF4lTLuCAZUylUheT8SyJaRoCpI8rgN4PvAMnxECuz2BmkMI6tAZsHWru
         RfdNp8q8nJonhfHWI3OcPmq6WDfWb1tmpQFPJ0FvVioytL4tiTPa+x+XYoC/2N88eXS2
         VJNg77Ue7y9rZ95AvIRQvEZKgtMz58+P1ss0QYLpqJT5b76AA2XvAH7Q5acxWt50OIqk
         oTaw==
X-Gm-Message-State: AOJu0YwsAwAWoximFF9NUoBBBdIwhyPjOGALSul/uzWHJaRcSlLl3srJ
        Edzl31dkDoGVkX/P7MGh2a+iOQ==
X-Google-Smtp-Source: AGHT+IGRer91bTYN2Rt+KzEEMh2s2tn6KVHqAwMKSj3SAFOo2KuajUauyZQXDFrsQbJ3tkXF9FmX/Q==
X-Received: by 2002:a05:6a20:9383:b0:149:44d9:bbb0 with SMTP id x3-20020a056a20938300b0014944d9bbb0mr244163pzh.43.1695405001898;
        Fri, 22 Sep 2023 10:50:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e12-20020a63db0c000000b00553dcfc2179sm3420871pgg.52.2023.09.22.10.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:01 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Kees Cook <keescook@chromium.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: [PATCH] i2c: mux: demux-pinctrl: Annotate struct i2c_demux_pinctrl_priv with __counted_by
Date:   Fri, 22 Sep 2023 10:49:59 -0700
Message-Id: <20230922174959.work.093-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=keescook@chromium.org;
 h=from:subject:message-id; bh=4Rvl/5wL+K6ZOeH1ROPGt2vMng9UfD2mTlgwhwq1jQY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPHYWMdyHq0jxtRP9ZmEsFazTpzFSBpF1GF4
 5CfsbLb84qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3TxwAKCRCJcvTf3G3A
 Jrn0D/4ugY7BUA37RdDIydA7/mOWNmkmEKNS3VHSQIjnl9AmK7Nu6+gjsJBhg34oojB97r5nuZq
 27lhAKwwHmKEUrGCfAmRhXJLH4CDVxvZqXwd+xqrqNjpeG3yUAeoxso+/rgduvaq1YNA7WBHsc2
 IO352NHTSy+oDzHW5/KH7d3wL7NuSKO0DBZxakE4e4DiloSvDN51A7iOOg5EVSRqc0526QSZm0B
 s9FFKEqzkb9apkcltRxtfBR98w+1GMf6SUMivowvhdNdMGq6vSGxSBxPC65bfF99bKPgwY4F+t+
 1xptfzmEgCPRpCINY9ZNM3KgOkJW7H44axytK5qBWLZfi8xpxSP+WjQHmYunF/kCXmCLMQ16KHF
 GrxMceQX5DFhczV0ozC3jvTx2xZx0Y5n9ERFS1iGE2a1ouJ5enOXpb8gqGSqGl3XW38Q7D2uBf7
 cYNtly9HT5VX5NvqVkSVN6gV5+JdhROiC1Gyr2uRrLR3gnu6jDtM77OKbL1FAKBp+uu6KbvDgAd
 8jv+bUxpkifNcJ9mpuDxyYS8L2TRXL8ak+wxUGXHwRcC3mHWFBDNuy6J1qdfw7ScjxtDyjrtI1v
 3aj5010thsXGUIoUlN3u7UXb3zPa2Nxr2V3kUaEV4McZJd5mod4HSafaLrSR33EH3WR/HikPJ3r
 Vek09K+ /QRhY4pw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct i2c_demux_pinctrl_priv.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index a3a122fae71e..5e15d8777229 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -32,7 +32,7 @@ struct i2c_demux_pinctrl_priv {
 	const char *bus_name;
 	struct i2c_adapter cur_adap;
 	struct i2c_algorithm algo;
-	struct i2c_demux_pinctrl_chan chan[];
+	struct i2c_demux_pinctrl_chan chan[] __counted_by(num_chan);
 };
 
 static int i2c_demux_master_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
@@ -226,6 +226,8 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 	if (!priv || !props)
 		return -ENOMEM;
 
+	priv->num_chan = num_chan;
+
 	err = of_property_read_string(np, "i2c-bus-name", &priv->bus_name);
 	if (err)
 		return err;
@@ -248,8 +250,6 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 		of_changeset_init(&priv->chan[i].chgset);
 		of_changeset_update_property(&priv->chan[i].chgset, adap_np, &props[i]);
 	}
-
-	priv->num_chan = num_chan;
 	priv->dev = &pdev->dev;
 
 	platform_set_drvdata(pdev, priv);
-- 
2.34.1

