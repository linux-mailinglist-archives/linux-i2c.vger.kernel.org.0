Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044C63D7A6D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 18:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhG0QD3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 12:03:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38968 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229441AbhG0QD3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 12:03:29 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16RFgWEH103302;
        Tue, 27 Jul 2021 12:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tzEgKGyj8W0dnaCzQaQnjISWyFObQwE3HIBtnrO+VzQ=;
 b=apDqCTUHa4DBmwxrJYhghtEQs+sYiPjUMqUt2QSX8rde87Tg1FJBY5Ysu08GMALCcFEg
 UzAz2BIUzhnt1+Kb9isfBIIewKBNBofUcMM4OfQ2Pkp+1XDv0wPXwi0DFos6iyklRTuz
 BIS8yW3f2E2EU1Mgo2dE9emXHLDeLI78D9TeGK6/7KtNlcxVQkfpOLgh4wu22Cg0GaOj
 vb4F0bBWdzO5DECULETjzlLPNQm0szJVYbgpNmo0Q48q1gl8FACtfE+J9Qm62+nesSlN
 O6a2A5VotfiyVAnY9+6dlnCN/2fJrWG1C4tmpSI9IZgC+duM3YPh1u9dulu0W98Flaog Uw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3a2mhb9wq6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 12:03:23 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RG2IAn006929;
        Tue, 27 Jul 2021 16:03:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma01wdc.us.ibm.com with ESMTP id 3a236128bf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 16:03:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16RG3LBE25755996
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 16:03:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C6E58BE063;
        Tue, 27 Jul 2021 16:03:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 78218BE04F;
        Tue, 27 Jul 2021 16:03:21 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.139.59])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 27 Jul 2021 16:03:21 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        peda@axentia.se, robh+dt@kernel.org,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: i2c-mux-pca954x: Define the reset-shared-hogged gpio
Date:   Tue, 27 Jul 2021 11:03:14 -0500
Message-Id: <20210727160315.15575-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210727160315.15575-1-eajames@linux.ibm.com>
References: <20210727160315.15575-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vyf720QxfoeiT0OonjgbZUU4fAMmIVgO
X-Proofpoint-ORIG-GUID: Vyf720QxfoeiT0OonjgbZUU4fAMmIVgO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-27_10:2021-07-27,2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270093
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a property to describe a reset input that is shared between multiple
PCA953x muxes.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..06b9f8385bd7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -49,6 +49,11 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  reset-shared-hogged-gpios:
+    maxItems: 1
+    description: Reference to a shared, hogged GPIO connected to the reset
+      input of several PCA954x muxes.
+
   i2c-mux-idle-disconnect:
     type: boolean
     description: Forces mux to disconnect all children in idle state. This is
-- 
2.27.0

