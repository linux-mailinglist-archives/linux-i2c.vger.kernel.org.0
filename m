Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F9A7626FB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 00:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjGYWlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 18:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbjGYWlD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 18:41:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AE66A7F;
        Tue, 25 Jul 2023 15:35:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CEBC561924;
        Tue, 25 Jul 2023 22:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A67C433C7;
        Tue, 25 Jul 2023 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690324418;
        bh=/afpJPuPiv9orEg3GS3va/jozsy1NKzMmzbTKAx6uog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4mzAwTQOvszvgxVSbGfFEYzy7KeSop+CExQiHaPfXvCp7fEPkmuqh1gEiUcPxeqi
         Y/3ToTnGT0WH6IUKwpoPBCgO2Fp7PVKl2XI0PkRyfbVeSIiMbK+pFZHymBvgMSks5h
         3NfNnFniwo0h45cADdG51MGsU3/4LaP6/SixekOvVscQo28SYyGv12iTUwq+cJdXIx
         0rO3a9qdr2fqudpZ29ehLFo+0r2ksuziYFRAEeuv/ASouDOUOe7Jul0TWISvjst+pP
         uWNa2x8picpAY6Pttx5AKXCM3LWXvpayHZcGHuAvzvwLIa01yeNstN5wwcmdbX/Enm
         SH1zSlu7X3zew==
Date:   Wed, 26 Jul 2023 00:33:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Message-ID: <20230725223335.mzgdgr7qgeyc6hj7@intel.intel>
References: <20230705234501.4153224-1-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705234501.4153224-1-aryan.srivastava@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Aryan,

On Thu, Jul 06, 2023 at 11:45:00AM +1200, Aryan Srivastava wrote:
> Add support for block mode read/write operations on
> Thunderx chips.
> 
> When attempting r/w operations of greater then 8 bytes
> block mode is used, instead of performing a series of
> 8 byte reads.
> 
> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

thanks for your patch, could you please run checkpatch.pl,
clean it up a little (e.g. comments like /* A */) and resend it?

Thanks,
Andi
