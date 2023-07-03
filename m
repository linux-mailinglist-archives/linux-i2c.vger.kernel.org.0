Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422857463D9
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 22:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjGCUPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 16:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjGCUPm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 16:15:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA8810C7
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 13:15:39 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fba86f069bso4310286e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688415338; x=1691007338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dx8H6sR/Wv2lHyyH91PCRRhoBDKfFC/7awuySX6sc+E=;
        b=YyemVdJZZqqcZbDGfgvusKo2ajz+JVnopYNJiLCRxt2ywCwTrXh+7M/5CbUDdsR0Z8
         eVnvoPuTIAePA8vPamG+WnaOTRUH/qn4CIWOGDrFsNz2LZA5HgwGin6GG2QutMWm2Da2
         nnTLPtnt6Y07zh+Hf6/iQEJIUWpnuEPs+ajUtN0GGkrmkDAnSgWdUsgivipOhAu0deZs
         VFYhw+cs7arZbngrfeqBU/ZM4870/rTuO7J6kPTHT/gwqd+l3l99pJDufWTulTZPbZso
         kilaOQSR27LbGC8cb7PtiWFWGCAhZxkOx41RCV+GUyiO4tTmVdm2dlkrOpvmeby3r/N9
         Z4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688415338; x=1691007338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dx8H6sR/Wv2lHyyH91PCRRhoBDKfFC/7awuySX6sc+E=;
        b=dq4+9hUICgdyqSoKihYW+tJ9cvaMEGgTgC8Bj6vHuh6FAJiTGo32fL4VYJgjVr/OXe
         APykqUwqSfzZyhF322fArmiZBSNRfki/H3E7Cw1sJ4wNMHqlEwR665JZ1pRC4Gk+4dKa
         ecqj5yL4pEFlcmU9A3q0HiTVe0H09yuY6hqJRnbMJSNSdbxXmF0NIF90OzeCJwJiaXQC
         utmCqvw4WTZ3XgqKjIcyMya2ibLPbQxNK5Uh4hJK+gv3jjGRQJTF9W09Su4D8RBVpvhR
         S6VDf8KAjVOzlwug46mvV5eZVvwemIZl7uVtu6pW0mttE2K8zux460YQR0ILPDhD7nHa
         Pj7g==
X-Gm-Message-State: ABy/qLZPHo5/RZJh1jAJZaTsIZEH0AMp8yKJbI0SlWIglpuLKrFy/bPY
        oJqPPh3JwQWc+YGZPk+M7V218A==
X-Google-Smtp-Source: APBJJlEq68Mqj65mEs/wSXMg9a5XlDwCIh82LYS0i+587pB9e/O8fA2YMH2Sazury+OS2GI4uEsczA==
X-Received: by 2002:ac2:5f43:0:b0:4fb:7675:1c16 with SMTP id 3-20020ac25f43000000b004fb76751c16mr6518599lfz.49.1688415337880;
        Mon, 03 Jul 2023 13:15:37 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id w27-20020a05651204db00b004fba7edc6cesm1991365lfq.7.2023.07.03.13.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 13:15:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 22:15:27 +0200
Subject: [PATCH v2 3/4] interconnect: qcom: sm8250: Fix QUP0 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v2-3-9ba0a9460be2@linaro.org>
References: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688415328; l=5018;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=LIjpAgT5yWqObE8kRNFk8ncn1fTyVzW6dI2ChOcbjrg=;
 b=4v/po983D07jXh44YYiZvz1jD5J/kLLTGZamo0Q1lccrpxJJ/V5rSB3dAw/fgc6+AANio9T6A
 SOfqyWfPJjDD/44Q6iKoLQJeOnj7WRiAZBMnP+S4UkcBvYqudZd/VSe
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The QUP0 BCM relates to some internal property of the QUPs, and should
be configured independently of the path to the QUP. In line with other
platforms expose QUP_CORE endpoints in order allow this configuration.

Fixes: 6df5b349491e ("interconnect: qcom: Add SM8250 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm8250.c | 74 ++++++++++++++++++++++++++++++++++++--
 drivers/interconnect/qcom/sm8250.h |  6 ++++
 2 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8250.c b/drivers/interconnect/qcom/sm8250.c
index e3bb008cb219..d3d0196902cd 100644
--- a/drivers/interconnect/qcom/sm8250.c
+++ b/drivers/interconnect/qcom/sm8250.c
@@ -164,6 +164,54 @@ DEFINE_QNODE(xs_pcie_modem, SM8250_SLAVE_PCIE_2, 1, 8);
 DEFINE_QNODE(xs_qdss_stm, SM8250_SLAVE_QDSS_STM, 1, 4);
 DEFINE_QNODE(xs_sys_tcu_cfg, SM8250_SLAVE_TCU, 1, 8);
 
+static struct qcom_icc_node qup0_core_master = {
+	.name = "qup0_core_master",
+	.id = SM8250_MASTER_QUP_CORE_0,
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.links = { SM8250_SLAVE_QUP_CORE_0 },
+};
+
+static struct qcom_icc_node qup1_core_master = {
+	.name = "qup1_core_master",
+	.id = SM8250_MASTER_QUP_CORE_1,
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.links = { SM8250_SLAVE_QUP_CORE_1 },
+};
+
+static struct qcom_icc_node qup2_core_master = {
+	.name = "qup2_core_master",
+	.id = SM8250_MASTER_QUP_CORE_2,
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.links = { SM8250_SLAVE_QUP_CORE_2 },
+};
+
+static struct qcom_icc_node qup0_core_slave = {
+	.name = "qup0_core_slave",
+	.id = SM8250_SLAVE_QUP_CORE_0,
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup1_core_slave = {
+	.name = "qup1_core_slave",
+	.id = SM8250_SLAVE_QUP_CORE_1,
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup2_core_slave = {
+	.name = "qup2_core_slave",
+	.id = SM8250_SLAVE_QUP_CORE_2,
+	.channels = 1,
+	.buswidth = 4,
+};
+
 DEFINE_QBCM(bcm_acv, "ACV", false, &ebi);
 DEFINE_QBCM(bcm_mc0, "MC0", true, &ebi);
 DEFINE_QBCM(bcm_sh0, "SH0", true, &qns_llcc);
@@ -172,7 +220,7 @@ DEFINE_QBCM(bcm_ce0, "CE0", false, &qxm_crypto);
 DEFINE_QBCM(bcm_mm1, "MM1", false, &qnm_camnoc_hf, &qxm_mdp0, &qxm_mdp1);
 DEFINE_QBCM(bcm_sh2, "SH2", false, &alm_gpu_tcu, &alm_sys_tcu);
 DEFINE_QBCM(bcm_mm2, "MM2", false, &qns_mem_noc_sf);
-DEFINE_QBCM(bcm_qup0, "QUP0", false, &qhm_qup1, &qhm_qup2, &qhm_qup0);
+DEFINE_QBCM(bcm_qup0, "QUP0", false, &qup0_core_master, &qup1_core_master, &qup2_core_master);
 DEFINE_QBCM(bcm_sh3, "SH3", false, &qnm_cmpnoc);
 DEFINE_QBCM(bcm_mm3, "MM3", false, &qnm_camnoc_icp, &qnm_camnoc_sf, &qnm_video0, &qnm_video1, &qnm_video_cvp);
 DEFINE_QBCM(bcm_sh4, "SH4", false, &chm_apps);
@@ -193,7 +241,6 @@ DEFINE_QBCM(bcm_sn11, "SN11", false, &qnm_gemnoc);
 DEFINE_QBCM(bcm_sn12, "SN12", false, &qns_pcie_modem_mem_noc, &qns_pcie_mem_noc);
 
 static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
-	&bcm_qup0,
 	&bcm_sn12,
 };
 
@@ -222,10 +269,29 @@ static const struct qcom_icc_desc sm8250_aggre1_noc = {
 
 static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
 	&bcm_ce0,
-	&bcm_qup0,
 	&bcm_sn12,
 };
 
+static struct qcom_icc_bcm * const qup_virt_bcms[] = {
+	&bcm_qup0,
+};
+
+static struct qcom_icc_node *qup_virt_nodes[] = {
+	[MASTER_QUP_CORE_0] = &qup0_core_master,
+	[MASTER_QUP_CORE_1] = &qup1_core_master,
+	[MASTER_QUP_CORE_2] = &qup2_core_master,
+	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
+	[SLAVE_QUP_CORE_1] = &qup1_core_slave,
+	[SLAVE_QUP_CORE_2] = &qup2_core_slave,
+};
+
+static const struct qcom_icc_desc sm8250_qup_virt = {
+	.nodes = qup_virt_nodes,
+	.num_nodes = ARRAY_SIZE(qup_virt_nodes),
+	.bcms = qup_virt_bcms,
+	.num_bcms = ARRAY_SIZE(qup_virt_bcms),
+};
+
 static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 	[MASTER_A2NOC_CFG] = &qhm_a2noc_cfg,
 	[MASTER_QDSS_BAM] = &qhm_qdss_bam,
@@ -518,6 +584,8 @@ static const struct of_device_id qnoc_of_match[] = {
 	  .data = &sm8250_mmss_noc},
 	{ .compatible = "qcom,sm8250-npu-noc",
 	  .data = &sm8250_npu_noc},
+	{ .compatible = "qcom,sm8250-qup-virt",
+	  .data = &sm8250_qup_virt },
 	{ .compatible = "qcom,sm8250-system-noc",
 	  .data = &sm8250_system_noc},
 	{ }
diff --git a/drivers/interconnect/qcom/sm8250.h b/drivers/interconnect/qcom/sm8250.h
index 209ab195f21f..032665093c5b 100644
--- a/drivers/interconnect/qcom/sm8250.h
+++ b/drivers/interconnect/qcom/sm8250.h
@@ -158,5 +158,11 @@
 #define SM8250_SLAVE_VSENSE_CTRL_CFG		147
 #define SM8250_SNOC_CNOC_MAS			148
 #define SM8250_SNOC_CNOC_SLV			149
+#define SM8250_MASTER_QUP_CORE_0		150
+#define SM8250_MASTER_QUP_CORE_1		151
+#define SM8250_MASTER_QUP_CORE_2		152
+#define SM8250_SLAVE_QUP_CORE_0			153
+#define SM8250_SLAVE_QUP_CORE_1			154
+#define SM8250_SLAVE_QUP_CORE_2			155
 
 #endif

-- 
2.41.0

