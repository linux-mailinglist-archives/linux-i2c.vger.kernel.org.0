Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 420EC130A5C
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jan 2020 23:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgAEWuk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 17:50:40 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37787 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727146AbgAEWuk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 17:50:40 -0500
Received: from [37.160.42.38] (port=5507 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioEjB-00GSqI-RV; Sun, 05 Jan 2020 23:50:34 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 03/26] docs: i2c: summary: rewrite the "terminology" section
Date:   Sun,  5 Jan 2020 23:49:49 +0100
Message-Id: <20200105225012.11701-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105225012.11701-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This section, partly dating back to the pre-git era, is somewhat
unclear and partly incorrect. Rewrite it almost completely including a
reference figure, concise but precise definition of each term and the
paths where drivers are found. Particular care has been put in clarifying
the relation between adapter and algorithm, which has no correspondence
in the I2C spec terminology.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/i2c.svg     | 1341 +++++++++++++++++++++++++++++++++
 Documentation/i2c/summary.rst |   35 +-
 2 files changed, 1362 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/i2c/i2c.svg

diff --git a/Documentation/i2c/i2c.svg b/Documentation/i2c/i2c.svg
new file mode 100644
index 000000000000..5979405ad1c3
--- /dev/null
+++ b/Documentation/i2c/i2c.svg
@@ -0,0 +1,1341 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc="http://purl.org/dc/elements/1.1/"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   sodipodi:docname="i2c.svg"
+   inkscape:version="0.92.3 (2405546, 2018-03-11)"
+   version="1.1"
+   id="svg2"
+   viewBox="0 0 813.34215 261.01596"
+   height="73.664505mm"
+   width="229.54323mm">
+  <defs
+     id="defs4">
+    <marker
+       inkscape:stockid="DotM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8861"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path8859"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker6165"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM"
+       inkscape:collect="always">
+      <path
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path6163"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker2713"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM">
+      <path
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path2711"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="DotM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="DotM"
+       style="overflow:visible"
+       inkscape:isstock="true"
+       inkscape:collect="always">
+      <path
+         id="path1795"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker6389"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path6387"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutM"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path4107"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.4)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker5333"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path5335"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path5049"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="DotS"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="DotS"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path9326"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#404040;fill-opacity:1;fill-rule:evenodd;stroke:#404040;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.2,0,0,0.2,1.48,0.2)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mstart"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mstart"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path9283"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path9097"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8935"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8937"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8781"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8783"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Lend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path4700"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path4502"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-7"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-4-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-7-5"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-5"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-2"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-78"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-57"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-1"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-8"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-75"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="EmptyTriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="EmptyTriangleOutL-78-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4502-57-6"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#ffffff;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,-4.8,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-3"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-5-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-3-2"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-5-6-1"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-3-2-2"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-5-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-3-0"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-36"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-31"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-9"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-5-7-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-3-0-4"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-9-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-36-5"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3-5-7-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4369-6-3-0-5"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-1"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-3-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-1-8"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-3"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-0"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-7"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-3"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-5"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-4-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-5-3"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-4-4-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-5-3-2"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-4-4-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-5-3-8"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-4-4-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-5-3-7"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-6"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-6-5-4-4-6-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-1-5-5-3-8-3"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-27"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-09"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-27-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-09-2"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-27-0"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-09-23"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-7"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-4-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-7-7"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-4-6-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-7-7-5"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-4-6-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-7-7-9"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutM-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4107-7"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.4)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mstart"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mstart-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9283-3"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker9095-1-5-4-6-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path9097-2-0-7-7-0"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="DotM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="DotM-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1795-7"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker2713-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM">
+      <path
+         inkscape:connector-curvature="0"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path2711-2" />
+    </marker>
+    <marker
+       inkscape:stockid="DotM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="DotM-2"
+       style="overflow:visible"
+       inkscape:isstock="true"
+       inkscape:collect="always">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1795-8"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker2713-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM">
+      <path
+         inkscape:connector-curvature="0"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path2711-6" />
+    </marker>
+    <marker
+       inkscape:stockid="DotM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="DotM-1"
+       style="overflow:visible"
+       inkscape:isstock="true"
+       inkscape:collect="always">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1795-2"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker2713-94"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM">
+      <path
+         inkscape:connector-curvature="0"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path2711-7" />
+    </marker>
+    <marker
+       inkscape:stockid="DotM"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="DotM-8"
+       style="overflow:visible"
+       inkscape:isstock="true"
+       inkscape:collect="always">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1795-4"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker2713-36"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM">
+      <path
+         inkscape:connector-curvature="0"
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path2711-1" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker6165-5"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="DotM">
+      <path
+         transform="matrix(0.4,0,0,0.4,2.96,0.4)"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="m -2.5,-1 c 0,2.76 -2.24,5 -5,5 -2.76,0 -5,-2.24 -5,-5 0,-2.76 2.24,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         id="path6163-5"
+         inkscape:connector-curvature="0" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     showguides="true"
+     inkscape:window-maximized="1"
+     inkscape:window-y="0"
+     inkscape:window-x="0"
+     inkscape:window-height="1015"
+     inkscape:window-width="1920"
+     showgrid="true"
+     inkscape:current-layer="layer1"
+     inkscape:document-units="px"
+     inkscape:cy="214.66765"
+     inkscape:cx="-167.56857"
+     inkscape:zoom="0.70710678"
+     inkscape:pageshadow="2"
+     inkscape:pageopacity="0.0"
+     borderopacity="1.0"
+     bordercolor="#666666"
+     pagecolor="#ffffff"
+     id="base"
+     inkscape:snap-to-guides="true"
+     inkscape:snap-grids="true"
+     inkscape:snap-bbox="false"
+     inkscape:object-nodes="true"
+     fit-margin-top="5"
+     fit-margin-left="5"
+     fit-margin-right="5"
+     fit-margin-bottom="5">
+    <inkscape:grid
+       type="xygrid"
+       id="grid4451"
+       originx="-93.377219"
+       originy="-347.2523" />
+  </sodipodi:namedview>
+  <metadata
+     id="metadata7">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
+        <dc:creator>
+          <cc:Agent>
+            <dc:title>Luca Ceresoli</dc:title>
+          </cc:Agent>
+        </dc:creator>
+        <dc:date>2020</dc:date>
+        <cc:license
+           rdf:resource="http://creativecommons.org/licenses/by-sa/4.0/" />
+      </cc:Work>
+      <cc:License
+         rdf:about="http://creativecommons.org/licenses/by-sa/4.0/">
+        <cc:permits
+           rdf:resource="http://creativecommons.org/ns#Reproduction" />
+        <cc:permits
+           rdf:resource="http://creativecommons.org/ns#Distribution" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#Notice" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#Attribution" />
+        <cc:permits
+           rdf:resource="http://creativecommons.org/ns#DerivativeWorks" />
+        <cc:requires
+           rdf:resource="http://creativecommons.org/ns#ShareAlike" />
+      </cc:License>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Livello 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(-93.377215,-444.09395)">
+    <rect
+       style="opacity:1;fill:#ffb9b9;fill-opacity:1;stroke:#f00000;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect4424-3-2-9-7"
+       width="112.5"
+       height="113.75008"
+       x="112.5"
+       y="471.11221"
+       rx="0"
+       ry="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="167.5354"
+       y="521.46259"
+       id="text4349"><tspan
+         sodipodi:role="line"
+         x="167.5354"
+         y="521.46259"
+         style="font-size:25px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+         id="tspan1273">I2C</tspan><tspan
+         sodipodi:role="line"
+         x="167.5354"
+         y="552.71259"
+         style="font-size:25px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+         id="tspan1285">Master</tspan></text>
+    <rect
+       style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
+       id="rect4424-3-2-9-7-3-3-5-3"
+       width="112.49998"
+       height="112.50001"
+       x="262.5"
+       y="471.11218"
+       rx="0"
+       ry="0" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968767;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 112.50002,639.86223 c 712.50002,0 712.50002,0 712.50002,0"
+       id="path4655-9-3-65-5-6"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:12px;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="318.59131"
+       y="520.83752"
+       id="text4349-26"><tspan
+         sodipodi:role="line"
+         x="318.59131"
+         y="520.83752"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1273-8">I2C</tspan><tspan
+         sodipodi:role="line"
+         x="318.59131"
+         y="552.08752"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1287">Slave</tspan></text>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968767;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 112.49995,677.36223 c 712.50005,0 712.50005,0 712.50005,0"
+       id="path4655-9-3-65-5-6-2"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:12px;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="861.07312"
+       y="687.03937"
+       id="text4349-7"><tspan
+         sodipodi:role="line"
+         x="861.07312"
+         y="687.03937"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;writing-mode:lr-tb;direction:ltr;text-anchor:middle;stroke-width:1px"
+         id="tspan1285-9">SCL</tspan></text>
+    <flowRoot
+       xml:space="preserve"
+       id="flowRoot1627"
+       style="font-style:normal;font-weight:normal;font-size:40px;line-height:125%;font-family:Sans;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"><flowRegion
+         id="flowRegion1629"><rect
+           id="rect1631"
+           width="220"
+           height="120"
+           x="140"
+           y="-126.29921" /></flowRegion><flowPara
+         id="flowPara1633" /></flowRoot>    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:12px;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="863.31921"
+       y="648.96735"
+       id="text4349-7-3"><tspan
+         sodipodi:role="line"
+         x="863.31921"
+         y="648.96735"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1285-9-6">SDA</tspan></text>
+    <rect
+       style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
+       id="rect4424-3-2-9-7-3-3-5-3-0"
+       width="112.49998"
+       height="112.50002"
+       x="412.5"
+       y="471.11215"
+       rx="0"
+       ry="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:12px;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="468.59131"
+       y="520.83746"
+       id="text4349-26-6"><tspan
+         sodipodi:role="line"
+         x="468.59131"
+         y="520.83746"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1273-8-2">I2C</tspan><tspan
+         sodipodi:role="line"
+         x="468.59131"
+         y="552.08746"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1287-6">Slave</tspan></text>
+    <rect
+       style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
+       id="rect4424-3-2-9-7-3-3-5-3-1"
+       width="112.49998"
+       height="112.50002"
+       x="562.5"
+       y="471.11215"
+       rx="0"
+       ry="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:12px;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="618.59131"
+       y="520.83746"
+       id="text4349-26-8"><tspan
+         sodipodi:role="line"
+         x="618.59131"
+         y="520.83746"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1273-8-7">I2C</tspan><tspan
+         sodipodi:role="line"
+         x="618.59131"
+         y="552.08746"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1287-9">Slave</tspan></text>
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#DotM)"
+       d="m 150,583.61221 v 93.75"
+       id="path4655-9-3-65-5-6-20"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="opacity:1;vector-effect:none;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#marker2713)"
+       d="m 187.5,583.61221 v 56.25"
+       id="path4655-9-3-65-5-6-20-2"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#DotM-2)"
+       d="m 300,583.61221 v 93.75"
+       id="path4655-9-3-65-5-6-20-9"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="opacity:1;vector-effect:none;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#marker2713-9)"
+       d="m 337.5,583.61221 v 56.25"
+       id="path4655-9-3-65-5-6-20-2-7"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#DotM-1)"
+       d="m 450,583.61221 v 93.75"
+       id="path4655-9-3-65-5-6-20-93"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="opacity:1;vector-effect:none;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#marker2713-3)"
+       d="m 487.5,583.61221 v 56.25"
+       id="path4655-9-3-65-5-6-20-2-1"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#DotM-8)"
+       d="m 600,583.61221 v 93.75"
+       id="path4655-9-3-65-5-6-20-5"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="opacity:1;vector-effect:none;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#marker2713-94)"
+       d="m 637.5,583.61221 v 56.25"
+       id="path4655-9-3-65-5-6-20-2-0"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="opacity:1;vector-effect:none;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#marker6165);marker-end:url(#marker6165)"
+       d="m 750,471.11221 v 28.125 l 9.375,9.375 -18.74999,18.75 18.74999,18.75 -18.74999,18.75 18.74999,18.75 -9.375,9.375 v 28.125 0 0 56.25"
+       id="path6135"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cccccccccccc" />
+    <path
+       style="opacity:1;vector-effect:none;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#marker8861);marker-end:url(#marker6165-5)"
+       d="m 787.49999,471.11221 v 28.125 l 9.375,9.375 -18.74999,18.75 18.74999,18.75 -18.74999,18.75 18.74999,18.75 -9.375,9.375 v 28.125 0 0 18.75001"
+       id="path6135-4"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cccccccccccc" />
+    <path
+       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968719;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 712.5,471.11221 c 112.49999,0 112.49999,0 112.49999,0"
+       id="path4655-9-3-65-5-6-7"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:12px;line-height:0%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="859.94275"
+       y="480.03558"
+       id="text4349-7-3-6"><tspan
+         sodipodi:role="line"
+         x="859.94275"
+         y="480.03558"
+         style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
+         id="tspan1285-9-6-5">V<tspan
+   style="font-size:64.99999762%;baseline-shift:sub"
+   id="tspan9307">DD</tspan></tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index b7d3e620155b..fc69d9567d9d 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -31,21 +31,28 @@ implement all the common SMBus protocol semantics or messages.
 Terminology
 ===========
 
-When we talk about I2C, we use the following terms::
+Using the terminology from the official documentation, the I2C bus connects
+one or more *master* chips and one or more *slave* chips.
 
-  Bus    -> Algorithm
-            Adapter
-  Device -> Driver
-            Client
+.. kernel-figure::  i2c.svg
+   :alt:    Simple I2C bus with one master and 3 slaves
 
-An Algorithm driver contains general code that can be used for a whole class
-of I2C adapters. Each specific adapter driver either depends on one algorithm
-driver, or includes its own implementation.
+   Simple I2C bus
 
-A Driver driver (yes, this sounds ridiculous, sorry) contains the general
-code to access some type of device. Each detected device gets its own
-data in the Client structure. Usually, Driver and Client are more closely
-integrated than Algorithm and Adapter.
+A **master** chip is a node that starts communications with slaves. In the
+Linux kernel implementation it is called an **adapter** or bus. Adapter
+drivers are in the ``drivers/i2c/busses/`` subdirectory.
 
-For a given configuration, you will need a driver for your I2C bus, and
-drivers for your I2C devices (usually one driver for each device).
+An **algorithm** contains general code that can be used to implement a
+whole class of I2C adapters. Each specific adapter driver either depends on
+one algorithm driver, or includes its own implementation.
+
+A **slave** chip is a node that responds to communications when addressed
+by the master. In Linux it is called a **client**. Client drivers are kept
+in a directory specific to the feature they provide, for example
+``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
+video-related chips.
+
+For the example configuration in figure, you will need a driver for your
+I2C adapter, and drivers for your I2C devices (usually one driver for each
+device).
-- 
2.24.1

