Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4DE71DCE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 19:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388408AbfGWRfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 13:35:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36145 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfGWRfS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 13:35:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so35126243wme.1;
        Tue, 23 Jul 2019 10:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KMzb3lQV6/HQhyFJeMHm9RDfYopFx3+fyKqozQwxa7c=;
        b=FXkf+ad5WEsPsVuNEd/akwpuJKav1wHTStpjJYvBSXd8YPr+ZoULeKQARb8R5APOL+
         xAAdyN4nCWgcubQe7ZGgRVJODuiyX4wLtiHAixtjaUKZjVz8SRbuvx8z3ZlFxndAYSGc
         ZiGkHVHZC1w+JXLSPjCbAWn9TNzSJwqKmF+FMHb+7r+cLD8ENT2hv7bCejGwyv7HH4Me
         RxUN5cRkqqALd2O//S2T8AHs6PG2R/ThWFuW6YS6gA2Y2EVRLhDtpnDls94gx3A47l9O
         nDuewgQ5G4wwmeTYq9pIwgpilN1JclU8dXHobvx/21vTb9TaOdgmLMKEkZ6HbL0kv4ec
         Sp8A==
X-Gm-Message-State: APjAAAW/VuE5awNVPco24LeBip5jcZn+hhFwCRFulgtSrZcA6tAm0pul
        2ZkyIUBjzZF9/SleEhB5fLyqY1LC
X-Google-Smtp-Source: APXvYqwNRzEAQq/pFaRBFGVCDCI0KRPQ7Kg+0eycJPNDnuZpclNN2Fxt/Sfrz/Iq2t20plmQXSrtTQ==
X-Received: by 2002:a05:600c:212:: with SMTP id 18mr20452940wmi.88.1563903315440;
        Tue, 23 Jul 2019 10:35:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
        by smtp.googlemail.com with ESMTPSA id c11sm75919141wrq.45.2019.07.23.10.35.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2019 10:35:14 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:35:12 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] mfd: max14577: convert to i2c_new_dummy_device
Message-ID: <20190723173512.GA6317@kozik-lap>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190722172623.4166-7-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 07:26:13PM +0200, Wolfram Sang wrote:
> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.

I do not have the HW for testing anymore but looks good:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

