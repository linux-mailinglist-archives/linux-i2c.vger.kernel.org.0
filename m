Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E96957F365
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiGXFqy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiGXFqx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:46:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E8713F28
        for <linux-i2c@vger.kernel.org>; Sat, 23 Jul 2022 22:46:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DDF4D60EE0
        for <linux-i2c@vger.kernel.org>; Sun, 24 Jul 2022 05:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0BDC3411E;
        Sun, 24 Jul 2022 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658641611;
        bh=hTNBWb+Dffg9B/QRwBaACp6phE5MrdQaoQHPWTZV8vI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NbOe1UzhIzOQ6PTqNXQYQXAdHfmA4TWfKn4FBJ4WW7LCZ+VQ+7jjpKW94oIsIwxP2
         arOAjRPe7278JmyKcjir9uPjhJfsZ72SCUh7a+2wpvyIeqijN3v2V+MPHOlqAOKpNf
         c9581+XIk2K3ZjJsX0AjsbwV9IyCitpGRu136Z/OyVOIwKvanJ71Ekmiv/Udk3Vjv7
         FEZeWQiEhW0Gs9Odp/FbD7KP2tYWmDrzQ6ahtl7CGZ1KbStSnwTnnWpNwA0IHUfjsY
         98qW0koDt6xwvfR2McnhaiWXUYyVVRwAd2X9IeDdojWu8Htt5IcC+q9PNHRbIxlS6B
         qZE2f2VHQWdHw==
Date:   Sun, 24 Jul 2022 07:46:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc:     "Simek, Michal" <michal.simek@amd.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        git <git@xilinx.com>
Subject: Re: [PATCH] i2c: cadence: Support PEC for SMBus block read
Message-ID: <Ytzcxr2zp5ULnzGb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        git <git@xilinx.com>
References: <20220717145244.652278-1-lars@metafoo.de>
 <768b56a8-df1c-e24d-7879-328512598549@amd.com>
 <BY5PR12MB4902D36D299948DE036AC0BF818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
 <51fcbbf2-c490-4b2b-fde5-df1dfce7e677@amd.com>
 <BY5PR12MB4902C7B4F8516D15718AE900818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DHNvZmbws76/V7Np"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB4902C7B4F8516D15718AE900818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DHNvZmbws76/V7Np
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Tested-by:  Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com >

WARNING: Use a single space after Tested-by:
#30:=20
Tested-by:  Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com >

ERROR: Unrecognized email address: 'Shubhrajyoti Datta <Shubhrajyoti.datta@=
amd.com >'
#30:=20
Tested-by:  Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com >

Please start using macros. You never got it right so far :(


--DHNvZmbws76/V7Np
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc3MYACgkQFA3kzBSg
KbYwRA//WL7OKgtvHi8vB0wR2Fmda4UQZSx5KVtv+ZLwC9fzy4UM2igIoHH2SDhz
P4X5yEB/LxowPFiYj4Wo+93octnHB14fm9kueUthdnHIKuxNSkzJU9E9yxfBX2Mz
9mPzVQWozw7s6yp4KmK6ln16Pdh70+s2dSpmRmM7EqbjAX/mF9BMsbp8jU6Znk9y
ZQ/1dbQbN4Y70hbQ1MpnKa6EzbcC0kqiI5bvljIcNvM9cU++uNzMfxaNmB+1cYIn
Ap/cdlgkKG8Z4ISKQWmdecJTiXmLxBI0xvziogA9FJXnUhEllD0PpDm57QmsZMuw
ugnvn9hDI2hxRrgDKA6QaERy8Jq3n+A2PK8KQkFe8OLHyiv/t4R9JvVSzxJS7M6E
MhcTE/ujqNQtiUMbot8T/P0h1fe0OnswRLWiFxsLgg478a2v48B7L+nPieFPBMCt
KbnBApbErtQ7ZLmzc7ZlYfwvvuvzjx4wQZigcF/l0+JO+y+xUrilGvHTURd91NDC
O/hvfeNl30UvGax3smwKgv38v9VmlhKImnI8bXGECR+aICR/W6mlqHjzQdBn/pII
w1zqDolADsUEEzXn+U9iZnDPh0UMfuKYRa9w5IL25b6hAkZCh8auGCMcK82kxTBC
goo87rum7tpL3aaQt4Mm3TmKtqQc23j7vRilDtZnIM4+MBuagqE=
=rdvY
-----END PGP SIGNATURE-----

--DHNvZmbws76/V7Np--
