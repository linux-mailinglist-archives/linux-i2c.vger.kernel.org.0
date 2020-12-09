Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79302D4755
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 18:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731919AbgLIQ7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 11:59:34 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41652 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgLIQ7c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 11:59:32 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9Gvtnu022117;
        Wed, 9 Dec 2020 10:57:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607533075;
        bh=1VU4wf4ji4hch5y5IsBnYvCncSakS4v+KUMFXWHn4ds=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WombGAPH1UwI9/n4ZzVg5ppEgNIAt6NI/q4/3RP0hu8vwWawI06a/z6Zm5oduMmsF
         1P9L7CaGbvnxGaGdWPoo+hxd4F7hA1xIUrah6s1HPXX4qMpeBaIlnrFgBa61zr3VtC
         LDVylIXMCSqYi9BlwZZ55b2qiMEd5f6XWIF8D3jY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9GvtxA089806
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Dec 2020 10:57:55 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 10:57:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 10:57:55 -0600
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9Gvd9U090706;
        Wed, 9 Dec 2020 10:57:51 -0600
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Sekhar Nori <nsekhar@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Vignesh R <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: i2c: Add compatible string for AM64 SoC
Date:   Wed, 9 Dec 2020 22:27:33 +0530
Message-ID: <20201209165733.8204-3-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209165733.8204-1-a-govindraju@ti.com>
References: <20201209165733.8204-1-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add compatible string for AM64 SoC in device tree binding of OMAP I2C
modules as the same IP is used.

Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
---
 Documentation/devicetree/bindings/i2c/i2c-omap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-omap.txt b/Documentation/devicetree/bindings/i2c/i2c-omap.txt
index a44573d7c118..a425b91af48f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-omap.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-omap.txt
@@ -8,6 +8,7 @@ Required properties :
 	"ti,omap4-i2c" for OMAP4+ SoCs
 	"ti,am654-i2c", "ti,omap4-i2c" for AM654 SoCs
 	"ti,j721e-i2c", "ti,omap4-i2c" for J721E SoCs
+	"ti,am64-i2c", "ti,omap4-i2c" for AM64 SoCs
 - ti,hwmods : Must be "i2c<n>", n being the instance number (1-based)
 - #address-cells = <1>;
 - #size-cells = <0>;
-- 
2.17.1

