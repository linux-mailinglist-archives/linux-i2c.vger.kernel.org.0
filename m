Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9FEB54BCE6
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 23:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245417AbiFNVl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 17:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbiFNVlZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 17:41:25 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A6213CDA;
        Tue, 14 Jun 2022 14:41:24 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id d6so7560276ilm.4;
        Tue, 14 Jun 2022 14:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P/snQ/WMRmumIJEZaYOGe+qZw9rf1ibk1Zx2Cluh3eE=;
        b=LyOpdCmhpU59VQp24hsnT3nVwh7XbUhnbADUQD7BzJNhlB2pTjYIXjev622UTWP1uu
         RAJ2xbLNvtPYPQ1V9yOdAtECPFYV4GtJ5KzJLV1sUcuCa96JHdFfbT4B0UHnUcVfx1m1
         o+Eu7cOdoRP1UNJn4hvUii6vfeiHbj40c1/53sRwjDBZHAVKRupSswRPAz+WePz+e/B5
         TckQxmU74ZQ0PhFNcLrF9LQWKZNeIT3/gpaPpIK8cGjQf9UI5SB9Dyxfypxl0EdLxWnG
         k4BHFVqAOoJRtelpULKZB1n2e3Av/YwalY6UrsINhe77QWlYLtJmRH3MMjXVU0F0/a2Y
         CKwA==
X-Gm-Message-State: AJIora9on69fE8BM8PXdVpcWOru0k0S1zLAUNxqkZQWvifBAQa2lFLX1
        aAWFR4yHOq8cd3vxWpdQ0uK5vcAF6Q==
X-Google-Smtp-Source: AGRyM1snG5pU4M/G6iIKIUmFJVbwBn2Ae094R8NI4RwTUrqihx5I7ujinRYO6C0+lzgFNAsFXyGYhA==
X-Received: by 2002:a92:c568:0:b0:2d3:da8d:76cc with SMTP id b8-20020a92c568000000b002d3da8d76ccmr4134740ilj.161.1655242883879;
        Tue, 14 Jun 2022 14:41:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b3-20020a029a03000000b0032ead96ee5csm5316779jal.165.2022.06.14.14.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:41:23 -0700 (PDT)
Received: (nullmailer pid 2706027 invoked by uid 1000);
        Tue, 14 Jun 2022 21:41:21 -0000
Date:   Tue, 14 Jun 2022 15:41:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Potin Lai <potin.lai.pt@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-i2c@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: aspeed-i2c: add properties for
 setting i2c clock duty cycle
Message-ID: <20220614214121.GA2705772-robh@kernel.org>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
 <20220610054722.32229-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610054722.32229-3-potin.lai.pt@gmail.com>
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

On Fri, 10 Jun 2022 13:47:22 +0800, Potin Lai wrote:
> Introduce a new property for setting a minimum duty cycle for clock high.
> 
> * i2c-clk-high-min-percent: a minimum percentage of clock high
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
