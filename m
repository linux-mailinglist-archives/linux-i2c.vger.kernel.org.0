Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3E93923A
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 18:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730816AbfFGQhe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 12:37:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33618 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfFGQhe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 12:37:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id x15so1515187pfq.0;
        Fri, 07 Jun 2019 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uME/NtMQHAa2hKwfu/JcjwhnUS63snwCbGD6n+zyJCE=;
        b=VZPh764sRUOuyBOze63n4ipPuY3fKyavMMXi/bW8lYIezEaWqRS7XY+pTJhyB4cXUr
         ZQoSqPWIa4ppYVt/+xYNZckXlT7PLJ1lM+9mtIoznFfOUUUgAZNiCmtiCZHV6PtMXDsT
         umdeL33e+unObljqdH/iZblKnTXUpKk/cA3br0gNPUwskVqyK7rQNdc1MYot2Zc6OA/n
         kuvchxi+0AtRZzmFYkLNUsDZJhrvnOAP7azgOVPVU7vGJKEPq2WDuhLRuQ1urhsGoT8J
         EbBD8PP88hGgaxtbib9L7mbX2eA16BujXvLw+PBBxWbJ9xk4MHZ6VCOkwodic4ckj0nD
         l/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uME/NtMQHAa2hKwfu/JcjwhnUS63snwCbGD6n+zyJCE=;
        b=XiD5bGoJ84o8ObIZ+vSmjp+eJG8aohNHDHUS6f1nWmmY7wrabOsvzhJ4hQgGnDmyqQ
         V0fNrf43qf/dcNVIjB6yi0edzKlyaYYkH9AGblHSq4ApJAkcJhykcw2wfel3smo/uQd+
         evM0P+3ThblgOSWw4xDQYmL3hzR1RoFOQotCzTj5pNbUXTOC1WyCgISGf0EGeRiqBtSK
         RYhdhKqDm5zLHv8hKdWOhAPvO9qUQglPPoF2ostKO8G/jbpKiEAC9Ykl8rATGS0y592C
         I6JJJbl2ubGuOTl1bL1Stvg+c8qZCbavNHF1zPWg3VxgRwiiUedv4EOqbMfYdvWcsnIp
         rFFA==
X-Gm-Message-State: APjAAAWan9OfFNqIYbLEdi+xPNZZCv2ZSe6mzYiRC5kwevAa6o9lLNJV
        zaRvmmu+8aXKRJpSe+qlOeY=
X-Google-Smtp-Source: APXvYqxDWXYzRHbl7W0dxFXS7lq80py9lQ4XUbPhhuMjIAY0ywUj7kGVgNuwUG8WeDi+tUbAMzVAFA==
X-Received: by 2002:a65:6398:: with SMTP id h24mr3617741pgv.446.1559925453949;
        Fri, 07 Jun 2019 09:37:33 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id t2sm1745520pgj.39.2019.06.07.09.37.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:37:33 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v5 0/5] usb: typec: ucsi: ccg: add runtime pm support
Date:   Fri,  7 Jun 2019 09:34:18 -0700
Message-Id: <20190607163423.31860-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki and Wolfram
The latest set (v5) fix comments from Wolfram on further refactoring
master_xfer() function in i2c-nvidia-gpuc.c file and removing extra comments
in patch 2/5.

Patches can go through either usb or i2c tree but since there are 3 out of 5
patches from i2c so may be better they go through i2c. They all should go
together.

Thanks
Ajay

---- v4
These patches add support for runtime power management for UCSI CCGx driver.
I have tested them with NVIDIA GPU card which has i2c interface to talk to
CCG controller. I have added runtime pm support for the i2c bus driver as well.

Fourth version (v4) of patches fix comments from Wolfram on further refactoring
master_xfer() function in i2c-nvidia-gpuc.c file. Also I have added comment on
why we need a stub gpu_i2c_suspend() for runtime pm to work correctly.

First patch refactors master_xfer() of i2c driver fixing comment from Wolfram.
Second and third patch add support for runtime pm in i2c bus driver and UCSI CCGx
driver.

Last two patches add workaround for an old version of ccg firmware
which has known issue of missing interrupt when a device is connected
to runtime resume the ccg controller. The workaround is needed because
if a GPU card doesn't get new firmware but gets new kernel then also it
should continue to work. The workaround is to request runtime resume of
i2c client which is UCSI Cypress CCGx driver. CCG driver will call the ISR
for any connector change event only if NVIDIA GPU has old CCG firmware with
the known issue.

All the five patches should go together since ucsi_ccg driver is dependent
on i2c driver for runtime pm wokaround. I would prefer it to go through
usb-tree since usb ucsi_ccg driver is the main driver getting runtime pm
functionality with the series.

Thanks
Ajay


Ajay Gupta (5):
  i2c: nvidia-gpu: refactor master_xfer
  i2c: nvidia-gpu: add runtime pm support
  usb: typec: ucsi: ccg: enable runtime pm support
  i2c: nvidia-gpu: resume ccgx i2c client
  usb: typec: ucsi: ccg: add runtime pm workaround

 drivers/i2c/busses/i2c-nvidia-gpu.c |  64 +++++++++++----
 drivers/usb/typec/ucsi/ucsi.c       |  10 +++
 drivers/usb/typec/ucsi/ucsi.h       |   1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 118 +++++++++++++++++++++++++++-
 4 files changed, 172 insertions(+), 21 deletions(-)

-- 
2.17.1

