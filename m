Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F912B887C
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Nov 2020 00:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgKRXkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Nov 2020 18:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgKRXkq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Nov 2020 18:40:46 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36086C0613D6
        for <linux-i2c@vger.kernel.org>; Wed, 18 Nov 2020 15:40:46 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id x15so1914786pll.2
        for <linux-i2c@vger.kernel.org>; Wed, 18 Nov 2020 15:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4eqbUws5OBh+zSDmGIZGynXeE/GCKmhJYh2f9F/2s8=;
        b=MM/2GIKGWDzxw4aO+CK8E1czrZG9hJLEpzvnEQAQlaPwjmdtFuk3rlBdbPs8q+3uF9
         88xHc/Q9LHtK2qtfZlFJ0ZWcZXGWjHDwAbWd70kuQxRzVpxeSj+VbA17o5K+gKYn4G6k
         6nBxH+6s5j3GjdnOcWGf2UwpUEIgDW3X5H/Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4eqbUws5OBh+zSDmGIZGynXeE/GCKmhJYh2f9F/2s8=;
        b=BKWG9oaz90jtXlvKmVgJAHh5ySzfMJm70IGf0Saiv6uVdtrkzL9M1CM8kYAi6MrwBj
         StYUTxU3h3Trk8xYjzFs3u6cirYm9YlEUSykdlz0xOz11fY8vZuXA7TFukbHhldS6l9s
         H4EasFf0UGCb2/JwOusb/cSEc2fIyXnODH4gRdnelvF5EEfr6pd3qCHCGrHYU2lPv8QM
         NNg6YyTu852DvUQivNBjxSRpIp+sL2ltRZqGBAvBzOWyNgwzZwVjfCxgNlGpePkBNPXW
         lTHSblwugiSHlcGNxIQrvGYGV0LjgQs7Bvf90qJ4W1v5Z5vP8F76XNLAFd1ET9t8cD88
         PvkQ==
X-Gm-Message-State: AOAM531QpxQa5wpR/4AZ1nY7y99G4+9+xqbFx6FIwQoFTJySIRVBAyI4
        aDZox5V9tc3CtE+p9/Pbb2jzYw==
X-Google-Smtp-Source: ABdhPJwWRoldri4GORHGp02TpBVqgoRyd8LQW83YaMGnQCu23Xf4ZLp8w8bW2PEESszAm0RJA8sFSg==
X-Received: by 2002:a17:902:56e:b029:d5:d861:6b17 with SMTP id 101-20020a170902056eb02900d5d8616b17mr6679168plf.17.1605742845769;
        Wed, 18 Nov 2020 15:40:45 -0800 (PST)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:250:b6ff:fee1:7d4c])
        by smtp.gmail.com with ESMTPSA id t200sm5210979pfc.143.2020.11.18.15.40.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 18 Nov 2020 15:40:45 -0800 (PST)
From:   Evan Green <evgreen@chromium.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Evan Green <evgreen@chromium.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 0/2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
Date:   Wed, 18 Nov 2020 15:40:23 -0800
Message-Id: <20201118234025.376412-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-mux-gpio driver is a handy driver to have in your bag of tricks,
but it currently only works with DT-based firmware. Enable this driver
on ACPI platforms as well.

The first patch is a little dinky. Peter, if it turns out you'd rather
just take this all as a single patch, feel free to squash the first
patch into the second. Or I can resend a squashed patch if needed.

Changes in v3:
 - Introduced minor &pdev->dev to dev refactor (Peter)
 - Update commit message again (Peter)
 - Added missing \n (Peter)
 - adr64 overflow check (Peter)
 - Don't initialize child (Peter)
 - Limit scope of dev_handle (Peter)

Changes in v2:
 - Make it compile properly when !CONFIG_ACPI (Randy)
 - Update commit message regarding i2c-parent (Peter)

Evan Green (2):
  i2c: i2c-mux-gpio: Factor out pdev->dev in _probe_dt()
  i2c: i2c-mux-gpio: Enable this driver in ACPI land

 drivers/i2c/muxes/i2c-mux-gpio.c | 112 ++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 30 deletions(-)

-- 
2.26.2

