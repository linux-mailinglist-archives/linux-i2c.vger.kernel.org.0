Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E83B608C45
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Oct 2022 13:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiJVLHE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Oct 2022 07:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiJVLGi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Oct 2022 07:06:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62743385B;
        Sat, 22 Oct 2022 03:24:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E78860B24;
        Sat, 22 Oct 2022 10:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1F6C433C1;
        Sat, 22 Oct 2022 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666434269;
        bh=sNnqQxLQOiwqu7Ffq7bguDEOGa/qup8E74EebTPLQiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CGFosPZlrGF6y4gj9t6Lw1jBTwq0zSqI9G6rgAlwH7CydFsvs8cKOl/zGAtVz8+1z
         NHJow5DMWeZY9mKDHiwx2/ryRUJMVpRPCF2XGzQni3aKEmBnJkHC3WOet3rx7YHfQ3
         zQ5uye9wPLs2kR7f2Pcf0xPcjQXFWWyVdVuRFoNQ=
Date:   Sat, 22 Oct 2022 12:24:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/17] ARM: omap1: remove unused board files
Message-ID: <Y1PE2nYekbHayuud@kroah.com>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-13-arnd@kernel.org>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All board support that was marked as 'unused' earlier can
> now be removed, leaving the five machines that that still
> had someone using them in 2022, or that are supported in
> qemu.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
