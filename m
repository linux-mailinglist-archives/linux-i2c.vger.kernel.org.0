Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FFB22B0E7
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 16:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgGWOBr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 10:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgGWOBr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 10:01:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17D7C0619DC;
        Thu, 23 Jul 2020 07:01:46 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id d17so6465171ljl.3;
        Thu, 23 Jul 2020 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B+FgVV5YR7/MuNTExC4S1CyxjBezDRUZkCZGg28GSIk=;
        b=izVPHRvy9U4OahD09Cp+/GQN7sQMHeSfMtfa16KLHv0SoR9VfBG3NZBcDJVC4cnVww
         P5Np7KLWIhGaPH8+oVsPqL5ArYuIqPfaHVX1M4wfuHVJXHHx1e1b12WR0o/UGI81nFrW
         aH4DPBYFThDMLpq7wGU8p7+qE0JFyebMAY5vLQeXB1Mxzd5Y6r2SIbijALqfqWRBEfK9
         F5v3eFNyVaYrKfU29EimULUv7Ik7KgwywOwmuIgL6sKIQlcJYBlXNa7yOpu/ftnY/z7Y
         m0F6D+2uDRTpAvMNWHA0pxyNODs1wtmxbwg9BXEAr0sW6kgiPYCYf62XRe7BK21dj2gg
         s/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B+FgVV5YR7/MuNTExC4S1CyxjBezDRUZkCZGg28GSIk=;
        b=s8f1TgxEDCymOqH1x9F6p11qwMO6BtP77FhgrqnLizQBFWMJUuXH7W0sCakCwJVu9W
         oKaNQzoCpitPoPyMR5vfMGYv6m4q/+t9FdYDk6oGjrREUF3RFKvSp49Vvvhv6Rj4qFpd
         dcw8O7S7jscSITmz01Y23lic1Bg+8NgZjaikPumOWNWlKpdSghjqRG23pnBrh8vDuGdI
         Ju5YBi6Fn3HCaL6CMM6kkZpaNhM6muYdoEC9WljCZYUTnvO+NLLj4nbkn61BV9CNnSEX
         rAhygmk5XRHZLKVucLcQ27hy+BoSvmBb106SF9+pc8x/qDK+pLBMrVon8qQ+QLl7UGl2
         Xsxw==
X-Gm-Message-State: AOAM530fNWN9CHug1rIQvB+CPUZF329j7nZw2Ax/dHG6CGWF/05hrpBl
        MQo/yq3uyJY584Zu50FwN9w=
X-Google-Smtp-Source: ABdhPJx4NrXo8VV/65GyJsOu4Et0o2kWiyKcdzQDLsb8EKnpILRDPC5R3G9OV9Cpsl0fljq9DS6rrw==
X-Received: by 2002:a2e:8855:: with SMTP id z21mr2192826ljj.325.1595512905379;
        Thu, 23 Jul 2020 07:01:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id z186sm2970938lfa.6.2020.07.23.07.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 07:01:44 -0700 (PDT)
Subject: Re: [PATCH 5/7] i2c: tegra: enable second level clock gating
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldewangan@nvidia.com,
        smohammed@nvidia.com, rgumasta@nvidia.com
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-5-git-send-email-kyarlagadda@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1f51823f-09ea-80d5-69dd-7772474a3fb1@gmail.com>
Date:   Thu, 23 Jul 2020 17:01:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595506733-10307-5-git-send-email-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> Enable Second Level Clock Gating feature for supported chips.
> With SLCG enabled, software need not control clocks anymore
> and leave clocks enabled always on.

What problem is solved by this patch? If there is no real problem, then
I'm not sure that this is a worthwhile patch. Please explain.

...
> @@ -1932,7 +1946,8 @@ static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int err = 0;
>  
> -	i2c_mark_adapter_suspended(&i2c_dev->adapter);

Why i2c_mark_adapter_suspended() is removed?

> +	if (i2c_dev->is_clkon_always)
> +		clk_disable(i2c_dev->div_clk);

Why clk needs to be disabled on suspend?

>  	if (!pm_runtime_status_suspended(dev))
>  		err = tegra_i2c_runtime_suspend(dev);
> @@ -1968,6 +1983,15 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  			return err;
>  	}
>  
> +	if (i2c_dev->is_clkon_always) {
> +		err = clk_enable(i2c_dev->div_clk);
> +		if (err < 0) {
> +			dev_err(i2c_dev->dev, "clock enable failed %d\n",
> +				err);
> +			return err;
> +		}
> +	}

Would be nice if it all could be wrapped into
tegra_i2c_div_clk_enable/disable() helpers.

>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>  
>  	return 0;
> 

