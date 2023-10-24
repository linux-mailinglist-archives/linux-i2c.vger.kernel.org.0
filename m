Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2087D5C54
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 22:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344155AbjJXUUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 16:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344272AbjJXUUh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 16:20:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A45810C9;
        Tue, 24 Oct 2023 13:20:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD72C433C7;
        Tue, 24 Oct 2023 20:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698178835;
        bh=v9hilV1EOfsvRqh2/AHPVIjpQNl7T70xutch3qWr8xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m7bx9hnDnZV0wyshh0v7/9x3P0ZiifuQbeUNkAo+np7fLiPZ9LB/mK89RYWBxxAhW
         oloWeUTLwoGGIcm7ns0FY3PLK/hAzso5FnVEheVjTZMzqtZ8ftdmt9cGQYshij8m4E
         4ZN4i6wz0dwe9QKCDZsDhfbgqzZhFNW6F9NUUNjxVKGR97CGckP8UQFi3dSmq8sZXy
         qM+fyhnIX+Ah1X1aGZxaa2Jz1i/9FCpdmqjDfQm5Pak3ck/ey0yFeIDlDQfve0V4Lu
         yOEQcdfhspfg4lF1oOvuZmCo3rr6ZotPXpW7GeCScERO9UWc1Y3cUb2Vr2WUIrXwUd
         w+qufdCRed7UA==
Date:   Tue, 24 Oct 2023 22:20:30 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Move system PM hooks to the NOIRQ phase
Message-ID: <20231024202030.o3pyswa4css5lnwr@zenone.zhora.eu>
References: <20230717203857.2626773-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717203857.2626773-1-samuel.holland@sifive.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Samuel,

On Mon, Jul 17, 2023 at 01:38:57PM -0700, Samuel Holland wrote:
> When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
> the regmap-irq code must be able to perform I2C transactions during
> suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
> be suspended/resumed during the NOIRQ phase.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

I think this patch has failed to receive some comments, I'll go
ahead and give it my blessing:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
