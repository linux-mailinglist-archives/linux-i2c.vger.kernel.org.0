Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C314E677
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfFUKxQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:53:16 -0400
Received: from smtp127.iad3b.emailsrvr.com ([146.20.161.127]:58666 "EHLO
        smtp127.iad3b.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726218AbfFUKxQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:53:16 -0400
Received: from smtp24.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
        by smtp24.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id 6C74C40101;
        Fri, 21 Jun 2019 06:53:15 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1561114395;
        bh=sq67qECzciHcysXU6QW4+AWhIlJ5q5EgWY3WTdVjfdo=;
        h=From:To:Subject:Date:From;
        b=PCGhT/8YcmoSxQHcv8TDBQPom2zk1MjPN4ntOyz6oAddHcFpEKPrlqWrCmYMxUf4h
         Ygtd8yJYQOLTswQM+XCri4NPVYX+3BvkJdV5Z+xkFr1F7OiljV6UE+Ssvh5LyTB8Fh
         elVX1O6NSl8g8OSqFiFsJASRpPHdJilaOZaniyUw=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp24.relay.iad3b.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id 2414540127;
        Fri, 21 Jun 2019 06:53:14 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from commune.xenotropic.com (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:25 (trex/5.7.12);
        Fri, 21 Jun 2019 06:53:15 -0400
From:   Annaliese McDermond <nh6z@nh6z.net>
To:     eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com,
        wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Annaliese McDermond <nh6z@nh6z.net>, team@nwdigitalradio.com
Subject: [PATCH v2 0/2] i2c: bcm2835: Fixes for clock changes in probe function
Date:   Fri, 21 Jun 2019 03:52:48 -0700
Message-Id: <20190621105250.19858-1-nh6z@nh6z.net>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

An issue was reported in [1] and [2] that the latest version of the i2c
driver was not properly loading.  After analysis it was determined that
the new clock code was failiing because the i2c driver was trying to
load before the bcm2835-clk driver when not loaded as a module. This is
fixed by actually attempting to grab a reference to the clock and failing
out with a EPROBE_DEFER if it's not there.  This gives the other drivers
an opportunity to load.

This series also fixes a related bug where the clock setup code in the
probe function could cause an issue where the IRQ would be requested
by the driver and never freed in case of some clock setup failure.  The
patch moves this IRQ code to the end of the probe function where it will
not cause this issue.

[1] - https://www.raspberrypi.org/forums/viewtopic.php?f=44&t=242856
[2] - https://archlinuxarm.org/forum/viewtopic.php?f=23&t=13719

Annaliese McDermond (2):
  i2c: bcm2835: Move IRQ request after clock code in probe
  i2c: bcm2835: Ensure clock exists when probing

 drivers/i2c/busses/i2c-bcm2835.c | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

-- 
2.19.1

