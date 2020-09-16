Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C13726C113
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 11:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgIPJvJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 05:51:09 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13196 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgIPJuT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 05:50:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61dfcc0001>; Wed, 16 Sep 2020 02:50:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 02:50:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 02:50:18 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:50:17 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 09:50:17 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f61dfd70001>; Wed, 16 Sep 2020 02:50:17 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 3/5] misc: eeprom: at24: Support custom device names for AT24 EEPROMs
Date:   Wed, 16 Sep 2020 10:49:50 +0100
Message-ID: <20200916094952.458003-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600249804; bh=bboMx6ngFaZ1BJHdpO5SFh3jSPJ51Ty1Gw4ysHl6JRw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ns1FDdV5ks7eSYRj6Qf94TRIZQvHyNDpcQvLV6phKxSHC3fMHIi8M7UuPhxeF7g2B
         3OrS3IoNAvTalGkojJYxZITDW8cZgY0CK0LV3SLjpPtt3WcjuQIWUdT6AC/7iLnioc
         KP5DE9VFEQTwr6zcyQlN0WLr3Z+lxNumSrnvOUboqqEKYSzdPOIliRWqUeFibETWj+
         OanyrWlJYPCxvTDY7uM1QEiwmF4TT7bM4BHOqDIm4XUg6DKzp1KNt7R2TNp5vjl53E
         Dd8ebUrpvdHvX2as7TK9OsvKmEx2MmnGj++IyWyRbW1o2UQLjWkTg+Wvm8fssi/dwt
         lfPCkKqwJLoxg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

By using the label property, a more descriptive name can be populated
for AT24 EEPROMs NVMEM device. Update the AT24 driver to check to see
if the label property is present and if so, use this as the name for
NVMEM device. Please note that when the 'label' property is present for
the AT24 EEPROM, we do not want the NVMEM driver to append the 'devid'
to the name and so the nvmem_config.id is initialised to
NVMEM_DEVID_NONE.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/misc/eeprom/at24.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index f76624b5c033..305f2e13107b 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -713,9 +713,28 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 	}
=20
-	nvmem_config.name =3D dev_name(dev);
+	/*
+	 * If the 'label' property is not present for the AT24 EEPROM,
+	 * then nvmem_config.id is initialised to NVMEM_DEVID_AUTO,
+	 * and this will append the 'devid' to the name of the NVMEM
+	 * device. This is purely legacy and the AT24 driver has always
+	 * defaulted to this. However, if the 'label' property is
+	 * present then this means that the name is specified by the
+	 * firmware and this name should be used verbatim and so it is
+	 * not necessary to append the 'devid'.
+	 */
+	if (device_property_present(dev, "label")) {
+		nvmem_config.id =3D NVMEM_DEVID_NONE;
+		err =3D device_property_read_string(dev, "label",
+						  &nvmem_config.name);
+		if (err)
+			return err;
+	} else {
+		nvmem_config.id =3D NVMEM_DEVID_AUTO;
+		nvmem_config.name =3D dev_name(dev);
+	}
+
 	nvmem_config.dev =3D dev;
-	nvmem_config.id =3D NVMEM_DEVID_AUTO;
 	nvmem_config.read_only =3D !writable;
 	nvmem_config.root_only =3D !(flags & AT24_FLAG_IRUGO);
 	nvmem_config.owner =3D THIS_MODULE;
--=20
2.25.1

