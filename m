Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726EC5988DA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245652AbiHRQ0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344984AbiHRQZ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:25:56 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7DA0C6CFE;
        Thu, 18 Aug 2022 09:24:23 -0700 (PDT)
Received: from localhost (p54b336f9.dip0.t-ipconnect.de [84.179.54.249])
        by pokefinder.org (Postfix) with ESMTPSA id 4FE08A40FD0;
        Thu, 18 Aug 2022 18:24:22 +0200 (CEST)
Date:   Thu, 18 Aug 2022 18:24:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] i2c-mlxbf.c: bug fixes and new feature support
Message-ID: <20220818162421.sh6db7mozl4qf25b@the-dreams.de>
References: <20220816225412.9095-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816225412.9095-1-asmaa@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

> Bug fixes:
> 1) Fix the frequency calculation
> 2) Fix incorrect base address passed during io write
> 3) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
> 4) Support lock mechanism

If possible, the bugfixes should all come first so they can easily be
backported. Also, they should have a Fixes: tag where possible.

If the above is possible, can you reorder, add Fixes tags and resend?

Happy hacking,

   Wolfram
