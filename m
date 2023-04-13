Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF90E6E0655
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 07:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjDMFOI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 01:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjDMFNb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 01:13:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC97B8A4C;
        Wed, 12 Apr 2023 22:12:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DE39580CD;
        Thu, 13 Apr 2023 05:12:23 +0000 (UTC)
Date:   Thu, 13 Apr 2023 08:12:22 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Improve error reporting for problems during
 .remove()
Message-ID: <20230413051222.GA9837@atomide.com>
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
 <ZC5qUU4JLI9Negyi@sai>
 <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

* Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [230406 08:23]:
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1525,14 +1525,17 @@ static int omap_i2c_remove(struct platform_device *pdev)
>  	int ret;
>  
>  	i2c_del_adapter(&omap->adapter);
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> +
> +	ret = pm_runtime_get_sync(&pdev->dev);

It's better to use pm_runtime_resume_and_get() nowadays in general as
it does pm_runtime_put_noidle() on errors.

Not sure if there are changes needed here, maybe warn and return early
if needed?

Regards,

Tony
