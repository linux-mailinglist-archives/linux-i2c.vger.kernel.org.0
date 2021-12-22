Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF9847CF78
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 10:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbhLVJqn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 04:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbhLVJqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 04:46:43 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8E8C06173F
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 01:46:42 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g11so4162018lfu.2
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqP1kgI4bBi7sIz285iv1G8hI0tK50ES53M0iBeEsbE=;
        b=ylahN3q274IGuGIIYMYxFdzaj2saZ5O7IG3xOydmJW44xZacSqvsx8G/etizIRwuw6
         gfZVR/6FSHg51DjOwodog8DePVBj7Z9FRhC9LIkhNdMz1rEI+mdPRplzdOwaIhZ6LEE2
         EJr6HuNnaH9ScokQHFEnhRV8k4fNZ/SbEvBB9QJVJdEMBQHuO9qkVKD2QBvhmzNvZrFD
         dc30769iAw9Ld8g4hj9Lw/Rseo9iMK+A9gVndnpfs07T0LWYizq0NIkpp9ogij+LB3sF
         gnCCtq1RPHoAgQy3w+bmUeM76KmjujDkDdD4CGx4igiU/mven8ylpRa2S9Bw2wXgWnNu
         6Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqP1kgI4bBi7sIz285iv1G8hI0tK50ES53M0iBeEsbE=;
        b=UKjV8Ga16K0TJ+PBbNVrztKZNLS1r4YvaC2TcJj+DygOw3ZjXXSejIVDYC9P7Ic5O/
         zXKojblvXyscyHPm/Dz3vJ1Dg2Lvd5Yy6wd50qQ5h8hLqradBVfW8t5UqhvVuN+a+PWN
         8pJ+cnPpWQjXC6ysTI0TJ/YU8fltwnKtzJ2aviGIaZQ0mlIx5RUyCCUpX7oTsoUm/faH
         XvE93/erVL+npa5AJjrGZhaqaSXj7o4D2vFqgJplCWpK0bATZKL7yo+n5waNo7nh31+v
         +G+074GCm6hquDWiCqtumarqymzIGW1bPVtto8WhUeAu4ZCsfEggVjbWJ3yHJPI/Pit8
         uYRw==
X-Gm-Message-State: AOAM530TBxCDctKZYSYu7YrhS6+dalP4rmCizM4ac/MM49rQOsw+RPi6
        Q2eavpVC6ECdiW7P6jM1F7B1yFYsIEJnHQ==
X-Google-Smtp-Source: ABdhPJy9GCrp5bJj+zoLeuDYLyBcdnHGMNv1O7LZ7SgLcchzQVlFNR3cfvHTMyo8bTovQTC1z/9Vng==
X-Received: by 2002:ac2:5462:: with SMTP id e2mr1851914lfn.127.1640166400680;
        Wed, 22 Dec 2021 01:46:40 -0800 (PST)
Received: from dabros-l.wifi.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id e19sm132756ljn.82.2021.12.22.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 01:46:40 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, jsd@semihalf.com, upstream@semihalf.com
Subject: [RFC 0/2] i2c-designware: Add support for AMD PSP semaphore
Date:   Wed, 22 Dec 2021 10:45:56 +0100
Message-Id: <20211222094558.2098791-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset comprises support for new i2c-designware controller setup on some
AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
controller and acts as an i2c arbitrator there (x86 is leasing bus from it).

First commit aims to improve generic i2c-designware code by adding extra locking
on probe() and disable() paths. I would like to ask someone with access to
boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
behavior of my changes on such setup.

Second commit adds support for new PSP semaphore arbitration mechanism.
Implementation is similar to the one from i2c-designware-baytrail.c however
there are two main differences:
1) Add new ACPI ID in order to protect against silent binding of the old driver
to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
new _HID allows to recognize setup with PSP.
2) Beside acquire_lock() and release_lock() methods we are also applying quirks
to the lock_bus() and unlock_bus() global adapter methods. With this in place
all i2c clients drivers may lock i2c bus for a desired number of i2c
transactions (e.g. write-wait-read) without being aware of that such bus is
shared with another entity.

Mark this patchset as RFC, since waiting for new ACPI ID value. As a temporary
measure use "AMDI9999". Once proper one will be ready, will re-send this CL for
review & merge.

Looking forward to some feedback.

Jan Dabros (2):
  i2c: designware: Add missing locks
  i2c: designware: Add AMD PSP I2C bus support

 MAINTAINERS                                 |   1 +
 drivers/acpi/acpi_apd.c                     |   1 +
 drivers/i2c/busses/Kconfig                  |  20 ++
 drivers/i2c/busses/Makefile                 |   1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 359 ++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c  |  12 +
 drivers/i2c/busses/i2c-designware-core.h    |   9 +-
 drivers/i2c/busses/i2c-designware-master.c  |   6 +
 drivers/i2c/busses/i2c-designware-platdrv.c |   3 +
 9 files changed, 411 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

-- 
2.34.1.307.g9b7440fafd-goog

