Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CD22FC3BF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387582AbhASOfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:35:19 -0500
Received: from www.zeus03.de ([194.117.254.33]:55058 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387677AbhASJkZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 04:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=rKwj1AfOLCGXOesf4eVBjnn2gVf
        wi0SlaspsyM9LG+I=; b=oee3ecn0uienirp2jDwWU+e7Y5MuiH5+fUUSnG1B98l
        uag0O9R6618Ou5swlFlhnVVLeDxqpJh6tpiUnJaYetAWPBy0nSexXtazuqWvjN/E
        +DQfSEaiuBH9Tipikok+JclDS0eyMAV15EO+WUdH0oF5tm4Fsxt19iRrnxTMU148
        =
Received: (qmail 1003424 invoked from network); 19 Jan 2021 10:39:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jan 2021 10:39:19 +0100
X-UD-Smtp-Session: l3s3148p1@dCTXnD257NkgAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net
Subject: [PATCH 0/3] treewide: remove open coded SMBus block transfers
Date:   Tue, 19 Jan 2021 10:39:07 +0100
Message-Id: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The bigger picture is that I want to extend the maximum block length for
SMBus block transfers from 32 (SMBus2) to 255 (SMBus3). That needs some
cleanups and refactoring first. To make that easier, it would be helpful
if all in-kernel users would call the helper functions of the I2C core
for SMBus block transfers and not open code it via the generic
smbus_xfer.

This series converts the three users doing that. I don't have the
hardware, so these patches are only build tested. Please let me know
what you think.

Changes since RFC:
* addressed review comments, see individual patches

Wolfram Sang (3):
  media: i2c: adv7842: remove open coded version of SMBus block write
  media: i2c: adv7511: remove open coded version of SMBus block read
  ipmi: remove open coded version of SMBus block write

 drivers/char/ipmi/ipmb_dev_int.c | 24 +++++++++----------
 drivers/media/i2c/adv7511-v4l2.c | 41 ++++++++++++--------------------
 drivers/media/i2c/adv7842.c      | 24 ++++---------------
 3 files changed, 32 insertions(+), 57 deletions(-)

-- 
2.29.2

