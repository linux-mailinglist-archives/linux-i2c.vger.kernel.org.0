Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A39176E3C2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 10:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbjHCI5l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 04:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234900AbjHCI5j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 04:57:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DA51981;
        Thu,  3 Aug 2023 01:57:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8406661CE4;
        Thu,  3 Aug 2023 08:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F04C433C7;
        Thu,  3 Aug 2023 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691053053;
        bh=cEup0wu+FTQabkNencKL1iEruNbJ9YJHffpEK2p5Ps4=;
        h=From:Date:Subject:To:Cc:From;
        b=ev3+96Evo0EFilg5h4Da7301Lt4UuD9zddIDfdlAOgbSNRz24p8bLuYTU0CG1P383
         HmwUCv16LT5zkjyfzAmLqCg+yHNZYPWFllY0Lp1B/btQiS40iWUE8SpJHMF58JYY53
         tqzrCsXOHkgWJpFM9sm63zG50BFuIXOpHAKK/N2oGJTL2P3SovgfLMDWRGs9WtVlQ7
         F9briyjhIz9lnZA/s1PcRFOMyp0aBhB6fq4eBU2j9gM5UiHUGr81vDr0lq46ZuDYJz
         g9OzNX2nucz8VqteW9gH7059bm/iZ0rXcNx6P7TeHbGydmS5Ch4uvthWTp3rpQEq67
         v6GHjCbVmytag==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bcae8c4072so580133a34.1;
        Thu, 03 Aug 2023 01:57:33 -0700 (PDT)
X-Gm-Message-State: ABy/qLavrl9d0K9sPj3wQaV6aRN8FYp26jPhG8En/gnqWSlLvl2udfaw
        unEiudZYEe2Ygl9Znrj25UJkdpFpM092BkHHuw0=
X-Google-Smtp-Source: APBJJlFBCNBxoVqvlv1SiiLW6E4ZDF2QUkI8ECycVltZa6EwlGT3PrFREjSRmobsGwDA9UnRNimB+V0tXybgkq+JUeE=
X-Received: by 2002:a05:6871:823:b0:1bf:597b:2343 with SMTP id
 q35-20020a056871082300b001bf597b2343mr3096974oap.30.1691053053078; Thu, 03
 Aug 2023 01:57:33 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Aug 2023 17:56:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvTLTj3hKkjsWBwm8++nXqMpomjZd6QbpmrfR+3iveNg@mail.gmail.com>
Message-ID: <CAK7LNASvTLTj3hKkjsWBwm8++nXqMpomjZd6QbpmrfR+3iveNg@mail.gmail.com>
Subject: Wake up sequence of crypto - atmel-i2c
To:     Jianhui Zhao <zhaojh329@gmail.com>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jianhui,
(CC: crypto and i2c sub-systems)


I am trying to use ATECC608B chip
(it is compatible with ATECC508), but no luck so far.

Specifically, it fails in atmel_i2c_wakeup() in
drivers/crypto/atmel-i2c.c


I have a question about your commit.


commit 2638268fa9ebe4f13a8aee89044719f2084f80c8
Author: Jianhui Zhao <zhaojh329@gmail.com>
Date:   Tue Mar 10 20:25:51 2020 +0800

    crypto: atmel-i2c - Fix wakeup fail




Datasheet [1] page 40 says this:
 The Wake condition requires that either the system processor manually
 drives the SDA pin low for tWLO, or a data byte of 0x00 be transmitted
 at a clock rate sufficiently slow so that SDA is low for a minimum
 period of tWLO. When the device is awake, the normal processor I2C
 hardware and/or software can be used for device communications up to
 and including the I/O sequence required, thus putting the device
 back into low power (i.e. sleep) mode.




To pull down the SDA pin for the period of tWLO,
atmel_i2c_wakeup() sends long enough zero data.
(3 byte for 400KHz, 1 byte for 100kHz)

However, it relies on the i2c controller understanding
I2C_M_IGNORE_NAK, correct?

Not all i2c controllers can do I2C_M_IGNORE_NAK.

In my case, the SoC is IMX8MM, and the driver is
drivers/i2c/busses/i2c-imx.c, which does not handle
I2C_M_IGNORE_NAK flag.

If I2C_M_IGNORE_NAK is not recognized, the controller
sends the slave address and nobody responds
(as the ATECC chip is in the sleep state), then the
controller quits without sending zero data.

I guess that is the reason why atmel_i2c_wakeup()
does not work for me.

Am I correct?


[1] https://content.arduino.cc/assets/mkr-microchip_atecc508a_cryptoauthentication_device_summary_datasheet-20005927a.pdf





-- 
Best Regards
Masahiro Yamada
