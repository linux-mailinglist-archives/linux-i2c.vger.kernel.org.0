Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F66B30E4BC
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 22:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbhBCVKe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 16:10:34 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:44300 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhBCVKW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 16:10:22 -0500
Received: by mail-oi1-f169.google.com with SMTP id n7so1354343oic.11;
        Wed, 03 Feb 2021 13:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nNasvnVnGdaLNC1X/0gD5+vaBF/Bt3/vdbxlWRVVcDU=;
        b=O5upervxwVl4Ceyf+pXuc0ZYb/O+1lVY+Gk+TECHazXZJNY9z0TYszPje3gWC9ZaBH
         Rr4J9hoLT83QEQekIEjjZCgtxHgvK/sqFhZb/k/h1J59QnE2e5jiydEdTZQIL5o9rNv9
         fsZvug8Ze4PEs76Ege1YqK4TGFM1emEdXktxGC02BCwP4LaqkRJ/BIbA20z58SpsceHu
         igNQ8Uo/WmfdwdWS3j+AF7Y+6xRkeApPP7uqdnozham34M5r/wI1+A/mp3qw28TWweF+
         hW/j9GQ5iGvZTZU/u3x+KQ0DnoSMHnI73nUJsi7A+UYcXucpm+TbIldtog0QSKLGGSHc
         6UyA==
X-Gm-Message-State: AOAM533wZGF1NyO7NkuD/N98WdaitSaDSOBzAZPNFw441PVtt7351PK+
        iPSVA1l5Pps1452jwiJcyX37i2pg4A==
X-Google-Smtp-Source: ABdhPJziQ1MGayJwHSZF4XHn8QPqAgRmZ9o049qxfBV9fRup24v2U17idXkjmSVNyup8I87aVF/jeg==
X-Received: by 2002:aca:1808:: with SMTP id h8mr3234854oih.150.1612386581033;
        Wed, 03 Feb 2021 13:09:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x9sm663527ota.23.2021.02.03.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:09:40 -0800 (PST)
Received: (nullmailer pid 2451645 invoked by uid 1000);
        Wed, 03 Feb 2021 21:09:38 -0000
Date:   Wed, 3 Feb 2021 15:09:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
Message-ID: <20210203210938.GE3706951@robh.at.kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
 <161231243653.76967.3231080427102153199@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161231243653.76967.3231080427102153199@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 02, 2021 at 04:33:56PM -0800, Stephen Boyd wrote:
> Quoting Rob Herring (2021-02-02 12:55:42)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
> > index fa0ee03a527f..53cc6df0df96 100644
> > --- a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
> > @@ -18,7 +18,7 @@ properties:
> >      const: 1
> >  
> >    compatible:
> > -    const: allwinner,sun9i-a80-usb-clocks
> > +    const: allwinner,sun9i-a80-usb-clks
> 
> Should the file name change too?

Yes, I'll fix that while applying.

Rob
