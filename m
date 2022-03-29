Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9884EB6C8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 01:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240552AbiC2Xdt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 19:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiC2Xds (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 19:33:48 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088842B260;
        Tue, 29 Mar 2022 16:32:05 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id v75so20595859oie.1;
        Tue, 29 Mar 2022 16:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uVontxtUEql3lU9KitAPBTLnbX++NaldLSDhe68y51U=;
        b=k4d1g53U02XEnEjjtBRrM6l96i66O4r5TTx5ELH4YVj4tX+B4CN+btUj6qF3Lrj4Mk
         k4dVWTSTr9m+0AkIXxnNUb/vcNoQcQcVmsfpcXKC0Rg8htlo1/Gjv0IIM6WEXj0IKZtb
         WZbFiHok2x6SQxk3r6rrZLqlCAaTQKjyhCWiSffWuGar2lxmNkZas4fCRzU8CUG1Wegh
         whj1GlQRdZ/cM4pvz9Cjzo9gLSe3dApJCmGCVmWxcEl2Uqy+QMNHbENoPa1ywYKBQxp/
         uWekoStDCJcaJM7u5j7KVOQOK+kGuvXQErUlzf32d42aUvQqO58TgdR80k6ONiT64xV4
         k4Mg==
X-Gm-Message-State: AOAM533jc0XIH1DtbAD2/VOpbBPVGwRLCyDrPhPi5XMYlGdz5aAfMp0y
        BJKwkiIIXf1W7DNBdUmpYQ==
X-Google-Smtp-Source: ABdhPJzM7lZ8dOPmTFW3+GhYBg9fKuCKQZn0dcpllvmV1gXB8duY7h7nVC+ibIqmLOlc5EoCvRdrdg==
X-Received: by 2002:a05:6808:1491:b0:2da:7f75:8dec with SMTP id e17-20020a056808149100b002da7f758decmr677307oiw.275.1648596724298;
        Tue, 29 Mar 2022 16:32:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u14-20020a4ad0ce000000b0032174de7c2csm9208180oor.8.2022.03.29.16.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:32:03 -0700 (PDT)
Received: (nullmailer pid 1562172 invoked by uid 1000);
        Tue, 29 Mar 2022 23:32:02 -0000
Date:   Tue, 29 Mar 2022 18:32:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-acpi@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 1/9] of: add of_property_read_string_array_index()
Message-ID: <YkOW8mtlY7criwrk@robh.at.kernel.org>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-2-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325113148.588163-2-clement.leger@bootlin.com>
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

On Fri, 25 Mar 2022 12:31:40 +0100, Clément Léger wrote:
> Add of_property_read_string_array_index() which allows to read a string
> array starting at a specific index.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  include/linux/of.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
