Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D62E545056
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 17:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236990AbiFIPN5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 11:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbiFIPN5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 11:13:57 -0400
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445E816CF57;
        Thu,  9 Jun 2022 08:13:56 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id y16so18957369ili.13;
        Thu, 09 Jun 2022 08:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MdnhP1B6dGe9n1h4hktJclfvkqEAaRhx1l6n/vgyXH4=;
        b=aYTbHcIKSip9z5eLx3PXdLGwuKe0xh1Tn2oOaO9kaUJIF4wj3mkDabH6U/zxvbT/8L
         hUfiMwu6JBnmVIMFXvIYDHyjNpY2Bk5qo184ekh9xL3p074cwDFIUydefhj7JWcWg5Sq
         uoJQ98vf0Sril1ErLfmslUolQeFA/mKWQ7MUGKze729A7mifYXlPth/fGMYY37RBN/y7
         m/h2sRT/uZ9BaagePFkDavu9ex0q978IOOt3xvdZm36N0eB3AMuRby1XviCxLbsd44II
         qCGTIlQiS9fY0QhPScLZfrXJ5PO3PMr0OJBlHWBaVmhgL6zLxW++FHH3rVS4TWAkV2rO
         +tJw==
X-Gm-Message-State: AOAM531/cp9zIXWOPAayUDzNzDbQUTRatdVYFrQA9WhBDmYJ3OAk7w1a
        LSiZY0+xqtxDOJiG6v6mFd3enj+F/Q==
X-Google-Smtp-Source: ABdhPJxctqvAdV7wfx539ewBQpXQWBku3TcCJ0hHKApqfvhQCoOWdBrv7T4tvRUdM6b2f3Ul4BaiJw==
X-Received: by 2002:a05:6e02:1788:b0:2d1:aafa:9f13 with SMTP id y8-20020a056e02178800b002d1aafa9f13mr22412428ilu.69.1654787635365;
        Thu, 09 Jun 2022 08:13:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c3-20020a056e020bc300b002d3a8969dd4sm10432576ilu.28.2022.06.09.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:13:55 -0700 (PDT)
Received: (nullmailer pid 3807446 invoked by uid 1000);
        Thu, 09 Jun 2022 15:13:53 -0000
Date:   Thu, 9 Jun 2022 09:13:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Atul Khare <atulkhare@rivosinc.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Message-ID: <20220609151353.GA3805719-robh@kernel.org>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
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

On Wed, Jun 08, 2022 at 04:39:23PM -0700, Atul Khare wrote:
> The patch series fixes dt-schema validation errors that can be reproduced
> using the following: make ARCH=riscv defconfig; make ARCH=riscv
> dt_binding_check dtbs_check
> 
> This is a rebased version of https://tinyurl.com/yvdvmsjd, and excludes
> two patches that are now redundant.
> 
> Atul Khare (2):
>   dt-bindings: sifive: add cache-set value of 2048
>   dt-bindings: sifive: add gpio-line-names

Your series is not properly threaded. git-send-email does this for you 
by default unless you tell it not to.

> 
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 3 +++
>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> --
> 2.34.1
> 
