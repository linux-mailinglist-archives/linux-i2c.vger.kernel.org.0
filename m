Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8717E7304
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 21:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjKIUlr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 15:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjKIUlq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 15:41:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48CE4239;
        Thu,  9 Nov 2023 12:41:44 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188CCC433C7;
        Thu,  9 Nov 2023 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699562504;
        bh=ZKWmIs3QO39GuQ+9DOOvzD0QflUg/LDgD8XLmIHzfg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iO/gI4EGKu2Y6z+qQt1sa+HdMpbzqwqfoV0jjs5lvHVafWki28/xOxf9U/oIMHxBh
         mNDXnWzrLrBiJT+VXv7CnsA+bEqMFYFATTFmhx2sRnGXenfbCLbxbfNoMOPoVCkKZh
         uDHc2edXmAzB1FtVPrYgzxNw4lEMd03NTFSzXpH0SenyFKpQwMO+aDwDI0zrqXc7Ss
         X1LTljX2IzAnfdZ11rv5ZzE4PyXkVr+jfjPtpr5eDISKrYiytimMFtj5s+XiENYt2F
         8I1AsdpcaS/0495xaJwEDgxd1J4dzqfGX895e9dj5iWjH2igXiKukdokxI6QtWu5dB
         wn1C/HyS0ILxA==
Date:   Thu, 9 Nov 2023 21:41:41 +0100
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
Subject: Re: [PATCH v2 05/12] i2c: designware: Rename dw_i2c_of_configure()
 -> i2c_dw_of_configure()
Message-ID: <20231109204141.6awu722ngjdcs3sx@zenone.zhora.eu>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
 <20231109182823.3531846-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109182823.3531846-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, Nov 09, 2023 at 08:19:15PM +0200, Andy Shevchenko wrote:
> For the sake of consistency, rename dw_i2c_of_configure() and change
> its parameter to be aligned with the i2c_dw_acpi_configure().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
