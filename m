Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1554EB6CC
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 01:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiC2XeB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 19:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240598AbiC2XeA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 19:34:00 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D1531DDB;
        Tue, 29 Mar 2022 16:32:17 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-dacc470e03so20441683fac.5;
        Tue, 29 Mar 2022 16:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PIG7iRMXmTdLCXrScYrTLvhlMUfRJg2YBUgZN84Vf8A=;
        b=ff657zQdX6ACXlVuL0Q22K9OeFHqQfd2oCCdp487U6PuZXx246KDl+Q0ipHJvKTp1f
         JJa3mkdmACCEO9f7uFYMuh3qrO4JeGoAF1it1HVwa6sU+tp/DJ88iqGTrhljfyzaIgpl
         WC9EeU63Q+DUfHYyntHpeewRSwT3kIMFGSAQl9V7ybfd0oh4WXpakG09HTXDdfYJDf62
         qDezQqYUs4cFckSsxMy8OKySPwUvI3/Y3lYrW0/MLJS6rReyk34sbhRYeASJ9rDFceBq
         R6MTUMpB3XzUfJ68Bd3ObzuK8/BgWc9FLvAx86HOCIbVI+Bq7lYHTgx5HpceL7rAy0hz
         iKgw==
X-Gm-Message-State: AOAM530RFdgTI1/u5FXidnHGvoTNE6EWUcYYxeRUqfID/4cuQWHITckI
        rNQCKVrBGuw0PEkkmmfuVw==
X-Google-Smtp-Source: ABdhPJyhfdR4VS+MHMYGwfERWnZhSzI+QyMsmLzG2igOGLjqAhRLvotsbsA2gKzC7Ls8eacExFrNwg==
X-Received: by 2002:a05:6870:5b9e:b0:cf:f6de:3e89 with SMTP id em30-20020a0568705b9e00b000cff6de3e89mr916954oab.94.1648596736352;
        Tue, 29 Mar 2022 16:32:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 1-20020a056870118100b000dea1b17aacsm7550717oau.36.2022.03.29.16.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:32:15 -0700 (PDT)
Received: (nullmailer pid 1562608 invoked by uid 1000);
        Tue, 29 Mar 2022 23:32:14 -0000
Date:   Tue, 29 Mar 2022 18:32:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Peter Rosin <peda@axentia.se>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/9] of: unittests: add tests for
 of_property_read_string_array_index()
Message-ID: <YkOW/hb/aKDmWMs8@robh.at.kernel.org>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-3-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325113148.588163-3-clement.leger@bootlin.com>
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

On Fri, 25 Mar 2022 12:31:41 +0100, Clément Léger wrote:
> Add testing for of_property_read_string_array_index() function which
> allows to retrieve a string array starting at a specified offset. These
> tests are testing some basic use-case for this function.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  drivers/of/unittest.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
