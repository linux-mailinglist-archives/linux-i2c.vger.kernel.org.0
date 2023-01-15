Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBCF166B044
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jan 2023 11:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjAOKLl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Jan 2023 05:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjAOKLk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Jan 2023 05:11:40 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01807296;
        Sun, 15 Jan 2023 02:11:38 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so20159590wms.2;
        Sun, 15 Jan 2023 02:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaUFFdfJUDeyRNl7j9nd9AfJouyEYiFU0X0Hysi4jPM=;
        b=aw3tZQ5B+fzfQzUZ6d8Kjk8Cr+w3jTNM5QHBp3GLXvX40bRz7LoDvxldSYSzykxtBK
         AzFen/LghFG8yPHjPUf2lKqkKRA0RX19ewZhM9qA9vdHmNaWv/+qQuVlNgg/TlsUEPNT
         wFcsiyNBb/FMIOB13HnGE48fVVBqsn0esD+QfOVpmK5Sr1MrHaDALEFFkHAchweOAkc/
         +r/QHWBAzm4c0Z6+3m/WIv4iClU3aX9AOMRod8A8IOkNPwJ/YVSAzATTiFykZ+sCmi+Y
         sQso4AqpTwe6jUc5h3pKqNAFd6LFoPGz0vmOyHGyvbXfm2w4Uv0Gg+0LAn4zR6fd13N5
         pWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jaUFFdfJUDeyRNl7j9nd9AfJouyEYiFU0X0Hysi4jPM=;
        b=tu6uUFd5QTiVpEjYorEov8Km54atBw54x7Z2mLtQ/6gjuHRvml5OEoe64bNx3RyJ8R
         2IuNoSg238vz8ZA2wCYjaGJpGuIQKh0rqWQyDwJ5a8MwZNqdIDWZkTpP3gyEN3a9m9uQ
         IdZUllEvXdW7ebTdNN4jrakjxGq5CL8hk4zBG0D2B5diCW4HXJ2xA+d6zvuyOcygKRCh
         uhak2y5CqdqQE8haE9jDiP8lVX7JIgCQu8iIXtSlVcjzWJP/48dfooJMQYiQNkSnzwO1
         gzoPnCAXKmUetH30DCPf/mzWWVXZpuuSRml+j5gMEQX6pSxT1cLa4aVwH3cLEGaEjn67
         r+5w==
X-Gm-Message-State: AFqh2kr99pdXbbpqYipLophM9wJbxG7TbfjNzrJ3sZzhf2RcyLbBD8Cq
        POyahcINB7KnMFuYV9Cm5PY=
X-Google-Smtp-Source: AMrXdXvZ7oWzX87ba3J2EJM0a1X45/noT5Wui8evIy+AzfXgIx1nIJwwiasLTg/8DiCbYuuyYPrCdg==
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id h17-20020a1ccc11000000b003da1d5226b5mr4882343wmb.14.1673777496996;
        Sun, 15 Jan 2023 02:11:36 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id l24-20020a05600c1d1800b003daf6e3bc2fsm2058405wms.1.2023.01.15.02.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 02:11:36 -0800 (PST)
Message-ID: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
Date:   Sun, 15 Jan 2023 11:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Language: en-US
Subject: [PATCH v3 0/3] i2c: gpio: support write-only sda
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

There are slave devices that understand I2C but have read-only
SDA and SCL. Examples are FD650 7-segment LED controller and
its derivatives. Typical board designs don't even have a
pull-up for both pins. This patch makes i2c-gpio usable with
such devices, based on new DT property i2c-gpio,sda-output-only.

v2:
- improve commit message for patch 1

v3:
- patch 2: check for adap->getsda in readbytes()
- patch 2: align warning message level for info on missing getscl/getsda
- patch 3: improve description of attribute sda_is_output_only

Heiner Kallweit (3):
  dt-bindings: i2c-gpio: Add property i2c-gpio,sda-output-only
  i2c: algo: bit: allow getsda to be NULL
  i2c: gpio: support write-only sda

 .../devicetree/bindings/i2c/i2c-gpio.yaml        |  4 ++++
 drivers/i2c/algos/i2c-algo-bit.c                 | 16 ++++++++++++++--
 drivers/i2c/busses/i2c-gpio.c                    | 14 +++++++++++---
 include/linux/platform_data/i2c-gpio.h           |  3 +++
 4 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.39.0

