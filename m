Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F5B58CA4E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242614AbiHHORl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235330AbiHHORk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:40 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB023CDA;
        Mon,  8 Aug 2022 07:17:36 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 436E84000C;
        Mon,  8 Aug 2022 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5tqGvmnrSvsFcUDABYvSLRL0NMaC8Jssd6Lw6T4P0us=;
        b=nJhMSKF0txxias8Dm3BW4cdofXFhLcuGgMTXRVDW0oVfgylj/SbPorciy3mdswFZcx+W/C
        6zh4mr4IkLfB7Gx85SaGLAaLGI/YRsR8SG+m/1LdW5iCc9uWTXs+xpjsz9vlkLxLTjizwg
        VS+B6OVySPxGsV9oxsmZvEu5W5ugRJYx18cOWNzByK6r+r7xTM7i6mB9TP8we4Mg+RsPEV
        Vhn97WzHBEAQvV6W8BhvsTDXICAl/JBukjTVCb+YFPcqp+euwPklmYrE+HXx2xtztFUX10
        B/Uto+5ewJFjJmORkOPFfK0Sk8OhWP0iQgITC9gbZJrFlNO84iBJ3w0x7K3xmA==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] docs: i2c: rework I2C documentation, part II
Date:   Mon,  8 Aug 2022 16:16:59 +0200
Message-Id: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Back in January 2020 I sent a first batch of patches to improve I2C
documentation, titled "docs: i2c: rework I2C documentation, part I" [0] and
I wrote "I will continue to cover the rest of the sections later".

After about 2.5y, here I am with part II!

This series contains assorted improvements to the "Introduction"
section. The plan is to cover the remaining sections "later", but hopefully
sooner than in 2.5 more years.

[0] https://lore.kernel.org/linux-i2c/20200123135103.20540-1-luca@lucaceresoli.net/

Luca

Luca Ceresoli (9):
  docs: i2c: i2c-protocol: update introductory paragraph
  docs: i2c: i2c-protocol,smbus-protocol: remove nonsense words
  docs: i2c: i2c-protocol: remove unused legend items
  docs: i2c: smbus-protocol: improve DataLow/DataHigh definition
  docs: i2c: instantiating-devices: add syntax coloring to dts and C
    blocks
  docs: i2c: i2c-topology: fix incorrect heading
  docs: i2c: i2c-topology: reorder sections more logically
  docs: i2c: i2c-sysfs: improve wording
  docs: i2c: i2c-sysfs: fix hyperlinks

 Documentation/i2c/i2c-protocol.rst          |  11 +-
 Documentation/i2c/i2c-sysfs.rst             |  24 +--
 Documentation/i2c/i2c-topology.rst          | 209 ++++++++++----------
 Documentation/i2c/instantiating-devices.rst |  16 +-
 Documentation/i2c/smbus-protocol.rst        |   6 +-
 5 files changed, 137 insertions(+), 129 deletions(-)

-- 
2.34.1

