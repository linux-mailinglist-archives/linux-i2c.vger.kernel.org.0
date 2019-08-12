Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63AE689830
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfHLHry (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:47:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36346 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfHLHrx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:47:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so10885249wme.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IZQkmchfIioxGvxwfII0Mb+GhztO+bLNAcrpZHM+gHM=;
        b=OECdOmDA1lzjAt+UsvoP0TqVlUeO1ixOThWyjxtZuCd4oakR+9BQn/4G8j8ye0yyku
         oV0ece3Ii0I7yeVVZk0bMi+QmTcv5Kqb6Xya03Qu0d0AbuPdFwoirPWmWR3WJ4cTVy2a
         eBlZgoGSHyFJ7yKQg08nm834Ix1lGleGESZeJ911cCmVm1crG4deJvLOKietdzKU7jYG
         A+ZycIXNVZKFbgo666VKZdnHsezbk6YfplfEuzxvwi+mE0o7eeVBdDD3nZSeCL+9TwkH
         Ojef2nA6gIYY1FefCAjrIuP8K70IkAqTYxjVkl/dLelbu3PjAjE5+ybJuqF9uWdmzqyc
         9rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IZQkmchfIioxGvxwfII0Mb+GhztO+bLNAcrpZHM+gHM=;
        b=VcgLAXQQsyiWH6U53RS6ZPEkjoWvya5NtzvAnppcT1uwFn5LfSWPBuMtw0W+VcDtMr
         zHx0CypAiMQhJtyEh14EZU2Tt0JJPKCjTUeqPiZJqZdepK0zh+zAQqTWUE23T9fdZUaX
         CVvcq9/3AADbFuLOLk59n0qzaMtkiAVrubtlfK8gD+CQSxPMvbG9NJ0eDXo16BJaGtek
         V5OahX55ceD5VNCORx7BIvjoPjMdLHVC4682zSX88gE5LBREl1AteqjfvEkoIKhM80wz
         uGKbe8W+3fyCC2elU0H78DwkJu0TtY98T5gBHdkm57oCGUWsga675kdQmaAt4q/w55P8
         SFHg==
X-Gm-Message-State: APjAAAXM3PPyDE9sudYyuuckNiDT4RP+xouSTJDqIIvP1qE/X4QrFqdT
        v4H9dJfBMh6KwIUf93uPbiG+Vw==
X-Google-Smtp-Source: APXvYqy6nkLHkYwyL8VAeRFYM48i04+iJL/GyfS30yDTdMe7US9LguSGzQDHKCqRHLGsmsqset4kpg==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr26988551wmj.13.1565596071588;
        Mon, 12 Aug 2019 00:47:51 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id w13sm43977302wre.44.2019.08.12.00.47.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:51 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] mfd: max8925-i2c: convert to i2c_new_dummy_device
Message-ID: <20190812074749.GB4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-11-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-11-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/mfd/max8925-i2c.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
