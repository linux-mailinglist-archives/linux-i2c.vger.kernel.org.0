Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B4F6A39D1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 04:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjB0DzA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 22:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjB0Dy7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 22:54:59 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2F018151
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 19:54:47 -0800 (PST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R3NhA9026423;
        Mon, 27 Feb 2023 03:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=V9BlT8isM4/It8yT2TBcpHa2vgK4FTgcVCPoesydvks=;
 b=bwx9HIJ9JkKbmITk9SqriB5aCVkhNTRjIetFsV/YBvAt0/UIn+ZWBzxNWlkdjeySluZW
 XPDrgO+gx+nC6F6phklrGvFKR/OsAMpp2clvndZufAtv63FnZie7Z65Vfzo9xukT4Ez4
 2kiGnv9yVXGamBh+VDYzXw6lTqI9A8AtDKVKf4mz1bZpCHMjyFdIiPA3yTXeHRCHtqMh
 zlzNAtWfx9Pg7LDnMbkrnXBobHDUIsb8PdQsm34AlRl7Pv/fVvbvTe642GY+opXpdx5h
 Ns17eBXv2UBQoKLb3VLBGQojD0e9EyS2Lzqvhu8xtZYQm+MB40N6AQ0QnVE/DSJLvLw/ IQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nyv9164ff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 03:54:39 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31PKQkmw008599;
        Mon, 27 Feb 2023 03:54:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
        by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nybe2h3xu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 03:54:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
        by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31R3sZQQ18153738
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Feb 2023 03:54:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3759020043;
        Mon, 27 Feb 2023 03:54:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A944220040;
        Mon, 27 Feb 2023 03:54:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Mon, 27 Feb 2023 03:54:34 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC4F2600E5;
        Mon, 27 Feb 2023 14:54:29 +1100 (AEDT)
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gray <bgray@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] i2c: Disable I2C_APPLE on PPC when COMPILE_TEST is set
Date:   Mon, 27 Feb 2023 14:54:14 +1100
Message-Id: <20230227035414.1461763-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h0dF6QY3QPDR3A1jOrKYOwoeWQqLSnGY
X-Proofpoint-GUID: h0dF6QY3QPDR3A1jOrKYOwoeWQqLSnGY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 suspectscore=0 mlxlogscore=486
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302270026
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ppc64le_allmodconfig sets I2C_PASEMI=y and leaves COMPILE_TEST to
default to y and I2C_APPLE to default to m, running into a known
incompatible configuration that breaks the build [1].

Disable the I2C_APPLE build during PPC compile tests to prevent this.

[1]: https://lore.kernel.org/all/202112061809.XT99aPrf-lkp@intel.com

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d4975444a32d..3db56e446902 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -896,7 +896,7 @@ config I2C_PASEMI

 config I2C_APPLE
 	tristate "Apple SMBus platform driver"
-	depends on ARCH_APPLE || COMPILE_TEST
+	depends on ARCH_APPLE || (COMPILE_TEST && !PPC)
 	default ARCH_APPLE
 	help
 	  Say Y here if you want to use the I2C controller present on Apple

base-commit: ec0a1b360aec1ba0bdfad3dd69e300b028529c0d
--
2.39.2
