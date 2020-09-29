Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D71127D9D1
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 23:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgI2VQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 17:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgI2VQy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 17:16:54 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14B1C061755;
        Tue, 29 Sep 2020 14:16:53 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so7269925lfr.4;
        Tue, 29 Sep 2020 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nTqRPB3v1tkiwN7Cg1ds4smhECywcgz+mhK9iqkYF2I=;
        b=ZVcgqr1eJH2THDTRaxDQl1RhHaVCg3p3KCfxr/2U52C+17STyk7+SfAHRsDwfd6N1M
         LA/DhkvC1Dl1Dam0E0C6Qbwem0AsqPhk/exsjZirWA6X/6iSv8pwYfBnJfoqtsCCwUtA
         bSfPLpIWtuWKsJQhiDVuhhPPEl8TZvl+JtKz8mbfiYyZKI+fvXDpPu7sjXGSmxbqEOYJ
         gH7c2eqvhHK7laPgxpRW4IdKhftVfiQarhXwcz2RCFQJzLFhuJy3QJcRpd9dxSXtUmrV
         scQFaoeO1+D/xt7pjV7cXn3X0a+mDZCCJnDKDNSp1471mWqNh28y87m4RbAn6oExcDHT
         LhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nTqRPB3v1tkiwN7Cg1ds4smhECywcgz+mhK9iqkYF2I=;
        b=kZvapGl2zZ846LCE1W5yWYdt2xSbu60QAJGzJINLbmiQYJA/mqUoCjYV6W5VCSAmdh
         EbYHA424FCN61+M5mJQYJdqXJ4HvPRiBdcQS5igsJ18knza5VliE7YDkq/XKRKY3Jpiy
         KVYJMzy7Ilqz0OXBlShTD0+j+9reChtlKTz4Wcd3aRmY492m0+go1Yl6DtmffFnV6KRM
         /psJbLABOQQqJH1bPiu2KIAk9TZ8n7ISFRDWW5OSQOKJHiDEylqRCa3Pb+q4/ZS0selF
         8PQc97qSxn/BldWnQ+BQwHyplaIOSw+CxkGX4a9yeQGr0OgJEsdfKgm57lp01my4ybIX
         t+GA==
X-Gm-Message-State: AOAM533JUxkAicEup68DH/r1xxohZ4Kn6OxVuCWiS6JLrqE/d2xkyERv
        Uolabit+2m3bE2k25PJmXOwxl9umq6E=
X-Google-Smtp-Source: ABdhPJwhIFSkn4Fo5pgos3rHIO9bWKVVBCmj//jHJymDs1j7bnlLztn+lZ1jUtcuzWZQ/dnQrSFk4w==
X-Received: by 2002:ac2:4433:: with SMTP id w19mr2079597lfl.548.1601414211794;
        Tue, 29 Sep 2020 14:16:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m203sm3387483lfd.195.2020.09.29.14.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 14:16:51 -0700 (PDT)
Subject: Re: [PATCH v8 23/32] i2c: tegra: Factor out packet header setup from
 tegra_i2c_xfer_msg()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200922225155.10798-1-digetx@gmail.com>
 <20200922225155.10798-24-digetx@gmail.com>
Message-ID: <2efb1256-dae8-34d1-1175-e70059b7cdec@gmail.com>
Date:   Wed, 30 Sep 2020 00:16:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922225155.10798-24-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

...
> +	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
>  
>  	if (!i2c_dev->msg_read) {
>  		if (i2c_dev->is_curr_dma_xfer) {
> -			memcpy(buffer, msg->buf, msg->len);
> +			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);

I spotted that this now shall be i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE.

I also checked that the enforced DMA mode doesn't work using v8 and it
works fine after the fix. Will make v9 shortly.
