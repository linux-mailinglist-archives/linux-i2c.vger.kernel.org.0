Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BADD5455BE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 22:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbiFIUfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 16:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiFIUfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 16:35:44 -0400
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688B6AF1EC;
        Thu,  9 Jun 2022 13:35:43 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id y16so19572234ili.13;
        Thu, 09 Jun 2022 13:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QBDO7v65SAWGthk9Or/vLDWOZ29djnzYPLI5jGMZgQM=;
        b=0cO81muGdsKBmD786yq73xFE7wyy5yhWw9A5XEoEjAtkGOYWBf0YJPAhwT90zvGLlJ
         CjKSLTT9wtrxaOfDoWAgRz9iYDg9D0U3elLYjrJFmPq33iQTLbyqSrM3RlEkm3UdFDB/
         ZOz2QFvQpfAgplmFgRat14hmxlJwMkYxOcPRpv7cZo2aguyMFr1s8jqdULFy7+UQ+hKD
         mxL28BpXOFejblYyp1zivCod0/l3xc72dYKMwx2KCo+X+huQEhZmsWF/TzdCdgHffTOb
         P1dHK+HT8eJsqL+alO+ym4ZGhBDWjBYkQDHCy6GXDFW7IaloyddLxKVCiwyAddHrmDs0
         IXCA==
X-Gm-Message-State: AOAM532OtwXpjnNE1aogI1dvVTRInBnFKsJEDM6vP+AjOqlcmPGp2Xyr
        7e7jTZOL7p3qrAaxTCskHA==
X-Google-Smtp-Source: ABdhPJx/w+nY1iHBI7z9zDeV4Q2WNoBgjOGowewO0wrLqYSZkjJhQVYZ7hEjQ4BzxpX4n2jvUKXVqA==
X-Received: by 2002:a05:6e02:b26:b0:2d1:ef19:8f90 with SMTP id e6-20020a056e020b2600b002d1ef198f90mr23579045ilu.180.1654806942658;
        Thu, 09 Jun 2022 13:35:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r9-20020a02c6c9000000b00331b2dd285dsm5323726jan.177.2022.06.09.13.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:35:42 -0700 (PDT)
Received: (nullmailer pid 57211 invoked by uid 1000);
        Thu, 09 Jun 2022 20:35:40 -0000
Date:   Thu, 9 Jun 2022 14:35:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Potin Lai <potin.lai.pt@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: aspeed-i2c: add properties for
 setting i2c clock duty cycle
Message-ID: <20220609203540.GA43168-robh@kernel.org>
References: <20220607163703.26355-1-potin.lai.pt@gmail.com>
 <20220607163703.26355-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607163703.26355-3-potin.lai.pt@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 08, 2022 at 12:37:03AM +0800, Potin Lai wrote:
> Introduce a new property for setting a minimum duty cycle for clock high.
> 
> * i2c-clk-duty-cycle-min: a minimum percentage of clock high
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index ea643e6c3ef5..af4c49111cc0 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -49,6 +49,14 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  i2c-clk-duty-cycle-min:

i2c-clk-duty-cycle-high-min-percent

Or maybe 'i2c-clk-high-min-percent' with duty cycle being implied.

> +    $ref: /schemas/types.yaml#/definitions/uint32

With '-percent' you can drop this.

> +    minimum: 1
> +    maximum: 100
> +    default: 50
> +    description:
> +      a minimum percentage of clock high
> +
>  required:
>    - reg
>    - compatible
> -- 
> 2.17.1
> 
> 
