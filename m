Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122667624B9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 23:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjGYVqC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 17:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjGYVqC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 17:46:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98E91FEB;
        Tue, 25 Jul 2023 14:46:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EBCD6179A;
        Tue, 25 Jul 2023 21:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52087C433C8;
        Tue, 25 Jul 2023 21:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690321560;
        bh=j12DudDiurQZ7wG1+ynBYUqP1rT+XqdeB+3/wYCIb5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bVM88IDd/e9pL7GyNfNrNcpvNCr3e0FhEpmoEfa9C5qDqdEfLkdyKQx99pq6y1Jm1
         RRrU5X8P4PGj0ffBJoez/ONmu7rBBMLdQwGbWhzy0pZ7CVrxALlznXT5uJdLl0/3if
         zhNhLrEhdlefahIR91ePVE2x6wU5mI2+xXRM/514s42LYKTAicx8g6ToZeCeZIsvz8
         v4AKMurEGRd6e5Z8H2wAFeMqDFAqc9zPNhJj4CxDIyS88qjuqcV2fn+RR1R7lsj+rk
         MDJlWVgEnDU7ucndqaj2Xn/ybW0NXUkXWPQsgmEaVG3FvyllB/5O3jqyO1Jjvvk5Tk
         hKaavDH1aOlYw==
Date:   Tue, 25 Jul 2023 23:45:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 2/9] i2c: designware: Change i2c_dw_acpi_configure()
 prototype
Message-ID: <20230725214552.obgntuttotbj6igz@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725143023.86325-3-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jul 25, 2023 at 05:30:16PM +0300, Andy Shevchenko wrote:
> There is no point to have it being int and at the same time
> it may take struct dw_i2c_dev pointer instead of plain device.
> 
> Change the prototype and implementation accordingly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
