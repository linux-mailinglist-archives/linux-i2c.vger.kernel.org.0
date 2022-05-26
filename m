Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D76535525
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 22:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349026AbiEZUyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 16:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349038AbiEZUyE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 16:54:04 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39D9A8883;
        Thu, 26 May 2022 13:54:02 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QKduaN018425;
        Thu, 26 May 2022 20:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+xwtPWXD6jklB5VE6pY1RrdR5caYCf9Ug8zV9JHB4Bg=;
 b=Rahz6vBgUbX2cUuTgRoI7Fxkx1/qFqT8FL2xSxbkeRRwC07Jq3awW1CPZO/lpiKoNHj3
 YyrSwXgetVjZK+EtuNUj6ID6tYl1lt+/LvUzN5dQI6fweKd7P+zSmMiDWbo+fRCFwCpG
 APXrw6ayvF+87Ku6rb1ogEDHAuVJQRZwIurqjeSAYGw5f9JBCHPnU10rmYVW22rhga2A
 w5mWSWF2cX3IOGW80H04ZR5ZIMJoyOlZs21KykVy1GmHX/g5V+2tHia76dx3TNJpcCS4
 C5Wo4IZup3yi+qDzS7DG6mWxS/6FggzC5T9VKANlqkJxCGlx7rqRSvlv+NfIiSjZMuZQ dA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gag42ry48-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 May 2022 20:53:37 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24QKoarj018563;
        Thu, 26 May 2022 20:53:36 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03wdc.us.ibm.com with ESMTP id 3gabgma8rw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 May 2022 20:53:36 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24QKrZMI32309680
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 May 2022 20:53:35 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6E8A46A04F;
        Thu, 26 May 2022 20:53:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF2A16A051;
        Thu, 26 May 2022 20:53:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.46.254])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 26 May 2022 20:53:34 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, peda@axentia.se, jic23@kernel.org, lars@metafoo.de,
        eajames@linux.ibm.com, miltonm@us.ibm.com, joel@jms.id.au
Subject: [PATCH 0/2] i2c: core: Add mux root adapter operations
Date:   Thu, 26 May 2022 15:53:32 -0500
Message-Id: <20220526205334.64114-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -VpWsnc8H_tvs1846hlgJBmKfieTH_Iz
X-Proofpoint-ORIG-GUID: -VpWsnc8H_tvs1846hlgJBmKfieTH_Iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_10,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=846 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260095
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

Eddie James (2):
  i2c: core: Add mux root adapter operations
  iio: si7020: Lock root adapter to wait for reset

 drivers/i2c/i2c-core-base.c   | 38 ++++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c         | 50 +++++++++++++++++++++++++++++++++++
 drivers/iio/humidity/si7020.c | 16 +++++++++--
 include/linux/i2c.h           | 42 +++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+), 2 deletions(-)

-- 
2.27.0

