Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0967E72F7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 21:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjKIUgZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 15:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjKIUgY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 15:36:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2741A5;
        Thu,  9 Nov 2023 12:36:22 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D06C433C7;
        Thu,  9 Nov 2023 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699562182;
        bh=ykI1M3Me0gSHx/3nHop/0516aEoooudy4vo7MCNgpfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cDITedTMpGWAZ7wVz/EIy/OxxBXN7W1PcZo3TImDGaDY8cvCmJ/ETmXlC22kGSpRy
         QxTZZqj24ktswpYfSaCxVBiQ9NuOIhDcnhFDSt+UodG+12FDrTWAR/owzXDe8zNaIc
         10nFL1ee1BP2cmFrIrON+fHee67GvbE4bbd6mifiih9zcMHMxgfR24lWorg3KsYAjC
         yD9SW4XGV41EWaIjCkRcXFpWcsZIQB3LnIIbpCA7gSkGuF1JA/hJj/fbJODGdpOL3O
         EcYel8S14G1lm4ijuQOEccFijHNWof5apgj7K0XE+KZcX7RvjroyHKrxxWmJH4yD5T
         U/nniCfSndz9g==
Date:   Thu, 9 Nov 2023 21:36:18 +0100
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
Subject: Re: [PATCH v2 04/12] i2c: designware: Drop return value from
 dw_i2c_of_configure()
Message-ID: <20231109203618.wln4tdn5sfiatt22@zenone.zhora.eu>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
 <20231109182823.3531846-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109182823.3531846-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, Nov 09, 2023 at 08:19:14PM +0200, Andy Shevchenko wrote:
> dw_i2c_of_configure() is called without checking of the returned
> value, hence just drop it by converting to void.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
