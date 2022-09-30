Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBF95F06C9
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Sep 2022 10:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiI3Ipz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Sep 2022 04:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbiI3Ipv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Sep 2022 04:45:51 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7349E111DFA
        for <linux-i2c@vger.kernel.org>; Fri, 30 Sep 2022 01:45:50 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id cj27so2258133qtb.7
        for <linux-i2c@vger.kernel.org>; Fri, 30 Sep 2022 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=zGxDgMgW0IDegMxOKAwjscGt795hY9qTbQ4WdBlz61s=;
        b=ksu0lJieeXwfMfEvdsT0OObRGEEPXciAPO/Z5tHMRvyHTpnlw1EaIQ4+5PkWW/pugB
         d+xoKO+tPZ3vuv3DMPqDEKxhAvDN4U1j/gnmDpjzW8C+1rNMv1h78aWPBA8uyktswym8
         sAiTFig9+67i3gdgw24bakCu7VQVmAoPj+2jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zGxDgMgW0IDegMxOKAwjscGt795hY9qTbQ4WdBlz61s=;
        b=LzCnlU2I88unus30lQItMHi0CCp63MSGJ3/g2W20iyRdLGbSSB7CpT21t3LVcjmBzE
         BWQeHmV2kgFo547WbAsC+7y84wwK94Rwxo3lPtmdwFI+5O/+8wYtTladQbn7Ye0FMLTP
         msmI9oOh4EABQiM00h4Gx62fuhwtiaGZk1o0nM9moSJG83fcl1gE9e/7tPul83bhv1sa
         4+LV8dvadwefPLwaJjS08A6rQRRIDh8eFfAFAz1OZwwPUhbWt97HlG7bWiDaRtZtAZ+1
         UzLqlvk2SS93b/7z/pInOctm+XVDSO1mLTNa12RsveScI2J/HkfGENkkeGL/Gn12m26V
         BthQ==
X-Gm-Message-State: ACrzQf1hBDAk6c5iFdjPf96bmoSn25d/1WcSXrP9Ga9kxC+OUD6hnULc
        T0hJQAgK1Q5T3m4d98MA8OfraLLN9KT4pBlqzO4=
X-Google-Smtp-Source: AMsMyM4HNC03bfEQo1vycCBTzapj5L53R8xs6igjT2Zlf+7qEEGnqDQ7w/bq4tQ8LHCnHFTyGqkONQ==
X-Received: by 2002:a05:622a:34f:b0:35d:4cec:4d7e with SMTP id r15-20020a05622a034f00b0035d4cec4d7emr5629334qtw.56.1664527549351;
        Fri, 30 Sep 2022 01:45:49 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id bj12-20020a05620a190c00b006cdd0939ffbsm2010298qkb.86.2022.09.30.01.45.48
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:45:48 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id e145so4439759yba.11
        for <linux-i2c@vger.kernel.org>; Fri, 30 Sep 2022 01:45:48 -0700 (PDT)
X-Received: by 2002:a25:71c2:0:b0:681:63ae:4c48 with SMTP id
 m185-20020a2571c2000000b0068163ae4c48mr7624055ybc.578.1664527547933; Fri, 30
 Sep 2022 01:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220826074430.1333272-1-mani@chromium.org> <20220929174334.44d3e6d9@endymion.delvare>
 <YzYHF5qPMEMZu6WB@shikoro>
In-Reply-To: <YzYHF5qPMEMZu6WB@shikoro>
From:   Mani Milani <mani@chromium.org>
Date:   Fri, 30 Sep 2022 18:45:36 +1000
X-Gmail-Original-Message-ID: <CAEfrLckfRq99nShHgE5-2P0Wn7keprkR6W7SDa1FFna9e7Qmuw@mail.gmail.com>
Message-ID: <CAEfrLckfRq99nShHgE5-2P0Wn7keprkR6W7SDa1FFna9e7Qmuw@mail.gmail.com>
Subject: Re: [PATCH] i2c: i801: Prefer async probe
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

No, there is nothing special about the 190ms. It is just what I
measured on my device under test. I decided to include it in the
commit message to give a rough idea on how much delay this driver
probe can be adding to boot time.

Thank you Jean and Wolfram for reviewing.

P.S:   Apologies for sending this twice! My previous message was
rejected by the mailing list due to containing HTML subparts. (fingers
crossed this time)
