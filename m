Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11FA170EFBA
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 09:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbjEXHn7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 03:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239918AbjEXHn5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 03:43:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA2F1A8;
        Wed, 24 May 2023 00:43:48 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 053FA22435;
        Wed, 24 May 2023 07:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684914227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m23zQd722rFvXAhBGJs8LPiDmoALgown5nmTI8wZCyE=;
        b=AMcYtBSGTyukaFhARs5QWXPuXXZ1EJgnXMFjsQQDcLhz2AaIBNRZeWAJc/Cm4cF005lKVF
        WyYlRR7rSiCgQvPl0CG7JUXXkn4AJWX2u4aQqbotGfJbLEbSK0AqPTOkQLUImic/KiMaQ0
        5DrxxJDies1ktO+xe1wNeelZzLCR4dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684914227;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m23zQd722rFvXAhBGJs8LPiDmoALgown5nmTI8wZCyE=;
        b=8VQzQ1WnYs/uW23z078iBZUmUk5PmBAsJech/nFhLPH6X8LVStwWh9aAWQ02pIHang1HFq
        rfWRm/ByEgRznFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3258413425;
        Wed, 24 May 2023 07:43:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Qb20CjLAbWSVRgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 24 May 2023 07:43:46 +0000
Date:   Wed, 24 May 2023 09:43:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Eric Piel <eric.piel@tremplin-utc.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Message-ID: <20230524094344.44baaf45@endymion.delvare>
In-Reply-To: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
References: <20230517220135.170379-1-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 May 2023 00:01:35 +0200, Uwe Kleine-K=C3=B6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> While touching these drivers, fix alignment in apds990x.c and bh1770glc.c.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> I used v6.4-rc1 as base for this patch, but it also fits on top of
> today's next master. If there are some conflicts when you apply it, feel
> free to just drop all conflicting hunks, I'll care about the fallout
> later.
>=20
> I chose to do this in a single patch for all drivers below drivers/misc
> If you want me to split it, just tell me.
>=20
> Best regards
> Uwe
>=20
>  drivers/misc/ad525x_dpot-i2c.c         | 2 +-
>  drivers/misc/apds9802als.c             | 2 +-
>  drivers/misc/apds990x.c                | 4 ++--
>  drivers/misc/bh1770glc.c               | 4 ++--
>  drivers/misc/ds1682.c                  | 2 +-
>  drivers/misc/eeprom/at24.c             | 2 +-
>  drivers/misc/eeprom/ee1004.c           | 2 +-
>  drivers/misc/eeprom/eeprom.c           | 2 +-
>  drivers/misc/eeprom/idt_89hpesx.c      | 2 +-
>  drivers/misc/eeprom/max6875.c          | 2 +-
>  drivers/misc/hmc6352.c                 | 2 +-
>  drivers/misc/ics932s401.c              | 2 +-
>  drivers/misc/isl29003.c                | 2 +-
>  drivers/misc/isl29020.c                | 2 +-
>  drivers/misc/lis3lv02d/lis3lv02d_i2c.c | 2 +-
>  drivers/misc/tsl2550.c                 | 2 +-
>  16 files changed, 18 insertions(+), 18 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
