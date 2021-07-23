Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A53F3D404D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 20:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhGWRuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jul 2021 13:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbhGWRuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jul 2021 13:50:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F931C061575;
        Fri, 23 Jul 2021 11:31:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DCB356B;
        Fri, 23 Jul 2021 20:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627065082;
        bh=YVK18XWvShsXuhvfCBUhBI9tjum4ZlYhBoGf+lcllHg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=et2/cUr1PPDUZl94sMod+h0+4jPAlAuHxu0uHYB6EKt/zT2YzrUeF/zGGCjYbywq4
         BZWXYO3h+TVMWU7HkQff7ZOVBnwyhtm6sVebbAfzq0Nwwy2uun9cK0DogNSHDe0Cec
         JT1JYApgc+J/YYUb+KGfGXKaYCczo2qatLmhWVzc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-iio@vger.kernel.org
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 1/2] dt-bindings: iio: dac: ti,dac5571: Add TI DAC081C081 support
Date:   Fri, 23 Jul 2021 21:31:13 +0300
Message-Id: <20210723183114.26017-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723183114.26017-1-laurent.pinchart@ideasonboard.com>
References: <20210723183114.26017-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The TI DAC081C081 is compatible with the TI DAC5571 from a software
point of view. Add a device-specific compatible string value with a
fallback to "ti,dac5571".

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/iio/dac/ti,dac5571.yaml          | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml
index 714191724f7c..cdbbb336a5b5 100644
--- a/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml
@@ -11,16 +11,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,dac5571
-      - ti,dac6571
-      - ti,dac7571
-      - ti,dac5574
-      - ti,dac6574
-      - ti,dac7574
-      - ti,dac5573
-      - ti,dac6573
-      - ti,dac7573
+    oneOf:
+      - enum:
+          - ti,dac5571
+          - ti,dac6571
+          - ti,dac7571
+          - ti,dac5574
+          - ti,dac6574
+          - ti,dac7574
+          - ti,dac5573
+          - ti,dac6573
+          - ti,dac7573
+      - items:
+          - const: ti,dac081c081
+          - const: ti,dac5571
 
   reg:
     maxItems: 1
-- 
Regards,

Laurent Pinchart

