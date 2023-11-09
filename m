Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8813A7E72E9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 21:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjKIUdu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 15:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjKIUdt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 15:33:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DE118E;
        Thu,  9 Nov 2023 12:33:47 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F1CC433C8;
        Thu,  9 Nov 2023 20:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699562026;
        bh=wGFC9Tw6Oh1SaO7fObpsoz4UYwNyCyVIbizMrP+D3vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cdtJ4Z9YG63eHCeVpsHV8UQsE6dW0Q5IqJ8qaBoiK4qLwAAHRvL37J2cegVzMFeMd
         FOs+WMYtbd+9pc8bg5c8HJ7tU4+KOYAbA6udfgS1n2vl4S5KVqntEwn5M0ByyfbRwT
         JMrPW5Sr8VBmcUZBSO6VDC7fpUFBkegoNzl2QJEmD79wR3P5MT8cGofnpgkXWKGBhD
         cYPKLhfC7HVelaojpaFIOCo10kG8iP5AN66W2k9DibI4HqhFND8g+q+4DMoA3ioNYt
         5RFYxp3JpsxHLoe2fLQQO53RLfyLtmUHTWHFsIe/aG+7e14hCzIb9V76DkYB3CEmVZ
         RXEIiwFEwozww==
Date:   Thu, 9 Nov 2023 21:33:42 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 01/12] i2c: designware: Replace MODULE_ALIAS() with
 MODULE_DEVICE_TABLE()
Message-ID: <20231109203342.oee7alp74qmdi7ga@zenone.zhora.eu>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
 <20231109182823.3531846-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109182823.3531846-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, Nov 09, 2023 at 08:19:11PM +0200, Andy Shevchenko wrote:
> As Krzysztof Kozlowski pointed out the better is to use
> MODULE_DEVICE_TABLE() as it will be consistent with the content
> of the real ID table of the platform devices.
> 
> While at it, drop unneeded and unused module alias in PCI glue
> driver as PCI already has its own ID table and automatic loading
> should just work.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
