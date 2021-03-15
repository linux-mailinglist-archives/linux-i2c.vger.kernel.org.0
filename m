Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA17733C17D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 17:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhCOQSK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 12:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhCOQSJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Mar 2021 12:18:09 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13B7C06174A
        for <linux-i2c@vger.kernel.org>; Mon, 15 Mar 2021 09:18:08 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g8so8474604wmd.4
        for <linux-i2c@vger.kernel.org>; Mon, 15 Mar 2021 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=4cLf1KJ6GEp0APHfw+FxpyYjKA9+LfQ4yZFrFDAR3W0=;
        b=ZtkCTZ6RBkgl4Wc7BCEBsbG180OqWkOmUUEPYRAnH8qGHqFexXQWvJliex12kSFd0/
         1UCxji7hTVYZHeEcJaBeN7qe8GOuKyGdzfJGVBvNP7vrr9uf1OXliI9kyI7HLY90UTEq
         h/G/nk/fzYTOK7JcAKfv4EPg7RjeSSS4COncHKyAAH93LdUSHlopXY76LesT1zVjrfig
         HpK5jAEOAHgQqOYfDvOM28esm/jhj55I0qC2ohK8TBUijl+BTniqU18ml1CLhBnBfTTe
         UTE5Mg/h5eslaYeZSa+TJxVQMBiShgUX9SnKXZsnEJrbn5ci5JztZE5PA7BafQ9J9oA0
         CUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4cLf1KJ6GEp0APHfw+FxpyYjKA9+LfQ4yZFrFDAR3W0=;
        b=pcr/yMr8kKYelvuYtbupi+5+Jmzzigj8rRHSLhdujvRrypm2Z1Jsldh3CcHFa5w6R+
         9tE1YdPEBdV1J4PGIqQ7k9GGGThAVvQctIeeBq2JNmNcp947eZcdSSeHwPQjMQfHMdQx
         1XqI3swOEtbI2n3DfRLVp1cKlw7MEDOTPYzOFpjsZljNSOSieIl+bylu74S/4YAINhPq
         l+vTPWZUtYVPhozFX3FdX4vV8iwFN+gCbQ8MkUgIeBZmYy9RAyxQBddcesTse0bEv6nA
         OisLLzPNRm4lMhih+K95jxvqNLfOaX9lagQMAdgFKUJpcUi3tCIKlx2xOeF3B3q8ADR9
         UojQ==
X-Gm-Message-State: AOAM532EwQGKGvL3ZUahCci2JTihUgT6xe8h0pIY8lsbpJiB6RatBzoS
        5KkxWziVsspfMu6/8mucEMNv210VcJM=
X-Google-Smtp-Source: ABdhPJwS55JtGEXhQVKeNgYr6h2wQpbZRBhplKMh6zS/5E/Yj11yfZSaGmCkTNoC/QlMmpX3ELqlNA==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr437243wmk.89.1615825087623;
        Mon, 15 Mar 2021 09:18:07 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:499d:3dca:5498:583? ([2a02:168:6806:0:499d:3dca:5498:583])
        by smtp.gmail.com with ESMTPSA id h20sm95329wmp.38.2021.03.15.09.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 09:18:07 -0700 (PDT)
Subject: Re: [PATCH] i2c: turn recovery error on init to debug
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
References: <20210315115008.19110-1-wsa+renesas@sang-engineering.com>
From:   Klaus Kudielka <klaus.kudielka@gmail.com>
Message-ID: <4017aa36-3831-19a7-c1ad-31ef8bda1076@gmail.com>
Date:   Mon, 15 Mar 2021 17:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315115008.19110-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15.03.21 12:50, Wolfram Sang wrote:
> In some configurations, recovery is optional. So, don't throw an error
> when it is not used because e.g. pinctrl settings for recovery are not
> provided. Reword the message and make it debug output.
>
> Reported-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Renesas Salvator-XS with R-Car H3 ES2.0. Klaus, let me know
> if you are happy as well.
Tested on a CZ.NIC Turris Omnia (on top of 5.11.6). The error message is
gone, I2C functionality still ok. I'm happy.

