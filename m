Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064D589832
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfHLHsB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:48:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55873 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbfHLHsA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:48:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id f72so11208406wmf.5
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=E1i1E8TWvO1VSrOqM8vbWck6cQCOPIB0uEJKJYjbhrY=;
        b=byHzQiAdskyAz1hTiWRZbB545tZhX2+uf857cBNYla9a+9uXIde1M030thzJc2/S63
         lOxYfiwskh0rHwbsjflBJCY0laTKpWieT1G8vawhHeudg86YSQmWfRMRvi4gR/uBiPe/
         e6jXP0o55bzizb6R1ew5WfEWmVIr06yVovy+VM9OKmoY7tRvMFnShPgU0W171X6FuEVq
         rcxU6qtm7Ybk4eC6Wu6Vf1I9Ir+7mPgMQmhKQDOnFVQohZRm8bHTHjmrJR4pyR2EtU7M
         oi/R88jD7do6wKlE1Zhe/X2inHxk3m9WyqYZT9iwhZnlOYy0I60T8h22OxIJT0LrseOa
         o9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=E1i1E8TWvO1VSrOqM8vbWck6cQCOPIB0uEJKJYjbhrY=;
        b=kMQhmfpW9pOPspx27rQVBLh8nnDid2w2TbviIFMk+DS0n+N27SdqqsAz/CwWWlYbfG
         CVjMtKB+YM/5Sq+qvvuIomQUBtfEcpyfgg4dy49qKsY7HyJZgVf2ULW6a/RHq3aXQw9K
         vQSqXvOCf+AOVDZrDLweeaU2v/BE7TJ85EiN0FR642moeWrdcnK+G9Vgu6uDRHeL06Oj
         ROuNkAZ2znJaUTQIugu9/cAQLwvLBeRj0itzeWqn32NyybL6qVdbqclxH5zOi1RWTUj6
         iUoCk8+YhPcaYTNM9qAUWw+Asx3Mj6KoGTRSvY/+sgKTGfLUrgRXFpSbfHec8M0xSVUG
         UTGw==
X-Gm-Message-State: APjAAAW5ALVB8PSLJtd2ZMeWJCUxk0AMFzR/7hlXt0oxOUjY9suYwrCL
        PHd5S9fBBMtQ86mpCVcyHJf7JibLCkU=
X-Google-Smtp-Source: APXvYqx3fMfzlURgW+h/0aIr27PGHhyA9XZzTN6TwwQgDOI4uHFCeuPBiBvvUBoR/Szm+OFB1/8zfw==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr12265125wmh.65.1565596078875;
        Mon, 12 Aug 2019 00:47:58 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id x6sm19128678wmf.6.2019.08.12.00.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:58 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:57 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/14] mfd: max8997: convert to i2c_new_dummy_device
Message-ID: <20190812074757.GC4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-12-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-12-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/max8997.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
