Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2668D8FE6D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 10:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfHPIoR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 04:44:17 -0400
Received: from letterbox.kde.org ([46.43.1.242]:39500 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbfHPIoQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 04:44:16 -0400
Received: from archbox.localdomain (unknown [203.187.238.17])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id 135722873C2;
        Fri, 16 Aug 2019 09:44:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1565945054; bh=ewDnjhgYrVht1tDGt3K86esExP8zOs/6xc86+GZUyAI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GC9FSLpB4f4Pulx8/ASeT6WvjRlu2JWpUzOH4ueIp9Bg5Oz+5BjAm7/Vvv44SlK+e
         sw/P4tKvDG0gYWESGv00oaPeitoTA7KxKEx1f0MiE2fJoFtdRs6LWL0hEB1vzHfu/o
         X1thd6jipFrOZazckkSP5MYA6E1w2e4qt5o5FeCGGjBtaVFfUknOeZpWYNbsWkQudL
         L9DvZDNWF772SY4dDtaAXsTBp8Xk8u80IA15SY+5kcP+9Y7TjUNVm179tc4FfyY2S+
         VSPWgpomKKmI9ZATxdUVKuhN7vrO2MoC51ABI0eo1uiZDhgX8WK1GZX78fNqD4Iyg/
         mqzphHeaIc74Q==
From:   Bhushan Shah <bshah@kde.org>
To:     Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>, Bhushan Shah <bshah@kde.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] Enable the I2C nodes for Allwinner H6 CPU
Date:   Fri, 16 Aug 2019 14:13:07 +0530
Message-Id: <20190816084309.27440-1-bshah@kde.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816064710.18280-1-bshah@kde.org>
References: <20190816064710.18280-1-bshah@kde.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series adds device-tree nodes for i2c nodes in the H6 dtsi,
and enables it for the Pine H64.

Changes in v2:
  - Add the SoC specific compatible string instead of re-using a31 one.
  - Don't enable the i2c0 node in PineH64 by default

Changes in v3:
  - Fix compatible for i2c in sun50i-h6.dtsi
  - drop changes in the PineH64 dts completely

Bhushan Shah (2):
  dt-bindings: i2c: mv64xxx: Add compatible for the H6 i2c node.
  arm64: allwinner: h6: add I2C nodes

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |  3 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 60 ++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

-- 
2.17.1

