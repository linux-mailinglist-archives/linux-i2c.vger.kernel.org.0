Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5C559626
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 10:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfF1Ibh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 04:31:37 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:49122 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfF1Ibh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 04:31:37 -0400
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hgmI9-00054Y-4j from Joshua_Frkuska@mentor.com ; Fri, 28 Jun 2019 01:31:33 -0700
Received: from jfrkuska-fe28.world.mentorg.com (147.34.91.1) by
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Fri, 28 Jun 2019 01:31:30 -0700
From:   Joshua Frkuska <joshua_frkuska@mentor.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <wolfram@the-dreams.de>, <msyrchin@dev.rtsoft.ru>,
        <ying.zhang22455@nxp.com>, <leoyang.li@nxp.com>, <york.sun@nxp.com>
Subject: [PATCH V7 0/1] i2c: imx: add slave support
Date:   Fri, 28 Jun 2019 17:31:00 +0900
Message-ID: <20190628083101.103418-1-joshua_frkuska@mentor.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <42974013-1b7a-368a-652d-47f709c4e91e () mentor ! com>
References: <42974013-1b7a-368a-652d-47f709c4e91e () mentor ! com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Purpose:
Its purpose is to introduce i2c slave capability to the imx i2c bus controller driver.

This patch was tested on i.MX6q sabresd, sabreai and UDOO boards. It is a continuation of the work started in the following thread https://www.spinics.net/lists/linux-i2c/msg27340.html

The current version is version 7 and is a continuation of the discussion in https://www.spinics.net/lists/linux-i2c/msg30208.html and https://marc.info/?l=linux-i2c&m=154202241501928&w=2

v7 change summary:
1. rebased patchset on i2c/for-next dcd4072a2e0be81b31f94c97183e938b051d24f7 "Merge branch 'i2c/for-5.3' into i2c/for-next"
2. reduced #ifdef usage for i2c-slave and replaced with __maybe_unused
3. re-ordered i2c-slave functions to remove prototyping
4. refactored white space in commenting
5. removed scheduler priority adjustment code
6. updated added function names to use i2c_imx_ prefixing
7. grouped slave related members together in imx_i2c_struct 
8. removed v6 changes due to different co-author and not being able to comment on the changes (cc'd co-author in v7)
9. removed cosmetic changes

v6 change summary:
1. rebased patchset on i2c/for-next 
2. Add STOP signal process in slave receive mode.
3. Add CONFIG_PPC_55xx support

v5 change summary:
1. rebased patchset on i2c/for-next 5ff37d1a67e2fed0cae537ad682abb7f6647cca4 "Merge branch 'i2c/for-4.13' into i2c/for-next"

v4 change summary:
1. preserved Maxim's authorship, added rework note with signoff
2. re-arranged #include ordering
3. fixed check-patch warnings
4. redefined MAX_EVENTS to an integer
5. removed introduction of error codes
6. changed last_error (atomic_t) to type int
7. removed white lines
8. fixed multiple parenthesis alignment issues
9. removed explicit casting
10. replace udelay with usleep_range
11. removed multiple excess spacing issues
12. check for return of wait_event_interruptible_timeout
13. simplified conditional statements
14. removed dubious pinctrl handling
15. updated commit message

Testing: (validated locally with 3 different imx6q devices) For the purpose of this test, any 2 imx6 boards were hooked together to form a multimaster bus. In this configuration, slave and multimaster configurations can alternatively be stress tested. It is rebased and tested on the i2c/for-next branch.
1. enable CONFIG_I2C_SLAVE=y
2. enable CONFIG_I2C_SLAVE_EEPROM=y[m]
3. enable CONFIG_I2C_CHARDEV=y[m]
4. build the kernel
5. install the kernel/drivers on 2 imx devices
6. wire the i2c busses of both devices together
7. load kernel modules if needed
8. instantiate a slave eeprom on device 1 with address A on whatever bus it corresponds to (e.g. `echo slave-24c02 0x1066 > /sys/bus/i2c/devices/i2c-0/new_device`)
9. instantiate a slave eeprom on device 2 with address B on whatever bus it corresponds to (e.g. `echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-2/new_device`)
10. using i2cget/set on the appropriate bus, randomly read/write on device 1 from/to address B. (e.g. `i2cget -y 0 0x64` OR `i2cset -y 0 0x64 0x01 5`)
11. using i2cget/set on the appropriate bus, randomly read/write on device 2 from/to address A. (e.g. `i2cget -y 2 0x66` OR `i2cset -y 2 0x66 0x02 7`)
12. confirm operation between devices by observing the input and output of the i2cget/set functions as well as dumping the contents of the eeprom via the sysfs entry (/sys/bus/i2c/devices/i2c-<BUS #>/new_device)

Any constructive comments would be greatly appreciated.

Thank you

Maxim Syrchin (1):
  i2c: imx: add slave support

drivers/i2c/busses/i2c-imx.c | 753 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
1 file changed, 708 insertions(+), 45 deletions(-)

-- 
2.5.5

