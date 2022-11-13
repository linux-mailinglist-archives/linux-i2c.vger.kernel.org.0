Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6A2627151
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Nov 2022 18:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiKMRqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Nov 2022 12:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKMRqR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Nov 2022 12:46:17 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D84B83;
        Sun, 13 Nov 2022 09:46:16 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d9so8817132wrm.13;
        Sun, 13 Nov 2022 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag4XkUBYKsHXRFB5mf1y1PgkX1dWaaqTLlE81fZkCRY=;
        b=G9gP/NZ5klSXwhtRKWx3UwJGeCAVzXb82Sop/BtwOIrlAxIf0Wk9ijikj8ANP70Jm3
         D+LKhy6/nvoldPQ/6ayQIXzygCzRwtP1Txx8lSHMA7WRre2M48i/66Az5wCPsHjhURMC
         SAP4xLQyjQpDv46+MNSuT4I/Hiqe+a2GmBoIbKHXRzMb7Q7IwSyII+JpKHSfp0B27i3+
         oHqxsvAfJVCEIZO0F6D1GzGYOpOSzpbQeF5qzEisuEd4zKNs3lwhYuKF4zFR2p0lwEhr
         ENFp/QgqR64MPLuSzdYmnQwwwxE/3HeNLUl9QIJ4hw5/nXeN82L5B6dQ16TrjDavEKmf
         z0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ag4XkUBYKsHXRFB5mf1y1PgkX1dWaaqTLlE81fZkCRY=;
        b=phy5vicfrkSxGsugLrSUq3ppv7it3F+UVZLxz+c3suNLQtFv2fcB1D5B9zk5H129YP
         obNZ+YmXEbTaU5/YzdRbDx87oDDwMwVUOdfz/cxRRJWmXw0+mwA2Tk7ysTar3YDpvNSP
         sZauXx2CgRa7BIy3zWzprX9orRL23NuRY2ZYWb3s73a2Y1NmX7IVHG5BWx4HLyHp+Y+y
         bY1+5X7F6DjO/WLZn5vQKSuITYuDq/OvX7FSNhIqwVWNU2h0Tr3afq67QLBi3BpLTFW9
         3P12iYi+kayO6ik0nvswVW4JUPIlkUManUf7JmLgvO1qjKsRvOy/DdWJAuhft5oqg4L2
         Yt4g==
X-Gm-Message-State: ANoB5pnEOsrp6dLFH+yEfLm5hFNmu1zQF53KpeLbpaPScd3w5lNzj624
        v3jq3+x8IuYR/lhrNTaSnc202xnhsPE=
X-Google-Smtp-Source: AA0mqf59CXsPGxvoDXi04fpFB/sD6aD3hq9TeMlkSYeskpUtcJKj2BI/Aq9uxOnlKlLPBKrEeFnjbg==
X-Received: by 2002:a05:6000:98b:b0:236:6a53:3a19 with SMTP id by11-20020a056000098b00b002366a533a19mr5508197wrb.409.1668361574515;
        Sun, 13 Nov 2022 09:46:14 -0800 (PST)
Received: from localhost.localdomain (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600005c900b0022e36c1113fsm7468322wrb.13.2022.11.13.09.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 09:46:14 -0800 (PST)
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH v3 0/2] i2c: core: Introduce i2c_client_get_device_id helper
Date:   Sun, 13 Nov 2022 18:45:45 +0100
Message-Id: <cover.1668361368.git.ang.iglesiasg@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduces a new i2c helper to query driver match tables and recover the
identity of the bound device. This helper should help with the migration
of existing drivers to use the new i2c_driver .probe_new callback, which
does not provide the device id with the pointer to the driver data as the
previous .probe callback.

As part of the patchset, migrated the bmp280 IIO driver to .new_probe
callback using the new helper.

Changes from v2 --> v3:
* Update helper function doc comment dropping misleading sentence.

Changes from v1 --> v2:
* Add further clarification that the device queried needs to be bound to
  the driver.
* Drops extra newline after function return.
* Discard unrelated style changes.

Previous version:
 https://lore.kernel.org/all/cover.1667750698.git.ang.iglesiasg@gmail.com/

Angel Iglesias (2):
  i2c: core: Introduce i2c_client_get_device_id helper function
  iio: pressure: bmp280: convert to i2c's .probe_new()

 drivers/i2c/i2c-core-base.c       | 14 ++++++++++++++
 drivers/iio/pressure/bmp280-i2c.c |  6 +++---
 include/linux/i2c.h               |  1 +
 3 files changed, 18 insertions(+), 3 deletions(-)


base-commit: 474b4c719c40ded10b0b3450a396c0698e337802
-- 
2.38.1

