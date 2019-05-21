Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63B224A1C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfEUIVq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:21:46 -0400
Received: from sauhun.de ([88.99.104.3]:32964 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfEUIVp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:21:45 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 532892C54BC;
        Tue, 21 May 2019 10:21:44 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/8] arm: add I2C DT binding docs to various platforms
Date:   Tue, 21 May 2019 10:21:29 +0200
Message-Id: <20190521082137.2889-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C drivers entries in MAINTAINERS miss their DT bindings docs.
This series fixes that. Because these drivers are all embedded in their
platform entries, I suggest the respective maintainers pick them up via
their tree. If you prefer that I take them via I2C, let me know.

Wolfram Sang (8):
  MAINTAINERS: add I2C DT bindings to Zynq platform
  MAINTAINERS: add I2C DT bindings to DaVinci platform
  MAINTAINERS: add I2C DT bindings to LPC platforms
  MAINTAINERS: add I2C DT bindings to Nomadik/U300 platforms
  MAINTAINERS: add I2C DT bindings to Rockchip platform
  MAINTAINERS: add I2C DT bindings to STI architecture
  MAINTAINERS: add I2C DT bindings to Versatile platform
  MAINTAINERS: add I2C DT bindings to vt8500 architecture

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.19.1

