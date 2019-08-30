Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D2AA37C4
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 15:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbfH3Nb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 09:31:27 -0400
Received: from sauhun.de ([88.99.104.3]:54406 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727756AbfH3Nb1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 09:31:27 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 495CA2C0095;
        Fri, 30 Aug 2019 15:31:26 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-rtc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] rtc: convert two drivers to devm_i2c_new_dummy_device()
Date:   Fri, 30 Aug 2019 15:31:22 +0200
Message-Id: <20190830133124.21633-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I was about to simplify the call to i2c_unregister_device() when I
realized that converting to devm_i2c_new_dummy_device() will simplify
the drivers a lot. So I took this approach.

Only build tested, but visually reviewed multiple times.

Change since V1:

* rebased to rtc-next

Wolfram Sang (2):
  rtc: max77686: convert to devm_i2c_new_dummy_device()
  rtc: s35390a: convert to devm_i2c_new_dummy_device()

 drivers/rtc/rtc-max77686.c | 17 +++---------
 drivers/rtc/rtc-s35390a.c  | 54 +++++++++-----------------------------
 2 files changed, 17 insertions(+), 54 deletions(-)

-- 
2.20.1

