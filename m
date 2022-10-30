Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3952612CAA
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiJ3UeP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJ3UeO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:14 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B025AA1A9;
        Sun, 30 Oct 2022 13:34:13 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id y16so13408129wrt.12;
        Sun, 30 Oct 2022 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVWRHFVr2HzqsClJWTzBUugkh8zlIjyMQoH5XdqfGQU=;
        b=KP2adwlNrFJu3UuQL3mdeb9pnpZ5nQ2Nx/lGpEnh8l/ycUO97D7LgB7FEzl7+NogX2
         ZTZs0OVTXldQRvxXfbvJMbOa8Nk8IWTXNn6caOCLNcWDg2kQgb+GkV5gXPBRZp1ZSpYi
         PVVMip6LdgQn6FDadpBwykiumgh1fRXOZFcnFKLySkAMa1rLpZVu14YUvHKgC0D1hVcW
         bx0hEay2tpqsiFUz4+XYOdQbzCPw1/jlg/G+bScg01U79Gnv1zcGJEkhSnZVH+cHmgmt
         gWSj7g6eeKDz51sEsVwTlRze9COcO1nWA/qKO5xzKcF9dMoP6xELOP6s0FRHNsx414H1
         Vu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVWRHFVr2HzqsClJWTzBUugkh8zlIjyMQoH5XdqfGQU=;
        b=b7M+YnDFmKhOHS5i+qXQ7RgZx42gZAWIN6MyprX3cYmQJ7AaYJ+r3x7LJ+U7tZ4Mv/
         bETFWzkAT47LZxzAloZTEGq8WoWS6pqztLvMQY08PvbdTmr3Oi2TrZ1UISJyPp+XP/L5
         OP29wqwRoV2ByekMM6dChS4r8q0au086N5SOvM/r/s5uZ0nmRKClce7OFLmC2MuWUnCb
         NNoyB1viQnbOIwDmQ1iJ5JkTUqhG7KWUCVZFBJGKtWKC6T59vMGMRCEeVw7BSNJX+/LL
         656OOEe4CalK8XbKALL0xjYT0v0b0O4TdYKuRHVmnmeZ2mZaI53sBiZmb0I8ueTa8cTk
         8Fgg==
X-Gm-Message-State: ACrzQf0iKDssdXBSXsdHFCKnEx+HfkSmd/MZGIGtmPLyyfkP2MeCp7Oh
        J9KAJR/Ex3NFUFbEHI+0QNM=
X-Google-Smtp-Source: AMsMyM5zya11YZ8L7QokgA1DrRnREsk0/t1gjHvHcHsQcdNYK7edDLPQmlfpCALSKqXzJ+tqm6YKaw==
X-Received: by 2002:a5d:4604:0:b0:236:cdd4:4cdd with SMTP id t4-20020a5d4604000000b00236cdd44cddmr417731wrq.627.1667162052122;
        Sun, 30 Oct 2022 13:34:12 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:11 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 00/12] HID: ft260: fixes and performance improvements
Date:   Sun, 30 Oct 2022 22:33:51 +0200
Message-Id: <20221030203403.4637-1-michael.zaidman@gmail.com>
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
https://lore.kernel.org/all/20220928144854.5580-1-michael.zaidman@gmail.com/

Changes since v2:

  - Remove SMBus Quick command support
  - Missed NACK from big i2c read
  - Wake up device from power saving mode
  - Fix a NULL pointer dereference in ft260_i2c_write
  - Missed NACK from busy device

Changes since v1:

  - Do not populate hidraw device
  - Avoid stale read buffer pointer

Michael Zaidman (12):
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

 drivers/hid/hid-ft260.c | 313 ++++++++++++++++++++++++----------------
 1 file changed, 185 insertions(+), 128 deletions(-)

-- 
2.34.1
