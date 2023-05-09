Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4216FCE29
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 21:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbjEITDj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 15:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbjEITDi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 15:03:38 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355BF3C27;
        Tue,  9 May 2023 12:03:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso12145736a12.3;
        Tue, 09 May 2023 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659015; x=1686251015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AKjBxkSG5XpvKirZHxU4iQv2+9h2PYbWDdmCRx6tFk=;
        b=bKzDzjBaPGZWuge1wEtkm8qduXtg6c86iSHqbup5/ZIylz1oa1ALB44ZaxGI0XXlY3
         RGEbHwHCxdn3jO3kfIN1JZ7kEoeOmKyite6/cI7wHKaj4reWLx6hxwxPvKVJDMPJpCvt
         V2SWZEgC4OQgeXyWpu1hcJKAOVzLQ/P60A5OL9OnvEn2gXxvAeltidRkYOer8mB5q5GH
         wGx3OcZkJSfUVNgCFcPLCiq88/Ar2WwZgTRawACUSekWu7LHHMAhgU5hWrntKRJaHWC1
         Py6rnUJbxoBnN9RXqPR2UHyIGZuDtMY++YofgeegX7uOejt3eUo12FFi9fpu1+2lT30V
         If8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659015; x=1686251015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AKjBxkSG5XpvKirZHxU4iQv2+9h2PYbWDdmCRx6tFk=;
        b=eTNuWnr1eZQesFmX5Ek+rTanVppRqA0Og+ibearGyap4Fi2kyXfQnJW9zDU/KxxO3U
         1PjCvgg5ZhLkiEPYKv0SlKTcTT9vL6CIB976RaQgcM073NRlgeWplkbfnOA4cBqE50Qf
         +TlvMpafYdTRskFzW0UNc8IOo/PxdufH51O/h3KOJ+51D7fDU+FS2RI2fd1jrQF8U6J6
         HhI+L1mY2bfGunU3gJPwNhJbidCzEJcCXfCBFW/YBV6eOZ5suFu3qNl3YHr4pfhjkXeT
         O6trXMX42vxGs4yTPAU/4QfFN9zd0A2MdIipn2Glz75A58lmHzErzE2SyoSb7Ngg9Qxl
         2jYQ==
X-Gm-Message-State: AC+VfDyYNDlqqcAgfpg6y+LEVPKxGwvdJljZJg3mGQ+qdyHbJzSLzPtx
        JU+sLEOSIYmeA59WEvmUKLxtZIjPU6WU6Zx9
X-Google-Smtp-Source: ACHHUZ5SvZKLEKUlFLLtJuieYPEqbu/sYjWlkMbynHEPD+v/cATGL0gOXRDAzTMQ5oO/t1m0Nuqtgw==
X-Received: by 2002:a17:907:7e8f:b0:969:e7da:fcb1 with SMTP id qb15-20020a1709077e8f00b00969e7dafcb1mr3812940ejc.13.1683659014900;
        Tue, 09 May 2023 12:03:34 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009697aa5acfcsm1640232ejz.122.2023.05.09.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:03:34 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Subject: [PATCH v6 0/5] mfd: tps6586x: register restart handler
Date:   Tue, 09 May 2023 21:02:58 +0200
Message-Id: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOKYWmQC/4XOSW7DMAwF0KsEWpeBBnrKKvcosqBsyhZaW4EkG
 A0C372yVy0KNMsPko//KRJHz0lcTk8RefXJh6WE+u0k+omWkcEPJQsttZFGN5B5jAT32fcQ2Ya
 QAVVTOdcqJLSi3FlKDDbS0k/75Uwpc9wH98jOfx3P3m8luxhmyFNk+vlCai0NVmeFtanbBhRYS
 5E6cx1n8p/nPsw7NvmUQ3wcxVezk/91XA1IML1kNlXdsMJr+vADZTq4vcyKLw0shtVITqvOWWz
 +GtVLoyoGWdlJLhstDr+Nbdu+AaYnrs6SAQAA
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

The Tegra20 requires an enabled VDE power domain during startup. As the
VDE is currently not used, it is disabled during runtime.
Since 8f0c714ad9be, there is a workaround for the "normal restart path"
which enables the VDE before doing PMC's warm reboot. This workaround is
not executed in the "emergency restart path", leading to a hang-up
during start.

This series implements and registers a new pmic-based restart handler
for boards with tps6586x. This cold reboot ensures that the VDE power
domain is enabled during startup on tegra20-based boards.

Since bae1d3a05a8b, i2c transfers are non-atomic while preemption is
disabled (which is e.g. done during panic()). This could lead to
warnings ("Voluntary context switch within RCU") in i2c-based restart
handlers during emergency restart. The state of preemption should be
detected by i2c_in_atomic_xfer_mode() to use atomic i2c xfer when
required. Beside the new system_state check, the check is the same as
the one pre v5.2.

v5: https://lore.kernel.org/r/20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com

v6:
- drop 4/6 to abort restart on unexpected failure (suggested by Dmitry)
- 4,5: fix comments in handlers (suggested by Lee)
- 4,5: same delay for both handlers (suggested by Lee)

v5:
- introduce new 3 & 4, therefore 3 -> 5, 4 -> 6
- 3: provide dev to sys_off handler, if it is known
- 4: return NOTIFY_DONE from sys_off_notify, to avoid skipping
- 5: drop Reviewed-by from Dmitry, add poweroff timeout
- 5,6: return notifier value instead of direct errno from handler
- 5,6: use new dev field instead of passing dev as cb_data
- 5,6: increase timeout values based on error observations
- 6: skip unsupported reboot modes in restart handler

---
Benjamin Bara (5):
      kernel/reboot: emergency_restart: set correct system_state
      i2c: core: run atomic i2c xfer when !preemptible
      kernel/reboot: add device to sys_off_handler
      mfd: tps6586x: use devm-based power off handler
      mfd: tps6586x: register restart handler

 drivers/i2c/i2c-core.h |  2 +-
 drivers/mfd/tps6586x.c | 55 ++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/reboot.h |  3 +++
 kernel/reboot.c        |  4 ++++
 4 files changed, 55 insertions(+), 9 deletions(-)
---
base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
change-id: 20230327-tegra-pmic-reboot-4175ff814a4b

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>

