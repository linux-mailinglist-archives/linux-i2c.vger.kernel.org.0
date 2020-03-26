Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577F3194A1B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgCZVKE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:10:04 -0400
Received: from sauhun.de ([88.99.104.3]:54366 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgCZVKE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:04 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 198502C1F8B;
        Thu, 26 Mar 2020 22:10:03 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] i3c: convert to use new I2C API
Date:   Thu, 26 Mar 2020 22:10:01 +0100
Message-Id: <20200326211002.13241-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We are deprecating calls which return NULL in favor of new variants which
return an ERR_PTR. Only build tested.


Wolfram Sang (1):
  i3c: convert to use i2c_new_client_device()

 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1

