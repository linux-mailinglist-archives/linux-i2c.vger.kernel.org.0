Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6768D4AFF63
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 22:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbiBIVrJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 16:47:09 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiBIVrE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 16:47:04 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C31C03BFF4;
        Wed,  9 Feb 2022 13:47:07 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id y23so3915763oia.13;
        Wed, 09 Feb 2022 13:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TZ46TlKYTshX8RZZRBiPJL78zWYqEMH2598Ii/qKUQk=;
        b=siCwLftuZReJK+eohn6u88AMVD9Q4kW2hvDHSTbyxrJJKupZwdZe0SSMQztrsO0Fc2
         d1hTufHgJ05BEjkya3bkd0qZcukwNxiZe0MsVEmsIm0HEeRcezuau5plFhFWS0BV8fU/
         6ITZpjX96j7kWC/NYcSHO5/8LyzWElqDN6iy+zadKfiSVa4YdwqfWjpm/sxEDszB04iN
         V/OgnS6mUkDnrqqcFt0+oO9L01M6m2UV5WzOjU0vSnnk/gS9qe1C7MvCpiqqIKh88v2p
         plCS+WF1yGMYbqn8IAKe8gy5DHhc1x0whv0QjWUnaolh2gusWIfNAaI30rDKQNDeDFfW
         DvhQ==
X-Gm-Message-State: AOAM530bacES7E7DOBG663r+XXOKRbvO3eGErHgVPjSFtoeA1ua4qOyK
        Wq4ytunXnExB6ohSsBy7OA==
X-Google-Smtp-Source: ABdhPJwpcX+N4A3zDGD6/nUyulsEBel70rjWAgq7gY68Z5+BPGUcC7Y+GrNoFz+69YEbfiaxWQKtvg==
X-Received: by 2002:a05:6808:168b:: with SMTP id bb11mr2361167oib.116.1644443226592;
        Wed, 09 Feb 2022 13:47:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z4sm7026854ota.7.2022.02.09.13.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 13:47:05 -0800 (PST)
Received: (nullmailer pid 980191 invoked by uid 1000);
        Wed, 09 Feb 2022 21:47:04 -0000
Date:   Wed, 9 Feb 2022 15:47:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: add nxp,pca9541
 release-delay-us property
Message-ID: <YgQ2WJp8v53+5LE5@robh.at.kernel.org>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <20220201001810.19516-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201001810.19516-3-zev@bewilderbeest.net>
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

On Mon, 31 Jan 2022 16:18:10 -0800, Zev Weiss wrote:
> This property can be used to reduce arbitration overhead on busy i2c
> busses by retaining ownership for a brief period in anticipation of
> another transaction in the near future.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/i2c/nxp,pca9541.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
