Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CEAC1A5A
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 05:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbfI3Dfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Sep 2019 23:35:44 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37980 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729022AbfI3Dfo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 29 Sep 2019 23:35:44 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 30A001A0C10;
        Mon, 30 Sep 2019 05:35:42 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D3621A07D2;
        Mon, 30 Sep 2019 05:35:38 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 89FD840318;
        Mon, 30 Sep 2019 11:35:33 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional property i2c-mux-never-disable
Date:   Mon, 30 Sep 2019 11:25:03 +0800
Message-Id: <20190930032503.44425-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190930032503.44425-1-biwen.li@nxp.com>
References: <20190930032503.44425-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch adds an optional property i2c-mux-never-disable

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- update documentation

 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 30ac6a60f041..71b73d0fdb62 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -34,6 +34,7 @@ Optional Properties:
     - first cell is the pin number
     - second cell is used to specify flags.
     See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+  - i2c-mux-never-disable: always forces mux to be enabled.
 
 Example:
 
-- 
2.17.1

