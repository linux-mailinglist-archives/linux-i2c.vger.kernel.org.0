Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D3F7B0EF
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 19:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387473AbfG3R4L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 13:56:11 -0400
Received: from sauhun.de ([88.99.104.3]:55972 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbfG3R4L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jul 2019 13:56:11 -0400
Received: from localhost (p54B33338.dip0.t-ipconnect.de [84.179.51.56])
        by pokefinder.org (Postfix) with ESMTPSA id 5642A2C7BD8;
        Tue, 30 Jul 2019 19:56:09 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] media: ir-kbd-i2c: convert to devm_i2c_new_dummy_device & minor cleanup
Date:   Tue, 30 Jul 2019 19:55:53 +0200
Message-Id: <20190730175555.14098-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series is part of a tree-wide movement to replace the I2C API call
'i2c_new_dummy' which returns NULL with its new counterpart returning an
ERRPTR.

It was manually converted and only build tested. A small cleanup was
added while working on this driver. Looking for ack/rev/test for this
series.

The series is based on v5.3-rc2.

Happy hacking,

   Wolfram


Wolfram Sang (2):
  media: ir-kbd-i2c: convert to i2c_new_dummy_device()
  media: ir-kbd-i2c: remove outdated comments

 drivers/media/i2c/ir-kbd-i2c.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.20.1

