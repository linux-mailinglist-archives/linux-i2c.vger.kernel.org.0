Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1215647572
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 19:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiLHSVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 13:21:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiLHSVt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 13:21:49 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A9082FAF
        for <linux-i2c@vger.kernel.org>; Thu,  8 Dec 2022 10:21:47 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o15so1421265wmr.4
        for <linux-i2c@vger.kernel.org>; Thu, 08 Dec 2022 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIs4lQCakho0r7ShsrtjguOWPhatcvKJaCSKmoAEX/0=;
        b=bPMhmE83Jk2e5zLjjrHbUHSxXVfc9DjtZoT+NqFfuoZw84h2wR7nZ6N6O+XSWAlyvS
         TWejKUyLNXy8n2dsTy1e9zmFnmSBkU4m+AuVINgxXlew/XUlNu98rRLXwrY0O4WnFm39
         bBmpr9WvVBAyfW0eu922Bn6V2opnapL+6IOVvZ6mghfiz8mc2uWr9NbmM/4ZKPPnUbly
         ucwmC3ozpAWtUfEtqu8aArIhopGjNW5903aB64XqfV1Xpl2EN5vUXGq4fsnNluIUTrOc
         bm9qFVlSsXNbREAGaJdkiXsmal6eJ7vVYMAvZbY3oqVfYB0cj+fqRtWKimEZdvLY0qRc
         PUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIs4lQCakho0r7ShsrtjguOWPhatcvKJaCSKmoAEX/0=;
        b=h1q/Pg7claXFX5MAZLhc8uR8S9aJL45kkqXwRCjhJxHKccg51P0oxS5JUr2ygzw2Ru
         0hhwOG1NUMlhQhRBnp5GWG5Klsrm3pVySpUVzf7TyTfKL5OsME30+LDJcVS+SkXnmz8n
         HIfBnyvn62MqoOCwH8P/djPabnjXiGRjwavdpVGYjxsU/i/X/UsIKOX1Ei3apFciRiou
         EeFbxOTL+0/LQdPd1J8hgGxx+hrOgrxtvg1deWS7gP7wGrmmkbFR3bjLDBo6NMByXl8t
         wF95YP3Ppvbd2mWrpTdOIwTSl59PqyxOxrIg7aTwwkgEaBMh2n2QXcwcVMyLTA4z/kp2
         gNOQ==
X-Gm-Message-State: ANoB5pmbTG3wP6hoR3CKu909osIYJnMxokE1KeX+HpZwUNXaDKn50Eto
        BL0YC41fUrhaLfEbhQ7Vlmsz+w==
X-Google-Smtp-Source: AA0mqf4CgjZ6wDAZMUBWiHGDiaJWoAotvFsUx2d17lqrdMojR9a0pLA8aJWz2BXUGfWaNgAmJNCu6Q==
X-Received: by 2002:a1c:720f:0:b0:3c6:e63e:23e6 with SMTP id n15-20020a1c720f000000b003c6e63e23e6mr2666814wmc.21.1670523706065;
        Thu, 08 Dec 2022 10:21:46 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1fd:11b0:f877:1d6c])
        by smtp.gmail.com with ESMTPSA id f26-20020a7bc8da000000b003cfd4e6400csm5770338wml.19.2022.12.08.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 10:21:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] i2c: fortify the subsystem against user-space induced deadlocks
Date:   Thu,  8 Dec 2022 19:21:40 +0100
Message-Id: <20221208182142.250084-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Several subsystems in the kernel that export device files to user-space
suffer from a bug where keeping an open file descriptor associated with
this device file, unbinding the device from its driver and then calling
any of the supported system calls on that file descriptor will result in
either a crash or - as is the case with i2c - a deadlock.

This behavior has been blamed on extensive usage of device resource
management interfaces but it seems that devres has nothing to do with it,
the problem would be the same whether using devres or freeing resources
in .remove() that should survive the driver detach.

Many subsystems already deal with this by implementing some kind of flags
in the character device data together with locking preventing the
user-space from dropping the subsystem data from under the open device.

In i2c the deadlock comes from the fact that the function unregistering
the adapter waits for a completion which will not be passed until all
references to the character device are dropped.

The first patch in this series is just a tweak of return values of the
notifier callback. The second addresses the deadlock problem in a way
similar to how we fixed this issue in the GPIO subystem. Details are in
the commit message.

Bartosz Golaszewski (2):
  i2c: dev: fix notifier return values
  i2c: dev: don't allow user-space to deadlock the kernel

 drivers/i2c/i2c-core-base.c |  18 ------
 drivers/i2c/i2c-dev.c       | 112 +++++++++++++++++++++++++++++-------
 include/linux/i2c.h         |   2 -
 3 files changed, 91 insertions(+), 41 deletions(-)

-- 
2.37.2

