Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C94429AC8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 03:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhJLBKh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 21:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbhJLBKg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 21:10:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283A2C061570
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 18:08:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j5so80774175lfg.8
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lc5UpZccado6vN9C8psyC7T7O2wJ9OXek8gEjbedyhg=;
        b=PoWEKwiwJoKPWCn1FT319rBgmIGLVv+HZI4V0coMotMHR6NPmBtShtMNo8PHf9mMDH
         4RFgUykCOJdJymw5l7xuq+FEiCoxdxn/tG03RYSd3qDNNVi21gBcbiJ0mQ0/Jm810e/0
         qrBeFoYa21h6rXjokUxpdZjbiwZpQ31jeuCqGb3hPkToR6Ap7W9iKwW1/8XC6INWMw0p
         3Qznc6NP8jakEhkMRXFIWBuotwA5h4dGM+nT73PEfsjNwVYRqPP1dCCHZhg+Bs1dp+WC
         cqoJdNuf67h1GkLg883uy70loRjIIwsI3dgLqIUeP+CuS2HbgA9zBZ3c1Qa/7HX+5V2M
         7i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lc5UpZccado6vN9C8psyC7T7O2wJ9OXek8gEjbedyhg=;
        b=AiJXgfI37n3E9aDV+j8v0TeRFbTTHqANN8SWz5vaG+ULL4Qc92EtPqUmRpI+o6MmS+
         ZfJ65yjvqTCzP/HjbCncN2yjJGFgdg3SKqqfqpG4uh5Ipn0C2g1Tpzw4mDXbxg3cJjV1
         VzkP4M2JO0Hs7W80mmgGd3XatGJLZ2xsZWUG/XRzu0KyTyDCC0KEl6q0/HqKEd7csNmP
         o+jqbNBpp5e/2lqRraDZNzFbcy9pf9fROHYcWnWPT9fNoL4SHoL4KtUtJ/So/Z5yhOws
         4P6ceOzPcabgXv/mzJvQptPqfGKFVEFiwtaa3G0dDFxnxsa950kdGTIiJZoUJIrQI8zY
         pboQ==
X-Gm-Message-State: AOAM531a1pwuwyVUm+qsi7bjGMQYvakzzFFz3mSTL6Npd6V7DF9K7Aw+
        MTMDqyWcundXzinrBN1pck+PYiZLUuJquEJwnwjI/c8wTmyifg==
X-Google-Smtp-Source: ABdhPJyLjjBZxsSO2yMGmTXrhu5Ut/s450cyUUrugQ5H7gSfFfuIj/GB+1N3Xz4hYLX9/JtXB6fgcOWN+1YfBO0P/zU=
X-Received: by 2002:a2e:9c4b:: with SMTP id t11mr27255180ljj.376.1634000857454;
 Mon, 11 Oct 2021 18:07:37 -0700 (PDT)
MIME-Version: 1.0
From:   Sui Chen <suichen@google.com>
Date:   Mon, 11 Oct 2021 18:07:25 -0700
Message-ID: <CAJOps0s4qY3O36BGUpffzzA=gxw_crDzf_iif2fq0RdVhfCydg@mail.gmail.com>
Subject: [RFC Patch 0/2] I2C statistics as sysfs attributes
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It appears bus errors and NACK counts are frequently found in many
I2C controllers; a few I2C bus drivers now export those counters to
debugfs. There is some effort in attempting to monitor a large
number of BMCs (board management controllers) and we are wondering if
it is possible to have a more stable and unified interface for those
counters to be exported to compared to the debugfs, so that a single
command can be used to obtain the counters from different types of I2C
controllers.

One possible prototype is included in the patchset where debug
counters are populated in /sys/class/i2c-adapter/i2c-X/stats/.

By default only an empty stats folder is created, and it is up to the
platform drivers to instantiate the counters and link the counters to
the data structures internal to the bus drivers.

From the kernel data structure point of view, the statistics are
a property of an i2c_adapter (and not an i2c_dev). From the driver
type point of view, the counters should only be instantiated by a
platform driver (such as bus drivers) and not a device driver (such
as mux drivers.) In this example, the npcm7xx driver instantiates the
counters.

The patchset is intended to request comments on whether the goal makes
sense and what a good approach looks like.

Patch 1: add i2c statistics to i2c_adapter
Patch 2: instantiate i2c statistics from the npcm7xx i2c bus driver

TODO:
- Decide on which counters to be included (maybe start with BER and
  NACK?)
- Use enums and not strings as counter names
- Make binding more flexible so a counter can be backed by some
  function and not only pointer to a value

The desired effect can be tested by building and running an OpenBMC
distribution targeted at the npcm7xx SoC and running the image in QEMU.
The testing steps are as follows:

1. Clone the OpenBMC repository
2. `devtool modify`and apply patch to the linux-nuvoton recipe
3. Build image for quanta-gsj
4. Build QEMU
5. Run the image-bmc image in QEMU

Results:
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# ls
ber_cnt       i2c_speed     nack_cnt      rec_fail_cnt  rec_succ_cnt
timeout_cnt
root@gsj:/sys/class/i2c-adapter/i2c-1/stats# cat *
0
100000
0
0
0
0

Patch list:
Sui Chen (2):
i2c debug counters as sysfs attributes
add npcm7xx debug counters as sysfs attributes

drivers/i2c/busses/i2c-npcm7xx.c |  8 ++++++++
drivers/i2c/i2c-core-base.c      |  3 +++
drivers/i2c/i2c-dev.c            | 99
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
include/linux/i2c.h              | 21 +++++++++++++++++++++
4 files changed, 131 insertions(+)
