Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B12029F006
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 16:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgJ2PdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 11:33:23 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46784 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgJ2PdP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 11:33:15 -0400
Received: by mail-oi1-f195.google.com with SMTP id x1so3545243oic.13;
        Thu, 29 Oct 2020 08:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rUFT2zifM9pDNpAi/HwdNWSTaIX22Y8wrSrrYHAg9Hg=;
        b=LBapPYv9piU6ONujMKKb8cx8Y7735/JH4yMlAxM/XRR5qCtsaFJ4l0kTblfPrKSwAN
         EiAeOvUR6OxckMM86jbe5KN+5hyaahNMUnkwgkhTOZ9rIqLUOoRWnQ5osaHuUC5uw9qw
         oZNO1wJEPWtn/CqfaiBhTvVQEPYCut0/skX2DkI8Z8fHD+GluYX6hrMYQNifBumZYt9l
         qBrHOtsR3pCfRc0NeJ1nF4/vjceu3ofgublFgXjndTsQF3ksoxb1PwEVPoDWW391k8w1
         dVlfgddLL4kc5X/SbyfoSKvwUGySZe6COj2N8BQH0o1/ESS5lDRoQ6MW86rIAv9+9Mwo
         5AHQ==
X-Gm-Message-State: AOAM532mIQTrR8rp8ChtnydD+Qml2NVx7fh+VQmR9HEqZrjiUG8ESM54
        7Ql9qeJL2SBNy1LRn9Cm4SY9gbAs4w==
X-Google-Smtp-Source: ABdhPJxwYGyop1G3fdy6ZCkP7VXoOwDMiqJ1r8CR9p47Gu+PJ6qR0CCJtcvi4749qEnoHoG7KtpO3w==
X-Received: by 2002:aca:3a04:: with SMTP id h4mr23335oia.42.1603985594016;
        Thu, 29 Oct 2020 08:33:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm679283ooy.36.2020.10.29.08.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 08:33:13 -0700 (PDT)
Received: (nullmailer pid 1910928 invoked by uid 1000);
        Thu, 29 Oct 2020 15:33:12 -0000
Date:   Thu, 29 Oct 2020 10:33:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, Leon Romanovsky <leonro@nvidia.com>,
        devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Message-ID: <20201029153312.GB1905314@bogus>
References: <cover.1603925077.git.kblaiech@nvidia.com>
 <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 28 Oct 2020 18:55:54 -0400, Khalil Blaiech wrote:
> Write the devicetree binding text file in schema file, JSON
> compatible subset of YAML.
> Besides, add an entry within MAINTAINERS file.
> 
> Fixes: d9becc53b3ade81e ("dt-bindings: i2c: I2C binding for Mellanox BlueField SoC")
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
>  .../bindings/i2c/mellanox,i2c-mlxbf.txt       | 42 ----------
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 78 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 79 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml:28:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml:31:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1389582

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

