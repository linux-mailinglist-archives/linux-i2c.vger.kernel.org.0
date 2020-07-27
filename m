Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C779822E380
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 02:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgG0AZw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 20:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgG0AZw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 20:25:52 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0396EC0619D2;
        Sun, 26 Jul 2020 17:25:51 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v4so5642259ljd.0;
        Sun, 26 Jul 2020 17:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GKnOu6p3RfixuqRD3S1qs+Z1A7aJHu+EzkEkVp7wuI4=;
        b=Shm0qTlIgExezzQDG02ewiytrxTdTlFNuf81amBugZdEAACLhDAnQJFlN5TWe7GTl/
         rHNWDAlfHOrfIU9sZXwGiHL08BDIJHWOhumvV3SB04XIYHVdGzsI7yhtAYshn0D68syI
         AAqd0f+IjpucFGfFNTvaexbuqqrlczUrFNC7QZSWvQMGyq0zV8N4mpE3m5pEL4DgOnEY
         r5suHNBPgNDT9sfVVpNREEGKktZBsC0i4BztDx3p40TGVqKjGdY5eEDZZR886F2ugiR/
         uDBnPay8bCRyPpbEPLgNIMhkdN93mpiFyN+kcTK6GM+dskvzFxIKpl8twF2yCxKSUD4k
         JJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GKnOu6p3RfixuqRD3S1qs+Z1A7aJHu+EzkEkVp7wuI4=;
        b=WLThu9xaflXIjgg38w31gvKPbbVBu66RjYaT7Q0202GLh+NoplkCswDYd94GyCMbqC
         jpQOIojkjJUln34CQ6DP8kaSGDoKzIZpTHvSz4j8A05kv0+HKMCJ3VStyt8/7d2LDhKT
         Jdw6bnqBSSnaAWhA1Dj92yhpFID0yrnEpBwdPCPzpyfYgt/uu2kfUE20dEmUKt66jILt
         cDO2xNKm6uTjljlI/pAGY84Dwjf6RSc7ddvdlmjji7+ZFOfpd5iTunO/qCx/Oyp87FJb
         QivLM51Y8tntKh2GHT4G+4AP+yY90Ps3hmOL2hGh2hJm3eNXZsULA0KMyLU/UKqStoU6
         SlEA==
X-Gm-Message-State: AOAM532W8btD4DJafSZT0JIrXSu0qqO5+ccDOrpPQHljEzCFnjfLUJfR
        SJes73gGijbsBd6j6zWrGrZ9zZnM
X-Google-Smtp-Source: ABdhPJxwmNHqgZ0KpbLsAZAfgqCcfjiJWhzQTm93xQrBExY7mKMKds0N90A6ux1p4RD7yyJn7eGXfw==
X-Received: by 2002:a2e:6c0d:: with SMTP id h13mr8629273ljc.394.1595809550157;
        Sun, 26 Jul 2020 17:25:50 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id p13sm3021471lfc.63.2020.07.26.17.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 17:25:49 -0700 (PDT)
Subject: Re: [RFC PATCH v4 00/14] Support for Tegra video capture from
 external sensor
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <cb080da3-5ae5-bb83-8f5c-65d1fe17cb67@xs4all.nl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e7fd1d23-ea4d-2c17-e3cb-b27f9eb4f687@gmail.com>
Date:   Mon, 27 Jul 2020 03:25:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb080da3-5ae5-bb83-8f5c-65d1fe17cb67@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.07.2020 12:43, Hans Verkuil пишет:
> Thierry, Dmitry,
> 
> I'm happy with this series from a media perspective. However, patches 1-5 fix
> various i2c-tegra.c issues and patch 12 changes mipi calibration functions in
> drivers/gpu that patch 13 relies on.
> 
> I think the i2c-tegra.c patches can be merged independently into the i2c
> subsystem, but patch 12 needs to be merged with the media patches. So for patch
> 12 I need an Acked-by from Thierry.
> 
> I can also take the i2c-tegra patches if preferred, but there too I need Acks.
> Dmitry, can you either take these i2c patches, or reply with Acks if you want
> me to take it?

Hello, Hans and everyone! The I2C patches are good to me.

Either way of merging the patches should be fine since it's a hardware
bring up phase, and thus, it's not critical if patches will be applied
in a wrong order.

I'm listed as a reviewer and not a maintainer of the Tegra I2C driver,
so it should be up to Thierry and Wolfram to decide how to merge the I2C
patches.
