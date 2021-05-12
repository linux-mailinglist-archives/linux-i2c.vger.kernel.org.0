Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0667637EE32
	for <lists+linux-i2c@lfdr.de>; Thu, 13 May 2021 00:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239945AbhELVMk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 17:12:40 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:36857 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385217AbhELUHN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 16:07:13 -0400
Received: by mail-oo1-f52.google.com with SMTP id v13-20020a4aa40d0000b02902052145a469so3585641ool.3;
        Wed, 12 May 2021 13:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=W+U+q4eTJh3spyOvwiyGHGUH//7zxa04tD+r5bY4uEs=;
        b=NAvX5HW7A+Dy4y4Y0MLDMYlAvJjQqgJl1U0gcQ48zCrorzUE2x2HNAKqZfrfeCVRl3
         TslM4C5Al6kRoKJrgP37rCJl3ElsJs/fsGTAkz8QuudEXBJPaphrLbXjNl6q9zCT8RV3
         f4tBxHwsOOQauE8xtZqVxnJS2f7P7cVe+p4vDG33XNnqUoMuB0LWAwSDEI1QjOsT3dYu
         yPkHv/EiJdgrwaPDo5ijg7Lj97J1nPXkZRNudQgGLxYSgWDUKJaYi4/QruKDdTe/uA2g
         P8GKh2LVwR9HoaMJdvCUYQ60wt4IuxOVcpA2VeaQfJXs8WtQv8aVBpVv1Vh0Pp60T3fp
         f9ZA==
X-Gm-Message-State: AOAM5324jBeTP5/Lwkb66ZIEa2Eu0/KYn8B/7X39+2YcGOb6w6wHfzcY
        2kqLPxp5MeCCk2rA3NKGFA==
X-Google-Smtp-Source: ABdhPJz6exy8PFow7Wm6BrJeScyxRaMuPcJ29FGguAbvDNvhXui353fKkfnfOGYvQv2F8Or+1TWQfA==
X-Received: by 2002:a4a:c446:: with SMTP id h6mr18340852ooq.82.1620849964709;
        Wed, 12 May 2021 13:06:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r2sm165952otq.28.2021.05.12.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:03 -0700 (PDT)
Received: (nullmailer pid 204088 invoked by uid 1000);
        Wed, 12 May 2021 18:35:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>
In-Reply-To: <20210512160750.15183-1-zajec5@gmail.com>
References: <20210512160750.15183-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: convert to the json-schema
Date:   Wed, 12 May 2021 13:35:16 -0500
Message-Id: <1620844516.523024.204087.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 12 May 2021 18:07:50 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Introduced changes:
> 1. Added arm-gic.h include
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/i2c/brcm,iproc-i2c.txt           | 46 ------------
>  .../bindings/i2c/brcm,iproc-i2c.yaml          | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.example.dt.yaml:0:0: /example-0/i2c@18008000/wm8750@1a: failed to match any schema with compatible: ['wlf,wm8750']

See https://patchwork.ozlabs.org/patch/1477696

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

