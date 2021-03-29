Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0331F34C390
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 08:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhC2GKT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 02:10:19 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25508 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230224AbhC2GJ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 02:09:58 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12T5t3I5017332;
        Mon, 29 Mar 2021 08:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=gGpfvp2WBQZrUmjXPkc3CMLw8WnEqLTNqaoTYOZbV8U=;
 b=UE85ZbyUYRgJrYf0GuqQFAoMolyD5DNJ4ORM/jCe5NOwUGpEgGZVzD/96YQz0A1II5Jg
 u1ujS782rVQWPVEPKWfpNCLpAnWp1T1p+0LFj8cPcfOyqIfFEi5yyCEP46T++BYCuA6s
 w24J81eXTCQI7EnRUCI95CtZYQ9T5ALObykf9GCWUZRc+PusRPlZpF6lqmEdfSIF1t1a
 +keCcJH59z6vFSgQFt2JzaGUv6CPhgwMlaTxDYA/kYNXx9i3Kbfee3xQvfv6HwQIaFQv
 dZKION2cReqdPZ282BmFbkUjGhrxjC893F2q/dlE//uS6Vu39a5Ao9LsVaHr6b6Wj1y9 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37jvdmjm9m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Mar 2021 08:09:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 322AF10003B;
        Mon, 29 Mar 2021 08:09:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22F14221773;
        Mon, 29 Mar 2021 08:09:09 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar 2021 08:09:08
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: stm32f7: add st,smbus-alert binding for SMBus Alert
Date:   Mon, 29 Mar 2021 08:09:04 +0200
Message-ID: <1616998145-28278-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
References: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-29_02:2021-03-26,2021-03-29 signatures=0
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

[1] https://lore.kernel.org/linux-i2c/20200721062217.GA1044@kunai/
[2] https://lore.kernel.org/linux-i2c/20200701143738.GF3457@gnbcxd0016.gnb.st.com/

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v3: use lore.kernel.org links
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

