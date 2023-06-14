Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F7A72F0DB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 02:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241309AbjFNAQs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 20:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjFNAQl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 20:16:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7561739;
        Tue, 13 Jun 2023 17:16:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 54DCA63BEF;
        Wed, 14 Jun 2023 00:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11D8C433C8;
        Wed, 14 Jun 2023 00:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686701789;
        bh=kj9Ya7IV2GrY8S1ZmVY2sjyy1iwtpsSoYAouFrgDpLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BUqgYQRYma4PsE5pRtQr/DfNgQmVbQwUn/N1SkJ6TNEuJE9girQHlOuLbAifF3lA7
         Xn4JCt/UTJX2ThcxOnZUrs3jMotcUhYZ1XNitI4tg4e4r/65P4wny11o9pyHJw2yz/
         A/KnfqscJXCVkogfi6WiI6xeooXq4MMEdId2iLG5QDJZgz6ybBVtYF3ZW6rikLUunr
         4ndYgZnqGQmpApXdoi8MeyhxK2+k8AoDIN1lGWlcKr76SfnoVoxC7/ZHl87oZqvn1L
         SUSfvZ3TtSamzsBuZXAxioGNqk+TZH7+HfblfrNTqp6GQb22WgG6gneZAXVtHmGZI7
         uNyw+bRqNrb1g==
Date:   Wed, 14 Jun 2023 02:16:21 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
Subject: Re: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
Message-ID: <20230614001621.iyxi2khz4hmcbl3x@intel.intel>
References: <20230518161150.92959-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518161150.92959-1-mario.limonciello@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

On Thu, May 18, 2023 at 11:11:50AM -0500, Mario Limonciello wrote:
> power_supply_is_system_supplied() checks whether any power
> supplies are present that aren't batteries to decide whether
> the system is running on DC or AC.  Downstream drivers use
> this to make performance decisions.
> 
> Navi dGPUs include an UCSI function that has been exported
> since commit 17631e8ca2d3 ("i2c: designware: Add driver
> support for AMD NAVI GPU").
> 
> This UCSI function registers a power supply since commit
> 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
> but this is not a system power supply.
> 
> As the power supply for a dGPU is only for powering devices connected
> to dGPU, create a device property to indicate that the UCSI endpoint
> is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.
> 
> Link: https://lore.kernel.org/lkml/20230516182541.5836-2-mario.limonciello@amd.com/
> Reviewed-by: Evan Quan <evan.quan@amd.com>
> Tested-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
