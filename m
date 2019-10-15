Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0B8D6E6B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 06:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfJOE7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 00:59:37 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49544 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbfJOE7h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Oct 2019 00:59:37 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 127D11A0789;
        Tue, 15 Oct 2019 06:59:35 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2CD121A0287;
        Tue, 15 Oct 2019 06:59:31 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0D36140305;
        Tue, 15 Oct 2019 12:59:25 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [v2,1/2] dt-bindings: i2c: add property idle-state
Date:   Tue, 15 Oct 2019 12:48:38 +0800
Message-Id: <20191015044839.23746-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds property idle-state

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- update subject and description
	- add property idle-state

 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 30ac6a60f041..2c7875d338fb 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -34,6 +34,7 @@ Optional Properties:
     - first cell is the pin number
     - second cell is used to specify flags.
     See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+  - idle-state: Please refer to Documentation/devicetree/bindings/mux/mux-controller.txt
 
 Example:
 
-- 
2.17.1

