Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C675304A1
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350119AbiEVQ3W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349885AbiEVQ3I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:29:08 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13F83BA53;
        Sun, 22 May 2022 09:28:54 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3925ACCD42;
        Sun, 22 May 2022 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236897; bh=Z+OJGa1Upy60KMZOvZpycQ7yyyNT0Zo+p/WeDLbPSN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=B6TZQEWkDFp+qwDk/WMeNG1Pq3VsYA8P2YgW7HoQUfFa+4yBek68T1mSJSD54IrqI
         Vrw0m1eJEVp70b3iWsWROGKkuAECPwruxRDTJMnS4ixTBqvWDR/MMFZZIhk4T/sAUe
         PeyYgAjkN00lTxvaLhggf+sPob5Epjy5IAaH46+c=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH 05/14] media: camss: csid: Add support for 8x74
Date:   Sun, 22 May 2022 18:27:53 +0200
Message-Id: <20220522162802.208275-6-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

CSID hardware module on 8x74 is similar to 8x16.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index f993f349b66b..6b5cd9a66ff6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -570,7 +570,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->camss = camss;
 	csid->id = id;
 
-	if (camss->version == CAMSS_8x16) {
+	if (camss->version == CAMSS_8x16 ||
+		camss->version == CAMSS_8x74) {
 		csid->ops = &csid_ops_4_1;
 	} else if (camss->version == CAMSS_8x96 ||
 		   camss->version == CAMSS_660) {
-- 
2.36.0

