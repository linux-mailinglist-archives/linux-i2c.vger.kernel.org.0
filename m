Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CFE7D94A4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 12:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjJ0KEn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 06:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbjJ0KEm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 06:04:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D314110E;
        Fri, 27 Oct 2023 03:04:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5F7C433C7;
        Fri, 27 Oct 2023 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698401080;
        bh=X1m0OJsiKq8W+mLk4QFSXEI1ayfmxsutz70lNJq99ZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PU/GOkvlWnmpWmMIPEnqKx19IZXJwl52dUZnaHIg6j96BmTRrGt46BYrDRcNGtt/J
         Ec45BU5elFc+/TPXBFh7RvlaAcW40q6jJJNBRGENz/Wt0/A0lDXwDaX7+RPDC94Zld
         xb2Y9lEkTPOll7xD9oTGL/B6lzH1FhN2eTy0HVIJS4sWMSJy/jrocjAZ3m02IuJ6vo
         pnkyeULH53g8db/QTNEYnFJcNuDD7+ubD7lgeq8KTKB1mp6MKxnqMgNzRRd4NKekfQ
         gx2rNmmzkBXxWCInckhNzRXRgIyYg4eq2zJnp9amjqW32TMR7/8mJB0CFH4x8rawmA
         zi2zT0UuTBy9Q==
Date:   Fri, 27 Oct 2023 12:04:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: axxia: eliminate kernel-doc warnings
Message-ID: <20231027100435.2u2uuaue4nnyxttv@zenone.zhora.eu>
References: <20231026053918.17347-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026053918.17347-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Randy,

On Wed, Oct 25, 2023 at 10:39:18PM -0700, Randy Dunlap wrote:
> Add kernel-doc for 'slave' and 'irq' in struct axxia_i2c_dev.
> Drop kernel-doc notation ("/**") for static functions since they
> are not usually documented with kernel-doc.
> 
> Prevents these kernel-doc warnings:
> 
> i2c-axxia.c:150: warning: Function parameter or member 'slave' not described in 'axxia_i2c_dev'
> i2c-axxia.c:150: warning: Function parameter or member 'irq' not described in 'axxia_i2c_dev'
> i2c-axxia.c:172: warning: Function parameter or member 'ns' not described in 'ns_to_clk'
> i2c-axxia.c:172: warning: Function parameter or member 'clk_mhz' not described in 'ns_to_clk'
> i2c-axxia.c:172: warning: No description found for return value of 'ns_to_clk'
> i2c-axxia.c:271: warning: Function parameter or member 'idev' not described in 'axxia_i2c_empty_rx_fifo'
> i2c-axxia.c:271: warning: No description found for return value of 'axxia_i2c_empty_rx_fifo'
> i2c-axxia.c:303: warning: Function parameter or member 'idev' not described in 'axxia_i2c_fill_tx_fifo'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202310181049.Vo62moV1-lkp@intel.com/
> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
