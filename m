Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98CE6A4FAD
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 00:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjB0Xdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 18:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjB0Xdx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 18:33:53 -0500
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5015A1DB9C
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 15:33:52 -0800 (PST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RLpHMr019418;
        Mon, 27 Feb 2023 23:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TG/BaDVVamqPbyEuysD57blV5WUaAnvcnmZEWuI4sbA=;
 b=M1A6mWsaNWrP6/UlH+wGoVmRch46hOn8A8p+03enrusCr8o2+4Kkgyqo9UyoD3gdlgiD
 TcC3Y/NCSfIPmjw8x31pIK+72RLHbY/pg5xnZT1feXcy7ZRYPx2xZhLLkNODnem2bI/B
 bT6ly/CjsmxWlW5YzK+Chw1Q+LNJeeMXvRbVmCutpley50w/hc8l3vvnuWUEn+xKVh9J
 kfgw1b3xWcfDZ6yTzX1oKK5DZjGsdiaMu78RpfJItVx07VSQ6vIC5N8YJdOtbqCiiRoX
 8LhAOHUev0nt299xWt9I9NWUn4omxXGaq0i5AuYrp1WD9fTqqYzrmgtUA8HAx3KZ+z/W ng== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p14t4acgs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 23:33:45 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31QM0U9N015479;
        Mon, 27 Feb 2023 23:33:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
        by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nybdbhsau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 23:33:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
        by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31RNXf4e13500932
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Feb 2023 23:33:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 87F1B20043;
        Mon, 27 Feb 2023 23:33:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 141B520049;
        Mon, 27 Feb 2023 23:33:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Mon, 27 Feb 2023 23:33:41 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 42D03603CD;
        Tue, 28 Feb 2023 10:33:38 +1100 (AEDT)
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     arnd@arndb.de, Sven Peter <sven@svenpeter.dev>, mpe@ellerman.id.au,
        Benjamin Gray <bgray@linux.ibm.com>
Subject: [PATCH v2 2/2] i2c: Build I2C_PASEMI with COMPILE_TEST
Date:   Tue, 28 Feb 2023 10:33:18 +1100
Message-Id: <20230227233318.120415-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227233318.120415-1-bgray@linux.ibm.com>
References: <20230227233318.120415-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -JuABUq2TI2ynPVSD2CR83d618sq3tr_
X-Proofpoint-GUID: -JuABUq2TI2ynPVSD2CR83d618sq3tr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxlogscore=960 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270189
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver builds fine on non-power platforms, so add it to the
COMPILE_TEST set to increase build coverage.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index c42109e972fe..52b1aa164cda 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -890,7 +890,7 @@ config I2C_OWL
 
 config I2C_PASEMI
 	tristate "PA Semi SMBus interface"
-	depends on PPC_PASEMI && PCI
+	depends on (PPC_PASEMI && PCI) || COMPILE_TEST
 	help
 	  Supports the PA Semi PWRficient on-chip SMBus interfaces.
 
-- 
2.39.2

