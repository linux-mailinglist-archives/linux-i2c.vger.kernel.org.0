Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE61B8982F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfHLHrt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:47:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46259 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfHLHrq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:47:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so103704644wru.13
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/TkmzmCFMyqU4MHKNjTxgUU+DI3GkWHVrAyNy+f/OJY=;
        b=XR1tewy8pZSw4N+Xl0PLWK3l41j5iOTg1Jyjkr/RYJ4rPxaP5vYzI0UVL11YX6Wxup
         EGtUb14umTd8OPADsYm9+1ViqC9Fy3cb+B13OTP/1cfmKLgTw+KKuT44D12y/WnR8BHK
         cGKoKsKIMdIRFEMof8dya9mDRwpWi3DWWsJ0InkAZ4bkJ3DlnUlGWycvYMrs7nJL7sT9
         maGiYjdcAwPiVcLXuPotjBoh5dfgzgFcdiuDYHhf1z1swV853RZ211YXKRn/wwYtcCri
         MtBOzUD5NPsnPgqxesk8AMjPWpiBd3IzgsgI+0eFmEM2rrxOscSeEDRMXQeb337W/UcD
         M6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/TkmzmCFMyqU4MHKNjTxgUU+DI3GkWHVrAyNy+f/OJY=;
        b=Jh9B1GLuXbp4+l5b6UkI/FdqJmiGjliRtur84vsd8nddqwWj6ESoDRNOTOBkfKccLx
         NeI3CalVjzpUDWGawn2ffvryurATV5vW5J1OL8imlLHFoKd5R4VQPcbZNGg9he4jhiRB
         dEQzTO0aeDiOd6+toFdbtE1jGh/TmA3qVyIsOdBKzQaQXxEQMuTUsRpqvJz6VfknF+2a
         b3Zg0/mliafigO1eiXvsD+01LNec1wYTgwETmtVyf+eVibJjUJrtBfjIpmjRKGcdwcTA
         WgOjm9VUdX8BcsuUqTYfE11J1nAfLU6JFKd/VkTGCIdzH9Rz16r+CU1oVzzqqlG0sJmL
         BgLw==
X-Gm-Message-State: APjAAAUHTX4AaRKXtQsxyEfafDMuKYewxx9zfL9ldCfCi/tvDsup9wgI
        SfPjNrjP1hmQpe/YyOF5MJcy/MUXyuo=
X-Google-Smtp-Source: APXvYqwtsIceym+HBdhg9F4nrHqXzb+kG7g+UQ2T8fIIbXRfQJIJiyfscs23rHM3XDDAKKLObiGM1Q==
X-Received: by 2002:a05:6000:10c9:: with SMTP id b9mr26201744wrx.11.1565596064084;
        Mon, 12 Aug 2019 00:47:44 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id a84sm15915564wmf.29.2019.08.12.00.47.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:43 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:42 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/14] mfd: max8907: convert to i2c_new_dummy_device
Message-ID: <20190812074742.GA4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-10-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-10-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/max8907.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
