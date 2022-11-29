Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57C663C3ED
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 16:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234781AbiK2Pji (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 10:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbiK2Pjg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 10:39:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507981CB0C;
        Tue, 29 Nov 2022 07:39:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1930617A5;
        Tue, 29 Nov 2022 15:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B46DC433C1;
        Tue, 29 Nov 2022 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669736375;
        bh=3WvpfKAMMBXTqgD9OElc2LMfZiGvyFTgYTlwBSpfPUA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=c9q1ApteullDnEXtba85UEGzFJ5a/cjyrIbSsgP3eENCfn7eovuS5qxLAvcB+bVBE
         rJ4wTjQKWkiemyXd0GXENy+T1bg6BaqE5yvNaafX/JiCrby6WAkFdVA5Ky4haHXMTL
         u9QbnI3J60WuMxrPVAunA0oUt84VwSPgz3blJKYvTP0i8TUamEIxm31NbJhOyOL1OH
         7FTefHvFJYHOiS4Q3AgaixZh5zbSf5cWSqdzXVpU24tmvUZZ31zz0lg/QYeL1/HYIe
         8naJaG677gMStMZtpR6NuTOgWB5Itn3oXOWIV5NPJRjnfOpAE9rAuQVpN9cw/WKCBa
         KjXkzNw2i3dLA==
Date:   Tue, 29 Nov 2022 09:39:33 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Takayuki 'January June' Suwa <jjsuwa_sys3175@yahoo.co.jp>
Subject: Re: [PATCH] HID: mcp2221: Fix GPIO output handling
Message-ID: <20221129153933.GA716319@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104220223.293253-1-lars.povlsen@microchip.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+cc Takayuki, thanks for your report!]

On Wed, Nov 04, 2020 at 11:02:23PM +0100, Lars Povlsen wrote:
> The mcp2221 driver GPIO output handling has has several issues.
> 
> * A wrong value is used for the GPIO direction.
> 
> * Wrong offsets are calculated for some GPIO set value/set direction
>   operations, when offset is larger than 0.
> 
> This has been fixed by introducing proper manifest constants for the
> direction encoding, and using 'offsetof' when calculating GPIO
> register offsets.
> 
> The updated driver has been tested with the Sparx5 pcb134/pcb135
> board, which has the mcp2221 device with several (output) GPIO's.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  drivers/hid/hid-mcp2221.c | 48 +++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 0d27ccb55dd9..4211b9839209 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c

> +/* MCP GPIO get command layout */
> +struct mcp_get_gpio {
> +	u8 cmd;
> +	u8 dummy;
> +	struct {
> +		u8 direction;
> +		u8 value;
> +	} gpio[MCP_NGPIO];
> +} __packed;

This bug report: https://bugzilla.kernel.org/show_bug.cgi?id=216736
suggests that direction and value may be reversed here.

Mentioning here in case nobody actively monitors the bugzilla.

Bjorn
