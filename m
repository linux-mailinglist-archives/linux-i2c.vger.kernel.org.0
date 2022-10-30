Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42EC9612C06
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 18:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJ3RwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 13:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJ3RwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 13:52:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E483C14;
        Sun, 30 Oct 2022 10:52:12 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h9so13132971wrt.0;
        Sun, 30 Oct 2022 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRGQwiJyyZtZTz3TByj9KEqkFvLoG13HbwyG6xbLJsA=;
        b=FAckUJwd6EZu55q7Mb7vIO0E3XAFW3dHy41sLo7QgJxjCpa26PyWWGGAMN/XFJpbQd
         59Np4n5e/+Loxc9ipdU4d2YPhh1U78AhhqNjeG7W8p43DsGTnVtFhwW0Hl3CVfmkkWaU
         lApgSmjrooGqN/MavVzATDssXOtnoiiu2/7OalPsQzgJ9QV+RVUrqBJ0xAKYg3EldGPF
         lmfA4TnGFSlbcgwfGqHw4SL2+wJllxXz90zxMhbRQzJkm/UW5pZK3InndwZF2C0TJHsg
         CwCXwlMV/LEOJn0RtXBzlzevVxU0Etq06wr5ihtsbFlzeGyza6Nht3WE/6OxSE85cJEX
         XkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRGQwiJyyZtZTz3TByj9KEqkFvLoG13HbwyG6xbLJsA=;
        b=VnROlqCvwH4lcCTwnyS28dvAano9ThlIwk4+u/tUVskX7LNwkJY/RQsA1SfQYMwFYp
         y8R+mhB92a/vrtrMHxHywVCSgfvnDxFs6AO15NaBoGU8go/mJ5pGT/bTVYFwl8GvPwJs
         PvY0iNpfm/8ETOUN+6GF7p9p3iSsp5eSbpV6QT0nf0+AZ5mc9DIXg8PnjqSU9IIQogwN
         Y3oZswqs+gEZ9hc0yTvJvmMrMXJ8IrRY6vt7pVAX2AXB2ZfAKTAXUINOvdU2nAyQCF/B
         pQpKF7o17eoKNfGFY1odepTVMVaPSqLyVDUhFQrntRmqfGQJ9GArWoieTGNnqUDrXAB+
         Bnuw==
X-Gm-Message-State: ACrzQf0S3+q6A6uqUjz0kLw7Ocx/V7THrYnll7sx273gEZxwR6BBUStN
        hNDXic++VBk3hn1z9OPEMZTlAlcg0r4=
X-Google-Smtp-Source: AMsMyM73of4rrJBvNGNFrBktk0USXeaiq8Tc6F3xRszlQKFvkJ49nlq3Ihmp7Qf5Nr6JjGaCivjPvQ==
X-Received: by 2002:a05:6000:10ce:b0:236:54c8:e040 with SMTP id b14-20020a05600010ce00b0023654c8e040mr5660243wrx.290.1667152330891;
        Sun, 30 Oct 2022 10:52:10 -0700 (PDT)
Received: from localhost.localdomain (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id q1-20020a05600c040100b003c4ecff4e25sm5419229wmb.9.2022.10.30.10.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:52:10 -0700 (PDT)
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] i2c: core: Introduce i2c_client_get_device_id helper
Date:   Sun, 30 Oct 2022 18:51:06 +0100
Message-Id: <cover.1667151588.git.ang.iglesiasg@gmail.com>
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

Hello,

I don't want to step anyone's work here, so I'm sending this RFC to the
devs involved in the original discussion. I read on Uwe Kleine-König's
patchset submission thread the necessity for an i2c helper to aid with the
migration to the new i2c_driver .probe_new callback. Following the
suggestions made there, I wrote this small patchset implementing the
suggested helper function and ported the bmp280 IIO i2c probe to the new
probe using that helper.

Thanks for your time!
Angel

Original discussion thread for additional context:
https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koenig@pengutronix.de/

Angel Iglesias (2):
  i2c: core: Introduce i2c_client_get_device_id helper function
  iio: pressure: bmp280: convert to i2c's .probe_new()

 drivers/i2c/i2c-core-base.c       | 15 +++++++++++++++
 drivers/iio/pressure/bmp280-i2c.c |  8 ++++----
 include/linux/i2c.h               |  1 +
 3 files changed, 20 insertions(+), 4 deletions(-)


base-commit: c32793afc6976e170f6ab11ca3750fe94fb3454d
-- 
2.38.1

