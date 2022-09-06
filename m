Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CA55AF5D4
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 22:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiIFU2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 16:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiIFU2u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 16:28:50 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0151E3D7;
        Tue,  6 Sep 2022 13:28:49 -0700 (PDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286JmopI016577;
        Tue, 6 Sep 2022 20:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PfgIECtpimJcWSXMD37YPdw5nejOlzQMwZX5sjx0rds=;
 b=Ex0w9KqrVrekQOv1L0idUFTZayBV70ZMFfz4sXuD2RzY3gEiswnCPKF+Ab6MrW+VNTLZ
 XJ0hPjLtvrsoyF8SajoZI+O6i92WaoUMG4BvIiZ+7K5FBuNkhrO3kD9EXWi46IW0nobY
 G2BCYXY4q1czuPh/U0IsiUMMuW/ZXq1XYyTrqm/RZIaO3TQgHYIMK09wS0dL/CjLZmzE
 cudTqtiCV9XTpVL1SuKQSxFK8mPVf8TBKMU/S86OMhd64eKQTHfzQxgn9YSRodL96Lsz
 m6U01bgOL++hksat83h1f0vugq/0Xni6IEOxfNsIYhfK71IeEkXFONqIJOLA34lbhJuH IA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jecpq10wy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:28:33 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286KLgO0012234;
        Tue, 6 Sep 2022 20:28:31 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma04wdc.us.ibm.com with ESMTP id 3jbxj9npee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:28:31 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286KSVrg64815436
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Sep 2022 20:28:31 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0D74DB205F;
        Tue,  6 Sep 2022 20:28:31 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 42106B2065;
        Tue,  6 Sep 2022 20:28:30 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.74.237])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  6 Sep 2022 20:28:30 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, wsa@kernel.org, peda@axentia.se,
        jic23@kernel.org, lars@metafoo.de, miltonm@us.ibm.com,
        joel@jms.id.au, eajames@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] i2c: core: Add mux root adapter operations
Date:   Tue,  6 Sep 2022 15:28:27 -0500
Message-Id: <20220906202829.1921114-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PWq_bl0vnowXt3Us5pA0oGg2Dd34HIr6
X-Proofpoint-ORIG-GUID: PWq_bl0vnowXt3Us5pA0oGg2Dd34HIr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060093
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C clients need the ability to control the root I2C bus even if the
endpoint device is behind a mux. For example, a driver for a chip that
can't handle any I2C traffic on the bus while coming out of reset
(including an I2C-driven mux switching channels) may need to lock the root
bus with the mux selection fixed for the entire time the device is in
reset.
The SI7020 is such a device. This series adds the ability to the I2C core
to lock the root adapter of a client and fix the mux channel selection
until unlocked. The patch to the SI7020 driver then uses the new functions
to do just that and make sure the chip reset is safe.
I included the IIO patch for context, I can split and resubmit to iio list
only if necessary.
Thanks to Milton for the general idea here.

Changes since v1:
 - Correct spelling of i2c_unlock_deselect_bus comment.

Eddie James (2):
  i2c: core: Add mux root adapter operations
  iio: si7020: Lock root adapter to wait for reset

 drivers/i2c/i2c-core-base.c   | 38 ++++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c         | 50 +++++++++++++++++++++++++++++++++++
 drivers/iio/humidity/si7020.c | 16 +++++++++--
 include/linux/i2c.h           | 42 +++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+), 2 deletions(-)

-- 
2.31.1

