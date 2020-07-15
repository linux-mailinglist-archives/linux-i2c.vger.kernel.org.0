Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E2B22165B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 22:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGOUiq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 16:38:46 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40793 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOUip (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 16:38:45 -0400
Received: by mail-il1-f193.google.com with SMTP id e18so3176325ilr.7;
        Wed, 15 Jul 2020 13:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jg/X/vpGxWxvwTtPuVd1zmcZHSjHp/pT1OFJo4RhoVo=;
        b=fjNWmQLZpcfK8jx0h6p1pjaRvd1IG3zjI/gt9si7hZw8AxX2QJrnh1dIo7w4KkOAg4
         VrsDMtrDvNz3V78J3al/QqST4rQs28GWbDtBvSQfpGHm2CF6qdujTNmaIdP8x0fGHn7n
         nVW69YzeqjfkdS/Agtzk0N2FZSZDsehedtBUBWxxGjLPH42r1yKvSXHkNwcKHK1YK9pm
         ZQ/bShzUf1zttG6dVC5TCkrsJgM55MOmXpjszNR9w6hiJ/68h0wRbhsY5fl44zfFOK2J
         ljAfEvH71thBmbTNynzo9P3Q7Ta5SFMBaal7iQtE/0sn6laYTSbpKItLxMc+MFLgy6Lc
         SQDw==
X-Gm-Message-State: AOAM5335pUrZeP3lbdRkN+UzTLZwCHQ3IU0UMaFHJVd0d9xGIq63iOmp
        cPUX/KpB2JI4Uy3lTXK1Bwgv9f1pIQ==
X-Google-Smtp-Source: ABdhPJz0SK92/suN4UomLrs3EqKOwsXIY3wPt5SN3z7HrnBvRvVJIXZ5w5poRYlUtD5KO6O1SszALQ==
X-Received: by 2002:a92:ca8d:: with SMTP id t13mr1241550ilo.274.1594845524792;
        Wed, 15 Jul 2020 13:38:44 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i9sm1642617ile.48.2020.07.15.13.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:38:44 -0700 (PDT)
Received: (nullmailer pid 778616 invoked by uid 1000);
        Wed, 15 Jul 2020 20:38:43 -0000
Date:   Wed, 15 Jul 2020 14:38:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] i2c: add binding to mark a bus as SMBus
Message-ID: <20200715203843.GA776042@bogus>
References: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 01, 2020 at 11:48:30PM +0200, Wolfram Sang wrote:
> SMBus is largely compatible with I2C but there are some specifics. In
> case we need them on a bus, we can now use this new binding.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 438ae123107e..d1f8cf3bd236 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -77,6 +77,11 @@ wants to support one of the below features, it should adapt these bindings.
>  	this information to detect a stalled bus more reliably, for example.
>  	Can not be combined with 'multi-master'.
>  
> +- smbus

This is a boolean?

> +	states that additional SMBus restrictions and features apply to this bus.
> +	Examples of features are SMBusHostNotify and SMBusAlert. Examples of

Do features need to be enumerated separately?

> +	restrictions are more reserved addresses and timeout definitions.
> +
>  Required properties (per child device)
>  --------------------------------------
>  
> -- 
> 2.27.0
> 
