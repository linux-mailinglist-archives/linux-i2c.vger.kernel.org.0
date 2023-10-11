Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0C7C559C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 15:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjJKNkV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 09:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjJKNkV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 09:40:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5521290;
        Wed, 11 Oct 2023 06:40:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81759C433C7;
        Wed, 11 Oct 2023 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697031620;
        bh=WJd0NNslx/R8MDlLdtK0DgoE639SCagnJlS/CJ/nngg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GfIdp+fu2pqe40l2QHOwjoK0OAl0SKi6SMhfnkIr3fwoFnetnP8SlejRhqQSN9Lxs
         3HySrI3YqKEk/sg6HDXAMewA8xp7P00iPwQHtyBJcZtXgxsxXSOXpxVHAwwXrmciSw
         Evi6YdpryjdxwwQJNauScywZjfhxcUuIeQLQ6dk/yOh8kQIN6NSv3l/luPVmDwym+t
         xex2IdEx++gMD4QsBteOjLi/LPXSDazTYm9+yDdcvHghKAwg0lDcTURSdj9I11WHP3
         hYBQISWGKDpMkUSerQcXUMyUbVuJA7qVFlay8rnasWil51mnWGdGmE3lvyNvH+1g0q
         nSvTgoKs9AaHQ==
Date:   Wed, 11 Oct 2023 15:40:16 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: brcmstb: Add support for atomic transfers
Message-ID: <20231011134016.gimea3xy2b2qsyow@zenone.zhora.eu>
References: <CGME20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c@eucas1p1.samsung.com>
 <20231006144117.4079796-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006144117.4079796-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Fri, Oct 06, 2023 at 04:41:17PM +0200, Marek Szyprowski wrote:
> Add support for atomic transfers using polling mode with interrupts
> intentionally disabled to get rid of the warning introduced by commit
> 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
> during system reboot and power-off.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
