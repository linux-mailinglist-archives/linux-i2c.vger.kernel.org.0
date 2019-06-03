Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF49132AB6
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 10:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfFCIZk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 04:25:40 -0400
Received: from sauhun.de ([88.99.104.3]:35870 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727463AbfFCIZk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 04:25:40 -0400
Received: from localhost (unknown [88.128.80.57])
        by pokefinder.org (Postfix) with ESMTPSA id E8FDC2CF690;
        Mon,  3 Jun 2019 10:25:37 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/5] i2c: improve main header file
Date:   Mon,  3 Jun 2019 10:25:30 +0200
Message-Id: <20190603082535.1566-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While working with i2c.h, I stumbled over some issues often enough to
finally fix them. I couldn't test all of the changes (e.g. all
I2C_CLIENT_* flags), but there is no code change involved (otherwise
it is a bug). buildbot is happy, too.

Looking forward to comments.

Wolfram Sang (5):
  i2c: headers: don't use 'dev' as adapter variable
  i2c: headers: always have a named variable in arguments
  i2c: core: always have a named variable in arguments
  i2c: headers: update docs about I2C_CLIENT_*
  i2c: headers: reformat header comment and update copyright

 drivers/i2c/i2c-core-base.c |  4 +-
 include/linux/i2c.h         | 87 +++++++++++++++++--------------------
 2 files changed, 43 insertions(+), 48 deletions(-)

-- 
2.19.1

