Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA33256721
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 13:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgH2LcE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 07:32:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727940AbgH2La1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 07:30:27 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 939A1208CA;
        Sat, 29 Aug 2020 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598699900;
        bh=Q0ph4oqiKCEwsDqeFSh6njs6C5uJMGOmkzo8miXAWwQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=crTnDE87Kf/Au4dcCmJE2TKFsCI676nlC82aTqM/gtMdAKwFB0npRPhSZylhj6BPb
         dtv7BxG7hZ6cu/mV1IzDBOxdf9fXvmaTeU2v+KLNHgsip3uuacfkUUEiwBT//fJX1U
         cqzF33UGsCyzpwG9CkoLKYstVBQboZt0pKgakHA8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: i2c: imx-lpi2c: Use unevaluatedProperties
Date:   Sat, 29 Aug 2020 13:17:57 +0200
Message-Id: <20200829111800.2786-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829111800.2786-1-krzk@kernel.org>
References: <20200829111800.2786-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional properties actually might appear (e.g. power-domains) so use
unevaluatedProperties to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
    'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index ac0bc5dd64d6..594e174e2cde 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -31,7 +31,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.17.1

