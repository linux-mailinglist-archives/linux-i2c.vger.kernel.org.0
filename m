Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DEF29DCD4
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 01:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733143AbgJ1W3H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:29:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40473 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387508AbgJ1W3H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:29:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id m13so723569wrj.7;
        Wed, 28 Oct 2020 15:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TuERzv+I0rpz7wGuytgD+7FYdwTEBi7hw79iaAsE+F4=;
        b=btqzOokfPjt7hK371Su1Cq8JRNnPaZQdPkQhzKVPNRW5K/NnmOzcHTFtvQYXaq0tA2
         qCVelsYrzMIe629X6wRHEAo4wyAQxC1kU47Ix3WPAMXWXCPQzJ5LL64WXKriQKbiw00N
         rcnc17+BG7hZUaw4wjGL2SFNL8vEfjnUbRLE4VdMzYECbrDTdzeQTVUWOvM88JmuaZf8
         eoxk0DuETyur54p2HqpPVwGEPbtFW9C1tzSVverhocN8CoPVfgnmhryPg99e37maPyG0
         txn4jghMi9Tv2e/PLx9204TFJYRZuZDQJ6Oz2fSWlDXFE+5TuZxMG7BBNtO2K6XRzUpe
         cZRg==
X-Gm-Message-State: AOAM531z4OnbwuPkHRht3V9dRRscv2ckceIU0JXaEuWO6n8DgYEJGLEn
        gMcnmqhBTd4cSEDiKCVEurLHl/8lh50mHw==
X-Google-Smtp-Source: ABdhPJzqFo3mj4of5jE+IZvMiFxXULXKc0DG0DwWkOdEK2aXLgDE+YvMXSsMl4K4YrUuxRL82hp0jg==
X-Received: by 2002:a17:906:c0d8:: with SMTP id bn24mr6127669ejb.480.1603869716907;
        Wed, 28 Oct 2020 00:21:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id q3sm2287534edv.17.2020.10.28.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 00:21:55 -0700 (PDT)
Date:   Wed, 28 Oct 2020 08:21:54 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: exynos5: fix platform_get_irq error handling
Message-ID: <20201028072154.GA3494@kozik-lap>
References: <20201027214257.8099-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027214257.8099-1-martin@kaiser.cx>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 27, 2020 at 10:42:57PM +0100, Martin Kaiser wrote:
> platform_get_irq already prints an error message if the requested irq
> was not found. Don't print another message in the driver.
> 
> If platform_get_irq returns an error, relay this error to the caller of the
> probe function. Don't change all errors to -EINVAL. This breaks the case
> where platform_get_irq returns -EPROBE_DEFER.
> 
> platform_get_irq never returns 0. Don't check for this. Make it clear that
> the error path always returns a negative error code.

These should be three separate commits.

Best regards,
Krzysztof
