Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97CBC6D8FA1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 08:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbjDFGmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 02:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235272AbjDFGmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 02:42:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE74102;
        Wed,  5 Apr 2023 23:42:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A5FC62A96;
        Thu,  6 Apr 2023 06:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDA8C433EF;
        Thu,  6 Apr 2023 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680763335;
        bh=mJqfGgkA1fMz6skz9F+zwsRRFRctn6sP7FnHEqyeZJw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BECv1iinE7TxL2/LN70X9EyhKkkahnEO0lctucOs5wq0wMqUcqlULI3/C0hflGF/6
         xkj6ZhM+0ot9r+9R+5YG1/cv5bvIbidRcHjHrOxwkMdZjRGHd7GaR43jg/JeLI3fKm
         oaYpAJX2QfCUTEq+HlgZgnuunsRSkS9Tzu8WiReZEjmeHGenr/UXfbWjcipVkDm8LR
         8dKvxmx1Fe/UuGgQuRbt2FkFXyJ/fLeS0RTnQ1XrZjymIYczf3UJytZLTP2SWV1C2p
         23zLDwheOy+pb0z7eleokhheSCUSdpnOPyxNknVf3bf6/9yHeHP4yhpFtb0/OeeVZL
         +NAOBcf3fUKCg==
Date:   Thu, 6 Apr 2023 08:42:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
Subject: Re: [PATCH v8 0/6] Use CCP driver to handle PSP I2C arbitration
Message-ID: <ZC5pxORLN+SF/91S@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dxxWHW86FhdhLb9p"
Content-Disposition: inline
In-Reply-To: <20230403183216.3493-1-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dxxWHW86FhdhLb9p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 01:32:09PM -0500, Mario Limonciello wrote:
> The CCP driver now has symbols that can be used by i2c-designware-amdpsp
> to handle the communication regarding i2c arbitration with the PSP for
> both Cezanne and Mendocino based designs.

How should this go upstream, i.e. are there dependencies? Shall I pick
the I2C patches or is it better if all goes via the crypto tree?


--dxxWHW86FhdhLb9p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQuacQACgkQFA3kzBSg
KbbnKA/9FkOCsNE4br0lLkyFwLvhKnpsOXOiXTTASDuP/uTpLQKhjbNamFkckTJd
DNohsW34fuxuwG2mdQPd+812+lIrWJS9EZJMMaOll9kNySJNtMUU5ezPWBReIiRL
wKL8Yi+xaCr2/vhbCpLc0DIi6SbskJy1vMk+ceZ8SGh8l+IYDvBMowf0DbnXl43b
hyjM6xpmjQ4smTwdVACx38K1IdDOYCsoO+6h/pcDcgriE8hiRz4P7vbru+yWqJt6
XTVGU5P666vYOwq/ZSbkWz2dCZZ88Ukz6kpa4SgWPzA6r+qJ3A6pWErBHd64OmwF
s3/24EOuWF/QgEO2Rwu5n7WjKVaQCWPYmsXmdixwWbW9pHJUxWU9dLApbItBuMZn
VK3hR9Mr+lOF/bJGfnpjo1pjv5S1TvOnMsn6qyeFuBV2rYDg8TR8jQTsQOaYuhmL
Ji2twu1v1KFNQ4SDIevv8pqQLZz88vrW15qH0ZlsmXV0lTAJNW+ycJLh5Rub2aGa
SRBctuqB8Smp2S0H5HKwGTX135JYBAkmJEfc8jY8HcM/ZCjRXazsv723XUcj/yto
WktxREwePFhtU1WU3XvcwovTkrzDqpIu3yK/HkDxsqn+mQHbec7FDz5BG3xT5rn/
dzCoH4X8SbKPlewobhUVBFcZvT7wO4+bu8OToDVOrbO3PHRV/hc=
=0N0f
-----END PGP SIGNATURE-----

--dxxWHW86FhdhLb9p--
