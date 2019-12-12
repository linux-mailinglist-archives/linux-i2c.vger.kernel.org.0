Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D94A11DA10
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 00:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730987AbfLLXfL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 18:35:11 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41134 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLLXfL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 18:35:11 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so560995ljc.8;
        Thu, 12 Dec 2019 15:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMALgHPkuh/fgX4dtGxJeHepiAw93SnZTTwx7ykLGlQ=;
        b=QfnX5jsyZ8lubfRzxTxq9S2tkfhBYifEb0P7UlQDoJfwDk9huYZBDC/dhUHTZtsvrm
         fxiQ4hI1mh72QHk7LlrwTKdPolHMOd8DWZFs3Gjr7Wm83wOnfUGQ/mOEiBzUWc35WnS7
         WLt2/a+yR0tblDb/7MJ5L9zhOcAb/xFdq+2bIBo21UOAjHB7/R5cMcp268Su2ItH34Gb
         ya4X5ki8ZSn7joTOMfCip3SuvGf28oMk8BOsk+zhVsfGy9Z3v/Ag8HEDPDGinU2h5JnP
         gM3cil67sgQvwDxx7lH/IgZULJOWvBnAg62Uhq57/ZVpUbiej0JavdzN5UlW3yKNcnyJ
         VWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMALgHPkuh/fgX4dtGxJeHepiAw93SnZTTwx7ykLGlQ=;
        b=MGr2MfnBwKFl1RhKyq+yKhz9DDgLUpEdhulpF36N7nOkx/vEr2Fj2OaqLag+Ytic3k
         vlU6rTetDsN6MCQRMq0GHTxUDR7pI2tmIsd4sMx1J9y63RkzH+bP1uac4oOt0ks+3g3L
         23+UGui+Sg0rduOUgUytCnwZ7OggLt23fOC8LRiynC10c7CvDTWc9zxeVgQTGzrtgXoj
         LdVdh3xDfJVwEw90bzRvXswMmj9/oBoIQ8Gltxo5DBEL7Vaejh/SaQkgZ1FL6sZj9ouG
         +qcO35iKvQ1oNuHuJ2jXEevp41FvWIIlsUnYB+l5Jdybi10+QuvHYEnhpFyOOvz4TkPG
         Uk1Q==
X-Gm-Message-State: APjAAAXFEpyuRZTdA7yl6QW7wynxiWfQ353rWVynjUf0LB5TUkPw3YFy
        tG9SyzmecyaqbaFRNLIy9g4IVNX0
X-Google-Smtp-Source: APXvYqzOkTzeUocyxGe+AF2eb/2k7WrtEVpeY/sda04q044UYULGzf4YqlfV1F766iRQO75k7/73fg==
X-Received: by 2002:a2e:844e:: with SMTP id u14mr7642965ljh.183.1576193708812;
        Thu, 12 Dec 2019 15:35:08 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id q27sm3764283ljm.25.2019.12.12.15.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 15:35:08 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Tegra I2C: Support atomic transfers and correct suspend/resume
Date:   Fri, 13 Dec 2019 02:34:25 +0300
Message-Id: <20191212233428.14648-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

This patchset adds support for atomic transfers which are required for
shutting down machine properly. Secondly, a (not)suspending I2C is fixed
by this small series as well.

Changelog:

v1: The "i2c: tegra: Support atomic transfers" previously was sent out as
    a separate patch, but later I spotted that suspend/resume doesn't
    work properly. The "i2c: tegra: Fix suspending in active runtime PM
    state" patch depends on the atomic patch because there is a need to
    active IRQ-safe mode for the runtime PM by both patches.

    I fixed a missed doc-comment of the newly added "is_curr_atomic_xfer"
    structure field and added additional comment that explains why IRQ needs
    to be disabled for the atomic transfer in the "Support atomic transfers"
    patch.

    Lastly, I added a minor "i2c: tegra: Rename .." patch that helps to
    follow driver's code.

Dmitry Osipenko (3):
  i2c: tegra: Support atomic transfers
  i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
  i2c: tegra: Fix suspending in active runtime PM state

 drivers/i2c/busses/i2c-tegra.c | 113 +++++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 12 deletions(-)

-- 
2.24.0

