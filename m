Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8EEB8982C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfHLHrj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:47:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54813 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfHLHri (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:47:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so11234687wme.4
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BQ7IIT2+cZw+C3rJ+/zStn6DoC25TwFqSpopweEwxb8=;
        b=ROBzXKYFj+AppV9wFOtjvC8zTZ55gOCAVqc/IlenY+RkHnJwLX1Ujjee7t4x9o/5zJ
         EqyRFbRaubSTBXH64s9LqQTbxRqYuH8REygwGcrN9xux5ENE33/qzgKNudq/4BVmhbE+
         XDbiW/u8M7/R4GyywhNb4n4ixuVmuF6FjxaPVfMnn0hLO/XRbEno/rYgpun+iov0KT2k
         Dy6ucAV+lyg/rpsLhTN+NxKzNasJx8gAOpnAeAxhND6gcdDSlSr2Tw44JitfCShpPBWI
         poQq7boXHuZ+yl0oBdPs01bF4GTDb6iIx0PvKmaXEjKZs03k1aOXMgC0pvvUOpF6TOqT
         rAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BQ7IIT2+cZw+C3rJ+/zStn6DoC25TwFqSpopweEwxb8=;
        b=JnLFLtD9eWVKvKCBNRiftE+BZBr93ARsWIFzTnQ4IIPj/4gLm3qWKxdxlrqqrIA37+
         LJFG2VFcQjOs8yu0V/8cNen29zEqQm2ZayLuukbbWOXcaipMqePOv2B84P6IeWgSQQga
         G/7tIHD2iiUl7Hg/tjqYUeimOuloDdOH8mBW5UILccyL4keLt2L6nTIXiI2ifQm06uad
         JtBZdxUZN5/S1YqCaooXpprFrqTi7IPP0fzTuRLDhqJ6Hj9zPqBa2cVRVapPzWFMtwjE
         lgBdPTYnRfT7tHG0U00600r1dnqKXAUMcOo2VJJ3UklVxcFJEzl4XkNmUuL9gkTh44Cm
         IUEg==
X-Gm-Message-State: APjAAAWIwD20/7Qqw4HonWWJpsgWWXKxVObxY95NfiiXFiyiUmXH3FR+
        h6pI6A1O536leXOF/oC6IOSmhA==
X-Google-Smtp-Source: APXvYqw6dZ/IlLB/gbIJ0vIoaxGTBFEZkMPxysZQbmdcsbYP6FwmQa9PFVqHXDH/KYDuQtx2Gko/jA==
X-Received: by 2002:a1c:c742:: with SMTP id x63mr27530805wmf.0.1565596056765;
        Mon, 12 Aug 2019 00:47:36 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id 39sm11895188wrc.45.2019.08.12.00.47.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:36 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] mfd: max77843: convert to i2c_new_dummy_device
Message-ID: <20190812074734.GZ4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-9-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/max77843.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
