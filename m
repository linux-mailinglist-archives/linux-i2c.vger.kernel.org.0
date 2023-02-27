Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2B36A4FAE
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 00:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjB0Xd5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 18:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjB0Xd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 18:33:56 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F5C1E9E0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 15:33:54 -0800 (PST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RMrFSH023329;
        Mon, 27 Feb 2023 23:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=QZroA+A019b9S7mP+rSh6gAq0WH3R1H9WM0SiZT0J7o=;
 b=Cao85OPbbIQIwycsZbLfpGvhF4+xx0akgum02s8ra0FcOiMScNQk1sEXGZrU0Qxzx04d
 nMJGJgztKQsEUZAXMuzxy3t6tCMz8B1PGy78aRkmjioaq/jENLjI0DGJPDmOXWE1SPCJ
 YoYPInhqHb/84YqsDbDMZusFuvEda7OseAWfWkpvFDIvJuZaV/ZGH45eCcxBKbgzFNXs
 Yc2/dlomI8602q21irISq9c/3iM7RJWlBzCQhlgzpxIygLv7gnz3d6s1xgpRq1BmS9I6
 f/8/8x09Z6LLFsdsuAqDLFyIKwevF1u/4Z1pSUU05niWY+yF7Brx54RNqoPdUgRGVnRP yw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p15ptrsuv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 23:33:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31RJhs3C014801;
        Mon, 27 Feb 2023 23:33:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
        by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nybcq2exw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 23:33:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
        by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31RNXf3A28050026
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Feb 2023 23:33:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8BC122004F;
        Mon, 27 Feb 2023 23:33:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 17E712004B;
        Mon, 27 Feb 2023 23:33:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Mon, 27 Feb 2023 23:33:41 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3FC63600E5;
        Tue, 28 Feb 2023 10:33:38 +1100 (AEDT)
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     arnd@arndb.de, Sven Peter <sven@svenpeter.dev>, mpe@ellerman.id.au,
        Benjamin Gray <bgray@linux.ibm.com>
Subject: [PATCH v2 1/2] i2c: Disable I2C_APPLE when I2C_PASEMI is a builtin
Date:   Tue, 28 Feb 2023 10:33:17 +1100
Message-Id: <20230227233318.120415-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fI_5SXMl-8HkInKQD1J2y3OGfiL5rnGH
X-Proofpoint-GUID: fI_5SXMl-8HkInKQD1J2y3OGfiL5rnGH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=682 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270189
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
incompatible configuration that breaks the build [1]. Specifically,
a common dependency (i2c-pasemi-core.o in this case) cannot be used by
both builtin and module consumers.

Disable I2C_APPLE when I2C_PASEMI is a builtin to prevent this.

[1]: https://lore.kernel.org/all/202112061809.XT99aPrf-lkp@intel.com

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v1: https://lore.kernel.org/linux-i2c/20230227035414.1461763-1-bgray@linux.ibm.com/
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d4975444a32d..c42109e972fe 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -896,6 +896,7 @@ config I2C_PASEMI
 
 config I2C_APPLE
 	tristate "Apple SMBus platform driver"
+	depends on !I2C_PASEMI
 	depends on ARCH_APPLE || COMPILE_TEST
 	default ARCH_APPLE
 	help

base-commit: ec0a1b360aec1ba0bdfad3dd69e300b028529c0d
-- 
2.39.2

