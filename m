Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102AB42C27F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 16:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhJMOPN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 10:15:13 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:5438 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhJMOPM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 10:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634134389; x=1665670389;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Li6Ne+agwAMYqqjH4D05vEMTzz4vF7b2Z2OP7dMLKPE=;
  b=MJfOZt3eI3WkwXZ1opv/EEYEy41GOJHGiB2MdTOmZwZ97uqs0tF2VhRC
   Q1jzzqDuNVFqgOnIUxtiqWUB7ChLYl+TGwbRUHjklDGwVXS+XmEq2ERJY
   4/PUTCU97nyXih+HYSInbWo00ZpfNPDG8kbVTRav0tJHHQVG9yMYiKeqi
   1iY/VLf/TCdw7qvt7DtXTO9lpyNGc9O4xEzKYukCvjS/Vz8jRb3IaY2wi
   /zJYpgSB2g1kOXFFtqh7O+0/HpupaLz8+jsI/u9xgr633FlNKntEJ3qDm
   cPBSeWttKPWOcZ7w2Tt5TJ2w5XnzmpYKhuZiuq1XZz5f4TMvr5y39VFs8
   Q==;
IronPort-SDR: Om4bnOphYKnzjKPqhf6y8v/CFjh2PobuRcMfR/Pejg3F52okxsIR+R+rxIxVJFOFKrTAZgRgNg
 i7vV3F+QndMN6xxD5Cih5xnE4kN/C2ZB7YhLx3cWlKbkGa7K2S28+/HGSuCRyn2xF3KgNRiUY2
 8omPTQoLPza0+M8Rq2dI/Tzrn39PbXz4fIvvnTShuT3U7pyAoO3fS8hAsYRGlTX1ilR+IBcZrU
 ShHTuCXzYKXdEmvXbp2QYGDJlg1gQlMZ5CsruQPcJrAc8GEQh8O6om7mjZ1YyLu68cvB3szF8e
 KX/anb/Rds75S3p9RhmZEUqm
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="72800394"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 07:09:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 07:09:47 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 07:09:46 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <peter.korsgaard@barco.com>, <lars.povlsen@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 0/2] i2c-mux-gpio: Add optional 'select-delay' DT property
Date:   Wed, 13 Oct 2021 16:10:01 +0200
Message-ID: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add optional property 'select-delay' to add a delay when changing the
mux state. This is required on some platforms to allow GPIO signals to get
stablized.

Horatiu Vultur (2):
  dt-bindings: i2c-mux-gpio: Add optional DT property
  i2c: i2c-mux-gpio: Add support 'select-delay' property

 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt | 1 +
 drivers/i2c/muxes/i2c-mux-gpio.c                       | 7 +++++++
 2 files changed, 8 insertions(+)

-- 
2.33.0

