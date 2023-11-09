Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD327E72EF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 21:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjKIUf0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 15:35:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjKIUfZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 15:35:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA74418E;
        Thu,  9 Nov 2023 12:35:23 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3770BC433C7;
        Thu,  9 Nov 2023 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699562123;
        bh=jzsd4MIvNVY9dl4NFb5UjgQBZ0k/kEKxhUzxeOgefR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uG5CSq1DTl1Xn5jwDDJWmRUFPpYBrDB3JjkW7lkK04Frd9Yz7AD4Dg8YUeF8pKcLr
         arduEBSNDPwJ1BV2cVXUHRAzz0hMX8CUmSM3WspcY+iXJ+F63Id6lTwQXa2E4/rL5B
         YzzlcjTZAC4wLLm+lzBnjmWxUpMS/96ARSY3Vi5/5Z7dzjfPxfOWQifZZ7K4M0dyCz
         Xt5lvbkMbbyG5N9RkYcbhTTwNDxLHHMF8LsZSIqcN/SC927LhH7tl81dVIHQbEnzRP
         Ura6Wdp02ARlHP18C8UrubcR7vSA7DAXwMc83e6ww8hvM7c3x128YNgmXWh2tcaoZ1
         rSyLmhBZyDJBw==
Date:   Thu, 9 Nov 2023 21:35:20 +0100
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
Subject: Re: [PATCH v2 03/12] i2c: designware: Drop return value from
 i2c_dw_acpi_configure()
Message-ID: <20231109203520.23zpkgy2ukdzaoop@zenone.zhora.eu>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
 <20231109182823.3531846-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109182823.3531846-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, Nov 09, 2023 at 08:19:13PM +0200, Andy Shevchenko wrote:
> i2c_dw_acpi_configure() is called without checking of the returned
> value, hence just drop it by converting to void.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
