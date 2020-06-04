Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7980F1EDAF1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jun 2020 03:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgFDB7w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 21:59:52 -0400
Received: from inva020.nxp.com ([92.121.34.13]:45278 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbgFDB7w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 21:59:52 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F1E431A0191;
        Thu,  4 Jun 2020 03:59:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B6F1C1A016E;
        Thu,  4 Jun 2020 03:59:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 04E88402B0;
        Thu,  4 Jun 2020 09:59:38 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux@rempel-privat.de, wolfram@the-dreams.de,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 0/3] Convert i.MX/MXS I2C/LPI2C binding doc to json-schema
Date:   Thu,  4 Jun 2020 09:49:15 +0800
Message-Id: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Coverts i.MX/MXS I2C/LPI2C binding doc to json-schema, some examples are too old,
update them based on latest DT file, also add more compatible based on supported SoCs.

Compated to V1, this patch series adds "additionalProperties: false" for each
binding doc.

Anson Huang (3):
  dt-bindings: i2c: Convert imx lpi2c to json-schema
  dt-bindings: i2c: Convert mxs i2c to json-schema
  dt-bindings: i2c: Convert imx i2c to json-schema

 .../devicetree/bindings/i2c/i2c-imx-lpi2c.txt      |  20 ----
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |  47 ++++++++
 Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ---------
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 119 +++++++++++++++++++++
 Documentation/devicetree/bindings/i2c/i2c-mxs.txt  |  25 -----
 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml |  55 ++++++++++
 6 files changed, 221 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml

-- 
2.7.4

