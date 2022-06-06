Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D7153EEB2
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 21:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiFFTeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 15:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbiFFTet (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 15:34:49 -0400
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E2D1AD85;
        Mon,  6 Jun 2022 12:34:48 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id p1so12645351ilj.9;
        Mon, 06 Jun 2022 12:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gROz1pydceBcvf/fob5H6PUvxkDsoxGNEYfF2zFZELs=;
        b=AyYGflxK1DqFK3TcBO8zZQP4VZyNIP4ZtAO47P0OLsjaVADpUJ2yZKFnG7CPAoLjjd
         v6+R1okiOQVUOl9jsra1KM8F1hAjdslqhk1a7vZXjWXnCaHcHQnqJ4GlaVj3Z0Z7+IuV
         RJQYJBGsGdX6Rt8Q0cwEd6Ow48wiItMWe0axLswyqLujcIKGWp9CATqHSmnI+L07+qIg
         FHJyrdI9H5kOJ22EIeOjprvqXtDLxvjBoeswjxcurarYMlzUtJTzqMGIk6zJG1RtZClE
         TX9DqNf0M7HhCUoDhosqkkzltq5Mj2+l5plOu+74ekfal5KQ4KsGzuyUJcyQx085dlGd
         E+eA==
X-Gm-Message-State: AOAM530fRRs3CFLmujKXb1ElLUCJrk4sGlyMdntp4O8CTgwX4aXH03Oh
        xcb3C/bZbuMvXTpp5/c5mQ==
X-Google-Smtp-Source: ABdhPJyFcdHL9AJCLAhvOLjzsauecezyuHA5y8TsCzVkpu3aHcrvsi73MbDnrJ19ZLcgDNWVt3/Ggw==
X-Received: by 2002:a05:6e02:198e:b0:2d3:f382:bbc1 with SMTP id g14-20020a056e02198e00b002d3f382bbc1mr12215886ilf.129.1654544088069;
        Mon, 06 Jun 2022 12:34:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id x14-20020a026f0e000000b0032dd4094580sm5875484jab.49.2022.06.06.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:34:47 -0700 (PDT)
Received: (nullmailer pid 1129683 invoked by uid 1000);
        Mon, 06 Jun 2022 19:34:44 -0000
Date:   Mon, 6 Jun 2022 14:34:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Conor Dooley <mail@conchuod.ie>
Cc:     linux-mmc@vger.kernel.org, Atul Khare <atulkhare@rivosinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-riscv@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: convert da9063 to yaml
Message-ID: <20220606193444.GA1129604-robh@kernel.org>
References: <20220606152557.438771-1-mail@conchuod.ie>
 <20220606152557.438771-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606152557.438771-4-mail@conchuod.ie>
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

On Mon, 06 Jun 2022 16:25:57 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the dt binding for the da9063/da9063l to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mfd/da9063.txt        | 114 ---------------
>  .../devicetree/bindings/mfd/dlg,da9063.yaml   | 132 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  MAINTAINERS                                   |   1 +
>  4 files changed, 133 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
