Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAD434D917
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 22:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhC2Ui1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 16:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhC2Uh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 16:37:57 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D10EC061574;
        Mon, 29 Mar 2021 13:37:57 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id o16so14180730wrn.0;
        Mon, 29 Mar 2021 13:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Aem0mmjc+m+1Ls4c4+9Q57HeLTfug6e9XtREoWGla0s=;
        b=Yyz6cO6mfdJ4gTm/q/IIRn+Gd9fo6a0YRZUwTtMq4g0ykMc312Ut403N0L/wIqKGmv
         towoVO/GPQNCSCpJKtLguC/+QRRMz7J4T8F78TyeFbzQWiohay7whG+PPzrrX7rQrNrg
         A1IdGgVh+6vl/hbC41SOby1zjIPRFyBw9sGF0zjc1yUkyt0ga9GlSLGsSFoFagGxKAlY
         0A9zc0fzEBcPjLRbSq9D4aQDe7sP4dHsVrMSHw0qWx+GZg/15SUoCJnatic6Qy2iB6vP
         y5k5d4/Lbu/KRZMLjwFqXMHqh0g0IAGQtBD+RCpmK14s1pOqibGV+17LEb7JBSKgFCl2
         4fMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Aem0mmjc+m+1Ls4c4+9Q57HeLTfug6e9XtREoWGla0s=;
        b=APKcnnQT+tzpHl+rkhT7sfBpqLWfc57hN2jwm75kJSqUqgBxgSeB8DtejKb6bPJPZr
         NaMFg002Zg8mb9HA7Dw2y90fjrSW8JOVRSCxYOx1pZHiBhfrn1mTV/7hqG0CN9cJrtEv
         MndubQgLkr2KW1LPMmWU5wDFxKPCVINDeKH+WYcZsVFspcLFEcbFWWtwHr/C6nKkmrJx
         mDLhVhTro/diTfIAHCDOxnBLNC3WO4R4s6u2wB8o6cxFbqrh3Xnb69uTeVx2MPeYSL4P
         zMgfOL6JoFlVIKa6iJha69F39oGnc6v4D32ikRFToY4bkju1rpIsNrdkxoCsgBbsK4iT
         yZgA==
X-Gm-Message-State: AOAM530ZaiENetfr1Af+wT16DCey8QH83HKp79EZ92I/6ZKIbXBGmzcG
        3OLj909T9GBKgxi5lz8c60g=
X-Google-Smtp-Source: ABdhPJwbk6wDCyr/7t4h+Ru2dj6hjTiJekgD5rahNgY9nQO/QhGp2GU31eI13ujvkwBWaxDTybvuSg==
X-Received: by 2002:adf:b313:: with SMTP id j19mr29717540wrd.188.1617050275883;
        Mon, 29 Mar 2021 13:37:55 -0700 (PDT)
Received: from [192.168.1.211] ([91.110.20.103])
        by smtp.gmail.com with ESMTPSA id u63sm545862wmg.24.2021.03.29.13.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 13:37:55 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] Introduce intel_skl_int3472 module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, tfiga@chromium.org,
        sakari.ailus@linux.intel.com, rajmohan.mani@intel.com,
        rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, mgross@linux.intel.com,
        luzmaximilian@gmail.com, robert.moore@intel.com,
        erik.kaneda@intel.com, me@fabwu.ch, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <fd2fbee6-e620-a594-8377-d2f22131af29@redhat.com>
 <5d336f50-5f25-fce2-04eb-5ad450c9cd5b@gmail.com>
 <YGHsWNXha0i1OwCN@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5bc96e11-ab7a-d084-900b-9b8fdc4a4e72@gmail.com>
Date:   Mon, 29 Mar 2021 21:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YGHsWNXha0i1OwCN@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 29/03/2021 16:03, Andy Shevchenko wrote:
> On Thu, Mar 04, 2021 at 01:49:14PM +0000, Daniel Scally wrote:
>> On 04/03/2021 13:37, Hans de Goede wrote:
>>> On 2/22/21 2:07 PM, Daniel Scally wrote:
> ...
>
>>>> The existing mfd/tps68470.c driver being thus superseded, it is removed.
>>> Thank you for this patch series. Since there have already been a whole
>>> bunch of review-comments, I've not taken a detailed look at this yet.
>> No problem, I'm hoping to do a v3 over the weekend anyway.
> Do you mean v4?


Oops, I do indeed.


> I'm just wondering if you need any help.


Thanks - I don't think so; I've just not been working on it very much
lately. I got sidetracked with a sensor driver [1] that was pretty fun,
so I've been focused on that instead. I'm just finishing up a v2 for
that, and then I'll come back to this.


[1]
https://lore.kernel.org/linux-media/20210312103239.279523-2-djrscally@gmail.com/

