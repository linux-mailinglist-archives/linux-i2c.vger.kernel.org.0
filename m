Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AD2375C74
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 22:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhEFUze (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 16:55:34 -0400
Received: from mail-oo1-f48.google.com ([209.85.161.48]:44936 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhEFUzd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 16:55:33 -0400
Received: by mail-oo1-f48.google.com with SMTP id s24-20020a4aead80000b02901fec6deb28aso1534183ooh.11;
        Thu, 06 May 2021 13:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5798qhRg7fLkP9l9DRC4VFM60YOqQpO/boyzsZg7U9w=;
        b=nJliEd3yDf7zt+3yyKa7Rgoo64+YzpTKXOCPZSq1ATwQhs25QrddBF1psSu5hgJO1N
         8AdsKN5CNKBPovAYqVT/6kEc3NWNXBHzNZpmcwmf6EFvdtBWvk39h7nwHdY/XI6a4A80
         IJNUQzkhQKC9BezD0JnKXA0/tiBPc1+6jXCCZshAf+nWvgWkP1DlS4p2gITFNSsLPWew
         U6JRrn/Bi3y+hWnBFaoq/ICCz5xGhJsvuWGbv/MqFeRRlg+0EsYVb7divrAAwjn4MoHh
         vbFjSmvOm5lukNRGKSxuodG/YIEovRv3sD5REujO5z47k+LK47VTn+tc7cIFFywcPfz+
         ZYcg==
X-Gm-Message-State: AOAM533LlscKqz3eHmV8+ZUtyJ7wyNjzm1IAfb5kC+uYvZSt6JM+8yv6
        wTl/vwLinqNan4kcbb7gq4NLvfpQEA==
X-Google-Smtp-Source: ABdhPJwLhaQ1UQtAk9pNEqwRa6wU/JPH5JfMbIH509NJ/0TCI1oOP4JFt6GzavmA9TwsidkKIkf58A==
X-Received: by 2002:a4a:e385:: with SMTP id l5mr5062668oov.48.1620334473953;
        Thu, 06 May 2021 13:54:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e39sm791299ote.62.2021.05.06.13.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:54:33 -0700 (PDT)
Received: (nullmailer pid 785228 invoked by uid 1000);
        Thu, 06 May 2021 20:54:32 -0000
Date:   Thu, 6 May 2021 15:54:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to
 json-schema
Message-ID: <20210506205432.GA782463@robh.at.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 04, 2021 at 04:51:11PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Mobile I2C Bus Interface (IIC) Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> R-Mobile A1 and SH-Mobile have multiple interrupts.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> It is still not clear to me which instances on R-Car Gen2 and RZ/G1
> support automatic transmission, cfr. this note for the IIC3 instance in
> the Hardware User's Manual:
> 
>     Automatic transmission for PMIC control (DVFS) is not available
>     because the second generation R-Car series and RZ/G series products
>     do not support the DVFS function (automatic transmission can be used
>     as a hardware function, but this is not meaningful for actual use
>     cases).
> 
> The only thing that's clear is that R-Car E2 and RZ/G1E do not have the
> automatic transmission registers.  Note that current r8a7745.dtsi and
> r8a7794.dtsi do not reflect that.
> 
> This binding interpretes the note as that IIC3 does not support
> automatic transmission on R-Car H2, M2-W, M2-N, and V2H, and RZ/G1H,
> RZ/H1M, RZ/G1N, while the other (if any) IIC instances on these SoCs do
> support automatic transmission.  This matches with the current
> r8a774[234].dtsi, which do not declare compatibility with the
> family-specific and generic versions.  Note that the current
> r8a779[0123].dtsi still do, and thus should be updated!
> 
> Possible alternative interpretations of the note are:
>   - Only IIC3 has the automatic transmission registers.  But the
>     automatic transmission feature is not useful as the SoCs lack DVFS
>     support.
>   - All IIC instances have the automatic transmission registers, and
>     IIC3 is traditionally used to control the PMIC.  But as the SoCs
>     lack DVFS support, the automatic transmission feature is not useful.
>     As R-Car V2H has only instance IIC3, and is documented to have
>     automatic transmissiong registers, this might be the correct
>     interpration?
>   - Anything else?

Can't help there, but looks fine otherwise.

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Thanks for your comments!
> ---
>  .../devicetree/bindings/i2c/renesas,iic.txt   |  72 --------
>  .../bindings/i2c/renesas,rmobile-iic.yaml     | 160 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 161 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
