Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA727B2051
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 17:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjI1PDc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 11:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjI1PDb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 11:03:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136DC194
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 08:03:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FCEC433C7;
        Thu, 28 Sep 2023 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695913408;
        bh=VsaonKAkT/6XtxrAvbbTe7kEagAs6kzWdnlY+QF0kSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kQDYpei9iBOFvf+yiu8UTf8MBOc5m0OukpVfVp/aEvawXP3yl5i01jKJYTdMEpXcQ
         tPd2NApGpMIHMjLXoz+G/q2ixxqmoFYGgyEKvXBKwU5WD38wV8rp4G33g7cxC9DV+x
         EaFcWFuPG5eQ3DVw3dCh/MdR/QNQ+rmA6c0ECH0jQcfoZBOhaFPox/RpNTh3LEUqYQ
         u7KqqWREuWuSqPJuHy/x79pCjSuKs6HJCbDgPSFafcdJG3sw5mA4CjboX+8NmDu+Zz
         YGWP7jf2lgK3CyN8JRWTxj/UBHL+glBI5xXNlC45BTNH5ByfIvisC/Y6s611Mq2Xtt
         TPS7RV65Gx9dQ==
Date:   Thu, 28 Sep 2023 17:03:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
References: <20230928101655.47d3dd2a@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928101655.47d3dd2a@endymion.delvare>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On Thu, Sep 28, 2023 at 10:16:55AM +0200, Jean Delvare wrote:
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
> 
> These Tyan server boards are 18 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.
> 
> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>

I think I commented here that I had double thoughts on this. I
said that on one hand I like the cleanup, but on the other what's
wrong keeping them here?

Maybe someone is still using these devices.

BTW, do you really have them?

Andi
