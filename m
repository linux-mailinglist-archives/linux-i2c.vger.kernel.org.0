Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB8375C80
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 22:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhEFU6W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 16:58:22 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:42538 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbhEFU6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 16:58:21 -0400
Received: by mail-ot1-f51.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso6101118otg.9;
        Thu, 06 May 2021 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bp5RtdBBe2ku1w14VHF5wWt/pMonE6P5FU8yha9Qjiw=;
        b=PNl0NpCB5vT5w9EnGu3sLyDabryPmReu9O2f/Cuk7C/fgPWVlVArVUvaJUnYAiSAPC
         dIBv4G+bj2aJQsOtA3XbbzwaOOfPkhql8UVFQw+z/q+Gysk7CMD5mNVT+A+6+so66W0j
         F6vjqWKfPHLxegiVLCYUrG0dBUTlN/aKiasCPVSbHgG7n5CM1kErx+JwcgQqAdJ6rmg7
         6jjNngPl/p/iuif9/2CQvppDjWjwulUamV4d7zxFWvxxMTvD2E/7MwAXZYOwE2XjFfK8
         StVLAleWRYQ7d1COYXC9I+62Y63pUCStS0CDTwagIpzB1LBSzuiDQEcdciX1YN/o0kML
         dAwg==
X-Gm-Message-State: AOAM533YTuxUMXttF912o0o1glr2mu1lF4QVR0rcyAsDRWyPzwMCIoyV
        zQsVM2mMVt86OzeB9rxNQg==
X-Google-Smtp-Source: ABdhPJxGWV9UXRuzfIx+dZRZ51NNQHx3iD/Z5WX9PfNcGr1bWcFyXenYzfJcadHL3ofARshMGMHmQw==
X-Received: by 2002:a9d:6a18:: with SMTP id g24mr5166911otn.368.1620334640613;
        Thu, 06 May 2021 13:57:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z9sm818582otj.44.2021.05.06.13.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:57:20 -0700 (PDT)
Received: (nullmailer pid 789013 invoked by uid 1000);
        Thu, 06 May 2021 20:57:19 -0000
Date:   Thu, 6 May 2021 15:57:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: i2c: renesas,iic-emev2: Convert to
 json-schema
Message-ID: <20210506205719.GA788962@robh.at.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <3a72f4353b24c4d790a216bfde1b284800b3029a.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a72f4353b24c4d790a216bfde1b284800b3029a.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 04 May 2021 16:51:13 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas EMMA Mobile EV2 IIC Interface (IIC) Device Tree
> binding documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/i2c/renesas,iic-emev2.txt        | 22 --------
>  .../bindings/i2c/renesas,iic-emev2.yaml       | 54 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 55 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
