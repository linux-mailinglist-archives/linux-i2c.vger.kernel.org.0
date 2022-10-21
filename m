Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC8C607040
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 08:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiJUGnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 02:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiJUGns (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 02:43:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DAF62413CD;
        Thu, 20 Oct 2022 23:43:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB41961DD2;
        Fri, 21 Oct 2022 06:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CC2C433D6;
        Fri, 21 Oct 2022 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666334625;
        bh=sEwMq2j5fjO07u3xyI2MdfOg2PhiXrflPNSl+1UnYnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p35BnNfZPMnmjAztGM+SVzJPSQLvzbn4xPbC/SN4po2T9VkG2rTnk+kmA0AlVvMoa
         OZJQ5iwoswxe5tWoHusob88QqBXioMBVWB5RcbY6e39dv7zWqslEHVzy0oGlobvJiG
         RFbeSWjIe9n3yOguBmIO4jzeFqd0ZbPPZYS8hW9jqCI00juDwYj0u5UQ57a7JL0Uxp
         WPyDBY8oEaLI4MQsQKVzyn0lWUENtw2mYsCxtkm2JVDAShlvxWgB1B7jjkiFWTxFbN
         9ds+LgrUpoV6/ObsCWhfVPBvHm5fGG5NIfX0D8HCakUn1R5s03ZlYJ8yoVSyeKpEau
         ZhNzmEt01Qnvg==
Date:   Fri, 21 Oct 2022 08:43:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
Message-ID: <Y1I/hRG9XGTFDTr3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
 <S229897AbiJTWqk/20221020224640Z+957@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iApmyqhp3K52o8pq"
Content-Disposition: inline
In-Reply-To: <S229897AbiJTWqk/20221020224640Z+957@vger.kernel.org>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iApmyqhp3K52o8pq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 08:33:51PM +0200, Adam Borowski wrote:
> This fixes maybe_unused warnings/errors.
>=20
> According to a comment during device tree removal, only ACPI is supported,
> thus let's actually require it.
>=20
> Fixes: be18c5ede25da39a0eda541f6de3620a30cf731f
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

Applied to for-current, thanks!

@Asmaa, @Khalil: normally, I will not skip the driver maintainer's ack
but wait for it. I'd like to make an exception this time because I don't
want to get another dozen of patches fixing this build warning. Since
Asmaa already acked a similar patch, I hope this is okay with you.


--iApmyqhp3K52o8pq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNSP4EACgkQFA3kzBSg
KbaKpA//UbFxu/KCQ6nmi/cix+XNC2Jodbf/CpEn81lRISMmrLzIe78d35NXtgq+
qY8Yq3F7sm9a4eyklMQlAX8qLRr6XggCEltkI+ZcvshnvMg4rpNEzwFu2s+7YtwU
+S7julqS0h8AWUze4f3nGtM3w/hBSuj2tclZ0shKZX64COCBho2FmIQrDJbZu5um
hmB5R7Gis9c853pOGf0rdINA2x3Uod9tV+RddnBhmiq2ATkP0SBA1xXZ3/XbM3On
nrMtvMvJp0C8KTgwJF+2IovW95OQamCG/9/tgqt1/7N4Y6sdXwBQ8G6YtneqWunR
jmoaNbTUSulLM3imHqgyA2wyE1Heao3WyAOwusLVXepUHcEKALGlZEaVtPp15CvD
ICbMviweiENLD9RfSHmSaORlsRIiJevlNY2rq8omzRVP4NEDXUZiHEydjLay5jU1
pjWi1iRKtraDWr3T5/zalNuhKLLFBZjZboTDm2TdQoYj0aAzS96LSDmt4m8d7D0W
BMPqLFSMBlLNJvmuSE2w4j4RjW+r9vLn0kYeJqWAonjqITiMLoY4Vpl8452vTvXL
KuA5jDZSJl0KIlikXZ+Fd1+6GEuX2QxAbrF9FVvI1wJAxzcKYR6M7T66As1LfJ6t
aYqL9JJ+YSL0oMbIBwUeH0HnYW5/RSTojOl82KW+7/8nrgJlhDM=
=Bmm/
-----END PGP SIGNATURE-----

--iApmyqhp3K52o8pq--
