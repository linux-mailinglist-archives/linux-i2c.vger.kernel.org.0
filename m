Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D863F3ECE
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Aug 2021 11:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhHVJIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Aug 2021 05:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhHVJIM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Aug 2021 05:08:12 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9A2C061575;
        Sun, 22 Aug 2021 02:07:31 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so8737250wml.3;
        Sun, 22 Aug 2021 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AhPq++c5LnLSV6coaXUp7/7VbDNysWaKtvq47wkdGAs=;
        b=A6OyULkPkFg7lqEv4VdvuWuRyKWJSL7oT/xAey7fZDYfziA4jTHwCaS266A5M72c9+
         OSRy6RgxcjP07hpEIx2wvw9MAa5/nK+9bKCw0+xzkyZY+Ia/F9166dFSGUyTChJyvZv5
         Bwn1ixH51p5bXOI8+Gh1TCNLmB77N27cjXWj2r9LvCbor3p3wHTgZXLIQU6M3s0zNORE
         /eyBzTfmoaaVQf2u0Gx/8JweaVXjayfDPUfAkHxNYfY7Nfc89t/2S7vnQaNui4dVGu0c
         5QfGSglb302VBjBPag0KxEz4i/IkRV0oXjmlzzQjkXC1kW+Z/D0iM9JDa/Tzz7BvZKnD
         WY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AhPq++c5LnLSV6coaXUp7/7VbDNysWaKtvq47wkdGAs=;
        b=rfLAyRLClapQeo37r+DW3aMnLpLJXKPn3k9+6o1hsdBDK18hF7ntClkJTed3BNAOg4
         rKziZEjzbHiz5sQwwcIUQfTAHJWV5r9LKrhsto5IyE1ZPxJNtq9qQt8m5jmnfVJdlRin
         SLAgJSYGH9oinfDUExKXnDkysXHXSD4bpy/3X/87DzkgWJJ07516U5YuOxNHQJEsctRs
         FvHptoX92kkQd0BAvQlis8IcAfJGEOb4EPadGbpNdhAbChcGw3yzPLBHkPZWb4nypRyA
         Cxm4/IvhcoSmDyNiooAUAOBXa2OSN5BTBl6hh6ezV7mrgENQ+7+UaUH8MS42BJPIKoh3
         grcQ==
X-Gm-Message-State: AOAM532H9aKxgL52e7EbLt0cCXCPD/reB7XUeNGW8iH7eaYsaVGQL3ck
        wiJYISpBrXPZnerZw4BLPVbkwRoOs/N1GQ==
X-Google-Smtp-Source: ABdhPJzxq7lQKTqstwQLycqiGMLlWfb++OLHjx2SRn3+U0yvi6F20Pz9xGZ37U5CoH63qfahXrHvOw==
X-Received: by 2002:a1c:46:: with SMTP id 67mr11586320wma.29.1629623249777;
        Sun, 22 Aug 2021 02:07:29 -0700 (PDT)
Received: from [192.168.1.22] (amarseille-551-1-7-65.w92-145.abo.wanadoo.fr. [92.145.152.65])
        by smtp.gmail.com with ESMTPSA id k12sm11787655wrd.75.2021.08.22.02.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 02:07:29 -0700 (PDT)
Subject: Re: [PATCH] i2c: Fix return value of bcm_kona_i2c_probe()
To:     zhaoxiao <zhaoxiao@uniontech.com>, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210816083756.22294-1-zhaoxiao@uniontech.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1d1be6bc-d0bb-7bfa-803f-c220c7492791@gmail.com>
Date:   Sun, 22 Aug 2021 11:07:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210816083756.22294-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/16/2021 10:37 AM, zhaoxiao wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
