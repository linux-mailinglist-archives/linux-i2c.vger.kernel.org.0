Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BA8790B77
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Sep 2023 12:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbjICKfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 06:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235800AbjICKfn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 06:35:43 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8B011D;
        Sun,  3 Sep 2023 03:35:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 83833CE0959;
        Sun,  3 Sep 2023 10:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3430FC433C8;
        Sun,  3 Sep 2023 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693737334;
        bh=CYLpYPeGI0w2m5LfccnFlQeF/v6+pPHDIGG7jNrSsZ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CI/mn7yWXPnP/4PvuIH1bU7XkTkW8LhN0omDP7SzOy/bjg/rweAwiVpsrZzlgK2j0
         E8pi7cxgYE1dA3HQHOMa6vDX8yu9wyoRpVkP9y8p1e0VxZ+5edPc49Kqk49SGaS65x
         CwKiHwtNtegMCCF8tRAyPys9TlqTQK6wvTQrcERIxKzydo6xdmiGWcoUTZsQN4aK+O
         QrE9k2y0FXC7olLXJnxj7UIU0bgY3x+ZfyjiQjsD5ftzlT+fJYrK4HxRfAWPNbBemA
         yX78sOv7qA6BkVPa+JQUKWkETB1M/JSUqLK7WMHsaynzF1ZCpflrFUJnR6iyOVqLnT
         gz2IfX2s7eLXA==
Date:   Sun, 3 Sep 2023 12:35:30 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Justin Stitt <justinstitt@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230903103530.cdg4ehf4fas4mjbf@zenone.zhora.eu>
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro>
 <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
 <ZOkyRoKmRTMHLm7b@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOkyRoKmRTMHLm7b@shikoro>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

> > There was some discussion [1] wherein it was ultimately decided that
> > this warning should probably be turned off (contrary to what the title
> > of the GitHub issue says).
> 
> I totally agree with your last comment in [1]. So, I also vote for
> disabling the warning. Thus, I will reject these patches, but still
> thank you for looking into such issues and trying to solve them!

yes, unfortunately this is the trend and most of the patches
follow this approach and they are getting merged.

I don't like pointers storing values and this fix whould be
completely taken from another side. In any case, given the trend,
I will not oppose.

Andi
