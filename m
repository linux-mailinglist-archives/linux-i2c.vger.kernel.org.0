Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B93B1205AF
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 13:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbfLPM3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 07:29:53 -0500
Received: from sauhun.de ([88.99.104.3]:39828 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727665AbfLPM3v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Dec 2019 07:29:51 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id 7053A2C2D92;
        Mon, 16 Dec 2019 13:29:50 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] input: replace i2c_new_probed_device with an ERR_PTR variant
Date:   Mon, 16 Dec 2019 13:29:48 +0100
Message-Id: <20191216122950.3613-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the on-going mission to let i2c_new_* calls return an ERR_PTR instead of
NULL, here is a series for this subsystem converting i2c_new_probed_device() to
the newly introduced i2c_new_scanned_device(). Based on v5.5-rc1 and build tested.
Please apply via your tree.

Thanks,

   Wolfram

Changes since RFC:
* use a local variable and populate the private struct only on success
  (Thanks Dmitry!)
* rebased to v5.5-rc1


Wolfram Sang (1):
  input: mouse: convert to i2c_new_scanned_device

 drivers/input/mouse/psmouse-smbus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

