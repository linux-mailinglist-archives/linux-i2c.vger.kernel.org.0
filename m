Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55057B7020
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 19:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbjJCRnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 13:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjJCRnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 13:43:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADEDAB
        for <linux-i2c@vger.kernel.org>; Tue,  3 Oct 2023 10:43:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595B4C433C9;
        Tue,  3 Oct 2023 17:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696355020;
        bh=TtGIT3HnaKhF123hsa/A1tMszPSeMVFwMu7a0xT7A58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cD41OClAs2MLtxyqcLUIEGAIAwKOFwmHDbXF2xBFodOS9rMQKW9Si1iJ50WkLlvsD
         1kTZWIEpvASLHgyKiVPe9FIxv98AV6YmZ8iSDzOUGkEurhE1zdqBT08Zgpn/pZGzwa
         RF23BmpYIwcixl3sQ1sUn7ggPwQuzRJRL8LX9XDWWES3nt+s/5kbgJ4tvR80+dYLZh
         xWU3pQaNm10tx/Kc92FT3iM48M8gS/uZiuD3nykCs1w/eBZn5wV6TghPpXf3q7R2EQ
         ZtZEWJTzzvxIn8+x2IYwE0XeaG0Lh9asxU0zckzIEg9CtXLvCF+V9gUwajXJKcstHE
         z4G6nGORZ596A==
Date:   Tue, 3 Oct 2023 19:43:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Birch Stream SoC
Message-ID: <20231003174334.yr3plg77rqyhytvj@zenone.zhora.eu>
References: <20231002082804.63339-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002082804.63339-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Mon, Oct 02, 2023 at 11:28:04AM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Birch Stream SoC.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
