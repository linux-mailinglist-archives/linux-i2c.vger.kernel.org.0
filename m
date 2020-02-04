Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB5B15211D
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 20:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgBDTby (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 14:31:54 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37039 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDTby (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Feb 2020 14:31:54 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so1833895pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFB/BdCgZTdBks/LEBdQ18bfbCn8FFgKC0d0O7TIgS0=;
        b=dBePQkx6I4a3sC1JoR6NTZij8u1i3OvnxQuG0NxiAJ/P3cM1uf0iGvbGEqOcB35yih
         d3Igrj/o0zOxILY3mcpD3xkrJhKwO9jW1i3gDFnfNUIG32CE49IB8GvhrBIy75ZEN5Nb
         RwSsd+BBOyyGGm+ut5EbIpvrix8tTkP8JXhr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFB/BdCgZTdBks/LEBdQ18bfbCn8FFgKC0d0O7TIgS0=;
        b=JdkCVdKQSkm7jTt8Zd0WOjODseWUD73gwgvUOVc/rnibIVarRPu2+bCbjJC2j6ptQ8
         W99CdH7yxyFdCB2HUPWeNKSdqJaH5DM5hVJ/6043vAZ3ZJic06UR2TNACEPefLRu8Pn/
         JjHUeXgepsNXtfWCG6MxvJlZlczKXfEiInMldeJMUlhzLU9/Q2CUBPJmHmatHDXR0jz3
         V3+ipVdhoDii4jTmfiJ/KwYUEfGmrwVjbTnG2+JvdtiryeM5aJXygcQetvOIFhTZAv3b
         u4v34Z1cOHrAzKXPiTdSL1XUNCFvAzl/0XIhe+0J3HoJPuJyAWO3l4C8Hjcys0MsSp36
         w19w==
X-Gm-Message-State: APjAAAXMR5sl2nYYcZ5YrZLqwAE2lgG+ydAXpDMNkqbaTWKjoaVgeZ80
        yc9ENl+6dusCbwViIE6+2jKtxArY74n7jw==
X-Google-Smtp-Source: APXvYqzf9c2MZP/7ERU8b7VGvluFEwNq7jiuawqqDgFSu22JJUqhBVW+r7i9tKRsjfkMhVdWK31ZCQ==
X-Received: by 2002:a17:90a:9b88:: with SMTP id g8mr852714pjp.72.1580844713563;
        Tue, 04 Feb 2020 11:31:53 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g18sm24956626pfi.80.2020.02.04.11.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:31:53 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] Misc qcom geni i2c driver fixes
Date:   Tue,  4 Feb 2020 11:31:49 -0800
Message-Id: <20200204193152.124980-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here's a small collection of qcom geni i2c driver fixes that
simplify the code and aid debugging.

Stephen Boyd (3):
  i2c: qcom-geni: Let firmware specify irq trigger flags
  i2c: qcom-geni: Grow a dev pointer to simplify code
  i2c: qcom-geni: Drop of_platform.h include

 drivers/i2c/busses/i2c-qcom-geni.c | 54 ++++++++++++++----------------
 1 file changed, 25 insertions(+), 29 deletions(-)

-- 
Sent by a computer, using git, on the internet

