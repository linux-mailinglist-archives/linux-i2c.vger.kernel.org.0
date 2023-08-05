Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB851770FDA
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 15:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjHENMM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 09:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjHENML (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 09:12:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C712DE7;
        Sat,  5 Aug 2023 06:12:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5168F60E07;
        Sat,  5 Aug 2023 13:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5788AC433C8;
        Sat,  5 Aug 2023 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691241128;
        bh=xd7QcIrP+oGHdgOD4wl+BCQpaCxEUJEaYrxkHUgb4SU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bAnVpBMAVKCNybnDwOteOSNkf57rKLQm8D5vorHRhICk3+kIBNb8gjzpFEAhgMD5l
         ZB2U4x8W46mOXcSAxfSLlebRTywHY9ccgBt+nzPJ1PsL7vWog/Z69QLvcs/EClUd5/
         6c9nnM3bBs9P8WEWA/wkdzxeXeIc9X24pb+lmuQUpZB/67kSxiEYA0wM6Be+AsGRmo
         BQSIyD//hCF+4bGtu/4KzmRreoClB8SvXax9ynkzGrU1mTLE5xEezHoffYKiHq/6r9
         wn1HowonrP2Ivzq3hhMMtRjmLJd/Sp/yrMCqvMtiopbgDQUZxzkPdSAIL1++Lmx5/o
         iLtudnvMoQuzg==
Date:   Sat, 5 Aug 2023 15:12:05 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: mux: ltc4306: Drop enum ltc_type and split
 chips[]
Message-ID: <20230805131205.fzkp2asyuh24ktab@intel.intel>
References: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
 <20230717134807.265302-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717134807.265302-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Mon, Jul 17, 2023 at 02:48:07PM +0100, Biju Das wrote:
> Drop enum ltc_type and split the array chips[] as individual
> variables, and make lines shorter by referring to e.g. &ltc_4305_chip
> instead of &chips[ltc_4305].
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
