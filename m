Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28431EC71E
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 04:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgFCCJ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 22:09:27 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58962 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgFCCJ1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Jun 2020 22:09:27 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7E4EC20004C;
        Wed,  3 Jun 2020 04:09:25 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E05B8200025;
        Wed,  3 Jun 2020 04:09:19 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B291140296;
        Wed,  3 Jun 2020 10:09:12 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux@rempel-privat.de, pandy.gao@nxp.com, wolfram@the-dreams.de,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 0/3] Convert i.MX/MXS I2C/LPI2C binding doc to json-schema
Date:   Wed,  3 Jun 2020 09:58:52 +0800
Message-Id: <1591149535-342-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Coverts i.MX/MXS I2C.LPI2C binding doc to json-schema, some examples are
too old, update them based on latest DT file, also add more compatible
based on supported SoCs.

Anson Huang (3):
  dt-bindings: i2c: Convert imx lpi2c to json-schema
  dt-bindings: i2c: Convert mxs i2c to json-schema
  dt-bindings: i2c: Convert imx i2c to json-schema

 .../devicetree/bindings/i2c/i2c-imx-lpi2c.txt      |  20 ----
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |  45 ++++++++
 Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ---------
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 118 +++++++++++++++++++++
 Documentation/devicetree/bindings/i2c/i2c-mxs.txt  |  25 -----
 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml |  55 ++++++++++
 6 files changed, 218 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml

-- 
2.7.4

