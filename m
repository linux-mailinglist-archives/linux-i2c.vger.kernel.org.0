Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8E47A68CF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 18:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjISQYz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 12:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjISQYy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 12:24:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED17FA1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 09:24:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B72C433C8;
        Tue, 19 Sep 2023 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695140688;
        bh=E9SPSjFdOX2tAZmLydBA3wAJ3HloLLpRaLrxDjRKL8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GcyoHWniO2tajOSdGTC/WlZjNNNAo3pRiAMyCf6ZDseupmhYajtXpKyX4RSuawCxp
         V9LkMq9qHq6SfOCcBfRxm+1piy5gcT12aPGREWZd6s+Dcn1zoYSWh8212GaOio+87D
         QnbHgDpSogXNESygYtTa8PfsOlB2qB1rZzmwS4lacSCVMSzFp+wFOCE/EmAX1HGPFQ
         7E6NczSl5fa02LGLYtI100Q784CdX05M6gSYv63Hp3WoNEbcu9zjOXqcsgInFXGCLg
         OMo/MgzUXeGkwUvWYhemiExwRlruRj8O3igaXmaXohUyD8EI+Gr6fmpI74XCny3LBg
         Xkyvzfo/ZunqQ==
Date:   Tue, 19 Sep 2023 18:24:42 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: simplify module boilerplate code
Message-ID: <20230919162442.74ltlcrjihr2f6g2@zenone.zhora.eu>
References: <2f01722d-bb57-4645-8995-4bfebafe41ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f01722d-bb57-4645-8995-4bfebafe41ea@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Mon, Sep 18, 2023 at 02:16:58PM +0200, Heiner Kallweit wrote:
> Simplify the module boilerplate code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
