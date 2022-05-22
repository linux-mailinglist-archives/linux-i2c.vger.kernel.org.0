Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2AA530487
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349163AbiEVQ2d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348017AbiEVQ22 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:28 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4BB14087;
        Sun, 22 May 2022 09:28:27 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 188C6CCD4E;
        Sun, 22 May 2022 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236900; bh=ZlU+QqaeeUpgg6ydwdW9tHYSbBg1JjP1qdMb8cM8JSE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hP3NdJf6PTBiI/nZloaHgFq06IVg0B4nvzxBOzwW1puRDXe7bq3v9VvUKjhtE3ZAn
         tWEeap2QOohVKt/BdbTAWCpfv23yPfccYqkUeOapjMPbABlc8d9MSEMG/Ru5uF5Zad
         P7JbsE9Np1pU1STE6hVEcHDsT0xZKNJGpJRN/uZ8=
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
Subject: [RFC PATCH 14/14] [DNM] media: camss: hacks for MSM8974
Date:   Sun, 22 May 2022 18:28:02 +0200
Message-Id: <20220522162802.208275-15-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
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

Remove IOMMU_DMA dependency from VIDEO_QCOM_CAMSS: We don't have IOMMU
on msm8974 yet.

DMA_SG -> DMA_CONTIG: Taking a photo without this works but is offset
and doing weird stuff.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/media/platform/qcom/camss/Kconfig       |  4 ++--
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf..e382fd77ecc3 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -2,8 +2,8 @@ config VIDEO_QCOM_CAMSS
 	tristate "Qualcomm V4L2 Camera Subsystem driver"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
-	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on ARCH_QCOM || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index ca955808fd6d..885a809cc941 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -13,7 +13,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "camss-video.h"
 #include "camss.h"
@@ -410,15 +410,15 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
+	//struct sg_table *sgt;
 	unsigned int i;
 
 	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
+		//sgt = vb2_dma_sg_plane_desc(vb, i);
+		//if (!sgt)
+		//	return -EFAULT;
 
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
+		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i); //sg_dma_address(sgt->sgl);
 	}
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -966,7 +966,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.36.0

