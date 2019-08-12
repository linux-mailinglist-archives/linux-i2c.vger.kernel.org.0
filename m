Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C4F89821
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfHLHq5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:46:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53728 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfHLHq5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:46:57 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so11233065wmp.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=I1bA5jORkWQ9x0UxkfmMQZ+aUJyRV+I6opQ4+8D4ims=;
        b=lglejf56tBgWWaA7k3eSdwo3OsbCb6f9LcRJm4ksycSN9PTqOJu5CyHXQ+7IqzJxvo
         7eoPc02Kq96MebG5zgVDaK6GL3PqYP3oPbqMVA3xL/sJN5YXNK7ppv2ebdgtMdQUeXOg
         lyPkt2oTPPFItUVxs+qZJNq7Nyh+Jlxtr64y6cNWYF/I+BjMKGquSdbPcI6xdM2SfDvX
         NDNwh2DfSdbxJaVON1KhDpb8+QCLjUtAdXFkqh4Msi8u7LNBS0j3sm3LntBLcKI5OReY
         9USSjYB+1Taq8TMsf80a6IKlcJP2QosDu6bV/kKpNJPpS33yRsvVHmsL1rY8Nr/h3ZCc
         fzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=I1bA5jORkWQ9x0UxkfmMQZ+aUJyRV+I6opQ4+8D4ims=;
        b=cQh4qQOTjCimtMQMDEGKwYrg0wL7WD2FHp0jvkf3mc2FLlzHLeBb7RQmlT2RmMVOoT
         8eqfym2f/RWPVV0GcQy4qUYWeFnKP3EIbsgdnL4hNggK08gT75FX+LJGWcbeS7W4HPgC
         an4DJS0mFeU+rR0nfoNiVE0TD5TgxdZPi8G79wic7MWHBZNqXdJxpgK6bw3Dp+nsfONP
         PGOuAcFEmtftAcwt7OEdB+BVoBTzB1W5YFOqxsrOmJcoL4QXXtNZMJ+G7imui+99Pkzs
         U3XMSGt9didpKuVCZhfwX4SxZG20IvuTgQH82cyY3zesHatUOBm0Krn22SZHAT2m398w
         N4xA==
X-Gm-Message-State: APjAAAWnoYwKMjPPXYl5IcqFp18ERll5cxYh6n4ROMOAbueh9eWZBROH
        S+Q/d4TVaVPoqspoEsvQNv7elg==
X-Google-Smtp-Source: APXvYqwQUWwJahjPXQuRPdhuH8iNxALXWjWb/36HKamnbs66r/hrIHkKFrKzeZUKDpJJ1IQoeq2kng==
X-Received: by 2002:a1c:f913:: with SMTP id x19mr26141015wmh.139.1565596015652;
        Mon, 12 Aug 2019 00:46:55 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id f197sm13829394wme.22.2019.08.12.00.46.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:46:55 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:46:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/14] mfd: ab3100-core: convert to i2c_new_dummy_device
Message-ID: <20190812074653.GU4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-4-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/ab3100-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
