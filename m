Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEBC5A6BF8
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 20:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbiH3SUm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 14:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiH3SUl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 14:20:41 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8AF14027
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 11:20:39 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oT5Zf-0065IA-Hm; Tue, 30 Aug 2022 20:02:55 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oT5Zf-009MqK-UG; Tue, 30 Aug 2022 20:02:55 +0200
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-input@vger.kernel.or, Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v1 0/4] Fixes for the mcp2221 HID-to-I2C-bridge driver
Date:   Tue, 30 Aug 2022 20:02:11 +0200
Message-Id: <20220830180215.31099-1-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In this patch series are fixes for issues I found during recent tests of
an MCP2221 board.

- you can confuse the kernel driver when using the chip from user mode
  via /dev/hidrawX, typically leading to a NULL pointer dereference in
  the driver's HID raw event handler

- the driver needs > 15s to initialize because the HID raw handling is
  not enabled during initialization of the GPIO part

- data shared with the bottom half code is not protected from concurrent
  access

- the rxbuf pointer can become invalid or even stale if the device would
  send unsolicited reports

Enrik Berkhan (4):
  HID: mcp2221: don't connect hidraw
  HID: mcp2221: enable HID I/O during GPIO probe
  HID: mcp2221: protect shared data with spin lock
  HID: mcp2221: avoid stale rxbuf pointer

 drivers/hid/hid-mcp2221.c | 114 ++++++++++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 17 deletions(-)

-- 
2.34.1

