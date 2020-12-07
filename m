Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4168F2D1CF4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Dec 2020 23:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgLGWND (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 17:13:03 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42124 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgLGWND (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Dec 2020 17:13:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id l200so17202295oig.9;
        Mon, 07 Dec 2020 14:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f0dNnwK/5kgGvnbmjdPTuCFvEp0Wl2tDHSN9ygZUFJI=;
        b=iR7qQwAYHwqyqp/92XHaf6rVH0w+jpIt5r8sh0YSSEG7uc8zjr5CPIqC5VFcZvWrH0
         Kl419Sjyeq876e3j3zGP5Mdxg90BZM+ywFkCgGRjWUnD2jTzWTM+y5U+srxVMzIp2sce
         KSGUfmFnmvraEHC+tYRdAkof0YuOjcLk+UmY5MCUfRmUzO/rMGaBdWyQeVuXwVyFXdvg
         UNOBfC02umIj4gwO7Hzq38nd7+3FfsJLPWQTvnV5gO4wMyAAMXH1hmkS3GMRWLR9m+wR
         1Uv3uo5LH1e2a+QPtp+bYyff2cFU/9PrZwxgI5XKRno0m1HgY8F7FhMjzuE8dC1mi5vs
         XXHA==
X-Gm-Message-State: AOAM530lwqf0K5of+drat3arnVfl8/XhOB4dBdLkTC72cT7O/uE7bpFi
        mze+2jJ6IuaMNtvY9p4OoQ==
X-Google-Smtp-Source: ABdhPJzEZhGHQKhJ4fnbWGVRdcEsZk1pxoAvOC2puBJBnonaGVPN5ezyD5iEqMhLutQqVZRGmPPz9g==
X-Received: by 2002:aca:dc85:: with SMTP id t127mr695746oig.19.1607379136647;
        Mon, 07 Dec 2020 14:12:16 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i25sm201208oto.56.2020.12.07.14.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 14:12:15 -0800 (PST)
Received: (nullmailer pid 929187 invoked by uid 1000);
        Mon, 07 Dec 2020 22:12:14 -0000
Date:   Mon, 7 Dec 2020 16:12:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/18] dt-bindings: i2c: owl: Convert Actions Semi Owl
 binding to a schema
Message-ID: <20201207221214.GA929136@robh.at.kernel.org>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <2521d2e63efcd125a4fe93ee55435f399157ab39.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2521d2e63efcd125a4fe93ee55435f399157ab39.1605823502.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 20 Nov 2020 01:56:04 +0200, Cristian Ciocaltea wrote:
> Convert the Actions Semi Owl I2C DT binding to a YAML schema for
> enabling DT validation.
> 
> Additionally, add a new compatible string corresponding to the I2C
> controller found in the S500 variant of the Actions Semi Owl SoCs
> family.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---
>  .../devicetree/bindings/i2c/i2c-owl.txt       | 29 ---------
>  .../devicetree/bindings/i2c/i2c-owl.yaml      | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
