Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE5E618B68
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 23:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbiKCW1a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 18:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiKCW13 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 18:27:29 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C30D21802;
        Thu,  3 Nov 2022 15:27:27 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oqigH-005aIb-O6; Thu, 03 Nov 2022 23:27:25 +0100
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oqigH-005Ggn-9f; Thu, 03 Nov 2022 23:27:25 +0100
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-input@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v2 0/3] Fixes for the mcp2221 HID-to-I2C-bridge driver
Date:   Thu,  3 Nov 2022 23:27:11 +0100
Message-Id: <20221103222714.21566-1-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
References: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

- the rxbuf pointer can become invalid or even stale if the device would
  send unsolicited reports

Changes in v2:

- removed: data shared with the bottom half code is not protected from
  concurrent access

Feedback if this is actually needed or not would be appreciated.

- rebased on linux-hid/for-6.2/mcp2221

Enrik Berkhan (3):
  HID: mcp2221: don't connect hidraw
  HID: mcp2221: enable HID I/O during GPIO probe
  HID: mcp2221: avoid stale rxbuf pointer

 drivers/hid/hid-mcp2221.c | 51 +++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

base-commit: 3d74c9eca1a2bda03e45f18d13154ac3e0dfba85
-- 
2.34.1

