Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D787E7CF158
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 09:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjJSHfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 03:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbjJSHfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 03:35:44 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A28112;
        Thu, 19 Oct 2023 00:35:38 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8D6016000C;
        Thu, 19 Oct 2023 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697700937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=HucUa7dgW0DX1NhXf/pL0MQyRjRhnDgkYcJwUZwxjWk=;
        b=jrY5dLO4jlBtMYtXAx/nk+Ge51PUZWvldB7hHUAz+GJ/vtaUgDGQz93hBus1jRJ7750SEL
        jAnL0dcCY4zs8aB6Z7NWef2hiQqUBbgawv9Q3Q8PblKEurojjhFLc2AyppXU6sc/uJGKX6
        xKJMz2+MQ3+Y9sG677DISz+7xHmZPSnFp7banlYtL0UAzqMiuJZSJv/jSyREnzeJ8kuH9A
        blAZOInMNxON6K2qIwfxDNS7rfgns/bM34WpgRMYEfoxid98Hgdw5S5Z3ktU1V2yDDPvKx
        56015eKCvOVjTKpRJO/HUrkqYSdNR36eQKyNMyZkC4frbDgJkRASLT/7eQT8Yw==
From:   Herve Codina <herve.codina@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 0/3] Fix i2c mux module refcount issues
Date:   Thu, 19 Oct 2023 09:35:27 +0200
Message-ID: <20231019073533.386563-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Some i2c mux drivers wrongly use the pair of_find_i2c_adapter_by_node()
/ i2c_put_adapter() to lock the parent adapter.

Indeed, i2c_put_adapter() decrements the module refcount while
of_find_i2c_adapter_by_node() does not increment it. This leads to an
overflow over zero of the parent adapter user counter.

Identified mux drivers impacted are:
- i2c-mux-gpmux
- i2c-demux-pinctrl
- i2c-mux-pinctrl

Commit 48e9743dd648 ("i2c: core: add and export of_get_i2c_adapter_by_node()
interface") introduces of_get_i2c_adapter_by_node() to correctly handle
this refcount issue.

This series fixes the 3 identified mux drivers replacing the
of_find_i2c_adapter_by_node() call by an of_get_i2c_adapter_by_node()
call.

Best regards,
Hervé

Herve Codina (3):
  i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
  i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
  i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c     | 2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.41.0

