Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A351173B669
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 13:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjFWLiy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 07:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFWLiy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 07:38:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF08710F1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 04:38:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5AE2A61A30
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 11:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26900C433C8;
        Fri, 23 Jun 2023 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687520323;
        bh=YLn8XpyC4+WEHKB7Ct03GvEABkOLCXkqpdJNbjdNfeM=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=TKptuALR1YIvjIK6nBlnH3oxKp1xHZBDjch13mgSZosWh/OqTEBoW+pa4IuFDiwd5
         mnVQcARyfkKkp067vdyL58Sn0Qi1lvyocJjgGwLDoEdih3J3j1ffk6zi4dzFRPPQgv
         mUb6WVfedbMKxM1RUugDNHMl4ne7T95+eG4b7mBGSJqAqvL5fnSSXX7Ww5v/i4a9OH
         kKp6gDXp+iYgMFd9u0L4YLYTc2I+1F7rMjLVPH9qi1oD8uQryI5Stj9xNXu6AgfhYI
         8JcXeYEoosQzDmTMhh6No8vd9n0grEYVLZUJk8VhTAzqBpf5SxrhmXBpo5j95ejTY2
         dDXzqb8lNWDGw==
Date:   Fri, 23 Jun 2023 13:38:40 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: hix5hd2: Make sure clk is disabled in remove
Message-ID: <20230623113840.hakkqj5ehxh53rad@intel.intel>
References: <20230608225513.1151574-1-andi.shyti@kernel.org>
 <ZJVvf1vxqeeq+UHW@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJVvf1vxqeeq+UHW@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, Jun 23, 2023 at 12:10:07PM +0200, Wolfram Sang wrote:
> On Fri, Jun 09, 2023 at 12:55:13AM +0200, Andi Shyti wrote:
> > From: Alexey Khoroshilov <khoroshilov@ispras.ru>
> > 
> > pm_runtime_set_suspended() does not lead to call of suspend callback,
> > so clk may be left undisabled in hix5hd2_i2c_remove().
> > 
> > By the way, the patch adds error handling for clk_prepare_enable().
> > 
> > Found by Linux Driver Verification project (linuxtesting.org).
> > 
> > Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> 
> I have now applied "[PATCH 05/15] i2c: busses: hix5hd2: Use
> devm_clk_get_enabled()". Can this patch then be dropped entirely?

yes, this patch can be dropped. When I resent this I didn't plan
that refactoring.

Thanks,
Andi
