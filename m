Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2F4333803
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 09:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhCJI63 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 03:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhCJI6N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 03:58:13 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F02AC061760
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 00:58:13 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id n22so6551875wmc.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 00:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=14jUD9KR757Xt0m9lZ7BZTdoTxbSvdhfDsuNoCK1Gws=;
        b=S5vlGFlGizRIezNjHHZSjocQgxeL5UoFO7634X+FQ0uNQiW8tzKmR+4Y2CbrApd9Sa
         Q8OZVineJAjvzQakJ9JDj8QY/RdEMPErhkB08dUaEx+d4l1EJzhao/WrrAscbotxFyPw
         IuuFgJw3+fE6hNj5hVsb4JzRGVjqX+tVxW+Kbu0sFFDUwejZ04U0wArZgDMpfkXUxnwl
         LASYLKgCa99RC+JkNd9EVcWZ+MUGFoV96svCpqkjZtyOI6fYhKTdLKH+WI/7E5LH1c9D
         P3yPuDF9nT70gUbH7fFDwRAOLtRsnmeMlPMOaN/b6yz8uYzHEDLbpTUhzSU8mrOQHlyX
         aMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=14jUD9KR757Xt0m9lZ7BZTdoTxbSvdhfDsuNoCK1Gws=;
        b=unTZTtweVnE6lFnu0K//Z35duY6MY6+oshcxUh+ti+vwP3iUYc0MxyXjsUQNmHVchL
         zM2MTf9jQU6l8sBYRulmgr6AmsC5XSi8gUNgOwqlwcV6JkKrsKvG/pBl1iPi6UGLgOLu
         3HPuzBoFKMg2QZRsedMmooRTfwxJFSS58hQI1V7s34QV6WwIMQCpQZ5NTmpYvDGNdyxQ
         sLPQnyeYNqPONp5twi5xEBFwwtW2golEYfOX4RSmpH/obpNqaF4mv+jZ617HHzWHzrB9
         bDm7Mk1//9DcIZMivKZLmfXmIEQASgJoOA3zc6MqXkFj2GFKndlu7dcigPq5edzqNJwU
         E14w==
X-Gm-Message-State: AOAM530urg4MiUCq4B/8C9eCIQ6oInnFfitiadIk0zvum6o+U1vdq5Uw
        lD3SffEsB9fObsjcbGJOZEcNRA==
X-Google-Smtp-Source: ABdhPJyFp09UmbR/M/toEClX4xNfONENLYumn7IGLRVc+t9NZc46CFDo+qm5vYkbvQfTX7myWzJbFg==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr2215391wmh.32.1615366691731;
        Wed, 10 Mar 2021 00:58:11 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id v2sm13747943wmj.1.2021.03.10.00.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:58:11 -0800 (PST)
Date:   Wed, 10 Mar 2021 08:58:09 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Adam Ward <Adam.Ward.opensource@diasemi.com>
Cc:     Mark Jonas <toertel@gmail.com>,
        Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <tingquan.ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210310085809.GE4931@dell>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
 <20210308144211.GK4931@dell>
 <CAEE5dN3DcULAtmQ=4WjT3nD20AVV2sX=Yx1WSS1UuJsBWTgc3g@mail.gmail.com>
 <20210309094211.GN4931@dell>
 <VI1PR1001MB09741B1D3E04155E58D65DF9EC929@VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR1001MB09741B1D3E04155E58D65DF9EC929@VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 09 Mar 2021, Adam Ward wrote:

> Hi Lee,
> 
> Tidy, but I've noticed the logic got inverted along the way:
> 
> > On Tue 09 Mar 2021, Lee Jones wrote:
> > On Tue, 09 Mar 2021, Mark Jonas wrote:
> > This is my suggestion:
> > 
> > 	/* If SMBus Mode is not available, enter Two-Wire Mode */
> > 	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> 
> Determine bus *is* I2C, so assume SMBus timings not supported...
>  	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> 
> > 		ret = regmap_update_bits(da9063->regmap, DA9063_REG_CONFIG_J,
> > 					 DA9063_TWOWIRE_TO,  DA9063_TWOWIRE_TO);
> 
> ...and *clear* the (currently set by default) timeout bit:
>  					 DA9063_TWOWIRE_TO,  0);

Thanks for checking this.  You're right.

The example was provided as a back-of-a-fag-packet design, not a
fully tested (or even compiled) solution.  It took me 2 mins to type
out.

> > 		if (ret < 0) {
> > 			dev_err(da9063->dev, "Failed to set Two-Wire Bus
> > Mode\n");
> > 			return -EIO;
> > 		}
> > 	}
> 
> I think you're right to exclude a case; vendor motivation to
> override the TO default seems inherently trustworthy.

A default value is a default value. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
