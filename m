Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741F972AAB1
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 11:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjFJJgb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 05:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjFJJga (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 05:36:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B342D269A;
        Sat, 10 Jun 2023 02:36:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D05B60DF2;
        Sat, 10 Jun 2023 09:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15454C433EF;
        Sat, 10 Jun 2023 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686389788;
        bh=dtFXjJ4EPNkKuSigVdaZavR/GvRvLG89WPfmQG7j23A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YiisBsLa1TvYU9BRRZcCvo9zMkaQ3ebrIl3b2MLAfzSgze21+bFIK95RfvP4BXAg9
         TwXv+Tu76n7jDnXc8z3TWCoJPsgoSm6CEro4VOFCCIh4QsqAjDCI15FLcQJvd++quX
         HfTwnU4OVjMWUyNe9xtWlDuuC7ICJsDZwaV//jFFf4KBYdAxfqQnKvd0We9cWGC1BY
         OuM8SYZXk6HPlHxf2ku5xxLU4MCl9MZGhoEPa91dRbLf2UxGkxi49DeU+HD1+TkZzb
         v9VLGjooSss/3jHckowVvBtDBukushLvidyrdquEdv6ZyRCMk+Y8iiPNw7bMtEZaUJ
         uBiY0a8FamOvw==
Date:   Sat, 10 Jun 2023 11:36:25 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mpc: Use of_property_read_reg() to parse "reg"
Message-ID: <20230610093625.gvgbt7g4xvnuuog6@intel.intel>
References: <20230609183044.1764951-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609183044.1764951-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Fri, Jun 09, 2023 at 12:30:44PM -0600, Rob Herring wrote:
> Use the recently added of_property_read_reg() helper to get the
> untranslated "reg" address value.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/i2c/busses/i2c-mpc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index cfd074ee6d54..595dce9218ad 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -316,9 +316,10 @@ static void mpc_i2c_setup_512x(struct device_node *node,
>  	if (node_ctrl) {
>  		ctrl = of_iomap(node_ctrl, 0);
>  		if (ctrl) {
> +			u64 addr;
>  			/* Interrupt enable bits for i2c-0/1/2: bit 24/26/28 */
> -			pval = of_get_property(node, "reg", NULL);
> -			idx = (*pval & 0xff) / 0x20;
> +			of_property_read_reg(node, 0, &addr, NULL);

because of_property_read_reg() can return error, can we check
also the error value here?

Thanks,
Andi

> +			idx = (addr & 0xff) / 0x20;
>  			setbits32(ctrl, 1 << (24 + idx * 2));
>  			iounmap(ctrl);
>  		}
> -- 
> 2.39.2
> 
