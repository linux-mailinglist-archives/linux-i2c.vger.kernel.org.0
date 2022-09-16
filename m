Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0D05BB2E0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiIPTjp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIPTjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:39:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E7A17E06
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 12:39:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7859B828DE
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 19:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD67C433C1;
        Fri, 16 Sep 2022 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663357177;
        bh=ijT8/PQ0ZyYIvvO8aB4i1OGUhUzBqgBRVOqMuARMGn0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfJS7zskWsR4q0uiA4C+lF7NJKzbujCxSVpYgUMF2WlV/I/clpFI0kiZ63v1rzDfr
         DBLM0nF3VPjl4kOpeoN4sCAblaqRv1ds5yDIuTj3Ii+vFDvPrjAuGCBUAE4De76ce4
         b9iB2f2HZxf+rambCns0xo2gmabaQrYNLqYcVWW+jyycPH35KFuCJm6s7u9Vq7LSDV
         HQFge8RJypdFLfmTVlqf/+5bc3ORl91uHBM3z020+5WhBleg9pVPZxcF/9wdEHz0/T
         NdAfxiWq/BmZ5XnxAFPm5eDMGXOlHBNnkR+NUGZPNzJSxUk2udnPuu3F/tZSu0+hO1
         85u2pXtXLyVMQ==
Date:   Fri, 16 Sep 2022 20:39:33 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Subject: Re: [PATCH] MAINTAINERS: remove Nehal Shah from AMD MP2 I2C DRIVER
Message-ID: <YyTQ9Z0yz7CrDPMD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
References: <20220912205843.3343-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I/KWcu6Gn3tAytaJ"
Content-Disposition: inline
In-Reply-To: <20220912205843.3343-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I/KWcu6Gn3tAytaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 09:58:43PM +0100, Wolfram Sang wrote:
> His email bounced and given commit 88115ea6308d ("HID: amd_sfh: Remove
> name from maintainers list"), I assume he is no longer available as a
> maintainer.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--I/KWcu6Gn3tAytaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk0PQACgkQFA3kzBSg
KbZf9g//Yx5GnOQvh/wPiQFj1Tej3P6t/IM2ZJsDPBNoA3Cssze8HD6a7g44mxbg
PlhxiimVF3ObAfnZhaIIz0BpvcailFaoBwBD4Y6y3p28fy/H/Dx04PU/Dshg/DZn
YmeKH3iGB2MKLQ93RTSo1HRF0K7kGmo2on04ajoz4U745+zTeUVAOR5TS+lrbr2d
zxrbXpzuVqIHHYKuS1Jm807M1Kz/fbLY18cBDX0e6mQWWi3G19KIEzIeHNVw5ORU
wnhEZgHtUmX7Q7tbzfWSMv1LCAV0K/MQOc7r7MmPVxTJd1Eir747N5+IWDA8llZp
UypHt8ibR/JS8PfujlclkoyImMVSJZcCm8MsE+UGtf7T/XcitgzPF5W4JjFg3yus
t01G2oFW1QJo3p+s1PKv3M65kbEBhGM9nlvbP2VLIBKqUmLA/AbFsGngTubUabvO
lyJ7W3cIujo2TRqv2PjStbNhWscjEtIk/2VF9u03AqpwK9rzevTNHcOtB8ajeWgP
odavEq/pDSHUuJCaFDnvUFuFzxM+FP+TSKz/6qYlylV8Jycl0ywqeqyPIThiPKfi
ICnZg0hqpCXpUGppKpYmTXjknM4hw7Sk3xOSsuR7jWMrrnxsODOGCqf4jcNaN+5N
kNdnhyObVj8ckwBI2wvCFF2TrVgg6uD0YlTHYetLk93Pzl4sMC0=
=wbzR
-----END PGP SIGNATURE-----

--I/KWcu6Gn3tAytaJ--
