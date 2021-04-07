Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E2C35748E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244391AbhDGSuy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbhDGSux (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 14:50:53 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11110C06175F
        for <linux-i2c@vger.kernel.org>; Wed,  7 Apr 2021 11:50:44 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id b127so15337276qkf.19
        for <linux-i2c@vger.kernel.org>; Wed, 07 Apr 2021 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=22i+nO6AC7ddlnrwJZcEh1neFiMyTVpI8DRhK+N4aig=;
        b=YjoYocmuh62wjvYAH1B7/gNiTuNcZfO//X787k+oP+YBAxDXHj1Aqn444IQUBJWZpI
         r+X4oybrgrMJ+QWn8XkCuMSaOQ6ffwUWmLKz447xnkw9SVAhECClNfTYUgAF3RnyvoRT
         U+SKenuV26gR+lNx+WVWLGzyk3yY8fNRK2krI+ZFFQfPRH5ah9l37oJYHiNhhZmayKXI
         jKBbGPFEQHM9FLBMXxa6DB3XeErtVfWuX19h7d1nm/RtBQF565RgGYIZ2uqsIMFHs2iT
         E92pyXKw0X16KSq2HzPMlV4tBBaupAMJrQc/pOmcatBonYDrOaM4z/FGHMlWLWe4X7o7
         7U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=22i+nO6AC7ddlnrwJZcEh1neFiMyTVpI8DRhK+N4aig=;
        b=QbhfgcFikwr032neGv7L7w8CoEW7dKXIAGV+6Jzn3kqISknw0oRZvYKgZyUMywFsPy
         58XqPrKMKopEIZ+fg0KZNrTlJfLMR68V5jPgz6pvXPDxqk9/SZ82Hd9+VzZkLkH/yiio
         Rfg9hRwZ/M9wHtPN8znkyEuzlEzGanTLDUitn5MUtcS7NdZGzk11c994305EIE6eMv+o
         vEEGf6DVDxl06YCvT22tKlTDSF9cfiKYPpWAfdtWVekpRU4m6vbivd8zFKhEImFtJ7wm
         KCnFGt5ry74/u+v4OMbiF8C8DTZj1SLTFzTvcDMNYG/r0M+8Msh/CaUWSPJgt2eDAOOT
         GuIQ==
X-Gm-Message-State: AOAM533Kjpc4doLf+bxcEdIp+muiGa7ip3KBAwoLMw77ygYz5OHQdJY9
        0sNCm3HLv+Smff0wrXpg/xT4Xu+ylrI=
X-Google-Smtp-Source: ABdhPJzID1m2u/rTjHzwE9yEYUYPzAgJ8+3KfanwAk8IcrU9oGhuzvp3KRRCOueyelO1VnxkCGOIueECKrI=
X-Received: from legoland2.mtv.corp.google.com ([2620:15c:211:1:c151:20a4:9e4a:b11e])
 (user=varmam job=sendgmr) by 2002:a0c:f702:: with SMTP id w2mr4912067qvn.0.1617821443301;
 Wed, 07 Apr 2021 11:50:43 -0700 (PDT)
Date:   Wed,  7 Apr 2021 11:50:37 -0700
Message-Id: <20210407185039.621248-1-varmam@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v1 0/2] Override device name using DT "dev-name" property
From:   Manish Varma <varmam@google.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Manish Varma <varmam@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently I2C device names are assigned dynamically unless they are
instantiated through ACPI, this names are based on adapter_id and
device_address. While device_address will remain constant for a given
device, the adapter_id may vary across different systems and hence,
overall, the device name won't be unique for the same I2C device.

Changes here addresses this problem by introducing an optional device
tree property "dev-name", which will be used to set the device name,
if present, instead of following <adapter_id>-<device_addr> convention.

Manish Varma (2):
  dt-bindings: i2c: add "dev-name" property to assign specific device
    name
  i2c: use "dev-name" device tree property to override device name

 Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
 drivers/i2c/i2c-core-of.c                     | 2 ++
 2 files changed, 7 insertions(+)

-- 
2.31.1.295.g9ea45b61b8-goog

