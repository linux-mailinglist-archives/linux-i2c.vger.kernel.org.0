Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102BB6AACB0
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 22:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCDVaP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 16:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCDVaO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 16:30:14 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADB9EFBB
        for <linux-i2c@vger.kernel.org>; Sat,  4 Mar 2023 13:30:12 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id o12so23746938edb.9
        for <linux-i2c@vger.kernel.org>; Sat, 04 Mar 2023 13:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNPo159CEMD1crdsDtTY78w5jcUj36sIFO/9Bj1Jxt4=;
        b=NhPJFn03a0Wpk5v/36odv+83ODnrOeH2Ac7xVnth7d47zae8bDs/buTSCThJ8VffCL
         wFSn+UJlEcRsDd1Awza45rK8V+oOW+Ww94a6jrujICdK6S3w/aBqi063wjkoxS3s6JkM
         a2XyEQMYrv+MBvDjBHSxqLsFUJppZn61DZY4OvZz6I9GRgg9woZhmv6c+MqH+C8/zXfN
         k4KKVzHEDvBzyvjOlf5HFitr7xgrgLfSScO8zJX4kwriQ2XktbMVvh3yogYWM5jscUs4
         TrW5NqM0XcHO97Vq+X0sfL6E7MVu7S9N4rcEu3Fh+go8z1SjSmRCuKIlH9QGfnQgsMAV
         vXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNPo159CEMD1crdsDtTY78w5jcUj36sIFO/9Bj1Jxt4=;
        b=HJ8X4A0TDOMuf9zchDnyGqA3MUb9Hxg6Fz6Jgwp/UWVsuSqVIeo24yqx9j1ZIdGTTH
         M5KU/KH0CSwx2X095zSbQjR67A1Av1E1So8AV/wrZMc5h0sPyl41kHz7pF+5YgwQvNTz
         5D5BQE+u0PD9bBjyA7JGh31L53+HP2x1UZuqbwj/k0ZSNJeCQO3jigeImJHJ890IXP1T
         8aGzBveygZd1d3lpUNN5cCMTpGZ+MLfT+5bPNxe7eIkebENx17LVwO/i/ym84H94qqHC
         3RppmXvyyqmXbVquX/LprTlSjeUiZ9eglMN2y23lehCU/V7Yggm72yd5T7hRWyvmKa1C
         WVeA==
X-Gm-Message-State: AO0yUKVTNBL2iqzY8cr/BMqFXVH89aI186qrAtZlt+bYBdZJfRf5+/Wf
        J6GHOW4eDuUAv4jh55Aggg02j2Z5Psc=
X-Google-Smtp-Source: AK7set8T4yJo7oqQHhIiJineyTVvs82pG7oHbaJxQTHjopeiMeomek/wOBackm0ek5QpprB2vI6zVw==
X-Received: by 2002:a17:906:99c6:b0:8de:920d:a4bb with SMTP id s6-20020a17090699c600b008de920da4bbmr6245595ejn.26.1677965409802;
        Sat, 04 Mar 2023 13:30:09 -0800 (PST)
Received: from ?IPV6:2a01:c22:72de:8e00:a559:93c8:8a72:3308? (dynamic-2a01-0c22-72de-8e00-a559-93c8-8a72-3308.c22.pool.telefonica.de. [2a01:c22:72de:8e00:a559:93c8:8a72:3308])
        by smtp.googlemail.com with ESMTPSA id qo3-20020a170907212300b008d2d2990c9fsm2454284ejb.93.2023.03.04.13.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 13:30:09 -0800 (PST)
Message-ID: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
Date:   Sat, 4 Mar 2023 22:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/4] i2c: i801: next set of improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Next set of improvements.

Heiner Kallweit (4):
  i2c: i801: Use i2c_mark_adapter_suspended/resumed
  i2c: i801: Replace acpi_lock with I2C bus lock
  i2c: i801: Improve i801_block_transaction_byte_by_byte
  i2c: i801: Switch to new macro DEFINE_SIMPLE_DEV_PM_OPS

 drivers/i2c/busses/i2c-i801.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

-- 
2.39.2

