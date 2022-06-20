Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C7E55165C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 12:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbiFTK4n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbiFTK4m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 06:56:42 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1108F140CF;
        Mon, 20 Jun 2022 03:56:41 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8uEj5025763;
        Mon, 20 Jun 2022 12:56:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=TgKmrf9wxKkQaazvxz3DbIcJts9iFusl9pgYYdjJWD0=;
 b=bYpiaJnA2GjrShUhsH7wRKK1uapYBtpfdt34/fWN2scEpo4zjHghC+DM9VBf8AWOmeke
 KTYdRVOqDAPdcuh6XDlUMyS5Gg6ilGy4znRvcwSOscSdRQ9x1tvrQfQwT9iBcCi+op+H
 OFASW0sS10A5D88hNvXE59ISnmX2mbCK39jyTQbwaniZ4qBWWUtwG9d2uKtIiXrQnFDS
 Y/vnWTXOJx+vH0cbcNKrY+iXH8ouQfQ4mmMt5ktfN8yNSljO/HGfwv5Law2OcoVQJLi8
 g15cmGpxkWSR23Tk1sVISJOtXrLjiDge9uWPh/vtlZo7XWUwoKdDsZZH/p/ZJQxW3tuw Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtntu0rbx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Jun 2022 12:56:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4686A10002A;
        Mon, 20 Jun 2022 12:56:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E87C21BF7E;
        Mon, 20 Jun 2022 12:56:16 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 12:56:15 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 0/4] i2c: stm32: addition of STM32MP13 support
Date:   Mon, 20 Jun 2022 12:54:01 +0200
Message-ID: <20220620105405.145959-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds the support for the stm32mp13.

Alain Volmat (4):
  dt-bindings: i2c: st,stm32-i2c: don't mandate a reset line
  i2c: stm32: only perform a reset if there is a reset property
  dt-bindings: i2c: st,stm32-i2c: add entry for stm32mp13
  i2c: stm32: add support for the STM32MP13 soc

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  3 ++-
 drivers/i2c/busses/i2c-stm32f7.c              | 20 +++++++++++++------
 2 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.25.1

