Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E1E375C71
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 22:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhEFUxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 16:53:19 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43815 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhEFUxT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 16:53:19 -0400
Received: by mail-ot1-f41.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso5311848ots.10;
        Thu, 06 May 2021 13:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HAoaZHXzo7CffhYfQ10ODy71JcVRQ25QZoRVYSStdV0=;
        b=btstqeAPFYYCKs0/fRyMKOQ5h2zvaPAvXhlJU1NEadzHv1YPyw/7LHWwKpZwlGuB8j
         eZCEspb140BqE1LDyKjFbrUS3WyWXxBlxogNzFB0I63Bv5hEa1nSKL5rfsX34EloTQ+x
         3wNLc0bTlue6jzGWDQer2Xxy1z74bJdDBGYvJOZ3JLQUReCCzjg+nzVfox7nTvH4Noqo
         lCGm5WOokJSGiNBkT7jyyahMlEL9if1JjKdti6zE4+BbTKaksu9xtLZpqcL77yUNpnEO
         8HcFEdnD0zRKqKUXH99K3KRTwGy9Ovs2eJmAoVfaYoMBzYLNeWthfCOF3ywWCunpjC6s
         oxeQ==
X-Gm-Message-State: AOAM532q+4XY1g18AtwlBNZkbmFbRIylf6jDUqhSIzYplilf8/1MDIQ2
        2HHr2VqTgGlkzS+9X5Jpmg==
X-Google-Smtp-Source: ABdhPJxOQjXxivXri9OYP6f/8iAhQXvzwsiZkdiLVzLkZB1utK/Ca5Em448ghiL2LebIJNomJzqhXQ==
X-Received: by 2002:a9d:220a:: with SMTP id o10mr5538079ota.199.1620334339132;
        Thu, 06 May 2021 13:52:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g16sm710336oof.43.2021.05.06.13.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:52:18 -0700 (PDT)
Received: (nullmailer pid 782274 invoked by uid 1000);
        Thu, 06 May 2021 20:52:17 -0000
Date:   Thu, 6 May 2021 15:52:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH 3/6] dt-bindings: i2c: renesas,i2c: Convert to json-schema
Message-ID: <20210506205217.GA782244@robh.at.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <e80b6d1825d280b25f00a980c2caf778c9907d85.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80b6d1825d280b25f00a980c2caf778c9907d85.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 04 May 2021 16:51:10 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car I2C Controller Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Make the clocks property required.
> DMA is supported on R-Car Gen3 and RZ/G2 only.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/i2c/renesas,i2c.txt   |  66 --------
>  .../bindings/i2c/renesas,rcar-i2c.yaml        | 158 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 159 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
