Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9673B707AE7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 09:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjERHba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 03:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjERHb3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 03:31:29 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8EB213A;
        Thu, 18 May 2023 00:30:09 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7F2251BF204;
        Thu, 18 May 2023 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1684394930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6/pMkDHqpQee7Q5QnzaROcishnayyd/TZbSD01jovy8=;
        b=Tx7Z33B3eVZShtKikhLKhfxKEn0I3M0zPi6qXKlztvv0WPqWAUnDaTGJ/vuKHs+/5YQ9MR
        dUhfbCwqVN+7iXFC4I1x+qhAAdkMj+073xPwYtjpzOFNfsGcYJZRAhwll5VmEyRnKI+O9c
        7KCWfqBtXqrUbC6bsTE0Ysih9q1tgPc9hu9J5ldSdgidhf7Inr5oCuNsJMY4lEfuizt6YS
        ay/in2/LvjycUMlmTIIXeJjhS9uZ2KF9Q7vfyd3yWrgjSS+Rsm7bNCsIMvgMs8VXIy2DpI
        1iygqIKW5xgKTvf19jdlDw+mP1d+cjWhbPzC8XNJw0727qxXe4y8gRM2dpIDYQ==
Date:   Thu, 18 May 2023 09:28:46 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jean Delvare <jdelvare@suse.com>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Justin Stitt <justinstitt@google.com>,
        Yuan Can <yuancan@huawei.com>,
        Dan Carpenter <error27@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] misc: Switch i2c drivers back to use .probe()
Message-ID: <20230518092846.2012482c@booty>
In-Reply-To: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
References: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Thu, 18 May 2023 00:01:35 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> While touching these drivers, fix alignment in apds990x.c and bh1770glc.c.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

It's finally happening, thanks! \o/

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
