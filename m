Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB09B180227
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 16:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgCJPoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 11:44:16 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37767 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgCJPoC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 11:44:02 -0400
Received: by mail-pl1-f196.google.com with SMTP id f16so3434795plj.4
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2p+EcI7L/A1DVC/29xLNkKoAlt6wKb9qgS0/TTntts=;
        b=BdwMJy5ModIWnTns/Hmo1norAhn7toeZcwzhh1mWGCyafM1GB1p/TSRDLh5lDA5AC4
         N9RZvDG2r3PGnocKoaWGq5iva3cEoYDsb4ZkhbFBLQ7r0p4A2ua/jWhd9T4jLVvsExqB
         3ByWj2yt7V0RzcxEp/312/y+DaucUA2vIzpWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2p+EcI7L/A1DVC/29xLNkKoAlt6wKb9qgS0/TTntts=;
        b=VhLkZAffC+guJj44EKE+dboFzKnkkktoeOvoRJWnRmzN1Vcb4m3vv36XDLZgJUxjhO
         dZ5dkfTf9V1UGpyweweU/InGoxTs1WYqlkYxQt7xL0IF2wWh5qsPCivDq/opwvPRzJXI
         R/l8D4ieZQYjo5Rr/ibv+94uqJceaCk6vD+kow437X/lF4MIGRfDiL9NOPBYIy78t3r3
         VsesYrufWG7gSGkju/Oy2MpRB/RmdpyzpscA+MNxxuurofG9LPVhH8Sf9RLOlgU9Q4YV
         oEelBhVyNjc92MeShLl+XQPlzMsYPnUV84TrD/TTu7nkyTjMpbiGiEaIfJK+HsTkUHtJ
         n1CQ==
X-Gm-Message-State: ANhLgQ3VGt7fE1gNwOHibyOwlv3S5KlKBk62PeSZtv7mUBGr/oFt6Bdb
        2clp3WS/sRVXNmOwUolkHCh+5g==
X-Google-Smtp-Source: ADFU+vspG8Hr+OXyqIuMQSfkHHhLCVU2hiot8wjx0g6f9q8vljrpx0xyBhDfkfu5EpF55umf6MGrTQ==
X-Received: by 2002:a17:90b:4903:: with SMTP id kr3mr2329828pjb.3.1583855041356;
        Tue, 10 Mar 2020 08:44:01 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m12sm2731090pjk.20.2020.03.10.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:44:00 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
Date:   Tue, 10 Mar 2020 08:43:56 -0700
Message-Id: <20200310154358.39367-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200310154358.39367-1-swboyd@chromium.org>
References: <20200310154358.39367-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
should take care of this for us. Just use 0 instead so that we use the
flags from the firmware. Also, remove specify dev_name() for the irq
name so that we can get better information in /proc/interrupts about
which device is generating interrupts.

Cc: Alok Chauhan <alokc@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 17abf60c94ae..4efca130035a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -549,8 +549,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
-			       IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
+	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
+			       dev_name(&pdev->dev), gi2c);
 	if (ret) {
 		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
 			gi2c->irq, ret);
-- 
Sent by a computer, using git, on the internet

