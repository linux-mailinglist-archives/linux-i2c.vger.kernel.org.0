Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820EF75474A
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jul 2023 09:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjGOHxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jul 2023 03:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGOHxm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jul 2023 03:53:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB195358E;
        Sat, 15 Jul 2023 00:53:41 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-315adee6ac8so2757927f8f.2;
        Sat, 15 Jul 2023 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689407620; x=1691999620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64bznzqz+bNp3VRLI2c/xdrX18bRuMWopVm8BVRqgP0=;
        b=VJJE9KCuhs748Y/QWhkyhpIitB1/SZRCnYmn0PaN0lYUNcvEwRCl0Kiaj525mEA2cB
         UoBH0zp7yukPGUi2/X7Cpk3OSa6GlvASRnxwhodHkMaHvJngyW4asJst498s1+MLQfEQ
         JkhWyF9G4s+MUKBWL2BjnTzxJtgimeRz+5JUICyNun6llhihTqfr8U9l1a2ukCWuih1a
         Gss03KIpSNNSGtOhBRNw8Sh0i9/M/MQKXe5AjQBar5r0Q/pBGnkwVzt6Z9t7FNnZcuUK
         NMYkaeX8oBKxpYixvYS/jZKaoGFIFc1KQQ96BvGMYqFTcM2x3airBDrv8i5VhCp4320O
         REkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689407620; x=1691999620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64bznzqz+bNp3VRLI2c/xdrX18bRuMWopVm8BVRqgP0=;
        b=hrJY2gjclJ3qgb8/ivOWJAqW+vm3zOCryls7KEuBm8xKic8oZsI/lBttN3bKZ2B76E
         ugnJeBD6tABHoQ113U/5TfPds/R13Vi1oTlX1KG2wCJxK3690FIQuNON/EiJpgxnak5D
         G/2H/j3IBcQG3xt3XuYh3VcaZlhEXURgy36MqjWebWQXfr0OeF2X9wBsLokx5xYtTE2A
         qc8ClI6Toiy3ZYaxFAIV5sQhYEd42ngf0TUqVgdG8s0o65zTL5YCDDWI1rRfCCG2l6OL
         MUFRC1P7JOlyi7ckdTVFTnpS3c+65CJMw4shOSuSlMH40RVYqmPBjqOy3FOVVFalRrGh
         Lnog==
X-Gm-Message-State: ABy/qLZKKANHGxIymKOBZrEn2eCm9LCh6/GK6+DZnCUu/3nMpHYs8GZx
        03vztX0tNoLrNYI21AShzbI=
X-Google-Smtp-Source: APBJJlF45C5ZuFjGUeHBUKG0OpMzU+pF0/JOQUtOx4YP4a9QoFrtFoTPDo1ESwV2fjqo7pxl11mGBw==
X-Received: by 2002:adf:fc50:0:b0:313:e952:e500 with SMTP id e16-20020adffc50000000b00313e952e500mr5237036wrs.7.1689407619913;
        Sat, 15 Jul 2023 00:53:39 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm13001271wro.24.2023.07.15.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 00:53:39 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Subject: [PATCH v7 0/5] mfd: tps6586x: register restart handler
Date:   Sat, 15 Jul 2023 09:53:22 +0200
Message-Id: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJQsmQC/4XQz2rEIBAG8FdZPNfFP5OY9LTvUXoYzZhIm7ioh
 JYl716TU8tCc/zQ+c3HPFimFCiz18uDJVpDDnGpwbxcmJtwGYmHoWamhNJCK8MLjQn5fQ6OJ7I
 xFg7SNN53EhAsq3MWM3GbcHHTPjljLpT2h3siH76OZW/vNfsUZ16mRPh7hVBKaGiuElrddoZLb
 i0m7PVtnDF8Xl2cd2wKucT0fRRf9U7+13HVXHDtBJFuWkMSbvkjDFjw4PYyK5waUA2rAL2Svbd
 gno3m1GiqgVb0guqPDoZnoz012t3wUO/thk5R/9fYtu0Hw9zQHdYBAAA=
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org, Nishanth Menon <nm@ti.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
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

---
v7:
- 5/5: drop mode check (suggested by Dmitry)
- Link to v6: https://lore.kernel.org/r/20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com

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
 drivers/mfd/tps6586x.c | 50 ++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/reboot.h |  3 +++
 kernel/reboot.c        |  4 ++++
 4 files changed, 50 insertions(+), 9 deletions(-)
---
base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
change-id: 20230327-tegra-pmic-reboot-4175ff814a4b

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>

