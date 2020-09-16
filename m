Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE5A26C10D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 11:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgIPJuT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 05:50:19 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16339 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgIPJuQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 05:50:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61dfa70001>; Wed, 16 Sep 2020 02:49:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 02:50:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 02:50:15 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:50:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 09:50:15 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f61dfd50001>; Wed, 16 Sep 2020 02:50:15 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/5] dt-bindings: eeprom: at24: Add label property for AT24
Date:   Wed, 16 Sep 2020 10:49:49 +0100
Message-ID: <20200916094952.458003-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600249767; bh=mDFA/PH20B3Q5Gf2TjqMAYyM2JB2qhlii2i2ZSUhhdM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=PCdgLXcilOBzqscawsiYUEf4fcUUgHwWJ1/kBuA5x4pjIpWsOaG0gzAPHToLdu9B0
         AABrZcSXghTi+tFQdwH6g7ishKVGzvS8kNLAH23oIZ3e+fqGVVin6SHcagVGwkxYBg
         BlXo4nPaH1JKk9UTtD26aQwJOr18ZneyLJMZSz15DYuWM/MOR31sZVoQHAZm9+U4FY
         KiePrQX/zDCyvKA0Rzae8NxMBawbF8XrR6/tZz4FQxRIpOhtxVKCywkvjzdV1sCa6t
         8cB0qkk0zkZ8Iw8obBCN0bTeASO7cXWtUFTtgmLYSgtdd/ezkg6gjqGIuT0mh5f++e
         nF3v8w0pC0lig==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a label property for the AT24 EEPROM to allow a custom name to be
used for identifying the EEPROM on a board. This is useful when there
is more than one EEPROM present.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documenta=
tion/devicetree/bindings/eeprom/at24.yaml
index 4cee72d53318..6edfa705b486 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -114,6 +114,9 @@ properties:
           - const: renesas,r1ex24128
           - const: atmel,24c128
=20
+  label:
+    description: Descriptive name of the EEPROM.
+
   reg:
     maxItems: 1
=20
--=20
2.25.1

