Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA91265345
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 23:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgIJVbC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 17:31:02 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2176 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730986AbgIJNwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 09:52:04 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5a2d3c0000>; Thu, 10 Sep 2020 06:42:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 06:43:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 10 Sep 2020 06:43:04 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 13:43:04 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Sep 2020 13:43:04 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.73.219]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f5a2d660001>; Thu, 10 Sep 2020 06:43:03 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/5] misc: eeprom: at24: Support custom device names for AT24 EEPROMs
Date:   Thu, 10 Sep 2020 14:42:37 +0100
Message-ID: <20200910134239.192030-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910134239.192030-1-jonathanh@nvidia.com>
References: <20200910134239.192030-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599745340; bh=ZGkEXEwpXqpjoIf4jocKKQvXhnOPyZdgty/NwZOE9tk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=pjNYe+6C9EeJTax/G0VbAx8Lyvsger6Gou4+6jpUnfsKE8WwKapop42uNARSwqdjQ
         LvuqvcYUBrQEIeP1qZipOf1uiolOMzxu8b4g69Qfeyww7feSIjMzKJtoPmvn9MwrWu
         W+MXzpDyrHBKm3tlMdbLkln45wGQ1WrAk3djL/tAi64NddMuT0NfW5WHUS4QIFhWds
         2SrphB4SD2UHAm9blDz7XGOltpdEmci20/NodAHDL3r5YqnxKe8wtyXcBAVYiygHIl
         Srk4/LSB98LhlSHhmxJhwTORKF/lEKc8XltGwhfcXDmr3cUtvjtDB7c+bYkxQTk6qQ
         q2PM0g99/xJTQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

By using the label property, a more descriptive name can be populated
for AT24 EEPROMs NVMEM device. Update the AT24 driver to check to see
if the label property is present and if so, use this as the name for
NVMEM device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/misc/eeprom/at24.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 3f7a3bb6a36c..058be08a9a40 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -713,7 +713,15 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 	}
=20
-	nvmem_config.name =3D dev_name(dev);
+	if (device_property_present(dev, "label")) {
+		err =3D device_property_read_string(dev, "label",
+						  &nvmem_config.name);
+		if (err)
+			return err;
+	} else {
+		nvmem_config.name =3D dev_name(dev);
+	}
+
 	nvmem_config.dev =3D dev;
 	nvmem_config.id =3D NVMEM_DEVID_NONE;
 	nvmem_config.read_only =3D !writable;
--=20
2.25.1

