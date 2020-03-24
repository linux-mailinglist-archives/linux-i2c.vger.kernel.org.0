Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415941919B2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 20:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgCXTN3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 15:13:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42159 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbgCXTN3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 15:13:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so19791645ljp.9;
        Tue, 24 Mar 2020 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uIAcX2m8QpAWv8TMlh8B6oI/fe2X2DccVFEcYGZNbOk=;
        b=hsY68UyMWv486CjkFQ9XXWAJnkttldzEOXRVWyB4HW0IaB0FWKpvYrLGJu9q5GY5jg
         1cOEDDKCayQPZN3XII0yajPYt7sjmCy03V4yDBEQOduR/WMM2rbsZZfWx7/75dibd3q0
         82cmZEwuXk0PstRFXgmK+z796IHlmYdFK6cUfG45mBpqYH9LEKeBuhObJzl6Q4N4hMT/
         LakyMoO2nrp9D02bwNWqSLCLJDRlsIrvfsYuOtI5X5n9v3qU0SrDkOFNbTI+QpHmRxgi
         57B2F8XzqekOoUwhiIniXDeVVQewF6f6nxdDVKaX4DL/DHvqauFGQxZaqtoo85/AqEzs
         GWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uIAcX2m8QpAWv8TMlh8B6oI/fe2X2DccVFEcYGZNbOk=;
        b=R+840oR9XEcL4gixPRNJG58OBW7KnCVS/e6XbUzDahxY+zdzDsq1xxBbibHg/17aQw
         bKFpX2AfaA6G9usoWSV83lZUa2auAFsmEqxZEFE/0lHlqCLEpx2FCG+wMl2nXyqh74NN
         VgQYOS0rIxBbXSuwQlGXmgkyfKMiFC1V6ynBUL2tLoyq7oPbGQVZjmj322gkjZfC4scw
         hk0tADBTe6gFY5gMbQ76cX/QPTVrYtoGCs11fi0zPgHWlsM7Olvb9fiBtmJUmHkFWA9L
         qxqWDqAs7waFBDveC1XzidBSkpDwB/I069uz7qzXrVK+++/cmzOXrpGHLaXH2Ay0WR61
         rh2A==
X-Gm-Message-State: ANhLgQ3qA2GavOcn+jFDvNd9jDca233OPmrNs1oSHMVDW700XFUW2U41
        5XPAy1NfM2WKdPC+a20tSVU=
X-Google-Smtp-Source: ADFU+vuC24piMvbglWv/WVI/TWLmal3ArmiApJWvK+KWbm7V9Ezcb26GVi8QzfgpOoA3uvvY/Bl+ZA==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr8911183ljk.103.1585077206468;
        Tue, 24 Mar 2020 12:13:26 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id z23sm6347723ljz.52.2020.03.24.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 12:13:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] NVIDIA Tegra I2C synchronization correction
Date:   Tue, 24 Mar 2020 22:12:15 +0300
Message-Id: <20200324191217.1829-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

Recently I found a way to reliably reproduce I2C timeouts that happen due
to improper synchronizations made by the I2C driver. It's quite easy to
reproduce the problem when memory is running on a lower freq + there is
some memory activity + CPU could get busy for a significant time. This
is the case when KASAN is enabled and CPU is busy while accessing FS via
NFS. This small series addresses the found problems.

Changelog:

v2: - The "Better handle case where CPU0 is busy for a long time" patch
      now preserves the old behavior where completion is checked after
      disabling the interrupt, preventing potential race-condition of
      the completion awaiting vs interrupt syncing.

Dmitry Osipenko (2):
  i2c: tegra: Better handle case where CPU0 is busy for a long time
  i2c: tegra: Synchronize DMA before termination

 drivers/i2c/busses/i2c-tegra.c | 36 ++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

-- 
2.25.1

