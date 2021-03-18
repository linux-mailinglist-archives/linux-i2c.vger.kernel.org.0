Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4127534071D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 14:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCRNpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 09:45:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5322 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230517AbhCRNpR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 09:45:17 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12IDfsx8014144;
        Thu, 18 Mar 2021 14:45:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Mh1XkVMq3Xtlf2kfvBLiZv4WU5GJ6+7sEcK44RV22zs=;
 b=QULZ//VBLoES34B/3tASXpKg+U0hiF/0+LB/39QYzzufpbfUch4j0zUfP2bSknHlAIgC
 vQFXWGxXAMn6zVW2xFuxHfr3oTlkuXkEYV5o1xbP8fFWGiAfwaBCu4WOwDAg5VYmGhUL
 G2CKMHZMz78Cjqfa9YAay+6aGO3P3vcwE+q3CVplQWoyVXhtcVNMZ1mvPhCqloARWvo2
 XqQxxlMrDYsCxdDu95ihbbFyHTa2BkJ65QvmwXDSc/AxJfrJ8+jO/rkttIBXwW/K3Qd7
 Ca7vJtEeO1MAKsrJIVVa9Ncqi7zr+pfSPBs1YTNsVPjDpswwnsvLDGyCEx/OzO/bjqRp 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37a8prbn29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Mar 2021 14:45:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAA0D100038;
        Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C67E52272B1;
        Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 14:45:02
 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: stm32f7: add st,smbus-alert binding for SMBus Alert
Date:   Thu, 18 Mar 2021 14:44:48 +0100
Message-ID: <1616075089-28115-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
References: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-18_07:2021-03-17,2021-03-18 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Based on the SMBus specification, SMBus Alert active state is low.
As often on SoC, the SMBus Alert pin is not only dedicated to this
feature and can also be used for another purpose (by configuring it
as alternate function for other functions via pinctrl).

"smbus" dt-binding has been introduced recently [1], however it is also
used to indicate usage of host-notify feature.
Relying on 'smbus' binding for SMBus-Alert as well as it was discussed
previously [2] would lead to requiring the SMBALERT# pin to be configured
as alternate function for i2c/smbus controller even if only host-notify is
needed.
Indeed, not doing so would lead to spurious SMBus Alert interrupts since
the i2c/smbus controller would see the (not configured) SMBA pin as low
level.

For that reason, SMBus-Alert needs to have its own binding in order
to only be enabled whenever SMBALERT# pin is configured as alternate
function for i2c/smbus controller.

[1] https://marc.info/?l=linux-i2c&m=159531254413805&w=2
[2] https://marc.info/?l=linux-renesas-soc&m=159361426409817&w=2

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2: introduce st,smbus-alert property
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index d747f4990ad8..0d45ead7d835 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -36,6 +36,11 @@ allOf:
             minItems: 3
             maxItems: 3
 
+        st,smbus-alert:
+          description: Enable the SMBus-Alert via SMBA pin, note SMBA pin
+                       must also be configured via pinctrl.
+          type: boolean
+
   - if:
       properties:
         compatible:
-- 
2.17.1

