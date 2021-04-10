Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254EA35ABD5
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 10:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhDJIOv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 04:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhDJIOt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 04:14:49 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22D8C061762;
        Sat, 10 Apr 2021 01:14:33 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id g17so9384886ejp.8;
        Sat, 10 Apr 2021 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=iFkUvHDAIonvghUhNjShz3kgfmi52q6g6pOPNuEyy2Q=;
        b=ibzlsCZHwQG6TRiEh3aMXUzAQE0TGDic//8r3jxOv44J1MESfnvguYGuE/VDdzBvgB
         IYQk213UuqP2aTA7DdIpxb/5qkGqV9tWVNKeRZf8/7d7TkpeGfbWiITwE2H9L8uRXwKG
         lEC0BrG7RWKkbgWBohSy+pKeosbJfK8ok+2plwlYIjmlszp+kXYDwIfq3FK7AH6zyNDP
         OeJ83DWqUA/7ChRqZqUoL1E4ebKFmNVvgLKrO4vaGDQ5qOfLeSpmGhNT0V0zOOphzstF
         omHFlnG6T6mlVENn4El0PoWsUvkj4wF7ndpjxxfYIXo6GfcrGmsngMGTZAekoaEZ+bF8
         1cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=iFkUvHDAIonvghUhNjShz3kgfmi52q6g6pOPNuEyy2Q=;
        b=e66oCHI69Rnqs8mFYOWs6HNOSY7EWuH2IPf058fMmqrGvVcTOz511XnSbWNzcRAvjk
         EU+w6ApbOPR76tQRVJTCky8fFRMmpNAKO1kKOWNq3m9PwdAiHYH6J+AmoMnZcalEwfan
         hYA8aqaijtCizLCMZO76JQG5mQsttuMeVBW5F1wLASfn90CZ+7mLj3kodieMUei03Uoh
         OIkmHD5jPowNI/mAPG1yh8jCX6krFJamA0MCgdbNEIiUdiSoN9B4uLlaTP5WZ0kHjm13
         usD0d0GIozskgaoL4t/CQuw38RoVHH9BZST7vkDIH+dpDzO2QyasAAYvTYq+IgxooOTy
         C55w==
X-Gm-Message-State: AOAM531NjU9V2yko5/r+IWHaBNzt/QhmebkJ7dpimIXjuHeERrNiy9rG
        rTpf1GEOP4o0RGkRfbQc67FUWW0b6Zw=
X-Google-Smtp-Source: ABdhPJxXFT1AjQCeqSyg+7+b2oqkH1uyI+9DgyPOMO5o3onKySUKphQI37H0tMrS0IQPrdOhjGXGAA==
X-Received: by 2002:a17:906:c290:: with SMTP id r16mr385717ejz.241.1618042472430;
        Sat, 10 Apr 2021 01:14:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id hz24sm2303254ejc.119.2021.04.10.01.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 01:14:31 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1lV8lD-0004eI-6W; Sat, 10 Apr 2021 10:14:31 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for returned length from driver"
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion> <20210310204648.GA332643@ninjato>
Date:   Sat, 10 Apr 2021 10:14:31 +0200
In-Reply-To: <20210310204648.GA332643@ninjato> (Wolfram Sang's message of
        "Wed, 10 Mar 2021 21:46:48 +0100")
Message-ID: <87tuoe5zfc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Wolfram" == Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

 >> We don't usually do minor version updates for bug fixes. Instead, what
 >> I do is maintain a list of such "must have" fixes, that package
 >> maintainers can refer to. Look for "Recommended patches" at:
 >> 
 >> https://i2c.wiki.kernel.org/index.php/I2C_Tools
 >> 
 >> There's no section for version 4.2 yet, but we can add one as soon as
 >> the commit hits the public repository.

 > I added a section now for the 4.2 release. And (finally!) started
 > cleaning up the wiki a little.

Thanks! As a packager, I must say that this way of handling bugfixes
isn't great - I only just noticed this now by accident.

What is the issue with making bugfix releases?

-- 
Bye, Peter Korsgaard
