Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C52C884AD
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 23:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfHIVau (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 17:30:50 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40834 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbfHIVat (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 17:30:49 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 90DCF25BE27;
        Sat, 10 Aug 2019 07:30:41 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B03A8E21E01; Fri,  9 Aug 2019 23:30:36 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/4] dt-bindings: i2c: renesas: Rename bindings documentation files
Date:   Fri,  9 Aug 2019 14:30:00 -0700
Message-Id: <20190809213004.31181-1-horms+renesas@verge.net.au>
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

Changes since v1
* Accumulate review tags
* Correct changelogs

Simon Horman (4):
  dt-bindings: i2c: sh_mobile: Rename bindings documentation file
  dt-bindings: i2c: rcar: Rename bindings documentation file
  dt-bindings: i2c: riic: Rename bindings documentation file
  dt-bindings: i2c: i2c-emev2: Rename bindings documentation file

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

