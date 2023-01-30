Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E432E681C91
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 22:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjA3VUY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 16:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjA3VUW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 16:20:22 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DEA47EE4
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 13:20:21 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so9204447wms.2
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 13:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9rWDmCaWr1iBOjtGUiE5vre094qKBX+qIbZy1zTt9U=;
        b=OZGNoHjzGvCBRyKPy40KRJwuwFvpz6eOQaJAK26QXUo8ruoce32GanIovyil2zTpYE
         RDYCCq7jJ/TOC69+s6kdvMk4JTUVln4NPaHCTXJTzDBamQV3/xXRB5GMoQWPUS+f27XU
         mP4AhoszTwdN65qsbcEjfDGB97w6638uF+N/Lyb+hf0QtgLyXjLB1F86nwoqUzCTOJwJ
         crprZwNcAhShVgjXn8XiPTNrUSf5IX6ufmLkAhQCUOkhXzJBlTnutISZKm0QIE4jMib+
         4jkH7dAwYSKCyzUacUaq1Vod1sn/Ljxj79LEgYjCjUQiMj1N53UvWn/GkoyYGlh+3T3Y
         NGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9rWDmCaWr1iBOjtGUiE5vre094qKBX+qIbZy1zTt9U=;
        b=QARpTXepoRtuJHDN9HMicAB3WeyPxa8685BrV5v9K5cRXeFFOAe5hxE4Mk/7mtfy2q
         A9sxp6FqcAnR/ZTjZ1wJhQEBkao/Ag434+9TtUCeplXr3iSV1KzKJxAKaoMQTad7wya4
         jVEfqRnE12pJy3c2cgN9k3vE4yluaIs6lTNb9vx0O/wigpKS5K7D1H3hOFz2NYsDVYyt
         m1B/Awi/gRSL1DGvGp3VpnBO2DTW9ZfjVSPckrThPFod8OQiA8NBc6ac2I39AFjvceKu
         vmJfoLQCjZTZMa6o6kuCGfdUNy/r/UQ4RwVNonT0IMvUYzco6PUVXnqns6S+gAVxsmc4
         a9wA==
X-Gm-Message-State: AFqh2koVINbD6us6LpfQwN/cGnADhp6RymSmaymo+jjVztrO1cnzJVDu
        VR2+SkviJOOGR47FQZJk6AGhmK6XvN4=
X-Google-Smtp-Source: AMrXdXtSe22KDhBxJL1OTXD4bItgjjsSpzNxXwsRhTsnklXbSPuSPOT40EwljXbx9x99fjT8og9NLQ==
X-Received: by 2002:a05:600c:5405:b0:3d3:5709:68e8 with SMTP id he5-20020a05600c540500b003d3570968e8mr49493621wmb.36.1675113619640;
        Mon, 30 Jan 2023 13:20:19 -0800 (PST)
Received: from ?IPV6:2a01:c23:c074:7400:d941:3cb5:fa86:8ec8? (dynamic-2a01-0c23-c074-7400-d941-3cb5-fa86-8ec8.c23.pool.telefonica.de. [2a01:c23:c074:7400:d941:3cb5:fa86:8ec8])
        by smtp.googlemail.com with ESMTPSA id h36-20020a05600c49a400b003dc53217e07sm5925117wmp.16.2023.01.30.13.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 13:20:19 -0800 (PST)
Message-ID: <600080c4-a19f-7ab6-394f-c742179da00f@gmail.com>
Date:   Mon, 30 Jan 2023 22:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] i2c: core: add devm_i2c_new_ancillary_device()
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

Add a device-managed version of i2c_new_ancillary_device().

I have an own use case, but was surprised to find it on an old wish list.
https://elinux.org/images/b/b3/I2c_21st-ELCE-2019-Sang.pdf

Heiner Kallweit (2):
  i2c: core: add devm_i2c_new_ancillary_device()
  i2c: core: extend use case for dflt addr in i2c_new_ancillary_device

 drivers/i2c/i2c-core-base.c | 50 ++++++++++++++++++++++++++++---------
 include/linux/i2c.h         |  5 ++++
 2 files changed, 43 insertions(+), 12 deletions(-)

-- 
2.39.1

