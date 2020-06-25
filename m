Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1287209AA1
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 09:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390250AbgFYHkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 03:40:03 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:4832 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390040AbgFYHkD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jun 2020 03:40:03 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05P7DBBl014444;
        Thu, 25 Jun 2020 09:39:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7JM2qGnxotTxax9jX2KQ7mcDsm1caKdUQ1iktY4N3iI=;
 b=Me4crCBzFaejDePZS53lAku5TqEP5V9xIAt44H1UblROSjfe4RoKeCCEs6Be2HcddRt8
 +IcvGTf2NAZGKLBoz6LWXgluiBq435L8QBOFwtdcQpyS5T+aM5AVuR5B0RhPvPloESuJ
 KZ5kbVhY6kcGi1qTfID2ekjQclVxEHIEejNDajVZQs7TCfGKnKLGqnUxBOtqoRzh/UpP
 63ch688VvYf3LpqE1sXTu7cycv61/v0be9I7+nE+nvPY6wyFl2Nk/KQq+glRUFZ/RiPH
 Tzxyjn2XyYVxLfNTVFilDaBjcDhsjPSMz/cyfEAuiybasbfGui2IE+iLJ5OP6T3+3i5z NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31uuv9ghnp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jun 2020 09:39:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9006D100039;
        Thu, 25 Jun 2020 09:39:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 847BC2A82E2;
        Thu, 25 Jun 2020 09:39:51 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jun 2020 09:39:50
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v2 3/4] dt-bindings: i2c-stm32: add SMBus Alert bindings
Date:   Thu, 25 Jun 2020 09:39:28 +0200
Message-ID: <1593070769-9106-4-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-25_02:2020-06-25,2020-06-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new binding of the i2c-stm32f7 driver to enable the handling
of the SMBUS-Alert.

The I2C/SMBUS framework already provides a mechanism to enable SMBus-Alert
by naming an IRQ line "smbus_alert". However, on stm32, the SMBus-Alert is
part of the i2c IRQ. Using the smbus_alert naming here would lead to having
2 handlers (the handler of the driver and the smbus_alert handler
from I2C/SMBUS framework) on the unique i2c IRQ of the stm32. Meaning that
the smbus_alert handler would get called for all IRQ generated by the stm32
I2C controller.

For that reason, the smbus_alert IRQ naming cannot be used and a dedicated
binding is introduced.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
v2: Clarify commit message

 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index f2fcbb361180..6fde046fae5e 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -36,6 +36,10 @@ allOf:
             minItems: 3
             maxItems: 3
 
+        st,smbus-alert:
+          description: Enable the SMBus Alert feature
+          $ref: /schemas/types.yaml#/definitions/flag
+
   - if:
       properties:
         compatible:
-- 
2.7.4

