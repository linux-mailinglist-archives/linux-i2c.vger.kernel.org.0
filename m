Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8819828DDA4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgJNJaa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgJNJTi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 05:19:38 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9EBC0613D7
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:26:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x16so532334pgj.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoAVR9AHVrF5AmfQOiW6xvU4LK/5cY35UObNq6NT9XE=;
        b=EQTxzxUuIKTcB+XY70IZK53ZA9IwEFA63ysUwVxyS6E2XHi8jvNKV1KDaWxPQOMZwa
         DpWi781oIYquJ8RoAVv9BkQ8pmtZdjPU+u2OYk/cOqkvKpFXOplZdLqRCARtqWwa6WM8
         M7r+0Nwo0XKiYriJXGI2rMUfGAmFqR3fW0Wl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoAVR9AHVrF5AmfQOiW6xvU4LK/5cY35UObNq6NT9XE=;
        b=oxbVV2rSL+IfTziIm2BvyEfzP1IF6WG4OhzLbd9T8rat1s+LzvPoiPG/Yy903ACoRf
         ltb/5y449dxi289842j1Z2x/NEGHR2a5mAZK4cbbhWjRtId9YdCr49Dt2W2Fs2Twq6qX
         YLpuZTBsFwaOmlyS6+ULgDI1C2E2DpsYqyfbi27vNAdvnLSakS6FQjFB2xFtIJr49RYr
         ZwmPkbZgyj7qazM9CjlHljnshinzdPo2AH0Cu6FFjjsqitBUC2TGW65iAFSQoP01W9cZ
         X/P4c8zk5ekmsx+vz95BJr5+Iz6T8CAsoPLEeNJmTyijLNx74c1lxTXqXgbV2A+HZSQg
         lMNg==
X-Gm-Message-State: AOAM530GXjcLkTAlXYV31rrsKgXHV2FJmc7v/N+X3Mvk7ebYTA17Wk4C
        VkFgrS/trwkAKHsOrqLhtM3gqg==
X-Google-Smtp-Source: ABdhPJxjpE+t6tSF6IoGOjD0t+fTHO4qbXOhNCwIJqg8rHVYSn4dWpiqWHiGitjlRTuGvKhaxa/vBA==
X-Received: by 2002:a63:fe49:: with SMTP id x9mr1177056pgj.192.1602624381982;
        Tue, 13 Oct 2020 14:26:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id b15sm167713pju.16.2020.10.13.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 14:26:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i2c: i2c-qcom-geni: More properly fix the DMA race
Date:   Tue, 13 Oct 2020 14:25:27 -0700
Message-Id: <20201013212531.428538-1-dianders@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Previously I landed commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA
transfer race") to fix a race we were seeing.  While that most
definitely fixed the race we were seeing, it looks like it causes
problems in the TX path, which we didn't stress test until we started
trying to update firmware on devices.

Let's revert that patch and try another way: fix the original problem
by disabling the interrupts that aren't relevant to DMA transfers.
Now we can stress both TX and RX cases and see no problems.  I also
can't find any place to put an msleep() that causes problems anymore.

Since this problem only affects i2c, I'm hoping for an Ack from Bjorn
and then all these patches can go through the i2c tree.  However, if
maintainers want to work a different way out to land that's OK too.

NOTE: the 3rd patch in the series could certianly be squashed with
patch #1 or I could re-order / rejigger.  To me it seemed like a good
idea to first fix the probelm (and make the two functions as much of
an inverse as possible) and later try to clean things up.  Yell if you
want something different.

Changes in v2:
- Consistently use "val_old" to keep track of old value.
- Add comments about why UART is special.

Douglas Anderson (3):
  soc: qcom: geni: More properly switch to DMA mode
  Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
  soc: qcom: geni: Optimize/comment select fifo/dma mode

 drivers/i2c/busses/i2c-qcom-geni.c |  6 ++--
 drivers/soc/qcom/qcom-geni-se.c    | 55 ++++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 18 deletions(-)

-- 
2.28.0.1011.ga647a8990f-goog

