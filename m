Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2724033617
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 19:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfFCRIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 13:08:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36938 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFCRIh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 13:08:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id 20so8649559pgr.4;
        Mon, 03 Jun 2019 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xQ8NRhsJHVcFy61BUKCxSgtdSMOfetusLadIGRaNFGk=;
        b=MzZslMC19m/THz8JcjLnHcQ2gunoJK+QQCvLef3o8B48lkq3Er1DDw6utpEDnTT5X6
         dggpYjqORrI57AaRnDjQBTJc0GOGkF/pNrAmfMcfenPqFlnKOJYkX97vUF07JxsiSm2A
         saW8BwjifqD4KaxupBMWXyvykonrokqS9HVKe+eOfFKvY68FwmRZnrvDZyKRjAKESXLz
         oy/93N/10dFW2zUQnp+c0brEea2Op9vVLRvfhUPX/ijILth5Z9d3/1H6+X8bZZQlEiHr
         uH2lxV5UYqVa2JMy5wh8Jfw3EC3h3NQiw7bZDvt/x+BtT8QcXsOtPA8n+2YKWPyhiUrG
         NI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xQ8NRhsJHVcFy61BUKCxSgtdSMOfetusLadIGRaNFGk=;
        b=rXVhXDMJcAaaaGQNRoKXYbF1mn1FtwBPzasafArachUtbyA/SxghDTPC1Dfoe8HVMS
         DEwcjofR9s6DBHz5Z8shYaExK5mVN7IqAcfLsGSR5OTmqR6x4abbY9gd6pzXrHvnBJiN
         kpp1aJziZK3+jr6TmUjD5iV7KeI7ZkTKFwddsyZrHi2R+0CUK/+kgmF0xhoV6goOFLgV
         0dXMrX3pLKTmF0nc4MDr7U++1HI8LvFIaAeZHWhNxVo4MPSUzkd/BPl9L2OmYi9/EjDC
         7bl6ft4Yln22tFaRjfF4ACl1CdGkk0d8mWbTw4MTKG+PFwoI9tX8K/4FG8VDVwVVafk0
         6L4Q==
X-Gm-Message-State: APjAAAWtj6KX8Op4TNNJWeniETivRhAhdS+nnx/R4fsS60SUXlifDYkr
        Nh6Gsiz7zV+yPjmU7BRq1QA=
X-Google-Smtp-Source: APXvYqx/pI1U6Faacj44VkhbompKfy3LvLkL7b9lMUWC9gS4GJ9KcVbCWVDbqRNwSQPulB64FEwRCw==
X-Received: by 2002:a65:6256:: with SMTP id q22mr29750116pgv.190.1559581716301;
        Mon, 03 Jun 2019 10:08:36 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id p63sm17988814pfb.70.2019.06.03.10.08.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 10:08:35 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v4 0/5] usb: typec: ucsi: ccg: add runtime pm support
Date:   Mon,  3 Jun 2019 10:05:40 -0700
Message-Id: <20190603170545.24004-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki and Wolfram

These patches add support for runtime power management for UCSI CCGx driver.
I have tested them with NVIDIA GPU card which has i2c interface to talk to
CCG controller. I have added runtime pm support for the i2c bus driver as well.

Third version (v4) of patches fix comments from Wolfram on further refactoring
master_xfer() fucntion in i2c-nvidia-gpuc.c file. Also I have added comment on
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

 drivers/i2c/busses/i2c-nvidia-gpu.c |  71 +++++++++++++----
 drivers/usb/typec/ucsi/ucsi.c       |  10 +++
 drivers/usb/typec/ucsi/ucsi.h       |   1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 118 +++++++++++++++++++++++++++-
 4 files changed, 179 insertions(+), 21 deletions(-)

-- 
2.17.1

