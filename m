Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5403730AC5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 00:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbjFNWdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 18:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237096AbjFNWdU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 18:33:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B304E2950
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 15:32:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74E2E640BA
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 22:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587FCC433C8;
        Wed, 14 Jun 2023 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686781962;
        bh=ckukOVyUjKFFDuVSHLEdlx6NMLMp9ikK/kIvZdDpPSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SIYtXNqNp4TOcE0fVQsU2zapVpDEVOyU/16ZHpLuuS0o5TlR2gXFUJQgsGcHGXmJ1
         G2tDqrJ/FuubGxEFWuTiVsu6IHQ3oBkTuN2SipEYU4Yt6exNJWBD/BGS6iNp5U5a6R
         ew1k1cdUse1qXAKjsLyFCsyoLuT7tLMuKxH3oYiP+jOFeCYWwtIAiVMwHHA6PvHOvz
         761+63+r9VJ6/ssMSZ0f9CbsiE/jKdQ8dUiUjdCRE2cr9F07hnCs8g1uLzY16SJvAC
         YsOPMxoKALehKSafGcqolVelHI3vyS8g3U/agld4iNfshKNW1AhnYv5XP3tWLZROYj
         R3t+WCVXj3QGg==
Date:   Thu, 15 Jun 2023 00:32:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
Message-ID: <20230614223239.zhatso7csepakq4f@intel.intel>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sat, Mar 04, 2023 at 10:36:34PM +0100, Heiner Kallweit wrote:
> Here we don't have to write SMBHSTCNT in each iteration of the loop.
> Bit SMBHSTCNT_START is internally cleared immediately, therefore
> we don't have to touch the value of SMBHSTCNT until the last byte.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7641bd0ac..e1350a8cc 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -677,11 +677,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  	for (i = 1; i <= len; i++) {
>  		if (i == len && read_write == I2C_SMBUS_READ)
>  			smbcmd |= SMBHSTCNT_LAST_BYTE;
> -		outb_p(smbcmd, SMBHSTCNT(priv));
>  
>  		if (i == 1)
> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
> -			       SMBHSTCNT(priv));
> +			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
> +		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
> +			outb_p(smbcmd, SMBHSTCNT(priv));

Looks reasonable to me... Jean, any opinion here?

Andi
