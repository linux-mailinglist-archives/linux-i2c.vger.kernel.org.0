Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43D321BC4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 18:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfEQQjt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 12:39:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39612 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEQQjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 12:39:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so3585253plm.6;
        Fri, 17 May 2019 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OMoEZ2iMm1kOq3Qs5rH+hd52FI71eBsF046g/E2MoG4=;
        b=CJHxt09Ve4GNfCw2nyh5+nY5vHHzVwJk5t9P9GyQmx9F6+HYlFpZq9I5Jb6iy2qiKI
         drsEghEvsWogyskmWAG5l3QDbgO8XC4HpfR2nra+evhA7iW7Rv4VEPCiiXYX4J5Ghxr2
         szisYrAC81LKk8zYnaM66YW1DHBqPuLJzAR4oultfZNfg3OmDWrTDrtYsci2gzAfiZvB
         XAqt9ao+gx1bcoJ5gh+swcM1+1GsGw/+Fy6+KtgDTt8vYB5+THSmUYOgqbf4E/V3GdRm
         27dOzK7px2LUlZXFsvmEbotr6EKS5Lut04cebbiuobHOicXyjRIKT14/u0DdCKYV8zeF
         jD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OMoEZ2iMm1kOq3Qs5rH+hd52FI71eBsF046g/E2MoG4=;
        b=GR7ZmnWTaHtkW1yX/4VnU4Qv2y4qnCXVb16xZSnBMHHJw+rjob5ilP785ludpMLhp7
         RIqEmYAwMcZA4NjSbbCd5FEOtY1LDn0Jwvetj5MsSP3hAMGhqjYdZdHFsihh+5de5Pxu
         ISHtAwHkxbliUdEUAeMet7jJ8IufjeQJ3E2DJ2+pwrUq/MkO8VVJni1rHHg+6o9/9aLP
         1aUUivfNZXiYpewYzNsmWnfLlOANz8LrStslKbimI/vSIMGtv3vBhzEtnUxsIJjSmEQQ
         ZiE0arQ4KQ96fZAGhVrTsKNVkkYce5lTLFQBe/wshUzgwR84WAtPFgM5iX/phCIQydGk
         Do5A==
X-Gm-Message-State: APjAAAUa9vFPnF9jYEm+sSFVMpT0HogqXhG3O4zSQl41OuIWTMkT55kE
        FUswO9/S7YfUaHsQXno6u3M=
X-Google-Smtp-Source: APXvYqwvj++poiLPmNNOh0bEC0A1ERZ1NH1sXCDX/yOY2q3pSypzQ8IyHPjqHAuPFvWicTjxW7kvSg==
X-Received: by 2002:a17:902:b601:: with SMTP id b1mr10209235pls.117.1558111188991;
        Fri, 17 May 2019 09:39:48 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z7sm10513791pgh.81.2019.05.17.09.39.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:39:48 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 0/4] usb: typec: ucsi: ccg: add runtime pm support
Date:   Fri, 17 May 2019 09:38:14 -0700
Message-Id: <20190517163818.5007-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki

These patches add support for runtime power management for UCSI CCGx driver.
I have tested them with NVIDIA GPU card which has i2c interface to talk to
CCG controller. I have added runtime pm support for the i2c bus driver as well.

First two patches add support for runtime pm in i2c bus driver and UCSI CCGx
driver.

Last two patches add workaround for an old version of ccg firmware
which has known issue of not missing interrupt when a device is connected
to runtime resume the ccg controller. The workaround is needed because
if a GPU card doesn't get new firmware but gets new kernel then also it
should continue to work.

Thanks
Ajay

Ajay Gupta (4):
  i2c: nvidia-gpu: add runtime pm support
  usb: typec: ucsi: ccg: enable runtime pm support
  i2c: nvidia-gpu: resume ccgx i2c client
  usb: typec: ucsi: ccg: add runtime pm workaround

 drivers/i2c/busses/i2c-nvidia-gpu.c |  37 ++++++--
 drivers/usb/typec/ucsi/ucsi.c       |   1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 138 +++++++++++++++++++++++++++-
 3 files changed, 165 insertions(+), 11 deletions(-)

-- 
2.17.1

