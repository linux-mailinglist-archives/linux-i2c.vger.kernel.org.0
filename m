Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6654626C119
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 11:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgIPJuP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 05:50:15 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12388 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgIPJuN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 05:50:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61df470000>; Wed, 16 Sep 2020 02:47:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 02:50:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 02:50:13 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:50:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 09:50:12 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f61dfd20002>; Wed, 16 Sep 2020 02:50:12 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/5] misc: eeprom: at24: Initialise AT24 NVMEM ID field
Date:   Wed, 16 Sep 2020 10:49:48 +0100
Message-ID: <20200916094952.458003-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600249671; bh=jmvtm55itr9eJOTSnEX+409Pt+fxKdfCDE/ObG7O/GE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=D5BSMD999NSmW/YfFUWVQw0Sh1JKISbvb6+atTZAj17ffE67K1oFTolREyiwEnGmp
         /4VFtDnO4SpQoXnnELXjxf0/ne8dcddYurw9Sg0kcn6cT3XC22fNAQAlvvIde1fL6k
         7xWJxjUYZ9E24Mz1402wcCXqS6Ndg05aA6QULdafwsVnpIOSEbPg5ZK1NTADe4WiD9
         JOplbHXCukvwVpxUXuYb39aDAyAl9TWfzDcpGycVBD2n9A9YAzTraLWLv/fP0FvCHF
         bI9h0d2uhFbaaxDEJeOr4Xy7WzKe57U6g3AFGhtaV0ltUnkRKYuDiLg6jNXzkrT5kf
         k4q362vvJoR5g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The AT24 EEPROM driver does not initialise the 'id' field of the
nvmem_config structure and because the entire structure is not
initialised, it ends up with a random value. This causes the NVMEM
driver to append the device 'devid' value to name of the NVMEM
device. Ideally for I2C devices such as the AT24 that already have a
unique name, we would not bother to append the 'devid'. However, given
that this has always been done for AT24 devices, we cannot remove the
'devid' as this will change the name of the userspace sysfs node for
the NVMEM device. Nonetheless we should ensure that the 'id' field of
the nvmem_config structure is initialised so that there is no chance of
a random value causes problems in the future. Therefore, set the NVMEM
config.id to NVMEM_DEVID_AUTO for AT24 EEPROMs so that the 'devid' is
always appended.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/misc/eeprom/at24.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index e9df1ca251df..f76624b5c033 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -715,6 +715,7 @@ static int at24_probe(struct i2c_client *client)
=20
 	nvmem_config.name =3D dev_name(dev);
 	nvmem_config.dev =3D dev;
+	nvmem_config.id =3D NVMEM_DEVID_AUTO;
 	nvmem_config.read_only =3D !writable;
 	nvmem_config.root_only =3D !(flags & AT24_FLAG_IRUGO);
 	nvmem_config.owner =3D THIS_MODULE;
--=20
2.25.1

