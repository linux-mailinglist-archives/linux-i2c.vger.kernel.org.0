Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C944ABE64
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiBGMJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385342AbiBGLbd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:31:33 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB5DC03FECA
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 03:30:12 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 81A063F1E6
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644232876;
        bh=8Y9yNV8EX7NTdignHPRQY252HgYt0mlpY9TRr3lWof4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=eSTSgcNb5oVwfcw0ULwPZgHsDxRfMEBuxriKUgbStBXQdjXd11jYqzwadGxDxOykc
         EBWcInM7eeHx4uo934mDavnItYbh1/cl6g4RHkw3DIh9ShzEnFV0mXd5Cni+4d0EmK
         N7gzpz8Iw93dtVHqyQFXATMdhA3XxcSFpZjhYgjv2U2trv+43ejV2/YqONbiPnbekt
         ARkcT2LaYj9VhlJu30bmHzD9Gp5Ms7ZGMrNaL2nKRSc4DHV+gS8mi36Ab0IqXPceus
         vkW+HEomIL1lFyNlc4cOrrywyS1Ob4jRyBtgulQzIsMImsgnHO5eFp5+X3Z6godOzi
         2J1YioqkXRWZQ==
Received: by mail-ed1-f71.google.com with SMTP id w3-20020a50c443000000b0040696821132so7620951edf.22
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 03:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8Y9yNV8EX7NTdignHPRQY252HgYt0mlpY9TRr3lWof4=;
        b=8FNY1cOcLy2eW1k1kCk4wbJq1FGZjwdnewetDoaV6il495rv+M2b9B1BUhyh2q/HGM
         mRrjPOEwKi3sbs971k6nH9oUbM92IYByeb0ysHlXLv6D5p4D3YdRcQjap2tW1V3Ip0Aq
         P0mC8PrNAI17F9t4d0m98Ttm+gS66G54sYLEF6iIm4shAEUHMHfWrJRZA/vSguYUwTTR
         x+/nJ67UllyFMHGVChr9IPUPstic8X26qd11cCQ37Hb17lVgbHSy993sSSvSw+OIHwjV
         qUAdvyQt7NPYDP3OeFzqBEYEKCIySBcitwmFmmLa2AN9ve1R/gk9e5qG7+zMVMmtfrSz
         7n1w==
X-Gm-Message-State: AOAM5337zqk2bWZ9VwBd2jZDCJ1yFvDQIE3RpOc9pNbdDdIm+j2wdNUO
        nT5BFJYzqq0Sz28h93nVMRfwoDlpJaFUNgpWr4ozUV6P3rDYuh8rtqhZqYztRjOSIvUr/C8kYq1
        tq2zi+FRM2wNt8L9fbPVbfb1fx5MRWyCZPFc0nQ==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr9256733wru.20.1644232866048;
        Mon, 07 Feb 2022 03:21:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz28bw0iWdum97UqccNObiTCl0E42zll9NAhEqs1JdVzu878pa6CnjxT2SeV0Ew8TU0VtcspA==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr9256693wru.20.1644232865857;
        Mon, 07 Feb 2022 03:21:05 -0800 (PST)
Received: from [192.168.0.87] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b4sm2321525wrw.100.2022.02.07.03.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 03:21:05 -0800 (PST)
Message-ID: <776e1b61-678d-6686-06fe-a74b7ff68b85@canonical.com>
Date:   Mon, 7 Feb 2022 12:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/6] i2c: npcm: Fix timeout calculation
Content-Language: en-US
To:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-3-warp5tw@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220207063338.6570-3-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/02/2022 07:33, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Use adap.timeout for timeout calculation instead of hard-coded
> value of 35ms.
> Use syscon to access gcr, instead of "compatible".

One commit = one fix/feature/logical change, so requirement of syscon
should be a separate commit.


Best regards,
Krzysztof
