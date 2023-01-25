Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD54567BFA6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 23:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbjAYWMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 17:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjAYWMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 17:12:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E970F5CE53;
        Wed, 25 Jan 2023 14:12:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 84531616BE;
        Wed, 25 Jan 2023 22:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5778BC433D2;
        Wed, 25 Jan 2023 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674684725;
        bh=YIt0F6yGYF02jNoG01C/IBN+akaDldiFwJFAsSjjgEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SzLA+p9TSEXTBNzXvmW1q95QHaEIdZy65oyeRRNkVjCNq+55ndLayoY6LZblCgnYj
         TrNYzLlWatR6iZsW/4+GpnibUZ7I3HliD665lHc2Tu9k6sQHsteUPJXltaFsuTlid2
         Z5PNZ29S/ADZ63P7zeMObU1zZQ5OB2lMusNMLHJKE5XFS/5EQPtnjJnI2X3ok/fCee
         YOSaPOdSOFaCmLXwcLi0FFZK1uHPwZoAG7RYUEfBBl9G77/8a6lhCLRw/iZmjUlF00
         89tGaS0h5a4oOSPc9WdVLmBhHnRbO6UioN+t6bXxS9gKeHbynWYDA1ZoiW3ZWD6NHD
         6jEa40qPngvBw==
Date:   Wed, 25 Jan 2023 23:11:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <Y9GpL9RBNM8H2ZSL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230118134940.240102-1-brgl@bgdev.pl>
 <Y9DpbChLZfDONHPz@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CaxbyIFftu0Vi95h"
Content-Disposition: inline
In-Reply-To: <Y9DpbChLZfDONHPz@ninjato>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URI_DOTEDU autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CaxbyIFftu0Vi95h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So, this code handled all my stress-testing well so far. I'll try to
> think of some more ideas until this evening, but likely I will apply it
> later. Nonetheless, more review eyes are still welcome!

Ah yes, I now recalled why I had the gut feeling that this solution is
not complete. See this mail thread from 2015:

https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html

There are still drivers using i2c_del_adapter()+kfree(), so removing the
completion could cause use-after-free there, or?


--CaxbyIFftu0Vi95h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPRqSsACgkQFA3kzBSg
Kbbf9w/7BFVjt+dIMmMYA4nX1DYb1qibMoATRwcbxIVsIh4/dKHHzdVj2ptRpV1Q
LDzag3Jq6Bw/3w0++6//8CkYLS0u7+NjF86mKX5H1WtT477uuGsdw5upCe9lDNiy
3Ra6I+eDZ2y8dVjJMFGSBNQWH4zVjmlKeQgGb32/KKcZ6L52kxXQl8os9IQLadYW
23+zhsjoa4odM7I9dqLXFDovmvivdu9FfJIsvRRCp6Rugmd/CqLhSSDMKzYUYnFW
wLzSdmfa99ajnEXD3UucF82QhuiOatOJ9Y84YrorfB2tKGam1fXZgdKNfrAo/O4s
301ZzQahDiQXVaMxyD6aXZLPigNCmnVh76ezStVbNaSh6vO/6bsBRy/xRGYjges8
sJfvS+DV8mcxxX4YebRbo6jTskU372LcpopkyybFa0GvAzVHBO6KCanLxyPalLaO
aM8fBQAkCuo1KN6WyTnbjZILw8itY/O03gvvmDbf0gk+rSecjKGE4PAE+lyHTpVP
2MoQypjKIBiB0RgnyEa+eMWNm/HLuAoZ02ukmhaxm321ZJyI6CpGcXZ7b6QDPIZL
NoPmnpnSbDJBVPolpH2WEDxMu66o1frKgzAnpr0AqqbUS0zmrsZAG/NgCxpYVZq+
9r2cA32crnCHT3hoPjP8fkOcObDHqPWh7SPBzMGkIAojDIPjTh0=
=FpT/
-----END PGP SIGNATURE-----

--CaxbyIFftu0Vi95h--
