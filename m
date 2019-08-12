Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7679989836
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfHLHsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:48:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33261 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfHLHsP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:48:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so103820174wru.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=W8WcwmLi0Keqjqp1dlbohi1JK99Y2to0yKuNcuzaSIc=;
        b=SnhAzWfFl0VBd5gVo6j5gC5cYc2SXxssTyJ/pWH6lgJ/xGlnm+sDURAoOt5jngWEVt
         OE5AoLEDr8NQql1pveh6rCMYQp3G7VvRdXa31F7KwbRXF8MCM7lSEsnaG/VoXfW8fn1t
         5sNwMqwnsZ3RXDZCcNVA3bv5ZrM/DGLwRu/K3HroCOyxdFBXuNlh10PHjq7zLy5CzJGn
         D3C6OzfItrQdR8/Hu+Wjl83I8vvKbGiICc26MYDyv4pKhkZMnRgwTXptbBx+jzHVbYBA
         kYlfXHhhHc+wQoMmfldD/y0JJHi5AY81HS36JRvd+mC27QVpPzaFrF0cBOXFReeFIWXr
         K6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W8WcwmLi0Keqjqp1dlbohi1JK99Y2to0yKuNcuzaSIc=;
        b=I2vs/b+kSPYi4Gq8fUeVmLZtrumz3Ca0e1RzR8ovUChXAmzuEh0ke7AcEmfc+/QiVB
         tQjvSONLbwRY8FQhWdFywSV1fzkHqrDPMhdNv/N0tvyps4oqr1dKtMRm/6otMDFmYaos
         5logtZct3cOYc/EMUT5UdiMjdjUWaUXdDThe82lgppaVQGtUTrCWOlrpn7NmJ9x2L/eS
         R3bgGL4Ynnje0CbP9W2FqtXhwYx6Zo6QcFO4dt9Scg2AGwy2d1CKGvDOofADtwc719rW
         +NWXDyYxGIJlXaPt3A98+fRP2ok1fc98f4YXacuuwA7SDl4jN3JT1jF1KsvVuTnL8Svy
         bLIA==
X-Gm-Message-State: APjAAAUUbfjhEG0OSiqv0EDN645Yucu3mjaY+zwNwtAUGaRsfgJUJbNH
        o0F+R4pkNqZjDo7XfYLWGt2Jyg==
X-Google-Smtp-Source: APXvYqzVwL2tZXxtuOk75TDD2iXuB6iq2HovoexBdlGIuyJl2OpWK6S+QzXVvcXvxPBvSj6tDy3emA==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr41263939wri.334.1565596093391;
        Mon, 12 Aug 2019 00:48:13 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id w13sm43979199wre.44.2019.08.12.00.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:48:12 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:48:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/14] mfd: palmas: convert to i2c_new_dummy_device
Message-ID: <20190812074811.GE4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-14-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-14-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/palmas.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
