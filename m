Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49C11F1CD5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jun 2020 18:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbgFHQFt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 12:05:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58910 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730327AbgFHQFt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jun 2020 12:05:49 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 058G4brq146300;
        Mon, 8 Jun 2020 12:05:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31g77q9a0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 12:05:47 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058G5WxX151814;
        Mon, 8 Jun 2020 12:05:47 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31g77q99ym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 12:05:47 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058FpLx7018349;
        Mon, 8 Jun 2020 16:05:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma03wdc.us.ibm.com with ESMTP id 31gxfk5xvy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 16:05:45 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 058G5hsO32965044
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 8 Jun 2020 16:05:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D7EA06A04F;
        Mon,  8 Jun 2020 16:05:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 801DB6A047;
        Mon,  8 Jun 2020 16:05:44 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.140.245])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  8 Jun 2020 16:05:44 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        wsa@kernel.org, joel@jms.id.au, eajames@linux.ibm.com
Subject: [PATCH 0/2] i2c: fsi: Fixes for systems with more ports
Date:   Mon,  8 Jun 2020 11:05:42 -0500
Message-Id: <20200608160544.7134-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-08_14:2020-06-08,2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=1 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1011
 cotscore=-2147483648 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=759 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080115
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series fixes a register definition for the FSI-attached I2C master to
allow all the available ports. In addition, the code to add an adapter for
each port is modified to require a device-tree entry for the bus. This is so
that systems with lots of busses that have no devices on them don't add lots
of unecessary devices.

Eddie James (2):
  i2c: fsi: Fix the port number field in status register
  i2c: fsi: Prevent adding adapters for ports without dts nodes

 drivers/i2c/busses/i2c-fsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.24.0

