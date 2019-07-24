Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1C272E90
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 14:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbfGXMQS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 08:16:18 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49252 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbfGXMQS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Jul 2019 08:16:18 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0E1EF25BE43;
        Wed, 24 Jul 2019 22:16:14 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0325EE2209B; Wed, 24 Jul 2019 14:16:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/4] dt-bindings: i2c: renesas: Rename bindings documentation files
Date:   Wed, 24 Jul 2019 14:15:55 +0200
Message-Id: <20190724121559.19079-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename the bindings documentation file for Renesas I2C controllers.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Based on v5.3-rc1

Simon Horman (4):
  dt-bindings: i2c: sh_mobile: Rename bindings documentation file
  dt-bindings: i2c: rcar: Rename bindings documentation file
  dt-bindings: i2c: riic: Rename bindings documentation file
  dt-bindings: i2c: riic: Rename bindings documentation file

 .../devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt}     | 0
 .../bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt}         | 0
 .../bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt}           | 0
 .../devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt}    | 0
 MAINTAINERS                                                       | 8 ++++----
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt} (100%)

-- 
2.11.0

