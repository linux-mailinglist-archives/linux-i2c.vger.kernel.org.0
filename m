Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED696D3D18
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 08:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjDCGEK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 02:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjDCGEJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 02:04:09 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F1FA5198;
        Sun,  2 Apr 2023 23:04:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AAE9D80A4;
        Mon,  3 Apr 2023 06:04:05 +0000 (UTC)
Date:   Mon, 3 Apr 2023 09:04:04 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Don't do pm_runtime_resume in .remove()
Message-ID: <20230403060404.GX7501@atomide.com>
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

* Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [230403 05:48]:
> So if there is some clk handling necessary before the register access,
> I'm not aware where it's hidden. Is there some bus or omap specific code
> that ensures clk handling?

I think the missing part is that the runtime PM calls in the i2c driver
cause the parent ti-sysc interconnect target module device to get enabled
and clocked before accessing the i2c registers.

Regards,

Tony
