Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79F261DE42
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiKEVM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKEVM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:12:28 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220BC26C6;
        Sat,  5 Nov 2022 14:12:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id r14so12256660edc.7;
        Sat, 05 Nov 2022 14:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3dsR8X2EmvQmPsnNDXOyBSO7+PY7curypuTHe1fWaZk=;
        b=hQddjFJ3MQQsnPvqHHlR+vaH+L+2qogLwaq9Wk3FRgAmnhKXAOtdWZNPNhi8sfUNO+
         Bi4kSepLPBHPqDcDKhQg4ywBsHqifQhsJKe9KLjc69xNMtOZJFHQNmk7HktgXzhUGdZF
         MARQRUlpJdVACEQ41TBSh8sR7tOiBV2gttyy30VgDtyMF3GNUWa00YJbcckIbsVI4fDV
         lgMN7b+AtbBPAIVdmwRpramKur58ET6ZbjhA3FitbIExjXufCxlWYU/yDbD5UecpKDK7
         wQPXueMwuKeib0DrxPMO6teFDpp7Uzk3Ji58/9kkKfWFryxXdyvY1/k1eg37aNzLJ5fx
         Z8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dsR8X2EmvQmPsnNDXOyBSO7+PY7curypuTHe1fWaZk=;
        b=AswKFB3QmtmSFl02lO+y6uIrXTxzpsiDVg+RWL/tjHFTSI/PdTENsHGEhjtl7pbRAF
         XmcmBJHEWun/9FTqrZBSnnwSP7Vdh83UdVsfWgi5R2SXw1f6y2EnwwVWAoXaSzJh0QYK
         /GDmwRn0EdH45f+2wYWg8+KucSgwx5lNYvJFcpiV6LDxUWXibcj80eVQmTuX4a2hUop6
         y4gA8uef6OkcA/j0+H5E1dSaEDsH5zYlnBbVhzuqVZkXpNJ7FKkcRFl0RhuAzOP5yaRc
         g5UIjFXo0sHT+kF0A0lMucMrF0PNXj2PnZTPM0yS5qnupljg9qr38l5VHsn2SCiKeibP
         Ferw==
X-Gm-Message-State: ACrzQf2+vBrnCAlp/ZR+IAOY2ZWwXUk3sqyEzEl16sAcgpwtIM3cQMOM
        0uDOFzxWSF3VebArHFWZHXz71pToKJNMoQ==
X-Google-Smtp-Source: AMsMyM4hDa066bR0vLgFWexsHhYBqTuOOigtsm8+2KddvJDBHpcwxxypfGE8ygkbbVKb7w8NM8t3IQ==
X-Received: by 2002:a05:6402:1619:b0:462:b059:9655 with SMTP id f25-20020a056402161900b00462b0599655mr41234424edv.316.1667682745447;
        Sat, 05 Nov 2022 14:12:25 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:12:24 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 00/13] HID: ft260: fixes and performance improvements
Date:   Sat,  5 Nov 2022 23:11:38 +0200
Message-Id: <20221105211151.7094-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This patch series is an updated version of this one:
https://lore.kernel.org/all/20221030203403.4637-1-michael.zaidman@gmail.com/

Changes since v3:
  - Fixes for the kernel CI bot warnings
  - We now do not miss NACK on the wakeup from the power saving mode
    on the KVM installation reported by Enrik. For details, see
    https://github.com/MichaelZaidman/hid-ft260/pull/7

Changes since v2:

  - Remove SMBus Quick command support
  - Missed NACK from big i2c read
  - Wake up device from power saving mode
  - Fix a NULL pointer dereference in ft260_i2c_write
  - Missed NACK from busy device

Changes since v1:

  - Do not populate hidraw device
  - Avoid stale read buffer pointer

Michael Zaidman (13):
  HID: ft260: ft260_xfer_status routine cleanup
  HID: ft260: improve i2c write performance
  HID: ft260: support i2c writes larger than HID report size
  HID: ft260: support i2c reads greater than HID report size
  HID: ft260: improve i2c large reads performance
  HID: ft260: do not populate /dev/hidraw device
  HID: ft260: skip unexpected HID input reports
  HID: ft260: remove SMBus Quick command support
  HID: ft260: missed NACK from big i2c read
  HID: ft260: wake up device from power saving mode
  HID: ft260: fix a NULL pointer dereference in ft260_i2c_write
  HID: ft260: missed NACK from busy device
  HID: ft260: fix sparse warnings

 drivers/hid/hid-ft260.c | 325 +++++++++++++++++++++++-----------------
 1 file changed, 191 insertions(+), 134 deletions(-)

-- 
2.34.1

