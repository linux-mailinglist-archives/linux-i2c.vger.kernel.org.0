Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152382F35F8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbhALQmP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:42:15 -0500
Received: from www.zeus03.de ([194.117.254.33]:37322 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbhALQmO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 11:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=WLEbJPC873nWMnwiOyARO6xkxnK
        66e/bwM7RBGOc70U=; b=3aWck16ZLDFqsEERVcrG/peOwcndHVX81Zdi5G2ZNnP
        w+9LXhDQNUemSSZLlLj0qZtGyFKOQte76GZYWEWVFUafwUH5CO1XQ58ciL4S1pNU
        INxkLjEZppFgDcGN8TM0qah05T4kowS/Zm9NEpTL6KAipNtU8dLBw/x9YYQf3Heg
        =
Received: (qmail 2812363 invoked from network); 12 Jan 2021 17:41:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 17:41:32 +0100
X-UD-Smtp-Session: l3s3148p1@h5zqsba4RtEgAwDPXwxzAHrEwO71dOp2
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net
Subject: [PATCH RFC 0/3] treewide: remove open coded SMBus block transfers
Date:   Tue, 12 Jan 2021 17:41:26 +0100
Message-Id: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
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


Wolfram Sang (3):
  media: i2c: adv7842: remove open coded version of SMBus block write
  media: i2c: adv7842: remove open coded version of SMBus block read
  ipmi: remove open coded version of SMBus block write

 drivers/char/ipmi/ipmb_dev_int.c | 21 +++++++----------
 drivers/media/i2c/adv7511-v4l2.c | 40 +++++++++++---------------------
 drivers/media/i2c/adv7842.c      | 14 +----------
 3 files changed, 23 insertions(+), 52 deletions(-)

-- 
2.29.2

