Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A1152C49C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 22:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242706AbiERUlo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 16:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242694AbiERUln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 16:41:43 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105166E8EE;
        Wed, 18 May 2022 13:41:41 -0700 (PDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IJOkO9008508;
        Wed, 18 May 2022 20:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4UonT80lvmkz00sXipHvDDJWcEyXpjZqCzZcHJL6C4I=;
 b=Ngo7HLUUNDFfPCrWZPVOR7vZtgaSBkdJ18WJk7a0RETXXF058HcbO24glgglC5+4tB6f
 zhVcS9OnMwluenB69p1rPugCRI3Uvr+jWabYGS6JnCa+Lfq+kRB+k1apnwQrt+D0xUn0
 ixM5V/i9SZZCXGVB3+gqshkymtsTfPBjXCivTJoFSZ9OfGzkwug3jnt0qaqrtLhQfKwt
 Rv5MteFcbJyTFHjN/knm+/Lws4rfMpBCQsntM0h3t701UUYfILbfyPjpbLFZlOrfKWEH
 q+tKWBUPBekXxAUKpYYHxWIW0iZ3zttW6oinOK+GCpKH+rJhR99Q+i5830M/nkXf/sw5 Xw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g56x5sgky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 20:41:24 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IKbauZ030855;
        Wed, 18 May 2022 20:41:23 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma02wdc.us.ibm.com with ESMTP id 3g2429y1t6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 20:41:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24IKfMaB30867956
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 May 2022 20:41:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C0311C605D;
        Wed, 18 May 2022 20:41:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 481BDC605B;
        Wed, 18 May 2022 20:41:22 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.6.139])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 18 May 2022 20:41:22 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        jic23@kernel.org, lars@metafoo.de, wsa@kernel.org,
        milton@us.ibm.com, peda@axentia.se,
        Eddie James <eajames@linux.ibm.com>
Subject: [RFC 0/2] i2c: core and si7020: Add adapter transfer callback
Date:   Wed, 18 May 2022 15:41:17 -0500
Message-Id: <20220518204119.38943-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FHuP_YkgLd0JCH8ixA0a6Ua6It7DkdOT
X-Proofpoint-GUID: FHuP_YkgLd0JCH8ixA0a6Ua6It7DkdOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 mlxlogscore=917
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180119
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds a callback function pointer to be executed after the
adapter performs a transfer. The purpose of such a callback is for a
client to execute some code while "owning" the bus entirely. Holding the
adapter lock is insufficient in the case where the client is behind a
mux, as the mux driver could perform mux selection operations on the
bus while locked. The only use case for now is the SI7020 driver. While
the SI7020 is starting up after power on or reset, any I2C commands on the
bus can potentially upset the startup sequence. Since the SI7020 may be
behind a mux, the driver needs to use the new transfer callback to sleep
while the chip starts up.

Eddie James (2):
  i2c: core: Add adapter transfer callback
  iio: humidity: si7020: Use core transfer callback to sleep after reset

 drivers/i2c/i2c-core-base.c   |  3 +++
 drivers/iio/humidity/si7020.c | 12 ++++++++++--
 include/linux/i2c.h           | 25 +++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.27.0

