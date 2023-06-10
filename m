Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C2A72AB81
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 14:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjFJMm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 08:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjFJMm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 08:42:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C3935A9;
        Sat, 10 Jun 2023 05:42:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EAAC760FB8;
        Sat, 10 Jun 2023 12:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56DDC433D2;
        Sat, 10 Jun 2023 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686400975;
        bh=ckwO1x0lOe+QNBUQJXt0YVIEG7QS1hYKAomFlUxkfvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OKdXfk1aq9PSxpkP/jU2KzLkalPK1rjRhuOsWTj+MMoYCNqdwSWV1oKd8ReKz35zb
         kQTiWllj+QWnDf/xuJFwVDUCL0r7XFM0XZL58T/mUeKJ0hU7UgI8U96RhLfVW99/ey
         peouAfFmdCd5DOxl69+2F5GrU72vG+Y5lmqBnf+YwpIioKh0Y6umvD9fvchQXsmhTH
         a1CmGXIjIt3cIys234hW0kHBuo+G9qzt0mmlzGms3INCxwDGNQefNECt0dZ4DOSgz8
         65cUIfwWpmfI0/ovsv60UiLTDigckW29NbnyrOebL+3FdbvGOAKNihwWjqhMJ4dS5w
         oNectn8m5X3yQ==
Date:   Sat, 10 Jun 2023 14:42:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, rric@kernel.org, jannadurai@marvell.com,
        cchavva@marvell.com, Suneel Garapati <sgarapati@marvell.com>
Subject: Re: [PATCH 2/3] i2c: thunderx: Add support for High speed mode
Message-ID: <20230610124252.o7qmwgavqyrkfhq6@intel.intel>
References: <20230330133953.21074-1-pmalgujar@marvell.com>
 <20230330133953.21074-3-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330133953.21074-3-pmalgujar@marvell.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Suneel and Piyush,

[...]

> @@ -61,10 +61,19 @@ static int octeon_i2c_wait(struct octeon_i2c *i2c)
>  		return octeon_i2c_test_iflg(i2c) ? 0 : -ETIMEDOUT;
>  	}
>  
> -	i2c->int_enable(i2c);
> -	time_left = wait_event_timeout(i2c->queue, octeon_i2c_test_iflg(i2c),
> -				       i2c->adap.timeout);
> -	i2c->int_disable(i2c);
> +	if (IS_LS_FREQ(i2c->twsi_freq)) {
> +		i2c->int_enable(i2c);
> +		time_left = wait_event_timeout(i2c->queue,
> +					       octeon_i2c_test_iflg(i2c),
> +					       i2c->adap.timeout);
> +		i2c->int_disable(i2c);
> +	} else {
> +		time_left = 1000; /* 1ms */
> +		do {
> +			if (time_left--)
> +				__udelay(1);

Are you sure you want to wait 1ms with __udelay(). This is a bit
dsruptive, can we use a more relaxed waiting method?

> +		} while (!octeon_i2c_test_iflg(i2c) && time_left);
> +	}

[...]

>  	 * Find divisors to produce target frequency, start with large delta
>  	 * to cover wider range of divisors, note thp = TCLK half period.
>  	 */
> -	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
> +	int ds = 10, thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;

unsigned?

[...]

> +	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
> +		u64 mode;
> +
> +		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
> +		/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
> +		if (!IS_LS_FREQ(i2c->twsi_freq))
> +			mode |= BIT(4) | BIT(0);
> +		else
> +			mode &= ~(BIT(4) | BIT(0));

would be nice to have this defined and with some meaning as
comment.

> +		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
> +	}

Robert, any comment here?

Thanks,
Andi
