Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7030E569BF7
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 09:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiGGHoZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 03:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbiGGHoY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 03:44:24 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCBF32057;
        Thu,  7 Jul 2022 00:44:23 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675XdRx029339;
        Thu, 7 Jul 2022 09:44:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=FzRuHK4tWkYznjvDURmRBmnN2pVoDyOxzct0rhhn8ZM=;
 b=Nh9UpOZJKy/hyAI3Ii4MOTgeifNOaaepXpueWGwtn63wOV0xziNw9XMcm6fIZAjnbDpx
 FcoMv4anLr7ySL0+zNyZG5TEa6I2/JQfiMxadKx9CJOiut9HSS6OKefEG9Jm1hOdrCpb
 mLqRjJUMG8oduzzNJWQCSySFFYLv2fQ14Kyg+y9OHwmhd3I/5+6zjKQb9epFuvDWHRdZ
 m2d2mRjkDoMzec6CAq0uhcFCq6Fi0U2KCCCZ3qwA2Aoa+2z+ujcdggBhYQE/tGJZtTeE
 DMYgkxTMRFYSjlQebOyT/iIj/C8QtEY3A7w8oQrkp6Sw4gTuFDfDZDM757zLAMyCAlzh Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ubfb0uq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 09:44:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30E6F10002A;
        Thu,  7 Jul 2022 09:44:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C8D6210F8B;
        Thu,  7 Jul 2022 09:44:06 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:44:05 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH v2 0/2] i2c: stm32: addition of STM32MP13 support
Date:   Thu, 7 Jul 2022 09:44:00 +0200
Message-ID: <20220707074402.2429786-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds the support for the stm32mp13.

v2: drop the 2 first commits regarding reset handling due to the
    STM32MP13 reset being now available:
    https://lore.kernel.org/all/a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com/

Alain Volmat (2):
  dt-bindings: i2c: st,stm32-i2c: add entry for stm32mp13
  i2c: stm32: add support for the STM32MP13 soc

 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 2 ++
 drivers/i2c/busses/i2c-stm32f7.c                        | 7 +++++++
 2 files changed, 9 insertions(+)

-- 
2.25.1

