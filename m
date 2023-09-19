Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8C17A6909
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 18:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjISQe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 12:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjISQe7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 12:34:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870ECC9
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 09:34:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CE4C433C8;
        Tue, 19 Sep 2023 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695141293;
        bh=UR5mb3z3r9h7jD3CkTy9NjvCDyjphlr/wrg9+WUyiAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=COIQ8tVCpDls2HSj0JJkMe7A//DdjvhjTg4XiG4Rw4HB2iQ7D5X9FHyQADIC4bWBR
         JserVjgdJiKu+pO3r0w5DXoar72elF5nkPYL9r6g6CZqlVEUQRTZrEQPJYH0N5vBTV
         WP5qPmbTfef025K7gSX4w1vTohxaNckSbJXe1dsGBQvl4DjTAz36ryKv19NTreZmet
         898o42MCjlCfi5lkN94SgaMxsYyx+fNep+vVbhkQJ3tz0JyFP0iGTQrNDhuEeEgF4G
         Rx9meGNxTj4niXyUi4qZPNCXYvfC3k6EKcILVmBlTJrnwCSDG74WR3Lt+apkA0zcvJ
         vYODPPVIxBYfw==
Date:   Tue, 19 Sep 2023 18:34:47 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: add helper i801_restore_regs
Message-ID: <20230919163447.7xk2igq6xz3ikvve@zenone.zhora.eu>
References: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
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

On Mon, Sep 18, 2023 at 01:57:01PM +0200, Heiner Kallweit wrote:
> In few places relevant registers are reset to their initial value on
> driver load. Factor this out to new helper i801_restore_regs to avoid
> code duplication.
> Even though no actual problems are known, this patch may contribute
> to avoiding potential issues by:
> - restoring register values also in the error path of i2c_add_adapter
> - making restoring registers the last step (especially in i801_remove)
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
