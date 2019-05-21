Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B959B249F5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEUIPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:15:35 -0400
Received: from sauhun.de ([88.99.104.3]:32868 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfEUIPf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:15:35 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id AA9BD2C54BC;
        Tue, 21 May 2019 10:15:34 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/6] i2c: add DT binding docs to MAINTAINERS
Date:   Tue, 21 May 2019 10:15:03 +0200
Message-Id: <20190521081509.2586-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C drivers entries in MAINTAINERS miss their DT bindings docs.
This series fixes that. Because they are all dedicated I2C drivers
entries, I suggest I pick them up via my I2C tree.

Wolfram Sang (6):
  MAINTAINERS: add DT bindings to i2c-altera
  MAINTAINERS: add DT bindings to i2c-emev2
  MAINTAINERS: add DT bindings to i2c-mv64xxx
  MAINTAINERS: add DT bindings to i2c-ocores
  MAINTAINERS: add DT bindings to Renesas R-Car I2C drivers
  MAINTAINERS: add DT bindings to i2c-xlp9xx

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.19.1

