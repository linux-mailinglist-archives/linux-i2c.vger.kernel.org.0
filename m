Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6693D75656A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 15:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjGQNsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 09:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbjGQNsN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 09:48:13 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A84B2D1;
        Mon, 17 Jul 2023 06:48:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="169508539"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2023 22:48:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D0B58400CF1C;
        Mon, 17 Jul 2023 22:48:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] ltc4306 driver enhancements
Date:   Mon, 17 Jul 2023 14:48:05 +0100
Message-Id: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series is based on the code improvement work done for
rtc-isl1208 driver and is just compile tested.

v1->v2:
 * Added Rb tag from Geert for patch#1
 * Added patch#2 for dropping enum ltc_type and split the array chips[] as
   individual variables, and make lines shorter by referring to
   e.g. &ltc_4305_chip instead of &chips[ltc_4305].

Biju Das (2):
  i2c: mux: ltc4306: Simplify probe()
  i2c: mux: ltc4306: Drop enum ltc_type and split chips[]

 drivers/i2c/muxes/i2c-mux-ltc4306.c | 33 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 20 deletions(-)

-- 
2.25.1

