Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6920A785A36
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 16:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjHWOQm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 10:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbjHWOQl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 10:16:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAA3E6E;
        Wed, 23 Aug 2023 07:16:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 741C5661C1;
        Wed, 23 Aug 2023 14:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F02C433C7;
        Wed, 23 Aug 2023 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692800184;
        bh=9bA99h/jxRYCaVy16pLVKDg+NSIVHEcnxWPz9OMtQ9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZCsRNNCQnsxhoYzmmmBAnFpblgltYa9IWOCWC/OQqAf8Lvvj1AIuxuQ+8CvvGlzys
         CwIErTmMmjMwhc+H8YsQbpTR4blFAbtlmQoCCkTKYopwskT7aGZrFaKeqOtBtmw5wp
         bcz+cvFZIrTbmXA9S54cHSgYdxLSW+FKYFdGSkzzSc9M8k9BuSkye6oQEXeDTZLI5o
         USdV6Ry5aYwqKK8coeizCbLPn/Kk21OzLhLbH7vNBjV46FYo34idHwgy011o2RkiWA
         H7RbXm0BVXm9sgqzzk99FXPtMtoEKpqcrRcKD+MOhY7lW6wjTeiFSMNFYYJct8737S
         Rk55TDFDp7byQ==
Date:   Wed, 23 Aug 2023 16:16:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v16 4/4] i2c: muxes: pca954x: Add regulator support
Message-ID: <20230823141620.4pduysyal7ayzklt@intel.intel>
References: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
 <20230821062027.2631725-5-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821062027.2631725-5-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Mon, Aug 21, 2023 at 08:20:24AM +0200, Patrick Rudolph wrote:
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

you forgot:

Acked-by: Peter Rosin <peda@axentia.se>

Adding it for b4 and patchwork.

Thanks,
Andi
