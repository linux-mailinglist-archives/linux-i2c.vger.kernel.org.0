Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E757553048A
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348028AbiEVQ22 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242277AbiEVQ2X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:23 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A31140A5;
        Sun, 22 May 2022 09:28:19 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9BD06CCD3F;
        Sun, 22 May 2022 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236896; bh=IFedgtBwp9D2KJuEP5HWLqXXyvyVv6MDZe6OMaClztA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=u1E75YC2lj5dxIsJOBIvz17uyyEXx8OSQOcZtalAIP3a0i/04ScLtRAdSmXysAJpt
         JUlBndwXYjqmCNHyBEOBmeVT7SK8QaIaaNhB44K/jE0VaP4zsJaHAHQSLyNqDyNPld
         hEI56rG80N+d92PeTjcocdlOScqjey6EuhARYS8A=
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
Subject: [RFC PATCH 03/14] media: camss: vfe: Add support for 8x74
Date:   Sun, 22 May 2022 18:27:51 +0200
Message-Id: <20220522162802.208275-4-luca@z3ntu.xyz>
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

VFE hardware modules on 8x74 and 8x16 are similar.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5b148e9f8134..ace53ed24884 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -170,7 +170,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 {
 	struct vfe_device *vfe = to_vfe(line);
 
-	if (vfe->camss->version == CAMSS_8x16)
+	if (vfe->camss->version == CAMSS_8x16 ||
+		vfe->camss->version == CAMSS_8x74)
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_2X8:
 		{
@@ -1286,6 +1287,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	switch (camss->version) {
 	case CAMSS_8x16:
+	case CAMSS_8x74:
 		vfe->ops = &vfe_ops_4_1;
 		break;
 	case CAMSS_8x96:
@@ -1390,7 +1392,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		init_completion(&l->output.sof);
 		init_completion(&l->output.reg_update);
 
-		if (camss->version == CAMSS_8x16) {
+		if (camss->version == CAMSS_8x16 ||
+			camss->version == CAMSS_8x74) {
 			if (i == VFE_LINE_PIX) {
 				l->formats = formats_pix_8x16;
 				l->nformats = ARRAY_SIZE(formats_pix_8x16);
-- 
2.36.0

