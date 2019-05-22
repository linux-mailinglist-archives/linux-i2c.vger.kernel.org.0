Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0AF4269E4
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 20:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729562AbfEVSdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 14:33:38 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39339 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbfEVSdi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 14:33:38 -0400
Received: by mail-pg1-f195.google.com with SMTP id w22so1740418pgi.6;
        Wed, 22 May 2019 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RCB+Wwrfoeojn5OomtnKLYYAzLMm3Cgy7bczJAntCUM=;
        b=R32O6tuRCC5QThL92wCGsKdhHKTRtXhVp4CXxU+bqj8rJqxH6p5e4Or1NrrPz2EuDR
         QXKNq5im6lCnsncx1XglgqXsqEnU2fuY+z0UC1zngjyPD+vHBCjCLq8ge1GaDQM/Gd0n
         KCK6GJll4oxC8iTxeIQ5YdgsUPUXRByck6FJNhmYZ4IOMKYOzAiqbWO+hb1ZeEuFcWDc
         uwRqjZIrMFU/e7hOStzmlngIKDrA7Cfo6HDY3d3eNofg6XpZcoqdKktzADDWWHPlEAPW
         3/z60kIppAyYTxu5IJlXih8mUS7TK8d0v5gWqyXvJBzJ9zrejQdzR/WU1zeAI3gyLUu4
         dNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RCB+Wwrfoeojn5OomtnKLYYAzLMm3Cgy7bczJAntCUM=;
        b=YTESJ3lEWQb1JyEMVIeD5kOScwmdwb/v531Ga2/B3tozWJ9A7vIynjrjOeMzEyi7E0
         GRh+RwWiKOdYAdN9mUfZHpYTzALlV5NVXDBZBCKfp+tyAw5lVxqWQo3LuQlB2PeKQAGU
         P+GlCDBSjJkVIsWid845hl9bFCp50CMmASwRmZEodTXXs9Fj6Yp9kY17jNGU7teuRsXl
         au1vwYmxiOCO1oTCnNDgTx0yKkNkYq3ODznWz6znTrOtsSgdTF73i/7J7PG4+vO2SwzD
         3YBiXU0bB/AuDUw4OP3KYC5+/R2oihzHK9wvDLtkIF5C3een1mzvsnPPGbFQL8PMd1Ho
         7GmA==
X-Gm-Message-State: APjAAAXhWLu1gW2N8WPVr9LjePicwsLLeVUf1mhgesEa2dSToXNqBs5A
        RT3xoc4OQaekzpflQwAP0Ms=
X-Google-Smtp-Source: APXvYqz6YawLK0+5f+iauXtOgiHzgCAaEjrrezzVp8j4EabNZLP8/g7efWglnpHsQZ0yEJCsA4IVuw==
X-Received: by 2002:a62:4ed8:: with SMTP id c207mr98395058pfb.241.1558550017231;
        Wed, 22 May 2019 11:33:37 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id c76sm46138294pfc.43.2019.05.22.11.33.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:33:36 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v3 0/5] usb: typec: ucsi: ccg: add runtime pm support
Date:   Wed, 22 May 2019 11:31:37 -0700
Message-Id: <20190522183142.11061-1-ajayg@nvidia.com>
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

Third version (v3) of patches fix comments from Heikki on adding common function
in ucsi.c which can be used by both ucsi_ccg and ucsi_acpi.

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

 drivers/i2c/busses/i2c-nvidia-gpu.c |  60 ++++++++++----
 drivers/usb/typec/ucsi/ucsi.c       |  10 +++
 drivers/usb/typec/ucsi/ucsi.h       |   1 +
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 118 +++++++++++++++++++++++++++-
 4 files changed, 169 insertions(+), 20 deletions(-)

-- 
2.17.1

