Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED1F1094CE
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 21:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfKYUri (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 15:47:38 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44669 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfKYUri (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 15:47:38 -0500
Received: by mail-il1-f196.google.com with SMTP id z12so6066918iln.11
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 12:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGtTbbiSE5dj1/mTlXQ5k0Rw2FeOQZ84/77O/3M8RCg=;
        b=JKqRWwZ6FOmra40yWcI+SAIx6WXfpb41+vj5YTllwEbJk7/vdLnQ2jlAhi0exp+rXm
         4VQChm+SwQyop5Ocq6+naGPJPnn2CEdlVX48HbodAlgKOtVFjCUkIJITy1XwXfBFQkcK
         YC7ngUJEhckutxm2agHYrauIX5DStR0l4NnvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGtTbbiSE5dj1/mTlXQ5k0Rw2FeOQZ84/77O/3M8RCg=;
        b=BzN2dtAajT3QyvIR1AyvcHKz4+Uz+0dryjnUkATx2EzwJLCO04IEHEfoCPXkJ3eLCD
         MsQkbT2DQ7SoTlCIpCr1He66GMDa6EKuuAIlxmQuByKns977l/kvTlSeF2IGITRZc+V/
         PTfbukGOMweODgZsRyB5nhZ8r7Nc6ZlmVlQQQ0K3xTZ6yKOL/L8SdkJ2p43qV6hZ0g8A
         n8fHapUjEPtJAm4Dc2wU3kFgLXCB6dOY0lNeH0R5SCfvTxPNEZ9whMaxqNoea6hQft7M
         FXxsr5KRclXJcBMEPjk89DNgxDJLeHj1jPiAZS7KxrOBluDukxwkFaaRDCGCeASY7WuJ
         Nadg==
X-Gm-Message-State: APjAAAUMrcB61fLjNLheP+sElRzF8H+8+uNuvrWS8vDfOCVSh54enlhf
        UI6c40bE/1uIr8uU7OtNEp7n0A==
X-Google-Smtp-Source: APXvYqwWURvSGC7bu3mFjP9EBh3AKvol6fK9p9oqnU0fPDZxo0PQniLBD3zVB/46FdDEQJZ5WxyRfQ==
X-Received: by 2002:a92:902:: with SMTP id y2mr31416080ilg.284.1574714857234;
        Mon, 25 Nov 2019 12:47:37 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id z10sm2500057ill.73.2019.11.25.12.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 12:47:36 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     enric.balletbo@collabora.com, Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Raul E Rangel <rrangel@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 0/2] Convert cros-ec-i2c-tunnel to MFD Cell
Date:   Mon, 25 Nov 2019 13:47:28 -0700
Message-Id: <20191125204730.187000-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Having the cros-ec-i2c-tunnel behave as a MFD Cell fixes a race condition
that could happen if the cros-ec-i2c-tunnel gets probed before the
cros_ec_lpc init has finished.

Changes in v2:
- Extracted platform_device_info into its own variable.
- Moved i2c tunnel into cros_ec_platform_cells
- Requires https://lkml.org/lkml/2019/11/21/208 to correctly enumerate.

Raul E Rangel (2):
  platform/chrome: cros_ec: Pass firmware node to MFD device
  platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c tunnel to MFD
    Cell

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
 drivers/mfd/cros_ec_dev.c               |  9 +++++++
 drivers/platform/chrome/cros_ec.c       | 14 +++++++---
 3 files changed, 33 insertions(+), 26 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

