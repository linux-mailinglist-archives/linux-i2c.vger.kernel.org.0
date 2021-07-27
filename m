Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6D03D7A6F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 18:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhG0QDf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 12:03:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2040 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230130AbhG0QDc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 12:03:32 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16RFpo5S001144;
        Tue, 27 Jul 2021 12:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HDvKu8WaTUsEecYqW26lv3BDYg3y0cz/yQMfDphWoYA=;
 b=EVvUmCteqcDp5qGhIW19hs88Jz2qZWJlJBBrvPi2ljIwaqySnQXxy7DboHgLFGOVDUtF
 xrFU8O2W1QAD4PdUpaD4zRI3Lnkjsog71j7jUeo6l3/y2rHxeJIEVSjplefFsuyf/KVy
 xlJjEA6ZPskeo4D4o/AIbV9VRkm9Mc5pJQjIWCEh8dBo2HsnsliQQG49V/KlHUhLjqII
 8brzDUdW0W7257QkbLwDDJSKmOsUOY1+ij4hsQs9EiZCuEilVVjh+7pLcgE3HGZ+sqis
 oBmSYDFaHpTs9ufWcmAQrxL5r1a1TLLe7sM722Ll9zxfkxB0FHtqlgk2D5S/J7wcqxRF 8A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3a2n5n0au1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 12:03:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RG24rF014388;
        Tue, 27 Jul 2021 16:03:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma03wdc.us.ibm.com with ESMTP id 3a235mj9k1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 16:03:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16RG3Lg239190886
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 16:03:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5D1C9BE056;
        Tue, 27 Jul 2021 16:03:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 05274BE063;
        Tue, 27 Jul 2021 16:03:20 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.139.59])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 27 Jul 2021 16:03:20 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        peda@axentia.se, robh+dt@kernel.org,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 0/2] i2c: mux: pca954x: Support multiple devices on a single reset line
Date:   Tue, 27 Jul 2021 11:03:13 -0500
Message-Id: <20210727160315.15575-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b-1ZKOAM0QSmdRfTC6xd-jpr7O-atpsd
X-Proofpoint-ORIG-GUID: b-1ZKOAM0QSmdRfTC6xd-jpr7O-atpsd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-27_10:2021-07-27,2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270093
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some systems connect several PCA954x devices to a single reset GPIO. For
these devices to get out of reset and probe successfully, each device must
defer the probe until the GPIO has been hogged. Accomplish this by
attempting to grab a new "reset-shared-hogged" devicetree property, but
expect it to fail with EPROBE_DEFER or EBUSY.

Changes since v1:
 - Rework the patch to use a new devicetree property that we don't expect to
   successfully obtain

Eddie James (2):
  dt-bindings: i2c: i2c-mux-pca954x: Define the reset-shared-hogged gpio
  i2c: mux: pca954x: Support multiple devices on a single reset line

 .../bindings/i2c/i2c-mux-pca954x.yaml         |  5 ++
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 46 +++++++++++++++----
 2 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.27.0

