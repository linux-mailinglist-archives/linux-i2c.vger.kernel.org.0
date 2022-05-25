Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2DB533E1F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 15:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbiEYNn5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 09:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244563AbiEYNny (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 09:43:54 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A04AB0D0
        for <linux-i2c@vger.kernel.org>; Wed, 25 May 2022 06:43:45 -0700 (PDT)
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 72A5C240002;
        Wed, 25 May 2022 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653486223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=esBJ+U3nJdS9HxfOFI05OPRrJdjtBdJnX/ZjzrtnbLY=;
        b=OYn2lwZe0+PSqeo4PIAKcJV9M2fAjqtCPEFrjTvbrnZ6Tmms3m3cGhzc9Gb92INfeb2TI3
        rW0XcBJSQZfSkAXhuslcpFMZSgJEuYE4IBi+aI1Nh6bHMPJgEgMv3bHGBtvtHb81Pb1+ze
        LCzatjkTNezhIxXxUwxNBrahaQSO2tRDBjRLYYvTpDIkDZ8dkXqte+iBxK8dZNXP44LYEu
        UmLMki1GHZr1SNLjqPj7RAmEnBKXHbypUTtXNw4pitMo7p3yAVxzxZSFaS8WFdHQoDZCMW
        FQlATOYG9vh/e/e4KRU9aa8xXybWNCRp0I4srnJeiPie44Z6GJYa302lqkaXlw==
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] i2c: mv64xxx: Add atomic_xfer method to driver
In-Reply-To: <YoiIOcmeOnbPIafh@shikoro>
References: <20220330171657.9039-1-macroalpha82@gmail.com>
 <YoiIOcmeOnbPIafh@shikoro>
Date:   Wed, 25 May 2022 15:43:43 +0200
Message-ID: <87mtf5ybg0.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@kernel.org> writes:

> On Wed, Mar 30, 2022 at 12:16:57PM -0500, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>> 
>> Add an atomic_xfer method to the driver so that it behaves correctly
>> when controlling a PMIC that is responsible for device shutdown.
>> 
>> The atomic_xfer method added is similar to the one from the i2c-rk3x
>> driver. When running an atomic_xfer a bool flag in the driver data is
>> set, the interrupt is not unmasked on transfer start, and the IRQ
>> handler is manually invoked while waiting for pending transfers to
>> complete.
>> 
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> Gregory? Looks reasonable to me.

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
