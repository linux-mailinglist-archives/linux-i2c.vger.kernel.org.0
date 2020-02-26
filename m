Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79F891704C0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 17:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBZQqx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 11:46:53 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44405 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgBZQqx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 11:46:53 -0500
Received: by mail-ot1-f66.google.com with SMTP id h9so3528005otj.11;
        Wed, 26 Feb 2020 08:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bPkNgrD0XTEQh+3xIosJggjfUocBUIxTPyEHiivVmyY=;
        b=auh8ITFvOYAfhMX0LsCZDzppMl4SZu0U7dJ2/bqLjFoyTCRWabhQCL7Lg7k7lNDq4j
         9SDU4h6L4ZSqk5HqRbLF5e68LHeiIGdMgIMzujiMoaDGv7O3itKxgzXri3ceEtUJrfDJ
         gz2wOst91xmiGIJvjm2NG4CEr7h1N+Ux7rtu3uFiTP7hCxkQLtBndUJ7HeGzAoVzH0ix
         hnikpk2pfSJYQEMGDO1sYoDUq3jyzDk2FgRTCUlUQ+2QYjQ0qYsM4pHMXBnoBQSZ1AbC
         bLg645sK0mIWRrmHMkQsnnAhkhVlpMX7UPRf0wWuYsB2H8hPY1Z/M/Acv8F/9/YUSdeN
         YZ7Q==
X-Gm-Message-State: APjAAAXq49rCxVQ9/e5qeMDNwZiTeehHitou+sTA8rLBGUgij/pFxBQ5
        gBdXixekXLGaAlWYBUwJtPsEyvNSrw==
X-Google-Smtp-Source: APXvYqyOCcGsXxIhYjcUqRhhtA1NArKYIhwPJu9E5shGzCoArkou36oa+gAYqrwlQK0Yxez0Y7uH/w==
X-Received: by 2002:a05:6830:134c:: with SMTP id r12mr3794075otq.126.1582735612311;
        Wed, 26 Feb 2020 08:46:52 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g5sm948027otp.10.2020.02.26.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:46:51 -0800 (PST)
Received: (nullmailer pid 17801 invoked by uid 1000);
        Wed, 26 Feb 2020 16:46:51 -0000
Date:   Wed, 26 Feb 2020 10:46:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-i2c@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Convert UniPhier FI2C controller
 to  json-schema
Message-ID: <20200226164651.GA17752@bogus>
References: <20200221025535.30311-1-yamada.masahiro@socionext.com>
 <20200221025535.30311-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221025535.30311-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Feb 2020 11:55:34 +0900, Masahiro Yamada wrote:
> Convert the UniPhier FIFO-builtin I2C (a.k.a. FIFO) controller binding
> to DT schema format.
> 
> There are two types of I2C controllers used on the UniPhier platform.
> This is the new one with FIFO support, which is used on the Pro4 SoC
> or newer.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../bindings/i2c/i2c-uniphier-f.txt           | 25 ----------
>  .../bindings/i2c/socionext,uniphier-fi2c.yaml | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-uniphier-f.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml
> 

Applied, thanks.

Rob
