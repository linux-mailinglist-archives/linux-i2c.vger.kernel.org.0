Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1F989834
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfHLHsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:48:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33172 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfHLHsI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:48:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id p77so10276239wme.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=oJisgWnDEB7FRQeVeun93jQaR5ES1KStdB1vVlMSndA=;
        b=EJdNXt9fogeecU1R4hnXUKwFMJyvnzUbRbu/ZBtaKLYANBuo3ev/dL5cXIwiHMeWiC
         7f7TupDpedezy29E+TolN5ydvQtlCW5MMqAou+wZ3X8IBvxMxu4jiGFWQzs5osgo5U1z
         6ywt22fqQidjCbuxP2IMDljpuioTTAt+MpIw6wPocxW5lxZpJtE8JJcvu+UXW7UJyHdn
         4tHNEX2d3I5nNKZXS2C9hnlNwuUQLPFfqsnCrNauoLJrTEQxKqMCmmVK8Yk1mwbZyP0W
         EhpQBBZs2clCyA2FpH4as0BA6lbPYBhaoF1HjTBgA1RNlmP6SSgMvNsVaRacdr53heS9
         CpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=oJisgWnDEB7FRQeVeun93jQaR5ES1KStdB1vVlMSndA=;
        b=kLs7I3wRKtEw5hsfu702PR6FwMW3VC+ZL1eZYO3Fw6hkk5tjSgiG2BcVCGmuUpYH+v
         yrGNzXuruPt9kMrF0CtnVIlg/JJc0Y83zkElTk9A/rSV84OUg8K7cXDS+4kpSkbG22uP
         YpFvOd8UmacEk6BkJ5/SRTPaOoGVZRZje/+MWm4wGyewcjhvwh43sI3ryRTLy7sVzO8F
         N8G8Z8Wh2lfFawJvTU5Yiz/rfcZk0jU7ryyaVbyz0iJPFWzUmH7ErQMREzZOJi1UpJr7
         3GSFqobUb4t90ztz8bXnOoQdDNoz9arCUe85Yw9EZKppnbAw6HKzrV8J1nuejf2EXqAC
         gObA==
X-Gm-Message-State: APjAAAVTS48xqkwT5PxkoGPR6gI6WXASE0I0EzAlBcOgg1mNCDGNOJKo
        4kjuvMBnGZxsMREdTyhXEyVUyg==
X-Google-Smtp-Source: APXvYqx6JauNMG4v0kuXBMom1u4m8KtPH1IXdtoZ5aztjWC97jrkBOomdNBRiM7+05XnoJjo2oXoUA==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr25053945wmj.36.1565596086391;
        Mon, 12 Aug 2019 00:48:06 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id e13sm9330882wmh.44.2019.08.12.00.48.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:48:05 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:48:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/14] mfd: max8998: convert to i2c_new_dummy_device
Message-ID: <20190812074804.GD4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-13-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-13-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/max8998.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
