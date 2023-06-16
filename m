Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F417732545
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 04:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjFPC25 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 22:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240805AbjFPC25 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 22:28:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655252719;
        Thu, 15 Jun 2023 19:28:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1E6961E82;
        Fri, 16 Jun 2023 02:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2388AC433C0;
        Fri, 16 Jun 2023 02:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686882533;
        bh=RG8zJOEs5zwd79CJ7/rRYIW8iSFBbt2yZjsLRR44/Ds=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Jnigvh48ioCT4S/0MC1vFMpJHfdLm8PGTUEye27uKyB8cCLz3qbqMakJ+6V9jCXQM
         mlii/TlrjLjIGKvx4qQLenpoPjTe6Fs4KrqfwdJIfOvM3R95CFnN/kCim8ce6hnQJn
         61duih8f5lnaUJ8Fr0M+dqkUUsZpqdhYTXx6VjZyiyrdxhmHut4h7jkjlgAg68Ta0o
         OZp/3q2p/iCs7HJl2er5TlvtsABkGmsXWGjZpaBrSOOHyVn4gLTcS4NZ5jBY1y7vQa
         /iXvf8RF4uXr+BPGo5IiK9mYEK3NhvtcQv/RQRMT19JeRl+jaD96N87/hKXWmKcc0K
         6IbkMxHhMlBkg==
Date:   Thu, 15 Jun 2023 19:28:51 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Andreas Klinger <ak@it-klinger.de>,
        Marcin Wojtas <mw@semihalf.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, netdev@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v7 0/9] fix fwnode_irq_get[_byname()] returnvalue
Message-ID: <20230615192851.6fc01998@kernel.org>
In-Reply-To: <2023061553-urging-collision-32f8@gregkh>
References: <cover.1685340157.git.mazziesaccount@gmail.com>
        <20230530233438.572db3fb@kernel.org>
        <2023061553-urging-collision-32f8@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 15 Jun 2023 13:37:17 +0200 Greg Kroah-Hartman wrote:
> > What's the merging plan? Could patch 1 go to a stable branch=20
> > and then driver trees can pull it in and apply their respective=20
> > patches locally? =20
>=20
> I'll take patch 1 now, and then after 6.5-rc1, Matti, can you send the
> cleanup patches to the respective subsystems?

=F0=9F=91=8D=EF=B8=8F=F0=9F=91=8D=EF=B8=8F
