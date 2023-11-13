Return-Path: <linux-i2c+bounces-101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637B7E9962
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 10:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBDD5B20842
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 09:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279751A590;
	Mon, 13 Nov 2023 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms+pPFwF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804D61A587
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 09:48:27 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E6010EB;
	Mon, 13 Nov 2023 01:48:25 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50970c2115eso5805094e87.1;
        Mon, 13 Nov 2023 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699868903; x=1700473703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FL5A1EB7Y50WGBsGjFprxrhkGSiEyyL4ntXF0JwGxHM=;
        b=Ms+pPFwF+6J+cDn44xo2gkzE23859VqN76rGPl75C6XuoWqvCqGJeoDWAcYjcVk+a8
         tt8KtFeHhNO6NKjrmfxsNQqR2V3NtqvTLCrhRREiYqtJ3Kk65PO+wAd8KyxzU1Uegk6l
         OIL77YxeKasFYLAPyHbkqtAqprn8TEQj0/iU0KKov/LIL9pi9vsTc2qbCVXFT9kVbQSS
         bWWt2WFE82y8uTW+aGTi43o2aQS9PKl+n7UlRPRiBDKhmXZlP10YQo6vMp7ciq3dYIIQ
         BodT2HqBRXFUJOVSgnor9R6icfNqv+Vu9wFDSVZNu5MXgUi3s9rPPZwxbcp3caMB6Uwa
         ffQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699868903; x=1700473703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL5A1EB7Y50WGBsGjFprxrhkGSiEyyL4ntXF0JwGxHM=;
        b=SdRjiFMWDSFXCrQPq7+HhzaEMZY8byCK2OZtWRO3GOjmLKyMTSLeUL+Y8UB0q5y5lk
         73c2OEpG72tKJEk6KcJUNzTFFERzEXvb41N+rhxJsT7s8Ek6wRC/gKxaKpNAyx8VT0d/
         TLNwsCX/OyaNy3mEXFuGRMuz/HOQFwt+qlBh8lKyTv280bzVH1vd1CAZIpJgEQLkg2X3
         dX6S3hAd3PbQNYKzQl2ylBRgaBdPjC/EFT0s/u8ki+DPLvU1JdGu/qBN6B3OXixdUVNr
         ixtW23W4hnPzh4HYOkcQHDY3j8fA2jBCjsiTiTL/uU4wlmi89ORM4ocUNC2s9BKeiF2P
         OYdw==
X-Gm-Message-State: AOJu0Yx8F477Ry6j0qPc4HjFZD4YgSxbP3jpvwrM7qXP0fX+Opr9oQnv
	clpwmQjsnitRgyc2DsP+dezPclf5C3E=
X-Google-Smtp-Source: AGHT+IFcdSuyXNSP+fAJWKpvkur2IEHkeZjZijFgF5WAjaPrdGN9BZawGDYnwPKU6xDowk2QkyaKkw==
X-Received: by 2002:a05:6512:1313:b0:507:a5e7:724 with SMTP id x19-20020a056512131300b00507a5e70724mr2319543lfu.38.1699868903314;
        Mon, 13 Nov 2023 01:48:23 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id b11-20020a0565120b8b00b0050826c3780dsm917345lfv.134.2023.11.13.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 01:48:22 -0800 (PST)
Date: Mon, 13 Nov 2023 12:48:20 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jan Bottorff <janb@os.amperecomputing.com>
Cc: Wolfram Sang <wsa@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <yuperxjytpcwz25fofjut2edzjc4i6jgymcraxp4q6mfe27taf@b33ym5iuubji>
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109031927.1990570-1-janb@os.amperecomputing.com>

On Thu, Nov 09, 2023 at 03:19:27AM +0000, Jan Bottorff wrote:
> When running on a many core ARM64 server, errors were
> happening in the ISR that looked like corrupted memory. These
> corruptions would fix themselves if small delays were inserted
> in the ISR. Errors reported by the driver included "i2c_designware
> APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
> "i2c_designware APMC0D0F:00:controller timed out" during
> in-band IPMI SSIF stress tests.
> 
> The problem was determined to be memory writes in the driver were not
> becoming visible to all cores when execution rapidly shifted between
> cores, like when a register write immediately triggers an ISR.
> Processors with weak memory ordering, like ARM64, make no
> guarantees about the order normal memory writes become globally
> visible, unless barrier instructions are used to control ordering.
> 
> To solve this, regmap accessor functions configured by this driver
> were changed to use non-relaxed forms of the low-level register
> access functions, which include a barrier on platforms that require
> it. This assures memory writes before a controller register access are
> visible to all cores. The community concluded defaulting to correct
> operation outweighed defaulting to the small performance gains from
> using relaxed access functions. Being a low speed device added weight to
> this choice of default register access behavior.
> 
> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>

The patch has already been merged in, but in anyway:
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

For the record. Next time don't forget to add all the reviewers to the
Cc-list on the patch(set) respin, otherwise the new version might get
to be missed amongst the other messages in their inbox. That in its
turn won't let them test it out and finish the review on time.

-Serge(y)

> ---
> ChangeLog
> v3->v4: add missing changelog
> v2->v3: regmap accessors use non-relaxed form instead of wmb barrier
> v1->v2: Commit message improvements
> v1: insert wmb barrier before enabling interrupts
> 
>  drivers/i2c/busses/i2c-designware-common.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index affcfb243f0f..35f762872b8a 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -63,7 +63,7 @@ static int dw_reg_read(void *context, unsigned int reg, unsigned int *val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	*val = readl_relaxed(dev->base + reg);
> +	*val = readl(dev->base + reg);
>  
>  	return 0;
>  }
> @@ -72,7 +72,7 @@ static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	writel_relaxed(val, dev->base + reg);
> +	writel(val, dev->base + reg);
>  
>  	return 0;
>  }
> @@ -81,7 +81,7 @@ static int dw_reg_read_swab(void *context, unsigned int reg, unsigned int *val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	*val = swab32(readl_relaxed(dev->base + reg));
> +	*val = swab32(readl(dev->base + reg));
>  
>  	return 0;
>  }
> @@ -90,7 +90,7 @@ static int dw_reg_write_swab(void *context, unsigned int reg, unsigned int val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	writel_relaxed(swab32(val), dev->base + reg);
> +	writel(swab32(val), dev->base + reg);
>  
>  	return 0;
>  }
> @@ -99,8 +99,8 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	*val = readw_relaxed(dev->base + reg) |
> -		(readw_relaxed(dev->base + reg + 2) << 16);
> +	*val = readw(dev->base + reg) |
> +		(readw(dev->base + reg + 2) << 16);
>  
>  	return 0;
>  }
> @@ -109,8 +109,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	writew_relaxed(val, dev->base + reg);
> -	writew_relaxed(val >> 16, dev->base + reg + 2);
> +	writew(val, dev->base + reg);
> +	writew(val >> 16, dev->base + reg + 2);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

