Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F5E436A09
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Oct 2021 20:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhJUSGk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 14:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhJUSGd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Oct 2021 14:06:33 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C95C061764
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 11:04:17 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id g141so444029wmg.4
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/MKAWTTZVY+L26TjjBN76SFAWTqP7r/m5a26e349Xjk=;
        b=esB4Zcg41rLtKOEGAJoEv5UkZ+zUXNp1PtSvVPoClhEXWVPgBZl36Im0a0AtK0eAIp
         RFXAf4zy/7U7ZWQIkEaKOE9I+C6LdDEN2VzLNom7bP9aEAE8wVRdtBxDhH41Ira+eymw
         9KpItGBytls7zf7mNu/p4RSPmNKYoKgSxk+oPWUovZXvGkmYaGBCkqdeU1zFm1dRR3IG
         raL1ef+bQGEX2WVRYd1U4cNzFMky08sgcQfdTOEMYwEF8pvaX4q3MU2qR+uWxvtj2yXI
         wk0C90oQFWQpcsmWaUlJQpvIXxI8KDLUqHRdtFGScNGffp1N8rdhTQartBpjwQ9wws96
         cRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/MKAWTTZVY+L26TjjBN76SFAWTqP7r/m5a26e349Xjk=;
        b=7lfkLGiQHNMpw+C5hgyq+5u+eu7a/x+UR/IKoX6B4knzzxJ81AN1APds3BwO5kX3HG
         2ylQTEKh3g53PskGAZY68op57XvuR52N9UAKDhhNvYLntF75u9C43shhBoryNYmK6xwe
         XOVspEgCxw1DvwkhvFMtU/mzqtHbOQhNF9BIubgeCjc4Lcy3fZ+PC9WOBLujXBvX3CRH
         12Ho+RcWmV2MTHH9NgPUSkVuHWmCIjVpqoNWvcBZTPDIlYQMXPf7yaBr17TT7Z3eKN5d
         KGqLgZy8VaW5tgs59qpLpneG6sWr5Ik4GTY9u1DsUpBxxywxqNljkdfNnZHACqbKoD0b
         3uKg==
X-Gm-Message-State: AOAM531hcQLxAd4Ey9twBr+eSWWeBgBZR9IHU48r2jVg00sTrf75Ltcy
        Go+LSlhVeJvO8vfOBaz6jzUfC35tMQq6DQ==
X-Google-Smtp-Source: ABdhPJyRUs+1M4ZQ3kjBuns/1VGAIHRvvT+qyRZvMKwEDKMcAljrD77CBI7epRF/Et2Gp1TTqjx62Q==
X-Received: by 2002:a7b:cb56:: with SMTP id v22mr1168375wmj.77.1634839456031;
        Thu, 21 Oct 2021 11:04:16 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id p12sm6596436wrr.67.2021.10.21.11.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 11:04:15 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] at24: updates for v5.16
Date:   Thu, 21 Oct 2021 20:04:13 +0200
Message-Id: <20211021180413.8942-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram,

Please pull the following changeset for the v5.16 merge window.

Best Regards,
Bartosz Golaszewski

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v5.16

for you to fetch changes up to 7629254054820bead6e18f8c3ae65c2bb01a5ae2:

  dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05 (2021-09-13 09:28:57 +0200)

----------------------------------------------------------------
at24 updates for v5.16

- add two new compatible entries to the DT bindings

----------------------------------------------------------------
Raag Jadav (1):
      dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05

 Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ++++++
 1 file changed, 6 insertions(+)
