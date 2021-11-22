Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509C3458C73
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 11:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbhKVKnP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 05:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239322AbhKVKnK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Nov 2021 05:43:10 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E640C061574;
        Mon, 22 Nov 2021 02:40:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bi37so78522676lfb.5;
        Mon, 22 Nov 2021 02:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=d2zC3GZX8uS+l6jcheKIGphOeFfmp6L0jvVLD+Y/Jgg=;
        b=e9xey83dyEX1R8jouZHFbXYCyGbfzrF7RGhHRazW+A4EbXdOczICrLDI5vFSjMqyaC
         YEDnaR9k/x0Jhz26HC8Qj7d0qdmFie/GKN8Os2iatdxGaaK8VvUxi70lBlwvnkszpZbg
         pKrkthP3GjNll4KT0rnCXDTOd0HdZZbi3uDEORe5TefBJWgTAuJrT1zV/Foi7Rm0eQzj
         iJzIl0dtXtkVb+gHZVbdU286KjzEAy2j+HiNRcllY8ZuiKsK9zdjPm1tWVJwTHovb6Wk
         OTV22QCJlQtbPtMe2xALyYK3nuVFN8Ytjme1HmzppML5wLgzi1D8unL3p5Q0yZKlZ79j
         9BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d2zC3GZX8uS+l6jcheKIGphOeFfmp6L0jvVLD+Y/Jgg=;
        b=aMSw7eEL59YD3kgRL3QhjKud2abt04njjb+5xq31zewRrdyS2sOk/ffuSMkAmp53ak
         Eu2BxLs5ehn1+Ht/nbasdTwJWC9YVeguMJ7IvVBS7hoDQ7MbUbCmRevvkIECMIbEbBZU
         8MthmTahHuWWwQ4XrkBeLF6j8F/Ts2OaL7mipdFoe7ZetGOiTiVZVJi7pI5Fi0ZyU41w
         3/auhrHoCOUDQ5KvnlBWcE9fR+Mu+mHUyZY4nI3xThthlRa3SGomneo3vVBvLWls3vU0
         6QXUqQsFa9ODRgcWfBEJdZKdea8O2jITOJ84jBRbwGRzQymMQ7LobL5ciAz0YRIErk7o
         T+cA==
X-Gm-Message-State: AOAM533/QHa5C1EBHI9+7ag022jo5/ZffWAxoWTMqDcbjyoGxZe3TuJl
        EraVXvZ8CLvpNmsJengcoy4=
X-Google-Smtp-Source: ABdhPJz8MCr6N9OooxMtZp0JXg0RH1rMd+WUjNeUklGObs/fDFhoLmD6Spn0Rgm+TP5aJLvUKKCc/g==
X-Received: by 2002:a05:6512:2033:: with SMTP id s19mr56816313lfs.290.1637577601896;
        Mon, 22 Nov 2021 02:40:01 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id bp36sm1061426lfb.0.2021.11.22.02.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 02:40:01 -0800 (PST)
Subject: Re: [PATCH] i2c: tegra: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, andy.shevchenko@gmail.com
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c92231a-5bc5-be08-bf9d-0b77b85648be@gmail.com>
Date:   Mon, 22 Nov 2021 13:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.11.2021 16:32, Akhil R пишет:
> -	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> -	if (IS_ERR(i2c_dev->rst)) {
> -		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> -			      "failed to get reset control\n");
> -		return PTR_ERR(i2c_dev->rst);
> -	}
> -
>  	tegra_i2c_parse_dt(i2c_dev);
>  
> -	err = tegra_i2c_init_clocks(i2c_dev);
> -	if (err)
> -		return err;
> +	if (!has_acpi_companion(&pdev->dev)) {
> +		i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> +		if (IS_ERR(i2c_dev->rst)) {
> +			dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> +				      "failed to get reset control\n");
> +			return PTR_ERR(i2c_dev->rst);
> +		}
> +
> +		err = tegra_i2c_init_clocks(i2c_dev);
> +		if (err)
> +			return err;
> +	}

What about to factor out the reset initialization into a separate function and write it like this:

static int tegra_i2c_init_reset(i2c_dev)
{
	if (has_acpi_companion(i2c_dev->dev)
		return 0;

	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
	if (IS_ERR(i2c_dev->rst))
		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
			      	     "failed to get reset control\n");

	return 0;
}

And then change tegra_i2c_init_clocks() to:

static int tegra_i2c_init_clocks(i2c_dev)
{
	int err;

	if (has_acpi_companion(i2c_dev->dev))
		return 0;

	...
}

This will make both reset/clocks initialization to look more consistent.
