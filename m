Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F019B443F20
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 10:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhKCJU6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 05:20:58 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19427 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhKCJU5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Nov 2021 05:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635931101; x=1667467101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QfHR3Cra0DJdP8QD9ujWRugo8vll6siTTDc+rrxgmn0=;
  b=hQpe7EwOLq6AjcI3Q535itXJzGsrTvQfS/bRuH+CglHAjx7kvLfXSSa1
   F5iEYnVCIM8+3RIYmWqLVxA4hXeptMC8vxBToepfTV9Lp2VcXHF7b4YwH
   Lxw8ranEUcsehxUJyWkoJFUq8naO52fxfy0H1fFIdh9lupK4VOtu2Oq4Z
   b038+rpN5syGyawyTh4F8Iy2mejj2Gta8b8LSEshXtljPLTIrPDCy7PWa
   YD0in1SIDawl85T/RNSQlhdSVJXAfy6ddgfgkmDhuXlwKE37OS4SCVA2T
   9z0emGT7zl+4M484TnoRSs9uGLxQSUFAwIMQXFxF7d9mJbvnGohqOjftM
   w==;
IronPort-SDR: H7ZdxvYVi+aC9L+jAmJ7VLnjyXwZTA6xPLPn9gRaPGJc4L9nxPTwl2M8Wf/ytgP41mdXf6B7TP
 TVS1ouvz4gP0lZzVrIOWUM1QJKpUVzOwgU8axRV5Fwnn/mzRt3/FRSVSGMNb+ArAquSwxStsHS
 Sddus6L05JkAlNp1PTElll9+IcyqMa6mc6oyqvr6zHsjaB2rzczUO36HmGgebcfphhL2dOG+7B
 doEMBlpiJt8WdhH2RYaYgZpcaQiKkBuH1IZ6oXDvQD1jvGto/wSdg55ER+j6gTZ/6VQZrhvB3q
 x2wE1mY/rCZb2nxrdyXsZvNI
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; 
   d="scan'208";a="142631579"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Nov 2021 02:18:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 3 Nov 2021 02:18:21 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 3 Nov 2021 02:18:19 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4 0/2] i2c-mux-gpmux: Support settle-time-us property
Date:   Wed, 3 Nov 2021 10:18:37 +0100
Message-ID: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for settle-time-us property. If this is defined in device
tree then add this delay to mux APIs.

v3->v4:
 - update i2c-mux.yaml by adding required and select properties

v2->v3:
 - move the binding changes into i2c-mux.yaml
 - read at a later point the DT property 'settle-time-us'

v1->v2:
 - add the changes to i2c-mux-gpmux instead of i2c-mux-gpio to be able
   to use mux_control_select_delay

Horatiu Vultur (2):
  dt-bindings: i2c-mux: Add property for settle time
  i2c-mux-gpmux: Support settle-time-us property

 Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 14 ++++++++++++++
 drivers/i2c/muxes/i2c-mux-gpmux.c                  |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.33.0

