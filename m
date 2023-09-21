Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A197AA3C9
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 23:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjIUV6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 17:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbjIUV6P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 17:58:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947FA5B8D7
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 13:52:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61F9C433C7;
        Thu, 21 Sep 2023 20:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695329530;
        bh=J1aOkpmuohXSUINq9LqWWlF3yp91ubxz+AP1gZ3+Wbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fOzWn2ff720dJSEjOydbBf5jHkUR0Ro8nmYvtu8b3A62Z03BlitfHen3xUvRR0T4o
         0DU8kSuDzBiijWP/7hQWNo/woXCm9zu/NLKhTO7cYUxsp6kpgYL5PeYxf+tQCWHh3w
         kyqloWR32jnTnktHPaNSYFvlGmb3HqQFmsCma5g32poPMOQG7NY6EUgtItI7UYDFph
         rq6DyK48GGTprh2nIqz9FRk4HLWq1JuVC0GoOt5YlIHVRlTlnnX9BtNQYeWwksKL6+
         zbDJaiPxAvi0DV9A951EPvQJmUCFvNIVCYpQ2ApBUhaGeatSlc7x6cV75GU0NfQnBd
         Qp9P6bfDSRevQ==
Date:   Thu, 21 Sep 2023 22:52:05 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RESUBMIT] i2c: i801: replace acpi_lock with I2C bus lock
Message-ID: <20230921205205.cndrvknokklhoxpl@zenone.zhora.eu>
References: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Wed, Sep 20, 2023 at 09:33:01AM +0200, Heiner Kallweit wrote:
> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
> calling the smbus_xfer callback. That's i801_access() in our case.
> I think it's safe in general to assume that the I2C bus lock is held
> when the smbus_xfer callback is called.
> Therefore I see no need to define an own mutex.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
