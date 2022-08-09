Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB67658D1E7
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Aug 2022 04:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbiHICKo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 22:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240114AbiHICIH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 22:08:07 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD351A393;
        Mon,  8 Aug 2022 19:08:07 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so10883931pjf.2;
        Mon, 08 Aug 2022 19:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=petxK778XPOlaFMZPaOnKvyoyQ6Ir54E3r1P1GqcORs=;
        b=E0fKpa412B1eeW/w8yZbW8kc81xIugoTeV9AoQrbSu5HYELK4QgNUoWMRJjooQAaU3
         v9ebho0Mq8TMHfqtw+YKKjIjro82OW0KnGdzC9XxCiU5kptGkneC4N2F3iCA/stylUrK
         QAeUguwh+8bKNCMSgUClyapUHpKga7a+tM0Z9Nf1rt4DM++yUkwRf9gZdzYM7vfM448y
         aCuZ196529B+tV0xRlZSxocyiRO/2Jxn2Edmb5joBT/ScOJFnM/ulhvlHAXja3zyidvH
         bEM4vWp+4H4RyJTCBT8ebAeXtfJnaqWqYIDDgfucs4ry3gOjMWZnKR5S1m7TfUiFy5O3
         spMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=petxK778XPOlaFMZPaOnKvyoyQ6Ir54E3r1P1GqcORs=;
        b=LcTqcEtJopYkvYXXYWMo3H/+PCLWDti/q44U9ph7L8QrzSvv1oqjuT7nSmrAIIlsJR
         EEyzMdHnI5qoGRqeUQkTEWNEPO3wfGTNdDuZNwijBt1heNl+0okAX7dDd3ZTOXKMrEiN
         xfot9kDQnY1w5PvMYFG8qxuseu73jQY9B23qAkRIy4VgVCfNBCG60X3dUhp0SO3sVORo
         eSBkciSaEmbqaad3HEsMFYw41bOrj9mc9sgYAJzcIL93kxZerFgt6fc3TsCsDmtrVnU3
         y/F+l78imF+OZi66kouIwFo1khuhwx8kLlGUEQSfOV2xG7lAX+hn8bDz+fpNfcZao1hU
         xD8g==
X-Gm-Message-State: ACgBeo3oRCKqu3AcvkxDBf41cefWH72xsNLNdLtpSOmnj8MfVgd6tPUG
        7fMkMGPIircxG2WCWf6Dzw249C2tsCc=
X-Google-Smtp-Source: AA6agR6CBZfiuOELuRj1c20hbg78hjsciqTTia/FqVLqST+0lgVWxucU26a9+K7Qv5CWVJt5c/cTEw==
X-Received: by 2002:a17:902:70c7:b0:170:9030:8219 with SMTP id l7-20020a17090270c700b0017090308219mr12335025plt.163.1660010886674;
        Mon, 08 Aug 2022 19:08:06 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-70.three.co.id. [180.214.233.70])
        by smtp.gmail.com with ESMTPSA id x18-20020a170902ec9200b0016892555955sm9427970plg.179.2022.08.08.19.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 19:08:06 -0700 (PDT)
Message-ID: <3971c298-9c9a-83a1-8dc7-5d59dd0e1a05@gmail.com>
Date:   Tue, 9 Aug 2022 09:08:03 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/9] docs: i2c: i2c-topology: reorder sections more
 logically
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-8-luca.ceresoli@bootlin.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220808141708.1021103-8-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/8/22 21:17, luca.ceresoli@bootlin.com wrote:
> +Mux-locked caveats
> +~~~~~~~~~~~~~~~~~~
> +
> +When using a mux-locked mux, be aware of the following restrictions:
> +
> +* If you build a topology with a mux-locked mux being the parent
> +  of a parent-locked mux, this might break the expectation from the
> +  parent-locked mux that the root adapter is locked during the
> +  transaction.
> +
> +* It is not safe to build arbitrary topologies with two (or more)
> +  mux-locked muxes that are not siblings, when there are address
> +  collisions between the devices on the child adapters of these
> +  non-sibling muxes.
> +
> +  I.e. the select-transfer-deselect transaction targeting e.g. device
> +  address 0x42 behind mux-one may be interleaved with a similar
> +  operation targeting device address 0x42 behind mux-two. The
> +  intension with such a topology would in this hypothetical example
> +  be that mux-one and mux-two should not be selected simultaneously,
> +  but mux-locked muxes do not guarantee that in all topologies.
> +

These two sentences in n. 2) can be combined into a single paragraph.
Also, did you mean s/intension/intention/?

-- 
An old man doll... just what I always wanted! - Clara
