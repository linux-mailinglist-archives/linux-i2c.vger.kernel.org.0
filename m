Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B4E502E01
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 18:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355861AbiDOQ4E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 12:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbiDOQ4E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 12:56:04 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C259728B
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 09:53:35 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id s25so10043615edi.13
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=6LpYU4N//QjLB0vLS7ZLbmqjiPwib6o+qQNX7EGbHmQ=;
        b=jit544Ky4NcT15BzcYq4YZAyWTAdDb9L7hXzVBAi30OwSv6YWiLiGC0hXX8kDM7g43
         34vaW4PKID1PuDjyhahrKnF5I61K9HRtES2obvAsiffBwNaCX4NEnAtZdY4Jh++uS/+8
         X+We46yPJso5TRwzj5ukf1wTSrsUA+q3SY3o8dg51kFe7zWe6FAaYFZ4pdT5ZRiM8iiZ
         /QSX8jvUMQmHbZA+QeHkk8p4lFBkRCAC8TIyJXTYE8yvFX7QgCKlpwED7iwvCOut7+e+
         jYEII9hroFaW+xky/jB3vTFBzLBADXchJ+gAeE+wyRN5ujPN/DZ72MJDn/m4/P4qlGGl
         Ncjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=6LpYU4N//QjLB0vLS7ZLbmqjiPwib6o+qQNX7EGbHmQ=;
        b=CJ3BW/aJSTvE0feC3hRydh8RR8dxM8uYLh3npWEOgMsBG59s12FZLE6Yi8/HyRysAQ
         HgYIN5My+Me6lggWWWiNyXgsRIVgj4j3Jed1kYgjVuoIrZ2qiyOIEyUKfnhflqeX3ojJ
         /SabS6htQ3VM2Gqj+M3H1tXTPQLloipH+g+QOEIZzeTY1YkqYJ8yxLtz5eF4WOrMn8eM
         2MdLWJnAuJDo+YpTCIk0Oex7N2CcdEwikmEPJc6yqcOJC6nNqkgRL3nxep+o6U2SxFIn
         1xS7PfrGhSjyWwTnLw/+/rqa9J9cbRxdQPoghOyklEQ+NJ3Wz32y2d/vorb4rq34cdZP
         g6mQ==
X-Gm-Message-State: AOAM532XeAVS0wuxn3k1Pv74dy3c8IM47erIoVzL7gNsxbiA6U3vHdrq
        8I8BdkBqpy9H2krxW9J9aZWD8djdSG8=
X-Google-Smtp-Source: ABdhPJynAL5PGH05jHjrjIkpycL/iD7MP69YJQAEnFIauNHZNqN7EVKtoGByURNz6gw2JFTJ5kzXBA==
X-Received: by 2002:aa7:db0f:0:b0:41d:7b44:2613 with SMTP id t15-20020aa7db0f000000b0041d7b442613mr163350eds.126.1650041613539;
        Fri, 15 Apr 2022 09:53:33 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id el14-20020a056402360e00b0042121aee887sm2373587edb.77.2022.04.15.09.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 09:53:32 -0700 (PDT)
Message-ID: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
Date:   Fri, 15 Apr 2022 18:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/8] i2c: i801: Series with minor improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series includes a number of minor improvements, partially it's
a re-send of patches submitted in December last year already.

Heiner Kallweit (8):
  i2c: i801: improve interrupt handler
  i2c: i801: make FEATURE_HOST_NOTIFY dependent on FEATURE_IRQ
  i2c: i801: make FEATURE_BLOCK_PROC dependent on FEATURE_BLOCK_BUFFER
  i2c: i801: enable FEATURE_IRQ and FEATURE_I2C_BLOCK_READ on all chip
    versions
  i2c: i801: add helper i801_set_hstadd
  i2c: i801: add i801_single_transaction(), complementing
    i801_block_transaction()
  i2c: i801: call i801_check_pre() from i801_access()
  i2c: i801: call i801_check_post() from i801_access()

 drivers/i2c/busses/i2c-i801.c | 339 ++++++++++++++++++----------------
 1 file changed, 175 insertions(+), 164 deletions(-)

-- 
2.35.3

