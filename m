Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BEC6DC92D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Apr 2023 18:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjDJQTX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Apr 2023 12:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjDJQTW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Apr 2023 12:19:22 -0400
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB88A131;
        Mon, 10 Apr 2023 09:19:18 -0700 (PDT)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pluEZ-0004v2-1O;
        Mon, 10 Apr 2023 18:19:11 +0200
Date:   Mon, 10 Apr 2023 17:19:05 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH v3 0/2] i2c: i2c-mt65xx: add support for MT7981
Message-ID: <cover.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the I2C units found in the MediaTek MT7981 and MT7988
SoCs. Just like other recent MediaTek I2C units that also uses v3
register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
0x94 instead of 0x4).

Corresponding commit in MediaTek's SDK:
https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/472dc5cf11d4359cb3e3f80577dba22df0696e43/target/linux/mediatek/patches-5.4/0901-i2c-busses-add-mt7981-support.patch

Changes since v2:
 * bindings come before patches using them
 * remove reduntant word 'bindings' from dt-bindings commit

Changes since v1:
 * add missing commit description
 * add link to commit in MediaTek's SDK to cover letter

Daniel Golle (2):
  dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981 SoC
  i2c: mediatek: add support for MT7981 SoC

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml         |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                     | 13 +++++++++++++
 2 files changed, 14 insertions(+)


base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6
-- 
2.40.0

