Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E312826989F
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 00:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINWMe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 18:12:34 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44882 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgINWMd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 18:12:33 -0400
Received: by mail-io1-f67.google.com with SMTP id g128so1822832iof.11;
        Mon, 14 Sep 2020 15:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z+qSwNUkHNOo72Qbw1JME5fFnhiiheFUy8wUUZB0Lrw=;
        b=qufn+EOHGi3WAhfPFtJKjeAkA3hcObpRARsmJTs54heAfVGvB7njIEdu+NNQmUmiAs
         rPqlM9CTO4/RLycxA32I1a1DgjY2jbBvwVo59fEGMgoC5TXlEOUBgG74qILKCRrRANGT
         +hjbjdiU3Ma2N8Pr1RuKIO39m2eWvvDU/ILcLCfX9+j/zVvvpa7LDwHGeLgHEkutV474
         2eaJUzc9FQ5CWRiXFpLEn53NRJeJmYN0SG1TgF4H1wexMKwJakJZa8lygK4NX9qaMB9a
         uFesZX/W/lTkqYTMlCdHV5+U1FvFLhZAK5k+FQge6wkD+nPDW83k0hvoC0fMm5VaGKvU
         XEKg==
X-Gm-Message-State: AOAM5307VJ64qw72S96bajySFKMQcfgLNiTOpnu/yk1G2XehDPw6A3sr
        mIeBdyiYy2veZmMfqamDlG5qEA2UDKAC
X-Google-Smtp-Source: ABdhPJysHKNt8T7c2v44FhcVvreRsv3LO9EBSDoouJkZ5T5GLGQGPYrN+p7J2mwdjP1SyIgIZC3s5Q==
X-Received: by 2002:a05:6638:2a6:: with SMTP id d6mr15486944jaq.132.1600121552368;
        Mon, 14 Sep 2020 15:12:32 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z18sm7919814ill.1.2020.09.14.15.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:12:31 -0700 (PDT)
Received: (nullmailer pid 353325 invoked by uid 1000);
        Mon, 14 Sep 2020 22:12:30 -0000
Date:   Mon, 14 Sep 2020 16:12:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: jz4780: Remove of_match_ptr()
Message-ID: <20200914221230.GA349829@bogus>
References: <20200904131152.17390-1-paul@crapouillou.net>
 <20200904131152.17390-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904131152.17390-3-paul@crapouillou.net>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 04, 2020 at 03:11:52PM +0200, Paul Cercueil wrote:
> CONFIG_OF is selected by CONFIG_MACH_INGENIC, therefore we don't need to
> handle the case where Device Tree is not supported.

What about COMPILE_TEST? If not supported, why not?

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/i2c/busses/i2c-jz4780.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
> index ed2ec86f6f1a..cb4a25ebb890 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -857,7 +857,7 @@ static struct platform_driver jz4780_i2c_driver = {
>  	.remove		= jz4780_i2c_remove,
>  	.driver		= {
>  		.name	= "jz4780-i2c",
> -		.of_match_table = of_match_ptr(jz4780_i2c_of_matches),
> +		.of_match_table = jz4780_i2c_of_matches,
>  	},
>  };
>  
> -- 
> 2.28.0
> 
