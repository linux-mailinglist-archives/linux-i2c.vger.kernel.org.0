Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748D8375C6C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 22:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhEFUvn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 16:51:43 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:34805 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhEFUvm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 16:51:42 -0400
Received: by mail-oi1-f182.google.com with SMTP id l6so6779483oii.1;
        Thu, 06 May 2021 13:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DMYlFdBCYSfqScjdg6z0WG4WuAv0qzbnzJMBhAgqN64=;
        b=QlpsGeHblUAW7ZazteB6j4l0moeRNH0v+58c88RWR8XrxJ2Cf6MJtKTK/P2E40r/zu
         c0UWHI1tQLhy3+JUVxOzo+sZcnld6R5iJxNYHDRafEYxdN6sM1u99G30UjxG5xZv6lpT
         HBNKOMlz//czcWh+NZcbO1JI0IuNr2FmCXVZm7+0CdAzsc2RXDOvTQ+0VrTo6uEYV/dw
         JMRoe2/9gP+ku7aKiVV4ormNAmiyJFOlOKoo33x7aZ9qeHUrhdLDs1Pqnqr6VjBmpNDW
         I21naTRsttTzinWNqmc21jSmJP0gc69N1MJ28eRF/fZyHPj+Ap5jpuFVI9OlzFhnD4wZ
         J+dg==
X-Gm-Message-State: AOAM533INpE0Z3ChXCP9OSfreJE+SHx04Md4V5w7O0XGHSFTjSeU8Gx0
        Epb6PozoBbDTYhfOcwuCkg==
X-Google-Smtp-Source: ABdhPJzOUL7xjHdywbLDzqywoXYHu2JDHJlX81GiALsfQDWslhIL7OHpC2E8DNHCOje/13mqWx561A==
X-Received: by 2002:a54:4395:: with SMTP id u21mr4547217oiv.174.1620334242911;
        Thu, 06 May 2021 13:50:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o9sm790467otp.20.2021.05.06.13.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:50:42 -0700 (PDT)
Received: (nullmailer pid 780078 invoked by uid 1000);
        Thu, 06 May 2021 20:50:41 -0000
Date:   Thu, 6 May 2021 15:50:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,i2c: Drop
 "renesas,i2c-rcar"
Message-ID: <20210506205041.GA779991@robh.at.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 04 May 2021 16:51:09 +0200, Geert Uytterhoeven wrote:
> The compatible value "renesas,i2c-rcar" was deprecated in commit
> ad4a8dc3fec6485b ("i2c: rcar: Add per-Generation fallback bindings"),
> and never had any users in upstream Linux.  Drop its description from
> the DT bindings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
