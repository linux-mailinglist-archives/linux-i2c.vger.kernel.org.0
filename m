Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200F92A2635
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Nov 2020 09:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgKBIhS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Nov 2020 03:37:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34877 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgKBIhS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Nov 2020 03:37:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id n15so13549690wrq.2;
        Mon, 02 Nov 2020 00:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TuUrkOcH//Xx3KZ0IESTZA0H3E8OCi9T5X7+sNOtdHs=;
        b=g2cQj8C2ZdrhW3vyFREFG6VYviX6piTBSyBvcoBRSZibetL2Zt15xdxmYaMujXmt1p
         lAxeU4tl538ceCcZr2eiqgNAxVUCdhf+szd1wWgx2DK5q+s2i/Ygryxaqwt4l53fB6GT
         4vNUDXE9Mjf56+uKEBxf0exM3bSiKXKseszUKouP6ltAM+6rimwu2myoW/jpH6+BAyg0
         6tCX4ApzpVqWEihiIzeyPgboKM3PhYzLD+bXYJADJ9N5Ty5dXNd4SV8ksS4MoUrg3WpE
         Eg1qUAuLugFN+0FGH3iNhym63aD4cIpfHNLcpj8gL+jR4sRFqhVIszX+176oslP7dtuw
         pjiQ==
X-Gm-Message-State: AOAM530iXkS9y3UK21jXnFstlnZI+nUqpwl8cwVt2UMPf2OrBcDDafYj
        yohjstkc+Mdt3Mas4iQgmzI=
X-Google-Smtp-Source: ABdhPJxb/qF1Ivn97RkEh23PzumLjCjjlCUT5uwRz1N40PsWAhGuhHKrQopXET8xwFXVS8vZHZAL5g==
X-Received: by 2002:adf:f104:: with SMTP id r4mr18919536wro.202.1604306236001;
        Mon, 02 Nov 2020 00:37:16 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id v24sm21819894wrv.80.2020.11.02.00.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 00:37:14 -0800 (PST)
Date:   Mon, 2 Nov 2020 09:37:13 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: exynos5: don't check for irq 0
Message-ID: <20201102083713.GA6986@kozik-lap>
References: <20201027214257.8099-1-martin@kaiser.cx>
 <20201101171807.8182-1-martin@kaiser.cx>
 <20201101171807.8182-3-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201101171807.8182-3-martin@kaiser.cx>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Nov 01, 2020 at 06:18:07PM +0100, Martin Kaiser wrote:
> platform_get_irq never returns 0. Don't check for this. Make it clear that
> the error path always returns a negative error code.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> changes in v2
> - split the patch in three parts
> 
>  drivers/i2c/busses/i2c-exynos5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
