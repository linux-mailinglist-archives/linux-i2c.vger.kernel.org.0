Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3146BD8D7
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjCPTUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjCPTUV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:20:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749C5115;
        Thu, 16 Mar 2023 12:20:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1986EB82290;
        Thu, 16 Mar 2023 19:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58085C433A0;
        Thu, 16 Mar 2023 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678994411;
        bh=l++fa3PUwdYAtmiufnCYsRMEq/GkUCqb0EEUpvF/gVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kl7xaSe7m5m7E6AoKD9F54Gtb6HlVx4Px3DA2/gds23umZzR5up9P629IXqHzemIF
         WUIQUkBbnNbpxJjDQUFyoAFVA6DcJo3IsIm8tjPqx8MxK1ILnPntLj7lkuV5jPZRBL
         6XSH1cP7F+1UWN3U5h5hEebnndifhUj0zNkIw1kVZJxjSPe3v5fz7IMjmwUmkF7D2L
         VCBor2GD4SSdHSyQsguUfL5f395v2g6cGNsjAxKiageKVZQv6rHS0DMsdonWYkuS1q
         jGpWJAZODT9NXUySE5iMorHo4JPopOUvQEAdumKke1FmUV+LMk6Jwlsdv5w7bvENyb
         6H1Es/O87mO0A==
Date:   Thu, 16 Mar 2023 20:20:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Use of_property_read_bool() for boolean properties
Message-ID: <ZBNr6L44obs2j6yH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230310144707.1542595-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pk3mxALnv1mSgk92"
Content-Disposition: inline
In-Reply-To: <20230310144707.1542595-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pk3mxALnv1mSgk92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 08:47:07AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--Pk3mxALnv1mSgk92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTa+gACgkQFA3kzBSg
KbZEIRAAiY5q8NNW1uGSRtF6Ba+jrjXR9aY5ELiahc8e861yL37Kvj4eme5YUjfr
+t8NJI7IvfqIM1oLex4xzKZcga9XZz3cnEYrxEKwaqg6awy+DeQRXtX25ccJSo4v
DBUdvSz78u2k7ivwNW0R5Ek5ICIFoo56JBhLPwoy24KcCwWiKp9HC9W5w48uRp7m
ypU6tI+mbX62YonlwyNp5uwfT79eFv28d9IIpIMmrLl10ta5Fgg+yeWUM54uIhAo
s2vi02fUezcGzwdk1X0NZNGrTwsgarvljeTZpjj1dUEeOdl0sm/cW/EG+3q/Q2tO
dMKQvIjOCnDDpNXoMmaj2wXL4X356BmKC/eaNmyySZ6sYJLsnba/bzDwc0H6YmpW
VopakHBi4pQcgu++Z6DYWf6BuyMM+RSXKIN94OqJpPT6QnzCUBIctPj6qTGZBebK
MFwwnNc+u8dT1zudMNgjFOK8IgNjWQWe7MYDi/DqJFtPbtcNEHJxzqgnGHRnxnJM
Hbvn8Ak6QhCctLZ92URkSSo4ajzA62yfCaE/cLpUlFtze1EJG5gnCCGjFaRPPyvm
XO4xKFJa4RuFLbKAlroScPP1Gd++kW5dowafF9CfzVGuMFjUjBTGSgNQZ+dHb0P7
kfEWj+madEhjZdR4MjP5SNahoAiGjhDy4OiwxE4Hr7zmcm9p1KI=
=rZwH
-----END PGP SIGNATURE-----

--Pk3mxALnv1mSgk92--
