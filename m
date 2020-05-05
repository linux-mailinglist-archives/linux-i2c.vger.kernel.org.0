Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385971C4DDA
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 07:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgEEFwg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 01:52:36 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:53704 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbgEEFwf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 May 2020 01:52:35 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0455lBeA027132;
        Tue, 5 May 2020 07:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/RG1jmnvaQFJTmB5c3f4Wt7K8CWp+WbtLlXwa1U86qY=;
 b=Mu+zXVFRC3qGokaDcoghATVQ8pmNONE6Cjbzr/DwCxry1ftwv0uNxLgtR5L+GS2lmWch
 jlhMN2cO2EF/nXRICAJ0E/+PEkt+bbhCj09CWVvnqeWxEufybzeBhR7e3Vg/XdakGJUK
 PCTXgC11Ma6F4PLY/LjxmocXVurNc6Elkn5Bhum77xZ194mvG9kDNV4yVg6xCPBprY55
 PMbK1NuYlMemW0aXjUOTBZkWycoPPWIFxivPKJBCHsnE8UznFKJOKioAm0xrck60yIVg
 5Jr4rNgW3sMhqLtHXyVLGKG6EO0z42TiW1fQ5azQd6wEPoRW3RdliN143gqiXTeP9tcL xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30rxb1wy0s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 May 2020 07:52:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EFF610002A;
        Tue,  5 May 2020 07:52:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21AC021CA74;
        Tue,  5 May 2020 07:52:21 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 May 2020 07:52:20
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
Subject: [PATCH 3/4] dt-bindings: i2c-stm32: add SMBus Alert bindings
Date:   Tue, 5 May 2020 07:51:10 +0200
Message-ID: <1588657871-14747-4-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-05-05_02:2020-05-04,2020-05-05 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new binding of the i2c-stm32f7 driver to enable the handling
of the SMBUS-Alert

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index b50a2f420b36..04c0882c3661 100644
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
2.17.1

