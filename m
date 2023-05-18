Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415E1707D21
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 11:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjERJnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 05:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjERJnu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 05:43:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA8F2120;
        Thu, 18 May 2023 02:43:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74B276090A;
        Thu, 18 May 2023 09:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A78FC433D2;
        Thu, 18 May 2023 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684403025;
        bh=s5q5Atssg2PIJLzWkKLBpdqUT9nDeyn3uS1X+z+Shac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MCUkJHNY64CFnB6lp9hV0ctt7QbAAU1AdDj37uGTSyyUIKcFH9m46a87Ei1cGnAHV
         cz5c4+Y9408Bgg3mX7feV8Qnpi1Tq9Y9N7x7t/cbJ3zO5ME5VswZAb6LNTPmB0+jYL
         MpNPSiPqklUmhGkbvKuwCMI1q0Unh+4SQVxapYWOYf4dVjL1cH/VvmqoVX3PxIdG8+
         369GdwIkO6RRUyjXTNYwP515nCEJhJL1FoK0VyBM8+WHFaI6dysDOPsj4pJaspxUil
         Nh7lPTlcMLzg+3tXq4wTDFGlKWk5ffWwOP5y5pSIWRAdqUI45P49Ed0VFh7F2NxLx9
         j4MQo0TyGlo5A==
Date:   Thu, 18 May 2023 10:43:40 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v6 4/5] mfd: tps6586x: use devm-based power off handler
Message-ID: <20230518094340.GC404509@google.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-4-af44a4cd82e9@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327-tegra-pmic-reboot-v6-4-af44a4cd82e9@skidata.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 09 May 2023, Benjamin Bara wrote:

> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> Convert the power off handler to a devm-based power off handler.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)

Do the 2 MFD patches depend on the others?

For my own reference (apply this as-is to your sign-off block):

Acked-for-MFD-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
