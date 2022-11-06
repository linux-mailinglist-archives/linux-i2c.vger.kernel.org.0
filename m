Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5AF61E201
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Nov 2022 13:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiKFMKC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 07:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiKFMKC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 07:10:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A69DE98;
        Sun,  6 Nov 2022 04:10:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B31DB80B70;
        Sun,  6 Nov 2022 12:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FA3C433D6;
        Sun,  6 Nov 2022 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667736598;
        bh=j1zqZmSkkH6XHp97/IAU6nUPanP1KOTVaUs91Fq0Ams=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gln8fpFZP2UgvjePf5FZMQgsTAxBrSaCOmu8YvTiPaE1eBXGWL0OnqOns3w7eYm+E
         e9bcIVD7j+v7sfUOqeI5koSRpYylc/LYbClhPnweRw/Dy4oHh4dUDocnLUYO+XSdEL
         JSYs9w8zh1z1zyfUPV9zUlonYnJR2+hrF/kjS1SML/1V/e4DwcVGrDIq8+5JpunRlI
         jpnWuuV4U+wNNk/CEkT63v8tkItrgPapH8hK+z/IKvExmpWatBHQO45dobtciB3xBs
         /m5AIEKqdxVSSEflrwI/LneZrHdYHZ2S1bGZICXA8mOFWfN79Dx2iIzVutqDzhoAxP
         gEDu0CsYFvTDQ==
Date:   Sun, 6 Nov 2022 12:09:48 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-iio@vger.kernel.org,
        Uwe =?UTF-8?B?S2xl?= =?UTF-8?B?aW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] i2c: core: Introduce i2c_client_get_device_id
 helper
Message-ID: <20221106120948.0dd617b8@jic23-huawei>
In-Reply-To: <Y2bVuYMVew8/h9HE@shikoro>
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
        <Y2E0BWyvHjPko2TB@smile.fi.intel.com>
        <20221105145658.45b0e9da@jic23-huawei>
        <Y2bVuYMVew8/h9HE@shikoro>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 5 Nov 2022 22:29:29 +0100
Wolfram Sang <wsa@kernel.org> wrote:

> > I can do an immutable branch with just the new function call in it if
> > that is useful given I assume this is applicable across a bunch of subsystems?  
> 
> I'd think I should provide the immutable branch with the new I2C API
> call. Feels a bit more logical. Will that work for you as well?
> 

Absolutely. That's even better - I didn't want to assign you work to do :)

Jonathan
