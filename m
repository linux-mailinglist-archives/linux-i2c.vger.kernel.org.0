Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7AD529ED7
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbiEQKHw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbiEQKFo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:05:44 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0FB49F22
        for <linux-i2c@vger.kernel.org>; Tue, 17 May 2022 03:05:21 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fecfc7a95aso68182837b3.22
        for <linux-i2c@vger.kernel.org>; Tue, 17 May 2022 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ZA9V5lO/+F+bF8jz1FqVjCsKgJDekjpTcf5RC67Rb+U=;
        b=CN+dHXm2PBRqvy1rf8fgS0o1jp5PYo7NivTVKQ/nKjhnlxSy7HON46mSOSXnbxnGt0
         0sM5TU3u1zBA21392OldZVr96LXY6KYit/jNYjk5EXR2CKoahlGMahwQ3FJUVseXyfI9
         cjBk1AWdrStlRBMUoPYESDY747UFkaFerpdGd9zJn2SF9wswLfipINF+E48kcMMNxFzF
         q4qSS/wz8gpL9dt631yseTk9m+wgmd+eNfv/jyPAJqke0+nnHbJavlK+Dqkq+5zr3Lw2
         jkxf/YGWa6gjweNW4DGXn5BjStf5V4Q9H6pXaZnnq3VkYUYWaAXIH05H2Uc9MjHsoekj
         DBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ZA9V5lO/+F+bF8jz1FqVjCsKgJDekjpTcf5RC67Rb+U=;
        b=RecSaj0soLUycuylQSxAYBDMi/m7ZW2/18ubB6Qw/CdChv2vvFtXTGM0xqOQWkucTE
         T1mIZIazpmWYQdharLTadQzGS5UdfPkv5Mx3HuSsNUkL4+9xS2IvPahZdYVCfy0Pcd45
         RGQXFaoBrRPCsgIWnB9YKiRd1MD9cWfm9GAGthRzPWKjhwE5Pkd4p5VDOVU7tYJf1n0Y
         SjveYXIo6ulZKZx+Lqgb1WTWn5cDXVnL8o73d+pD3iy920NsBrn4XaKvsDyQ5fj5KWUB
         XD+RQ916IslmKyuQJYysZiLNGYml/ze+GETvGPlpmVEVPxAV2AHh74o2rO3LdGCA0iwC
         BvaQ==
X-Gm-Message-State: AOAM533Aixlx7TKYoq1zJFgRrfyDNOnmYRTlcfQ3HjQ++LH2ZppCPDhf
        7ssjGpiEyKSITU6CsMnjX1Mpz8Xkvk0U
X-Google-Smtp-Source: ABdhPJzMkGHc7O1/Q7FmKZm+eLOtBU+xuDYiFF/nyYQhd08PMvWlme4OLTlm9m4QdO//1tq2jicPIWNqvZsR
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:ae7d:134a:180d:9b32])
 (user=suichen job=sendgmr) by 2002:a25:6406:0:b0:64b:17e3:9dd with SMTP id
 y6-20020a256406000000b0064b17e309ddmr21661588ybb.186.1652781921142; Tue, 17
 May 2022 03:05:21 -0700 (PDT)
Date:   Tue, 17 May 2022 03:05:04 -0700
Message-Id: <20220517100505.2569874-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC Patch v5 0/1] i2c: core: Adapter and client stats as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        wsa@kernel.org, openbmc@lists.ozlabs.org, tali.perry1@gmail.com
Cc:     joel@jms.id.au, andrew@aj.id.au, benjaminfair@google.com,
        krellan@google.com, Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This change adds statistics to the i2c_adapter structure as Wolfram
previously suggested
(https://lore.kernel.org/linux-i2c/YgEYEk355t8C4J1x@shikoro/).
It also adds relevant statistics to the per-address i2c_clients where
applicable.

The list of statistics are:

- bus_errors
- nacks
- recovery_successes / recovery_failures (only applicable to
  i2c_adapter)
- timeouts
- messages (only applicable to i2c_client)
- transfers (only applicable to i2c_adapter)

The statistics are located in /sys/class/i2c-adapter/i2c-x/stats and
/sys/class/i2c-adapter/i2c-x/x-xxxx/stats respectively.

Since the counting is done in __i2c_transfer, where the number of
messages transferred is not known upon error, the error counters are
attributed to all unique addresses that appear in the message list
passed into __i2c_transfer.

Currently an rbtree is used to find the i2c_client located at a certain
address. Would be happy to know if there is a better way of doing this.

Thanks!

Sui Chen (1):
  i2c debug counters as sysfs attributes

 drivers/i2c/i2c-core-base.c | 240 +++++++++++++++++++++++++++++++++++-
 drivers/i2c/i2c-dev.c       |  94 ++++++++++++++
 include/linux/i2c.h         |  41 ++++++
 3 files changed, 374 insertions(+), 1 deletion(-)

-- 
2.36.0.550.gb090851708-goog

