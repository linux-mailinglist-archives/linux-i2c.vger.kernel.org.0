Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A516CF2FE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjC2TTq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjC2TTo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:19:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601D3CD;
        Wed, 29 Mar 2023 12:19:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEE7C61D50;
        Wed, 29 Mar 2023 19:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0072C4339B;
        Wed, 29 Mar 2023 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680117583;
        bh=gTLU+XR5wtmB0lMQcIufKUrPY/RzhFv150zb3fpFcTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gZVJdWdg1sOp2uaW74Z8RwFdqeDjh7ImKdE14MzLoa6kTLztVa7uUQmmb3jj6XGdi
         8MntCLbtyjv6B7K3daLLWjpfNjRsrEz9CCFDSGPfPywyDzysUlkImN9Jm5apzx1BRb
         3m/VESTcPbYGvnF5bxnqctfjZJS2iVyOZIm+7f4T85FaTco71MOSe2FwCkSyWuyfNd
         zQ6ZyUz3F4JnlH0HiMq0kTT/Xv1wkvBcumaKNWyqMv8gPmCFmimKph4Fi1NxPgg8RC
         G2mmQdV/QfoPrEuvgm/+c1Z2cRUxJ4TK3iv2m8P277NFknekM7Fr4TMJcFhG76rs7m
         8fGWeDwR9dCpw==
Date:   Wed, 29 Mar 2023 21:19:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: cadence: Document `fifo-depth`
 property
Message-ID: <ZCSPTPFfwtTbLYEB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230317145441.156880-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6wVRiXzbKERLHBs7"
Content-Disposition: inline
In-Reply-To: <20230317145441.156880-1-lars@metafoo.de>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6wVRiXzbKERLHBs7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 07:54:39AM -0700, Lars-Peter Clausen wrote:
> The depth of the FIFO of the Cadence I2C controller IP is a synthesis
> configuration parameter. Different instances of the IP can have different
> values. For correct operation software needs to be aware of the size of t=
he
> FIFO.
>=20
> Add the documentation for the devicetree property that describes the FIFO
> depth of the IP core.
>=20
> The default value of 16 is for backwards compatibility reasons with
> existing hardware descriptions where this property is not specified and
> software has assumed that the FIFO depth is 16.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--6wVRiXzbKERLHBs7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkj0sACgkQFA3kzBSg
KbZTmxAAjEsqU/sNXg23JqS96JG2XWkpArKD+RpogLQk5MQhmI3a+OPW+cPgq5if
4pEpJI7ZnDq/0QnOKh/jBFIDxi6rj5Bu4ynLjANYMZOn2sOtRaw8NA+aH3LbDvkV
e6fQytV6Vyy5loYyXCByhbU/ZEJpv96DwQxXdq7MyTCMSCanEd34ngzRT6CMclLJ
m+PLmbpqxfU3IC76T8hcb81UPM6XuH4fOK7xqSrpYXp+Kk+asgBmImHs1Z0cIbfh
Vsr+JJlBdVIMCeSaGWqiYij8YR7vfQe48wJorRT/H7PbwyWIMHNYGkmQQ5VUoC0o
vmz4ltbKWWwBefQaQIfSpQOaueedikoIXDvwffqtoDDJ+gU6Igi1vILy2vXGCZbn
2uF29pk2HE0C4bsxH7fqylkWk1wCqAW56hpnPkCBmmemOavXt8f77r7TdA4/VUpD
bTboJWMZJRW8gZWihenrRUjoyMVjutHsdtPWI090hZ1vfmUsriZ7hi7se97ADQcT
dus0GnQzgCQx/IsdbGLS9DN2ukA73ffrKglqc0wlEMJDLi+/9+ALinJNTQU4EAvZ
Je5vP/ucWovDy46OovHiHxJ1fXXjtawUkcJ2hsVDwiV0kqQvpTT2375qRL94/9X3
xSljkDfmve3+ydlNUQ3uywuMyii3j9FhfDbbsjmffBW6eHmWoIY=
=J5JG
-----END PGP SIGNATURE-----

--6wVRiXzbKERLHBs7--
