Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD662A263D
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Nov 2020 09:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgKBIj0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Nov 2020 03:39:26 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44615 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgKBIj0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Nov 2020 03:39:26 -0500
Received: by mail-wr1-f65.google.com with SMTP id b3so7605419wrx.11;
        Mon, 02 Nov 2020 00:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o3JaExbbhm3aQ9g7JMD1kTTlVkCH24wuUtWIjuo+/Gs=;
        b=RfdErApCWvBxftKyEDGMPqMRyAecl+73Wj+lHeGldIkFvDtn3qFckt84XyVeOcCepB
         F8PfH7mRWSdu32q5MfhwU1eluIy9jMKn8e5mV/QF5QRuBDDJhCQQOYVmZCC7bCR4RWon
         atnO9es20pLDqn+4w6cpgmXJ6MTXzYLon9S6OyQf/dCsvxT269wyfuEcaJVpuWqBgHe4
         SP1nzDAd6g4wFSFHmkirmRGn1BxWPT+8/NNzG8M0GBgY/TKjo4bhyN7xO9ARpFp9zPPZ
         EYZeVfwwqTKqxVB8a85NmsK+IkbIg5xe38eJyYIBTZ4afFMdIx3fGPkCQ4U4AKZVD/5i
         cPSQ==
X-Gm-Message-State: AOAM530OeMax9+fr5hAhkIco++bCvufEZNOk6GM//2hHP0G2kxEnvUqO
        nd+FFbhx8Bx1qvy3O8Koj3o=
X-Google-Smtp-Source: ABdhPJxHQLkKVKy+jnNBMu1LSGvHqBENsrhhofX7k5Ss909xx78f7GB6DBJoP1rq4uuztVoITehqag==
X-Received: by 2002:a05:6000:107:: with SMTP id o7mr18539299wrx.354.1604306364645;
        Mon, 02 Nov 2020 00:39:24 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s188sm4255195wmf.45.2020.11.02.00.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 00:39:23 -0800 (PST)
Date:   Mon, 2 Nov 2020 09:39:22 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: exynos5: fix platform_get_irq error handling
Message-ID: <20201102083922.GC6986@kozik-lap>
References: <20201027214257.8099-1-martin@kaiser.cx>
 <20201101171807.8182-1-martin@kaiser.cx>
 <20201101171807.8182-2-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201101171807.8182-2-martin@kaiser.cx>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Nov 01, 2020 at 06:18:06PM +0100, Martin Kaiser wrote:
> If platform_get_irq returns an error, relay this error to the caller of
> the probe function. Don't change all errors to -EINVAL. This breaks the
> case where platform_get_irq returns -EPROBE_DEFER.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> changes in v2
> - split the patch in three parts
> 
>  drivers/i2c/busses/i2c-exynos5.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
