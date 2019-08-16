Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB138FB87
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 08:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfHPGz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 02:55:28 -0400
Received: from letterbox.kde.org ([46.43.1.242]:53684 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbfHPGz1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 02:55:27 -0400
Received: from archbox.localdomain (unknown [123.201.155.129])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id 27E8328ACED;
        Fri, 16 Aug 2019 07:47:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1565938058; bh=WFc0UZ1hs7LdUGdmu8qpw3+FtS1REZ6c7sIEozRjejM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m4NnzmEd45cZgPnuyqw+E6Xm8fBtuceixldmLQ160P9XhQ1dRsm+MeH3SNozLdrfQ
         7A5skpytPKRusQXFBhklSnwEI9cGrGbfnmRdKDU32i8PE9JgCuCx27DTqxtNowsrGi
         wjjVcvLkWG1bGlwO6X8d8so3dwld4unxrHv1sbxjFLw7IppuxLvE7yyRLgnhw3QKMq
         fJYdX3qv0ewyF3VDfQPIiH8Qf/8cbteZJUN953yNvPARjkKXuUGVRrI+u80WwwL7rX
         Y9FBHxMYFuH9wa3cjwGf6C5hfNLZq5tMGNRnIzwKqDnJyYmqwnUnyeqt4nFAZeY+5B
         Q+f3uE7CWblpw==
From:   Bhushan Shah <bshah@kde.org>
To:     Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Wolfram Sang <wsa@the-dreams.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Bhushan Shah <bshah@kde.org>
Subject: [PATCH v2 0/3] Enable the I2C nodes for Allwinner H6 CPU
Date:   Fri, 16 Aug 2019 12:17:07 +0530
Message-Id: <20190816064710.18280-1-bshah@kde.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190811090503.32396-1-bshah@kde.org>
References: <20190811090503.32396-1-bshah@kde.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series adds device-tree nodes for i2c nodes in the H6 dtsi,
and enables it for the Pine H64.

Changes in v2:
  - Add the SoC specific compatible string instead of re-using a31 one.
  - Don't enable the i2c0 node in PineH64 by default

Bhushan Shah (3):
  dt-bindings: i2c: mv64xxx: Add compatible for the H6 i2c node.
  arm64: allwinner: h6: add I2C nodes
  arm64: allwinner: h6: add i2c0 node in PineH64

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |  3 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  9 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 56 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.17.1

