Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADAFF3B279
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 11:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389127AbfFJJw3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 05:52:29 -0400
Received: from sauhun.de ([88.99.104.3]:39668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388664AbfFJJw3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 05:52:29 -0400
Received: from localhost (p54B33062.dip0.t-ipconnect.de [84.179.48.98])
        by pokefinder.org (Postfix) with ESMTPSA id 458282C077A;
        Mon, 10 Jun 2019 11:52:27 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH 0/3] treewide: simplify getting the adapter of an I2C client, part2
Date:   Mon, 10 Jun 2019 11:51:53 +0200
Message-Id: <20190610095157.11814-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a small follow-up series to a larger cleanup series already
sent:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=112605
("treewide: simplify getting the adapter of an I2C client")

These drivers use a bit different but still unnecessarily complex way to
determine the adapter of a client. Thanks to Peter Rosin for pointing
them out. They have been fixed manually, no need for a coccinelle script
here. Build tested, too. From the previous cover-letter:

The I2C core populates the parent pointer of a client as:
	client->dev.parent = &client->adapter->dev;

Now take into consideration that
	to_i2c_adapter(&adapter->dev);

is a complicated way of saying 'adapter', then we can even formally
prove that the complicated expression can be simplified by using
client->adapter.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/no_to_adapter

Please apply the patches to the individual subsystem trees. There are no
dependencies.

Thanks and kind regards,

   Wolfram

Wolfram Sang (3):
  hwmon: lm90: simplify getting the adapter of a client
  leds: is31fl319x: simplify getting the adapter of a client
  of: unittest: simplify getting the adapter of a client

 drivers/hwmon/lm90.c           | 2 +-
 drivers/leds/leds-is31fl319x.c | 2 +-
 drivers/of/unittest.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.19.1

