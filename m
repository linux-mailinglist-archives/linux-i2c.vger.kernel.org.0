Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15DB766D1D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbjG1MWM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236346AbjG1MV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:21:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2385149C6;
        Fri, 28 Jul 2023 05:19:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BC14617A1;
        Fri, 28 Jul 2023 12:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19337C433C7;
        Fri, 28 Jul 2023 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690546730;
        bh=gQurcQuCxiDt0SBlMwFfwQnLQiDNL6w3VdbHaWWy1Bw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cEXwOWhRje/2/MMOu5YHNslDYmqDxXyXLCSWjZeIB7hWVlL49Fl8JmndUR6cBZ6go
         85Ff5S60I8ohbVozgj8omXYlqBdN4Mf0QEiB46KvkF9Ze4LQN3ex3CteHgy135w4Xq
         rotf8YltM7XjsM7GsFuIh6rmXFbah2OdjS/BTfXg9s0pB0twCfAYx+Db/Zd0h6Dz2o
         VBEksIhi8TN6eiS8apERvZ0chyjJOHWZdqdNuMayuhmVS8M1lOIGEdrUdy/Y4W7kF9
         IiQMOXIl15OXpJPdAwTfZyd/XROYtVulGercHZXMmpRaC6EA4PfPBs5OBrFShAcu5f
         aL8wPFRw6Go0g==
Date:   Fri, 28 Jul 2023 14:18:40 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/22] i2c: img-scb: Remove #ifdef guards for PM
 related functions
Message-ID: <20230728121840.tdzwsf4zwrdywvkz@intel.intel>
References: <20230722115046.27323-1-paul@crapouillou.net>
 <20230722115046.27323-10-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722115046.27323-10-paul@crapouillou.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On Sat, Jul 22, 2023 at 01:50:33PM +0200, Paul Cercueil wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
