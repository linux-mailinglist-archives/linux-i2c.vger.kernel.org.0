Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A386C4B679D
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbiBOJbi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:31:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbiBOJbh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:31:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EBFE0D9;
        Tue, 15 Feb 2022 01:31:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4FA4B81859;
        Tue, 15 Feb 2022 09:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B71C340EB;
        Tue, 15 Feb 2022 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644917485;
        bh=TPI92uxefldVIoKagHhk5wuLidJESnJZFC1B90zMuWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZaahihxggrQCerRn9aiv1XD7sVfIQwMb2mOz4BKZZyhjtW4W8ZqGI9KbIrkGNIJZx
         5fgnRGxjUv4c382sSBge8pLk96vHJtd+I+zsKe+aZm7lpjrM6m9pKss0OpSQpuQ5XS
         iNjrrXyBVDg250b4Y4odsnb9AK6VAWHfAxUObMhLII3DNFjCJvn8B2Fsvs4LOZ6Hfp
         mo4IZV1MC4xDN/W4q1P9C0JBlAhL238tJW7hfp+qKI8bAhX4UJh20mjQG0wcjQd8CQ
         OQ29hCT7l33DqPaSw2hz84yxKUQ3mjcSkQybwc33Sl031tCnCSUwXRNnUTOwMjgkCh
         DAHdrKernDOTA==
Date:   Tue, 15 Feb 2022 10:31:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: pasemi: Drop I2C classes from platform driver
 variant
Message-ID: <Ygty6m9vPFU0gy9B@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220204095914.5678-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P+tODekEoy3IYXxW"
Content-Disposition: inline
In-Reply-To: <20220204095914.5678-1-povik+lin@cutebit.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P+tODekEoy3IYXxW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 10:59:14AM +0100, Martin Povi=C5=A1er wrote:
> Drop I2C device-probing classes from platform variant of the PASemi
> controller as it is only used on platforms where I2C devices should
> be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
> raised as up to this point no devices relied on the old behavior.)
>=20
> Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Applied to for-next, thanks!


--P+tODekEoy3IYXxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILcuYACgkQFA3kzBSg
KbY6uA/+IQh924YyTwayMaj8qOEr+9HV1GNHRTIkiVe1EHYHSnzqaPI1P5kHFMBk
gc6ua8ftK2AW1QFwRNY7iZth7CtMxQlu3+wWizAtSM6hHnO/DHW5prKEKcaVf2OP
g40PWfMFU0y2Rfb+YlBJaLt5rKwihfc6jHrflAteWf/YoSwaYrSAH+gjYRZ4bHIJ
4Gm7pljXhXL6gWRF2JT6OTsRr4qIDYwfupJYdWNiAbf+27OjPhJpD3YXwY7mxtOW
AB/oMuAwmkyYrz+UlnTe3zSU56Hv2V1hfYzueRCboKYfdMYBj7C/rEfH9uzvMpy0
Hlp+pV0uSHzkG5eGa8IMatOvDRR6u6zDD2H09nYfbL3SkmbM+OcN3MqsCg9F9NMU
u9ozjnjD7NXyOkEeM2CAAjWVEiXnYz3V9xNGJqlbN0tj7DcZ62+L1OGQ3sELKen/
HRE3je8ZevvH4jv1NU/+3/J3RaWua3EqljRpm9fIi27WeYWegjTg3PMPIhYmiCXI
lfmA/IVcvHWViKhSAeWb5rGAY6JCvDNTLkTZnWg3IweP7G7ssBAJ4x3LSEUFCUv8
+pFxK6tjD4aee/0u69zYrJ95aCC+9j/7eSStDWl1EVt3F21n1Jf7Uo63tJdIlm34
lpvavpW3Fg1OcZ1dtU16E9DGIczfu+e9APuJkp5eB4TgzA18RRM=
=ZV8g
-----END PGP SIGNATURE-----

--P+tODekEoy3IYXxW--
