Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE728770ABB
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 23:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjHDVW2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 17:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHDVW1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 17:22:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945F7B1;
        Fri,  4 Aug 2023 14:22:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 885C1620AE;
        Fri,  4 Aug 2023 21:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE3C433C8;
        Fri,  4 Aug 2023 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691184144;
        bh=t5W4kjKgYtEiCSYYBp8gIyQ/2vGcO2tH4SkTcfX6Rhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cLsVo3exJhae10WNDCBwJOMI1AAvHtc6vK5UEG+q5QOtS+BGzIRuZUtHF85k+8P4/
         oOo/R86OcuCeoavA/UJVolJwkV5hKyOy5YaVYl0BUYBR4Ssx1NT7wkOfS9g1CnShe9
         Eb/ZvWQaIGaf7R36gXCt3n5/4ya7lPghPLK36CVnBcR3TX2PUxF895FNGC5BVZ/CQE
         SKEsRUHrFv47f650hL7s5XRnV2BPWTrOuSyCfUEWasJ29J/HGG6+X/7aJ4+WLKiSrr
         LYvYe32SiA5PLAr0ffegmLUXKc2LJRoU0GdhGe/f7wihlxxFZT5ldhoLovh1efRIg6
         XWhigKwPwJ+NQ==
Date:   Fri, 4 Aug 2023 23:22:22 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 6/9] i2c: designware: Consolidate firmware parsing and
 configure code
Message-ID: <20230804212222.k5qbnv7bamhzpadp@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725143023.86325-7-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jul 25, 2023 at 05:30:20PM +0300, Andy Shevchenko wrote:
> We have two same code flows in the PCI and plaform drivers. Moreover,
> the flow requires the common code to export a few functions. Instead,
> consolidate that flow under new function called
> i2c_dw_fw_parse_and_configure() and drop unneeded exports.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

this is just some code refactoring... didn't see anything wrong
here:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
