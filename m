Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942504205C2
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 08:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhJDGUO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 02:20:14 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52466
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232496AbhJDGUO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 02:20:14 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F15D840314
        for <linux-i2c@vger.kernel.org>; Mon,  4 Oct 2021 06:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633328299;
        bh=6rhTGdQXINmijpkcPrHK0rvBN904JsfzhP/R1ITG3yQ=;
        h=Subject:To:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=tSiAxL/trZSnqDnQI98Bf/95bYqCMn+OAvwTf0d64/r94qjxGWvF1oS1pJFak5SEk
         6kj+jh6U2G94zig7kDQs2UmhOwz/WjHnW6M3YS5pfVaW27zle8pegCuavUQd3UBXuA
         OM/fFpPTJX6+o6AgS+IsMTk6u7ktoCS7lhjXvx0U8iKZj621+4H+eS3UC3ECgd3+Tr
         k3UbqMVFW8PKPiNnQy502WWTMzHtNopyNi3M/7KNJ085rkoenhoWK2geZO6fBq7pqP
         1oQ3KmHn6tJ6q+21JanGhhwCy4WhkTZw4IewH3tBAcj2vB5SqDw+XvMBo3G2OMWMD6
         vdsjjb+s3f5cw==
Received: by mail-lf1-f69.google.com with SMTP id d16-20020a056512369000b003fca9e038ddso13297209lfs.3
        for <linux-i2c@vger.kernel.org>; Sun, 03 Oct 2021 23:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6rhTGdQXINmijpkcPrHK0rvBN904JsfzhP/R1ITG3yQ=;
        b=jyiFUzw3wxheknmFgqlPVV9OxCeJyeMC9vR78v6qPQNKcPpJiFwC/GpsHJEpSUBQAw
         pa8Xa0p6rUjyzylHy9GKxwUwmMcMmw0inKcmZ33seWAV4Gq2LfHwqkeSWG2yN2J+Ewgy
         ixoDlGg3dWL84gl4g5Xr/uWTrumBv6bl0iNTFMe/tHwNaW6ZkUU9KGLSeFPYvuzevssh
         NFzn/n4gyJQPlVG2ObDH5fccp+G/xaMjfyIQZKgTrqoQBchkQ3PL2WDWNfkX0godaZ6u
         2f6N2NKqMyeIGuyBkPddISYDY1JWNPWHIpQWGEMunxVoOOcPMy0ED9dpdAuD0joVzAi3
         BE3A==
X-Gm-Message-State: AOAM532h1hBJ5LbOEAHzo2l6uEOV4FC76Ym7R40OO8GXjk+WcdrneK/K
        8vDfkGfdRdEDVU2ARnCeps/BhxhL1HJmgWkNnlwJPIDKw7zqqpU3hChkduCM/HuDuNPAdyIFTDO
        dCA+W3sBQPT1APzNXclArRqgTKwontieGrRyG8A==
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr13304237lfd.496.1633328299224;
        Sun, 03 Oct 2021 23:18:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtlfzjHtJZ1tlXP9FwF40sLemJaJymCby0Kw0vhaAlQc4a2km708y5CoSpfeHPWMuPuKw0Lg==
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr13304224lfd.496.1633328299032;
        Sun, 03 Oct 2021 23:18:19 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id j18sm1518879lfu.84.2021.10.03.23.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Oct 2021 23:18:18 -0700 (PDT)
Subject: Re: [PATCH] i2c: pxa: drop unneeded MODULE_ALIAS
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20210916170517.138035-1-krzysztof.kozlowski@canonical.com>
 <YVgKu5IEr3kvdM1n@kunai>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b94447ca-aa7f-661c-a0dc-8e7b244df5e3@canonical.com>
Date:   Mon, 4 Oct 2021 08:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVgKu5IEr3kvdM1n@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/10/2021 09:31, Wolfram Sang wrote:
> On Thu, Sep 16, 2021 at 07:05:17PM +0200, Krzysztof Kozlowski wrote:
>> The MODULE_DEVICE_TABLE already creates proper alias for platform
>> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Applied to for-next, thanks!
> 
> Good catch. Do you want to fix all of these duplicates in the tree? I
> found two handful of the same pattern and could assist you in removing
> themt. But I also don't want to steal your credits. Let me know if I can
> help.
> 

I think I fixed all of platform aliases. I also removed duplicates for
few USB and ACPI (some others seems to be not an actual duplicate or
intentional).

All patches:
https://lore.kernel.org/lkml/?q=f%3Akozlowski+MODULE_ALIAS

If you see something not fixed, go ahead.

Best regards,
Krzysztof
