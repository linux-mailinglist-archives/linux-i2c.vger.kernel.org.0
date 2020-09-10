Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A046E264785
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 15:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgIJNyj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 09:54:39 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10015 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgIJNwC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 09:52:02 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5a2d580002>; Thu, 10 Sep 2020 06:42:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 06:43:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 10 Sep 2020 06:43:02 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 13:43:01 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Sep 2020 13:43:01 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.219]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f5a2d640000>; Thu, 10 Sep 2020 06:43:01 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/5] dt-bindings: eeprom: at24: Add label property for AT24
Date:   Thu, 10 Sep 2020 14:42:36 +0100
Message-ID: <20200910134239.192030-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910134239.192030-1-jonathanh@nvidia.com>
References: <20200910134239.192030-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599745369; bh=O0fz7iA/JfwFmK2MfkAYul7GJEtbt1EDCkF9bjPsbNQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=YHGlXZ5eR3KnYr0WLqYJfNL63GaEg7MIK70Q/XgKiQSITGygNF3Ya8kHRzZde8Ibs
         atPHemPP68PVwWd++WkAFtMU3rc+ou3qR1qtNGvciBu3PjMSiEKa0hjrPPvVm1H/sY
         Xvj3cDDSjVrmK0y7l3gxYFOAEF7vU35RTpuFsIre7XWIJ/lwuLPLDT7THfkoxddSQv
         iMQJf7qXL0mzzO92Vs1DkDOMlQDnIu01zyv1jQnkKNmkdz+k9Lwt1iV9nsYX6otQCL
         isCgac8YX6PsyQ/iycDVeE3oabadlGx+MM0RPpXorSpj5RJrkCpzfGnsbrSNUwg7/3
         lqheMt/m12uZA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a label property for the AT24 EEPROM to allow a custom name to be
used for identifying the EEPROM on a board. This is useful when there
is more than one EEPROM present.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documenta=
tion/devicetree/bindings/eeprom/at24.yaml
index 4cee72d53318..5c00d8a146b0 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -114,6 +114,10 @@ properties:
           - const: renesas,r1ex24128
           - const: atmel,24c128
=20
+  label:
+    description: Descriptive name of the EEPROM.
+    maxItems: 1
+
   reg:
     maxItems: 1
=20
--=20
2.25.1

