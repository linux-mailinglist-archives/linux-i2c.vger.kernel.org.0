Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031C623FD61
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Aug 2020 10:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgHIIjD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Aug 2020 04:39:03 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42599 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgHIIjD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Aug 2020 04:39:03 -0400
Received: by mail-ed1-f67.google.com with SMTP id df16so4248551edb.9;
        Sun, 09 Aug 2020 01:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z/saybbfxMjaXzIe6opzcQCOPXkRMkvzjnIaZUfO3tk=;
        b=k/Wzgtpkk+CIK/NdZeBuWTxhUPXwxH9IlPkaHa1qutyUdVMEH1d3+IJFzV3IzlWYyo
         4QIOHv6RrT56/WnRs0cCQzNWLDl+4WaWkOZc/DBV1+nFtQe+KDCOnJidXwAacHgEqgaQ
         wGVvqBkkeXZ5JsZavD4VhBUyUbR6pWQeLU1FEteLc3BowTXN9drnK77CEWmLJhdqsAjg
         AWCwPDFOZJXD69UJx35QIkphIF+52/eoMVOmWNJlIKsdvhjJqi2G+HzZXeHxyZVi0TDU
         1E86xpO6LzDBAaAihz53b5ugeYhSjxRKZ8xT+7F1NNtyCxIdTLCwm84Em3SP3R1Nxh4x
         3NRw==
X-Gm-Message-State: AOAM530a7wJTiWH+gsrC1DM9H57H6RxB3+JwPvWuMjMtQ7D0K5jlEMVS
        IC7yLE9ckFRmsEy4qQPYrxd/JcyHzxQLhA==
X-Google-Smtp-Source: ABdhPJwmZeN96PN/ZIAPlxWpqko234mQ9lsp9dbVEg22MBGEl66tMuP7+R6WuTo7ZFtLkn1884Z6WQ==
X-Received: by 2002:a50:a6d2:: with SMTP id f18mr15832396edc.374.1596962341313;
        Sun, 09 Aug 2020 01:39:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id x16sm9477456edr.25.2020.08.09.01.39.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Aug 2020 01:39:00 -0700 (PDT)
Date:   Sun, 9 Aug 2020 10:38:58 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/arm: use simple i2c probe function
Message-ID: <20200809083858.GA7517@kozik-lap>
References: <20200807153100.384845-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807153100.384845-1-steve@sk2.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 07, 2020 at 05:31:00PM +0200, Stephen Kitt wrote:
> The i2c probe functions here don't use the id information provided in
> their second argument, so the single-parameter i2c probe function
> ("probe_new") can be used instead.
> 
> This avoids scanning the identifier tables during probes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  arch/arm/mach-davinci/board-dm644x-evm.c     |  5 ++---
>  arch/arm/mach-davinci/board-dm646x-evm.c     | 10 ++++------
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |  5 ++---
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 

Hi,

You need to split it per sub architecture maintainers.  The subject
prefix is then for example: "ARM: s3c64xx: ".

Best regards,
Krzysztof
