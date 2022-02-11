Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D064B2296
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 10:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347151AbiBKJ4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 04:56:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236464AbiBKJ4X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 04:56:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E37E98;
        Fri, 11 Feb 2022 01:56:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1102961E06;
        Fri, 11 Feb 2022 09:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA85CC340E9;
        Fri, 11 Feb 2022 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644573380;
        bh=0FStBV/9SBeI+EFPz6ZTJLDbJT+HjShaFqliyCFiedY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GX9L6FNqs4NEdyCWsr1BMveBBzlfZcDdrEK0Xzd+Qu9at0HPo51/agBfSbcV5Px16
         fs1pOQr2JV7YAfcTGJOzaKqp26N0T4IOcXYmVRDOp/KpYxq8G6FQuhX+rIKRqE6zo+
         6jlJawckcJ1RSeFPhlWbcrXPycamUsZz2yFU8l1AXigMgEI5sEyw4n/mQVQMUztS0G
         zVMH3gXcQRY4yywVo+GW+6W4Yh3LkLtx7PQ4ESC2u+Q0oLlX4rQJ5qyjrfPI4gxxa7
         mFVS0VldmU8UvRGPkNMl3UzJE2uTXTDXahQdRRmsWM9SD2X+z5C3V1xQX+zYFYWHFE
         6ulhjHFBh5saA==
Date:   Fri, 11 Feb 2022 10:56:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YgYyvgIIshpi7Wgb@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-3-jsd@semihalf.com>
 <YgWNE05eVK+LijL/@kunai>
 <CAOtMz3OyYXeyrpcSUpHZCR4tqroKWd09gYsjsU2W_idt8udMbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q5MBvKOSjtVh37zW"
Content-Disposition: inline
In-Reply-To: <CAOtMz3OyYXeyrpcSUpHZCR4tqroKWd09gYsjsU2W_idt8udMbQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q5MBvKOSjtVh37zW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ooops, sorry for this. Actually I used checkpatch till v3, but forgot
> to run this on v4 where this change was introduced, my bad. Will
> improve going forward :)

No worries, happened to me as well. Thanks for your contribution!


--Q5MBvKOSjtVh37zW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGMrsACgkQFA3kzBSg
KbZZ+Q/+IMEbLkgi7z8MYSCctupgbtkiIiFmykqzbjOFohLuRUfGqPXtHIOIgpM9
fxB4kwaQ4XpxtEv8Ny/Er2sQKddlhfM69LD595upC1HiMhAqT05L+XnMdzinbVMJ
OkDynoSQF1rMYCi0AooKGvXMAsXKeYBahaCygq2v6JmcNscJ4WmoCmaANdAxMkP9
PfRQr31m9NxceOrg0S+9u9K5Z8ZXx6fhcPLOwua1Rg73vn1kCzmiEQfh2oBX4sd3
uJJfcnZxG9Ktld43BuGarHR00Jhy4kUQ51PcTaLyEkuzy56JI8JQ5HfLQiB8DJZh
+7DIMPvQoEPJBGSaiXj8fPFVaD9b0TjixKvWvyVWuNQStjOLYx49+PocpUVdOgeW
/WuW/QQoe/MAPjlx/puJKKVr6hrLqcJj7iMJr1Wwa5Dm+LoqsLc1kZ7nCFggbmBJ
wWQPUr8iQzz5cFvQ78iLNay3Ji/hoqGEkAqbDIY552CCOVpF/fQcAvR71LBtQwMg
X0PoC4/G5o25m2yNZzjDQ+DASSgaeFjKvPoUntAitS7rQpXni7scCTZvu9iaqtA9
PHHvqk3hG0PQ8XbYkHpCb4gOkDhsXXefVWIr9VwbkfYrXbixc0+YxXD/po3hnisu
XeQAHXRVHJ2Rznx+KftSwz/axYyRCDI61tkvUhZpfjQM+B/BsZc=
=I62k
-----END PGP SIGNATURE-----

--Q5MBvKOSjtVh37zW--
