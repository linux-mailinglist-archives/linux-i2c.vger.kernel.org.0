Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A92B1F47E2
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 22:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387525AbgFIUQD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 16:16:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28526 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732949AbgFIUQD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 16:16:03 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059K3NHb067144;
        Tue, 9 Jun 2020 16:15:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31j6sewq99-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 16:15:58 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 059K40BD074241;
        Tue, 9 Jun 2020 16:15:58 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31j6sewq90-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 16:15:58 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 059KEYpt024258;
        Tue, 9 Jun 2020 20:15:57 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma02dal.us.ibm.com with ESMTP id 31g2sa17fj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 20:15:57 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 059KFuNd50856404
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Jun 2020 20:15:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A4429AE062;
        Tue,  9 Jun 2020 20:15:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D2237AE05F;
        Tue,  9 Jun 2020 20:15:55 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.141.69])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  9 Jun 2020 20:15:55 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        wsa@kernel.org, joel@jms.id.au, eajames@linux.ibm.com
Subject: [PATCH v2 0/2] i2c: fsi: Fixes for systems with more ports
Date:   Tue,  9 Jun 2020 15:15:53 -0500
Message-Id: <20200609201555.11401-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-09_14:2020-06-09,2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 cotscore=-2147483648 mlxlogscore=692
 suspectscore=1 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006090152
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series fixes a register definition for the FSI-attached I2C master to
allow all the available ports. In addition, the code to add an adapter for
each port is modified to require a device-tree entry for the bus. This is so
that systems with lots of busses that have no devices on them don't add lots
of unecessary devices.

Changes since v1:
 - Remove the check for null device node since that is checked in
   of_device_is_available

Eddie James (2):
  i2c: fsi: Fix the port number field in status register
  i2c: fsi: Prevent adding adapters for ports without dts nodes

 drivers/i2c/busses/i2c-fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.0

