Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD387B1CC1
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 14:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbjI1Mn7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 08:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbjI1Mn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 08:43:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0E31A5;
        Thu, 28 Sep 2023 05:43:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C2AC433C8;
        Thu, 28 Sep 2023 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695905036;
        bh=nCKJkBLDsYJN2+JB6FMchINp9ht48WeKEfXXmLsMaac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mR/mGzw26+OXka1xkGonbsyZD56oHHOsYro6F6Gpt8gwyQ0Qagcu7bwbuq40P8ZQ6
         Jj9Rqc2hAoybfVZN87hd5IP53LWSJ4MgZPjclC5zZidUzb0R3hCorxC54G5VdmZ16Q
         OtFcpBidl727OL/E+g5gspPU+hxxli/GVgPW4vbNGxtkpnml4iTSzH1JC/uvUoHaLE
         XNHLM410ZhzpnmTfvjUMHnfGveZJ951uq9BFfsyS4BaED2c2inV6v1hUs9pggaYuVj
         sT7H8S/E9LswpQC2JyND3CInwkhpKSoZAgn3nvVimWF8/yNT4nEVmjwTltw7vWJodB
         wI7iZGbfLiOqg==
Date:   Thu, 28 Sep 2023 14:43:53 +0200
From:   Mark Brown <broonie@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wentong Wu <wentong.wu@intel.com>, arnd@arndb.de,
        mka@chromium.org, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, linus.walleij@linaro.org, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <ZRV1CW/QpjCUTfdm@finisterre.sirena.org.uk>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
 <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SeTSb0KJB9qsHfXr"
Content-Disposition: inline
In-Reply-To: <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
X-Cookie: Save energy:  Drive a smaller shell.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SeTSb0KJB9qsHfXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 02:20:04PM +0200, Hans de Goede wrote:

> I agree that at least patch 1/4 is ready for merging. I'm
> not sure if Greg should pick-up the entire series or if
> the rest should be merged through there relevant subsystems
> to also give the relevant subsys maintainer tree.

I stopped paying attention when it was obvious that the USB stuff was
struggling badly and getting lots of resends, I've not checked the SPI=20
stuff in a while.

--SeTSb0KJB9qsHfXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUVdPoACgkQJNaLcl1U
h9Bk8wf/VXNcs84lq/tAoXmnr/TduF6HArdLh07P4ByQp8OOhW6VHFl8hdub9L8y
HW8C6+2Vi+nVmqQP6Vaka+eDehH9iaC/enuVWe0KSMTXwFzkJ04bQiI0XW/BrXHw
drA0xqOIihqtHXXEW8gObSnsgvU7AciMtVOxQwNahAK/0snz3bqIGLCq4Ds5MGMR
pKYBerSpaRRagFWX06dyJhfGSEfuhtP94Q75V8w2vhilQjzJi+duTwi2/Uyjn5Mi
tk5cetmxM9ipFjFkrH8fGLdZo4FydOnH0v+7kar2iC+EjCOKlcXKicajWWJGTzkN
a3wF1jybaLwc/+BrHBl61EUG2oNWuA==
=3Esk
-----END PGP SIGNATURE-----

--SeTSb0KJB9qsHfXr--
