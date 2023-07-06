Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7D47493DF
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 04:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbjGFCue (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 22:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbjGFCud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 22:50:33 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A241BD2;
        Wed,  5 Jul 2023 19:50:32 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QxLXz5JKjz67Q0T;
        Thu,  6 Jul 2023 10:47:31 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 03:50:29 +0100
Date:   Thu, 6 Jul 2023 10:50:25 +0800
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 17/23] i2c: pxa: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706105025.000017ce@Huawei.com>
In-Reply-To: <20230705204314.89800-18-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
        <20230705204314.89800-18-paul@crapouillou.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.206.101]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed,  5 Jul 2023 22:43:08 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Note that the behaviour is slightly different than before; the original
> code wrapped the suspend/resume with #ifdef CONFIG_PM guards, which
> resulted in these functions being compiled in but never used when
> CONFIG_PM_SLEEP was disabled.
> 
> Now, those functions are only compiled in when CONFIG_PM_SLEEP is
> enabled.
> 
> Also note that pm_sleep_ptr() has not been applied to each callback
> in the dev_pm_ops structure because the pm_sleep_ptr() at the usage site
> is sufficient.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

